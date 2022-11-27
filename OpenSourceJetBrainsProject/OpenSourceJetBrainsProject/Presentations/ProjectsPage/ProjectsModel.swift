//
//  ProjectsModel.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation

class ProjectsModel {
    var projectsService: ProjectsServiceInterface
    
    init(projectsService: ProjectsServiceInterface = ProjectsService()){
        self.projectsService = projectsService
    }
    
    func fetchProjects(page: Int) async throws -> [ProjectObject]? {
        do {
            // await : attendre la reponse de la fonction asynchrone
            //  c'est le point de suspension
            return try await projectsService.fetchProjects(page: page)
        } catch {
            return nil
        }
    }
}
