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
        
        let request = Request(restAdapter: self, resources: "sessions", verb: "post", payload: credentials, queryString: nil).send()
        
        return Promise<Response> { fulfill, reject in
            
            request.then { (Response) -> Void in
                
                let status = Response.getStatus()
                let token = Response.getField(name: "token") as! String
                
                self.getAuthenticator().setToken(token: token)
                
                fulfill(Response)
                
            }.catch(execute: { (Error) in
               print(Error.localizedDescription)
            })

            
        }
    }
    
    func logOut(){
        self.authenticator?.deleteToken()
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
