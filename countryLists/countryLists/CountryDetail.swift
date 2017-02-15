//
//  CountryDetail.swift
//  countryLists
//
//  Created by adigeleon on 10/02/2017.
//  Copyright © 2017 adigeleon. All rights reserved.
//

import UIKit

class CountryDetail: UIViewController {
    
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBOutlet weak var languagetxt: UILabel!
    
    
    @IBOutlet weak var populationtxt: UILabel!
    
    var data = [Country]()
    var path = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       nametxt.text = data[index].Name
       languagetxt.text = data[index].Language
       populationtxt.text = data[index].Population

        // Do any additional setup after loading the view.
    }

    @IBAction func backbttn(_ sender: Any) {
       dismiss(animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
