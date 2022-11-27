//
//  MockedProjectsService.swift
//  OpenSourceJetBrainsProjectTests
//
//  Created by Trimeche Hassen on 27/11/2022.
//

import Foundation
@testable import OpenSourceJetBrainsProject

class MockedProjectsService: ProjectsServiceInterface {
    
    func fetchProjects(page: Int) async throws -> [ProjectObject]? {
        let jsonString = JSONHelper.loadJson(filename: "Projects")
        guard let jsonString = jsonString, let jsonData = JSONHelper.convertAnyObjectToData(from: jsonString) else {
            return nil
        }
        let repos = try JSONDecoder().decode([ProjectObject].self, from: jsonData)
        return repos
    }
}
