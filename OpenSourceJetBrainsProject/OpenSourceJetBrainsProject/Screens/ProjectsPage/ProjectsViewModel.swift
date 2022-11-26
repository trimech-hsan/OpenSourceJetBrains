//
//  ProjectsViewModel.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation


class ProjectsViewModel {
    var model: ProjectsModel
  
    init(model: ProjectsModel) {
        self.model = model
    }
    
    var pageTitle: String {
        return "Open-source projects"
    }
    func getNumberOfRows() -> Int {
        return 10
    }
    
   
}

