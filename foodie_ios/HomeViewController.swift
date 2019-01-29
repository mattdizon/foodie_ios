//
//  HomeViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/14/19.
//  Copyright © 2019 dizon. All rights reserved.
//


import UIKit

class HomeViewController: UITableViewController {
    
     var tableArray = [[String: Any]] ()
    var nameArray = [String]()
    var cuisineArray = [String]()
    var thumbnailArray = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         tableView.rowHeight = 300
        self.tableView.dataSource = self
        self.tableView.delegate = self

        parseJSON()
     
        // Do any additional setup after loading the view, typically from a nib.
    }
    func parseJSON() {
        let url = URL(string: "http://foodz-backend.herokuapp.com/chef_recipes")
        
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
               
              

            } catch let parsingError {
                print("Error", parsingError)
            }
           
            
           
         
           self.tableView.reloadData()
        }
        
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecipeTableViewCell
       let userDict =  self.tableArray[indexPath.row]
        cell.nameLabel.text = userDict["recipe_name"] as! String
        cell.cuisineLabel.text = userDict["cuisine"] as! String
        if let url = NSURL(string: userDict["thumbnail"]as! String){
            if let data = NSData(contentsOf: url as URL){
                cell.thumbnail.contentMode = UIView.ContentMode.scaleToFill
                cell.thumbnail.image = UIImage(data:data as Data)
            }
        }
        
        return cell
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
}

