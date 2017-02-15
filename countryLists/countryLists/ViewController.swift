//
//  ViewController.swift
//  countryLists
//
//  Created by adigeleon on 08/02/2017.
//  Copyright © 2017 adigeleon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableview: UITableView!
    
    
    var data = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    private func loadData(){
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Country] {
            data = ourData
        }
    }
    
    private func saveData(country: Country){
        data.append(country)
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].Name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow!.row
        performSegue(withIdentifier: "Detail", sender: index)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            data.remove(at: indexPath.row )
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
   
    @IBAction func countryadd(_ sender: Any) {
        let alert = UIAlertController(title: "Add new Country", message: "Enter information", preferredStyle:.alert)
        let save = UIAlertAction(title: "Save", style: .default){
            (alertAction:UIAlertAction) in
            
            let name = alert.textFields?[0].text!
            let lang = alert.textFields?[1].text!
            let pop = alert.textFields?[2].text!
            
            let newCountry = Country(name: name!, language: lang!, population: pop!)
            self.saveData(country: newCountry)
            self.myTableview.reloadData()
        }
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert,animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
            if let destination = segue.destination as? CountryDetail{
                if let index = sender as? Int {
                    destination.index = index
                    destination.data = data
                    destination.path = filePath
                }
            }
    
    
    
}
}
