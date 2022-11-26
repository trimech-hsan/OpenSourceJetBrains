//
//  DetailsProjectViewModel.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation

class DetailsProjectViewModel {
    
    var model: DetailsProjectModel
    var project: ProjectObject {
        return model.project
    }
    
    var pageTitle: String {
        return "\(project.fullName ?? "No Name")"
    }
    
    init(model: DetailsProjectModel) {
        self.model = model
    }
    func getProjectFullName() -> String? {
        return project.fullName ?? "No FullName"
    }
    
    func getProjecrDescription() -> String? {
        return project.description ?? "No description"
    }
    
}
