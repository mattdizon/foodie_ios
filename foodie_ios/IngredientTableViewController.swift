//
//  IngredientTableViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/18/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {
    
    var tableArray = [[String: Any]] ()
    var ingredientArray = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
parseJSON()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func parseJSON() {
        let url = URL(string: "http://foodz-backend.herokuapp.com/users/1/user_ingredients/")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                // data is in json format
                //                print(jsonResponse) //Response result
                
                // convert json to dictionary data type
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                // setting local dict to the converted json
                self.tableArray = jsonArray
                print (self.tableArray)
                for userDict in self.tableArray {
                    let key = userDict["ingredient"]
                    
                    
                    print("\(key!)")
                }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            
            
            
            self.tableView.reloadData()
        }
        
        task.resume()
        
    }
    // MARK: - Table view data source
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ingredient", for: indexPath) as! IngredientTableViewCell
        let userDict =  self.tableArray[indexPath.row]
        cell.ingredientLabel.text = userDict["ingredient"] as! String
      
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
}


