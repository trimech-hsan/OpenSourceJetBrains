//
//  ProjectsService.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation
import Alamofire



protocol projectsServiceInterface {
    func fetchProjects(page: Int) async throws -> [ProjectObject]?
    
}

class ProjectsService: projectsServiceInterface {
    // async : pour lancer une tache asychrone  sur une thread
    func fetchProjects(page: Int) async throws -> [ProjectObject]? {
        let url = String(format: "%@%@%ld", Constant.Service.baseUrl, Constant.Service.projectsPath, page)
        let request = AppRequest(url: url, method: .get)
        do {
            // await withCheckedThrowingContinuation : méthode qui tente de télécharger du JSON depuis le serveur, de le décoder  et de renvoyer le résultat :
            
            return try await withCheckedThrowingContinuation() { continuation in
                request.sendRequest { result, error in
            // en cas d'erreur
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
           // en cas de reponse
    
                    do {
           // le decodage de resulat
                        if let data = result {
                            let projects = try JSONDecoder().decode([ProjectObject].self, from: data)
                            continuation.resume(returning: projects)
                        }
                    } catch {
           // erreur de  decodage
                        continuation.resume(throwing: error)
                    }
                }
            }
        } catch {
            // autres erreurs
            throw error
        }
    }
}
