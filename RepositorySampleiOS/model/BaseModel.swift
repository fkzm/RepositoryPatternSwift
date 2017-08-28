//
//  BaseModel.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation


class BaseModel : BaseCRUDProvider{
    
    
    static var url : String?
    
    var adapter: IAdapter?
    
    //abstract
    func getMetadata(){
        assertionFailure("Method should override")
    }
    
    
    init(iadapter:IAdapter) {
        self.adapter = iadapter
    }
    
    init() {

    }
   
    func save<T>(model: T) where T : BaseModel {
//        self.adapter?.save(model: model)
    }
    
}
