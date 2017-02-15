//
//  Country.swift
//  countryLists
//
//  Created by adigeleon on 08/02/2017.
//  Copyright © 2017 adigeleon. All rights reserved.
//

import Foundation


class Country: NSObject, NSCoding {
    
    struct Keys {
        static let Name = "name"
        static let Language = "language"
        static let Population = "popolation"
    }
    
    
    
    private var _name = ""
    private var _language = ""
    private var _population = ""
    
    
    
    
    
    override init(){}
    init(name: String, language: String, population: String) {
        self._name = name
        self._language = language
        self._population = population
    }
    required init(coder decoder: NSCoder) {
        if let nameObj = decoder.decodeObject(forKey: Keys.Name) as? String {
            _name = nameObj
        }
        if let langObj = decoder.decodeObject(forKey: Keys.Language) as? String {
            _language = langObj
        }
        if let popObj = decoder.decodeObject(forKey: Keys.Population) as? String {
            _population = popObj
        }
    }
    func encode(with coder: NSCoder) {
        coder.encode(_name, forKey: Keys.Name)
        coder.encode(_language, forKey: Keys.Language)
        coder.encode(_population, forKey: Population)
    
    
    }
    
    var Name: String {
        
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var Language : String {
        get {
            return _language
        }
        set {
            _language = newValue
        }
    }
    var Population : String {
        get {
            return _population
        }
        set {
            _population = newValue
        }
    }
    
}
