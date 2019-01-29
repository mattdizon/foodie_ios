//
//  SelectedPicker.swift
//  foodie_ios
//
//  Created by Matthew Dizon on 1/22/19.
//  Copyright © 2019 dizon. All rights reserved.
//

import Foundation
import UIKit

extension RecipeFilterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var selectedPicker = 0
        if pickerView == cuisinePicker{
            selectedPicker = cuisines.count
        }
        else if pickerView == coursePicker{
            selectedPicker = courses.count
        }

        return selectedPicker
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var selectedString = ""
        if pickerView == cuisinePicker{
            selectedString = cuisines[row]
        }
        else if pickerView == coursePicker{
            selectedString = courses[row]
        }
       
        
        return selectedString
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == cuisineTextField.inputView {
            selectedPickers = cuisines[row]
            cuisineTextField.text = selectedPickers
        }
        else if pickerView == courseTextField.inputView{
            selectedPickers = courses[row]
            courseTextField.text = selectedPickers
        }
        
    }
    
    
}




