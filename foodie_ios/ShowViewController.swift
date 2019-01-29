//
//  ShowViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/24/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var text: String! = nil
    var tableArray = [String: Any] ()
    var id: String! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
       //parseJSON() 
        // Do any additional setup after loading the view.
    }
    
//    func parseJSON() {
//        var temp1 : String!
//        if (self.text != nil){
//            let defaultLink = "Chicken-Ramen-451165"
//            self.id = self.text as! String
//            let url = URL(string: "http://api.yummly.com/v1/api/recipe/\(self.id ?? defaultLink)?_app_id=5280a629&_app_key=7b04744f3562fbbf2a23c9f72093c89a")
//            
//            let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
//                
//                guard let dataResponse = data,
//                    error == nil else {
//                        print(error?.localizedDescription ?? "Response Error")
//                        return }
//                do {
//                    //here dataResponse received from a network request
//                    let jsonResponse = try JSONSerialization.jsonObject(with:
//                        dataResponse, options: [])
//                    // data is in json format
//                    //    print(jsonResponse) //Response result
//                    
//                    // convert json to dictionary data type
//                    guard let jsonArray = jsonResponse as? [String: Any] else {
//                        return
//                    }
//                    // setting local dict to the converted json
//                    self.tableArray = jsonArray
//                    print(jsonArray)
//                    
//                    
//                    
//                    
//                } catch let parsingError {
//                    print("Error", parsingError)
//                }
//                
//            }
//            task.resume()
//        }
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
