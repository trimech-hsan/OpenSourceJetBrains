//
//  JSONHelper.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 27/11/2022.
//

import Foundation
class JSONHelper {
    
    static func loadJson(filename: String, bundle: Bundle = Bundle(for: JSONHelper.self)) -> [String: Any]? {
        if let url = bundle.url(forResource: filename, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    var value: [String: Any]?
                    
                    let jsonStructure = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions(rawValue: 0))
                    
                    switch jsonStructure {
                    case is [Any] :
                        guard let result = jsonStructure as? [Any] else {
                            return nil
                        }
                        value = [String: Any]()
                        value!["result"] = result
                        
                    case is [String: Any] :
                        let json = jsonStructure as? [String: Any]
                        value = json
                    default: ()
                    }
                    
                    return value as [String: Any]?
                } catch {
                }
            }
        } else {
        }
        
        return nil
    }
    
    static func convertAnyObjectToData(from object: Any) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}
