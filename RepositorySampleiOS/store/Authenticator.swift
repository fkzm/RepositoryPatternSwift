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
//    private var isAuthenticated:Bool?
    private var member:Member?
    
    static var authenticator : Authenticator?
    
    var token:String?
    
    
    
    init(tokenRequestHeaderKey:String, tokenLocalStorageKey:String, tokenResponseHeaderKey:String) {
        
        Authenticator.tokenRequestHeaderKey = tokenRequestHeaderKey
        Authenticator.tokenResponseHeaderKey = tokenResponseHeaderKey
        Authenticator.tokenLocalStorageKey = tokenLocalStorageKey

    }
    init(){
        
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
        createMember()
    }
    
    
    func createMember()
    {
        let tokenMap = JwtTokenHelper.getTokenBody(token: token!)

        let name = tokenMap["name"] as! String
        let id = tokenMap["id"] as! Int
        self.member = Member(name: name, id: id)
        
    }

    
    func getToken() -> String{
        let token = UserDefaults.standard.value(forKey: Authenticator.tokenLocalStorageKey) as! String
        return token
    }
    
    func deleteToken(){
        UserDefaults.standard.removeObject(forKey: Authenticator.tokenLocalStorageKey)
        self.member = nil
    }
    
    func addAuthenticationHeaders(request:Request){
        request.addHeader(key: Authenticator.tokenRequestHeaderKey, value: "Bearer "+self.token!)
    }
    
    func isAuthenticated()->Bool{
        return self.member != nil
    }
}
