//
//  CountryAdd.swift
//  countryLists
//
//  Created by adigeleon on 10/02/2017.
//  Copyright © 2017 adigeleon. All rights reserved.
//

import UIKit

class CountryAdd: UIViewController {

    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var langtxt: UITextField!
    
    @IBOutlet weak var poptxt: UITextField!
    
    var data = [Country]()
    var path = ""
    var index = 0
    var name = ""
    var lang = ""
    var pop = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func add(_ sender: Any) {
      if nametxt.text != "" && langtxt.text != "" && poptxt.text != ""{
        data[index].Name = nametxt.text!
        data[index].Language = langtxt.text!
        data[index].Population = poptxt.text!
        NSKeyedArchiver.archiveRootObject(data, toFile: path)
        
        
        }
        
    }
    
    @IBAction func bckbttn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    

}
