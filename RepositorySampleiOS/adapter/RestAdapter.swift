//
//  RestAdapter.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation
import PromiseKit

class RestAdapter {

    var baseUrl : String?
    var tokenLocalStorageKey : String?
    public var authenticator:Authenticator?
    

    init(baseUrl:String, tokenLocalStorageKey:String) {
        self.baseUrl = baseUrl
        self.tokenLocalStorageKey = tokenLocalStorageKey
    }
    
    
    func login(credentials:[String:Any]) -> Promise<Response>{
        
        let request = Request(restAdapter: self, resources: "sessions", verb: "post", payload: credentials, queryString: nil)
        
        return request.send()
    }
    
    func getBaseUrl() -> String{
        return self.baseUrl!
    }
    
    func getAuthenticator()->Authenticator{
        if self.authenticator == nil {
            self.authenticator = Authenticator()
        }
        return self.authenticator!
        
    }
    
    
}
