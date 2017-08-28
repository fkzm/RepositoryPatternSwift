//
//  User.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation


class User:BaseModel{
    

    var _userCode:String
    var _accountCode:String
    var _password:String
    
    
    init(usercode:String,accountCode:String,password:String){
        self._userCode = usercode
        self._accountCode = accountCode
        self._password = password
   
        var adapterMap = [String:BaseAdapter]()
        adapterMap.updateValue(RestAdapter(), forKey: RepositoryType.REST.rawValue)
        
        Store.store.registerAdapters(baseAdapter: adapterMap)
    }
    
    func create(){
        Store.store.create(model: self)
    }
    
}
