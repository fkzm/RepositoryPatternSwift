//
//  Store.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation




class Store{
    
    private var baseAdapter:[String:BaseAdapter]!
    private var currentAdapter:BaseAdapter!
    
    var connectedToInternet:Bool = false
    
    private init() {
    
    }
    
    static let store: Store = {
        let store = Store()
        // setup code
        return store
    }()
    
    
    
    public func registerAdapters(baseAdapter:[String:BaseAdapter]){
        self.baseAdapter = baseAdapter
        chooseCurrentAdapter()
    }
    
    
    private func chooseCurrentAdapter(){
        
        
        if(connectedToInternet == true){
            self.currentAdapter = self.baseAdapter[RepositoryType.REST.rawValue]
        }
            
        else{
            self.currentAdapter = self.baseAdapter[RepositoryType.SQL.rawValue]
        }
        
    }
    
    public func create <T> (model: T)
    {
        self.currentAdapter.create(model: model)
    }
    

}
