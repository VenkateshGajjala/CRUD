//
//  RealmeService.swift
//  CRUD
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService{
    private init(){}
    static let shared = RealmService()
    var realm = try! Realm()
    
    //MARK:- ADD DATA
    func create<T:Object>(_ object:T){
        do{
            try realm.write {
                realm.add(object)
            }
        }catch{
            print(error)
        }
    }
    
    //MARK:- UPDATE DATA
    func update<T: Object>(_ object: T, with dictionary: [String:Any?]){
        do{
            try realm.write{
                for(key, value) in dictionary{
                    object.setValue(value, forKey: key)
                }
            }
        }catch{
            
        }
    }
    
    //MARK:- DELETE DATA
    func delete<T: Object>(_ object: T){
        do{
            try realm.write {
                realm.delete(object)
            }
        }catch{
            
        }
    }
    
}
