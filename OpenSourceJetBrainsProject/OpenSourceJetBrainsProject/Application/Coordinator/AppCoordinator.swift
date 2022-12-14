//
//  AppCoordinator.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

protocol Coordinator{
    var parentCoordinator :Coordinator?{get set}
    var childrens: [Coordinator] {get set}
    var navigationController : UINavigationController {get set}
    
    func start()
}

class AppCoordinator:Coordinator{
    
    var parentCoordinator: Coordinator?
    var childrens: [Coordinator]  = []
    var navigationController: UINavigationController
    
    
    let storyboard  = UIStoryboard.init(name: "Main", bundle: nil)
    
    init(navCon:UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator Start")
        goToProjectsPage()
    }
    
    func goToProjectsPage() {
        // Instantiate ProjectsViewController
        let projectsVC: ProjectsViewController = storyboard.instantiate()
        // Instantiate projetcsViewModel
        let projetcsViewModel = ProjectsViewModel(model: ProjectsModel())
        projectsVC.viewModel = projetcsViewModel
        //set coordinator delegate
        projectsVC.coordinatorDelagate  = self
        navigationController.pushViewController(projectsVC, animated: true)
    }
}
extension AppCoordinator: ProjectsCoordinatorDelegate {
    
    func goToProjectDetailPage(project:ProjectObject) {
        let detailsProjectViewModel = DetailsProjectViewModel.init(model:DetailsProjectModel.init(project: project))
        let DetailsProjectVC: DetailsProjectViewController = storyboard.instantiate()
        DetailsProjectVC.viewModel = detailsProjectViewModel
        // Set the Coordinator to the ViewModel
        navigationController.pushViewController(DetailsProjectVC, animated: true)
        
    }
}

