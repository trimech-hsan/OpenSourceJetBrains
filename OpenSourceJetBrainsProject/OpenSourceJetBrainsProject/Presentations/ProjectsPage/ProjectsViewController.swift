//
//  ProjectsViewController.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

protocol ProjectsCoordinatorDelegate: AnyObject {
    func goToProjectDetailPage(project:ProjectObject)
}
class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private let refreshControl = UIRefreshControl()
    
    var viewModel: ProjectsViewModel?
    weak var coordinatorDelagate:  ProjectsCoordinatorDelegate?
    
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
            showLoader()
            try await viewModel?.fetchProjects()
            refreshControl.endRefreshing()
            tableView.reloadData()
            hideLoader()
          
        } catch {
            hideLoader()
            // Erreur generique parce que j'ai pas les codes des erreurs specifiques de l'api (j'ai pas trouvé une documentation ou swagger de l'api)
            let alertController = UIAlertController(title: "Problème de connection", message: error.localizedDescription, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertController, animated: true, completion: nil)
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
    private func showLoader() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func hideLoader() {
        activityIndicator.stopAnimating()
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let project = viewModel?.getProjects(atIndex: indexPath.row) else {
            return
        }
        coordinatorDelagate?.goToProjectDetailPage(project: project)
    }
    
}
