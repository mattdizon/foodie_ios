//
//  RecipeFilterViewController.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/14/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import Foundation

import UIKit

class RecipeFilterViewController: UIViewController {

    var lacto = false
    var ovo = false
    var pesca = false
    var vegan = false
    var vege = false

    var dairy = false
    var egg = false
    var gluten = false
    var peanut = false
    var wheat = false
    var seafood = false
    var soy = false
    var tree = false
    var sesame = false
    var sulfite = false





    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var cuisineTextField: UITextField!

    @IBOutlet weak var recipeTextField: UITextField!

    @IBAction func lactoButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.lacto = false
                 print(self.lacto)
            } else{
                lactoVegan.alpha = 1
                self.lacto = true
                print(self.lacto)
            }
        }
    }

    @IBAction func ovoButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.ovo = false
            } else{
                lactoVegan.alpha = 1
                self.ovo = true
            }
        }
    }

    @IBAction func pescaButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.pesca = false
            } else{
                lactoVegan.alpha = 1
                self.pesca = true
            }
        }
    }

    @IBAction func veganButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.vegan = false
            } else{
                lactoVegan.alpha = 1
                self.vegan = true
            }
        }
    }

    @IBAction func vegeButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.vege = false
            } else{
                lactoVegan.alpha = 1
                self.vege = true
            }
        }
    }

    @IBAction func dairyButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.dairy = false
            } else{
                lactoVegan.alpha = 1
                self.dairy = true
            }
        }
    }


    @IBAction func eggButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.egg = false
            } else{
                lactoVegan.alpha = 1
                self.egg = true
            }
        }
    }


    @IBAction func glutenButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.gluten = false
            } else{
                lactoVegan.alpha = 1
                self.gluten = true
            }
        }
    }

    @IBAction func peanutButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.peanut = false
            } else{
                lactoVegan.alpha = 1
                self.peanut = true
            }
        }
    }

    @IBAction func wheatButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.wheat = false
            } else{
                lactoVegan.alpha = 1
                self.wheat = true
            }
        }
    }

    @IBAction func seafoodButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.seafood = false
            } else{
                lactoVegan.alpha = 1
                self.seafood = true
            }
        }
    }

    @IBAction func soyButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.soy = false
            } else{
                lactoVegan.alpha = 1
                self.soy = true
            }
        }
    }

    @IBAction func treenutButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.tree = false
            } else{
                lactoVegan.alpha = 1
                self.tree = true
            }
        }
    }



    @IBAction func sesameAction(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.sesame = false
            } else{
                lactoVegan.alpha = 1
                self.sesame = true
            }
        }
    }

    @IBAction func sulfiteButton(_ sender: Any) {
        if let lactoVegan = sender as? UIButton {
            if lactoVegan.alpha == 1 {
                lactoVegan.alpha = 0.45
                self.sulfite = false
            } else{
                lactoVegan.alpha = 1
                self.sulfite = true
            }
        }
    }

    func concatURL(){

    }


    let cuisines = ["","American", "Italian", "Asian", "Mexican","Southern & Soul Food", "French", "Southwestern", "Barbecue", "Indian", "Chinese", "Cajun & Creole", "English", "Mediterranean", "Greek", "Spanish", "German", "Thai", "Moroccan", "Irish", "Japanese", "Cuban", "Hawaiin", "Swedish", "Hungarian", "Portugese"]

    let courses = ["Main Dishes", "Desserts", "Side Dishes"," Lunch and Snacks", "Appetizers", "Salads", "Breads", "Breakfast and Brunch", "Soups", "Beverages", "Condiments and Sauces", "Cocktails"]

    let cuisinePicker = UIPickerView()
    let coursePicker = UIPickerView()

    var selectedPickers: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        createPicker()
        createToolbar()
        // Do any additional setup after loading the view, typically from a nib.
        print(self.lacto)
    }
    func createPicker(){
        cuisinePicker.delegate = self
        cuisineTextField.inputView = cuisinePicker

        coursePicker.delegate = self
        courseTextField.inputView = coursePicker
    }

    func createToolbar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target:self, action: #selector(RecipeFilterViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        cuisineTextField.inputAccessoryView = toolBar
        courseTextField.inputAccessoryView = toolBar
        recipeTextField.inputAccessoryView = toolBar

    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeResults = segue.destination as? RecipeResultsViewController {
            let baseURL = 
            let name = recipeTextField.text?.components(separatedBy: " ")
            let cuisine = cuisineTextField.text
            let course = courseTextField.text
            var newURL =  baseURL + (name?.joined(separator: "+"))!

            if cuisine == "American"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-american"
            }
            if cuisine == "Italian"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-italian"
            }
            if cuisine == "Asian"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-asian"
            }
            if cuisine == "Mexican"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-mexican"
            }
            if cuisine == "Southern & Soul Food"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-southern"
            }
            if cuisine == "French"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-french"
            }
            if cuisine == "Southwestern"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-southwestern"
            }
            if cuisine == "Barbecue"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-barbecue-bbq"
            }
            if cuisine == "Indian"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-indian"
            }
            if cuisine == "Chinese"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-chinese"
            }
            if cuisine == "Cajun & Creole"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-cajun"
            }
            if cuisine == "English"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-english"
            }
            if cuisine == "Mediterranean"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-mediterranean"
            }
            if cuisine == "Greek"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-greek"
            }
            if cuisine == "Spanish"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-spanish"
            }
            if cuisine == "German"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-german"
            }
            if cuisine == "Thai"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-thai"
            }
            if cuisine == "Moroccan"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-moroccan"
            }
            if cuisine == "Irish"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-irish"
            }
            if cuisine == "Japanese"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-japanese"
            }
            if cuisine == "Cuban"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-cuban"
            }
            if cuisine == "Hawaiian"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-hawaiian"
            }
            if cuisine == "Swedish"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-swedish"
            }
            if cuisine == "Hungarian"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-hungarian"
            }
            if cuisine == "Portugese"{
                newURL += "&allowedCuisine[]=cuisine^cuisine-portugese"
            }



            if course == "Main Dishes"{
                 newURL += "&allowedCourse[]=course^course-Main+Dishes"
            }
            if course == "Desserts"{
                newURL += "&allowedCourse[]=course^course-Desserts"
            }
            if course == "Side Dishes"{
                newURL += "&allowedCourse[]=course^course-Side+Dishes"
            }
            if course == "Lunch and Snacks"{
                newURL += "&allowedCourse[]=course^course-Lunch"
            }
            if course == "Appetizers"{
                newURL += "&allowedCourse[]=course^course-Appetizers"
            }
            if course == "Salads"{
                newURL += "&allowedCourse[]=Salads"
            }
            if course == "Breads"{
                newURL += "&allowedCourse[]=Breads"
            }
            if course == "Breakfast and Brunch"{
                newURL += "&allowedCourse[]=course^course-Breakfast and Brunch"
            }
            if course == "Soups"{
                newURL += "&allowedCourse[]=Soups"
            }
            if course == "Beverages"{
                newURL += "&allowedCourse[]=Beverages"
            }
            if course == "Condiments and Sauces"{
                newURL += "&allowedCourse[]=course^course-Condiments and Sauces"
            }
            if course == "Cocktails"{
                newURL += "&allowedCourse[]=course^course-Cocktails"
            }

           //
            if self.lacto == true{
                newURL += "&allowedDiet[]=387^Lacto-ovo+vegetarian"
            }
            if self.ovo == true{
                newURL += "&allowedDiet[]=389^Ovo+vegetarian"
            }
            if self.pesca == true{
                newURL += "&allowedDiet[]=390^Pescetarian"
            }
            if self.vegan == true{
                newURL += "&allowedDiet[]=386^Vegan"
            }
            if self.vege == true{
                newURL += "&allowedDiet[]=387^Lacto-ovo+vegetarian"
            }




            if self.dairy == true{
                newURL += "&allowedAllergy[]=396^Dairy-Free"
            }
            if self.egg == true{
                newURL += "&allowedAllergy[]=397^Egg-Free"
            }
            if self.gluten == true{
                newURL += "&allowedAllergy[]=393^Gluten-Free"
            }
            if self.peanut == true{
                newURL += "&allowedAllergy[]=394^Peanut-Free"
            }
            if self.wheat == true{
                newURL += "&allowedAllergy[]=392^Wheat-Free"
            }
            if self.seafood == true{
                newURL += "&allowedAllergy[]=398^Seafood-Free"
            }
            if self.soy == true{
                newURL += "&allowedAllergy[]=400^Soy-Free"
            }
            if self.tree == true{
                newURL += "&allowedAllergy[]=395^Tree+Nut-Free"
            }
            if self.sesame == true{
                newURL += "&allowedAllergy[]=399^Sesame-Free"
            }
            if self.sulfite == true{
                newURL += "&allowedAllergy[]=401^Sulfite-Free"
            }
             recipeResults.text = newURL
        }
    }
}
