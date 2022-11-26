//
//  ProjectsViewModel.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation


class ProjectsViewModel {
    var model: ProjectsModel
    var allProjects: [ProjectObject] = []
    var page: Int = 1
    var lastCount: Int = 0
    var allPagesAreLoaded: Bool = false
    
    init(model: ProjectsModel) {
        self.model = model
    }
    
    var pageTitle: String {
        return "Open-source projects"
    }
    func getNumberOfRows() -> Int {
        return allProjects.count()
    }
    
    func fetchProjects() async throws {
        
        do {
            lastCount = self.allRepos.count
            let result = try await model.fetchProjects(page: page)
            if let sortedResult  = result{
                self.allProjects.append(contentsOf: sortedResult)
            }
        } catch {
            print("Request failed with error: \(error)")
            self.feedingError(error)
        }
    }
    // récuperer le Projects selectioné
    func getProjects(atIndex: Int) -> Repo? {
        
        if atIndex < allProjects.count {
            return allProjects[atIndex]
        }
        return nil
    }
    
    func shouldLoadNextPage(index: Int) -> Bool {
        if allProjects.isEmpty == false, index == (allProjects.count - 1 ) {
            if self.lastCount == allProjects.count {
                allPagesAreLoaded = true
                return false
            }
            page += 1
            return true
        }
        return false
    }
}

