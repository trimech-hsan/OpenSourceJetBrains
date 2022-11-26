//
//  ProjectsViewController.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProjectsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.reloadData()
    }
    
    func setupUI() {
        self.title = viewModel?.pageTitle
        // enregistrer un nib ou pour chaque cellule dans le tableview .
        tableView?.registerReusable(ProjectTableViewCell.self)
        
    }
}
    
    extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
        // nombres de cells a afficher selon les nombre envoyé par le viewModel
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return viewModel?.getNumberOfRows() ?? 0
        }
        // configurer les cells par les données envoyé par le viewModel
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell: ProjectTableViewCell = tableView.dequeueReusableCell(for: indexPath)

            return cell
        }
        
    }
