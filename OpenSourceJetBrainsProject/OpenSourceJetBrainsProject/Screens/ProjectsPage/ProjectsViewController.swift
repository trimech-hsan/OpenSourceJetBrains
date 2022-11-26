//
//  ProjectsViewController.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    var viewModel: ProjectsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //lancer une tache asynchrone  pour ramener les données
        Task {
            await fetchData()
        }
        // Do any additional setup after loading the view.
    }
    
    func fetchData() async {
        do{
            // attendre la  reponse de webservice fetchTeams
            try await viewModel?.fetchProjects()
            refreshControl.endRefreshing()
            tableView.reloadData()
        }
        catch{
        }
    }
    func setupUI() {
        self.title = viewModel?.pageTitle
        // enregistrer un nib de cellule dans la tableview .
        tableView?.registerReusable(ProjectTableViewCell.self)
        // ajouter  un refresh dans la tableView .
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshProjectsData(_:)), for: .valueChanged)
        
    }
    @objc private func refreshProjectsData(_ sender: Any) {
        // Fetch Projects Data
        Task {
            await fetchData()
        }
    }
}

extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    // nombres de cells a afficher selon les nombre envoyé par le viewModel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.getNumberOfRows() ?? 0
    }
    // configurer les cells par les données envoyé par le viewModel
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel, let project = viewModel.getProjects(atIndex: indexPath.row) else {
            return UITableViewCell ()
        }
        let cell: ProjectTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupUI(project:project )
        // pagination
        if viewModel.shouldLoadNextPage(index: indexPath.row) && !viewModel.allPagesAreLoaded {
            Task {
                await fetchData()
            }
        }
        return cell
    }
    
}
