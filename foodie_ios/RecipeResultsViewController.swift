//
//  RecipeResultsViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/22/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import Foundation
import UIKit

class RecipeResultsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {

    
     var text: String? = nil
    var id: String? = nil
    @IBOutlet weak var queryTable: UITableView!
    
    
    var tableArray = [[String: Any]] ()
    var nameArray = [String]()
    var cuisineArray = [String]()
    var thumbnailArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryTable.rowHeight = 300
        self.queryTable.dataSource = self
        self.queryTable.delegate = self
        print(self.text)
        parseJSON()
        
        // Do any additional setup after loading the view, typically from a nib.
 
    }
    
    func parseJSON() {
        if let encoded = self.text!.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encoded) {
              
            
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        
                    guard let _ = data,
                        error == nil else {
                            print(error?.localizedDescription ?? "Response Error")
                            return }
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [String:Any]
        
        
                        self.tableArray = json!["matches"] as! [[String : Any]]
                      
        
                    } catch let err{
                        print(err.localizedDescription)
                    }
                    self.queryTable.reloadData()
                }
                task.resume()
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Query", for: indexPath) as! QueryTableViewCell
        let userDict =  self.tableArray[indexPath.row]
        cell.nameLabel.text = userDict["recipeName"] as! String
        cell.cuisineLabel.text = userDict["id"] as! String
       
      
        let newV = userDict["imageUrlsBySize"] as! [String : Any]
       
        let oldUrl = newV["90"] as! String
        let newUrl = oldUrl.components(separatedBy: "=")[0]
        
         if let url = NSURL(string: newUrl as! String){
            if let data = NSData(contentsOf: url as URL){
                cell.thumbnail.contentMode = UIView.ContentMode.scaleToFill
                cell.thumbnail.image = UIImage(data:data as Data)
            }
        }

        return cell
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let indexPath = tableView.indexPathForSelectedRow
//        let cell = queryTable.cellForRow(at: indexPath!)! as! QueryTableViewCell
//        self.id = cell.cuisineLabel.text
//        performSegue(withIdentifier: "yourSegueIdentifer", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "yourSegueIdentifer"){
//            if let url = segue.destination as? ShowViewController {
//                url.text = self.id
//
//            }
//        }
//
//    }
    
}
