//
//  RecipeViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/18/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    var tableArray = [String: Any] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()

        // Do any additional setup after loading the view.
    }
    func parseJSON() {
        let url = URL(string: "http://foodz-backend.herokuapp.com/chef_recipes/1")
        
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
                           //    print(jsonResponse) //Response result
                
                // convert json to dictionary data type
                guard let jsonArray = jsonResponse as? [String: Any] else {
                    return
                }
                // setting local dict to the converted json
                self.tableArray = jsonArray
                self.nameLabel.text = self.tableArray["recipe_name"] as! String
                self.cuisineLabel.text = self.tableArray["cuisine"] as! String
                if let url = NSURL(string: self.tableArray["thumbnail"]as! String){
                    if let data = NSData(contentsOf: url as URL){
                        self.recipeImage.contentMode = UIView.ContentMode.scaleToFill
                        self.recipeImage.image = UIImage(data:data as Data)
                    }
                }
               
               
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            
            
            
         
        }
        
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
