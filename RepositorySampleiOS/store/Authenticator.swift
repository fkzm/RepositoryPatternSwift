//
//  Authenticator.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/28/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation


class Authenticator{
    
    
    static var tokenRequestHeaderKey = "Authorization"
    static var tokenLocalStorageKey = "token"
    static var tokenResponseHeaderKey = "X-New-JWT-Token"
    
    static var authenticator : Authenticator?
    
    var token:String?
    
    
    
    init(tokenRequestHeaderKey:String, tokenLocalStorageKey:String, tokenResponseHeaderKey:String) {
        
        Authenticator.tokenRequestHeaderKey = tokenRequestHeaderKey
        Authenticator.tokenResponseHeaderKey = tokenResponseHeaderKey
        Authenticator.tokenLocalStorageKey = tokenLocalStorageKey

    }
    
    static func getAuthenticator() -> Authenticator{
        
        if (self.authenticator == nil){
                self.authenticator = Authenticator(tokenRequestHeaderKey: Authenticator.tokenRequestHeaderKey, tokenLocalStorageKey: Authenticator.tokenLocalStorageKey, tokenResponseHeaderKey: Authenticator.tokenResponseHeaderKey)
        }
        return self.authenticator!
    }
    
    
    func setToken(token:String){
        self.token = token
        UserDefaults.standard.set(token, forKey: Authenticator.tokenLocalStorageKey)
    }
    
    func getToken() -> String{
        let token = UserDefaults.standard.value(forKey: Authenticator.tokenLocalStorageKey) as! String
        return token
    }
    
    func deleteToken(){
        UserDefaults.standard.removeObject(forKey: Authenticator.tokenLocalStorageKey)
    }
    
    func addAuthenticationHeaders(request:Request){
        request.addHeader(key: Authenticator.tokenRequestHeaderKey, value: "Bearer "+self.token!)
    }
    
    
}
