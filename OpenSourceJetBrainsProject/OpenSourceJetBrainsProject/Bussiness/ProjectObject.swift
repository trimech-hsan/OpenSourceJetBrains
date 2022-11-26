//
//  ProjectObject.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation

struct ProjectObject: Decodable {
    
    var fullName : String?
    var forks : Int?
    var openIssues : Int?
    var watchers : Int?
    var description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case fullName = "full_name"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case description = "description"
        
    }
}
