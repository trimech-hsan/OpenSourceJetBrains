//
//  AppRequest.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import Foundation
import Alamofire

public typealias RequestDataCallback   = ((_ result: Data?, _ error: NSError?) -> Void)

class AppRequest {
    var url: String
    var method: HTTPMethod
    var params: [String: Any]?
    public var request: Alamofire.DataRequest?
    
    private var alamofireManager: Alamofire.Session?
    
    init (url: String,
          method: HTTPMethod,
          params: [String: Any]? = nil) {
        self.url = url
        self.method = method
        self.params = params
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Constant.Service.requestTimeOut
        configuration.timeoutIntervalForResource = Constant.Service.requestTimeOut
        configuration.httpCookieStorage  = HTTPCookieStorage.shared
        alamofireManager = Alamofire.Session(configuration: configuration)
    }
    
    func sendRequest(completion: @escaping RequestDataCallback) {
        self.request = alamofireManager?.request(url, method: method, parameters: params, encoding: URLEncoding.default)
        if let request = request {
            request.response(completionHandler: { response in
                if response.response != nil {
                    completion(response.data, nil)
                } else {
                    completion(nil, response.error as NSError?)
                }
            })
        }
    }
    
}
