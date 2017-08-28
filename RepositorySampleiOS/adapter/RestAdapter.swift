//
//  RestAdapter.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation


class RestAdapter {

    var baseUrl : String?
    var tokenLocalStorageKey : String?
    

    init(baseUrl:String, tokenLocalStorageKey:String) {
        self.baseUrl = baseUrl
        self.tokenLocalStorageKey = tokenLocalStorageKey
    }
    
    
    
    
    func getBaseUrl() -> String{
        return self.baseUrl!
    }
    
    
}
