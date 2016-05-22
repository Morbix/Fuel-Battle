//
//  CarsTextField.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 22/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit

class CarsTextField: UITextField {

    var selectedCar: Car?
    var cars = [Car]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self
        
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        
        self.inputView = picker
    }

}

extension CarsTextField: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}

extension CarsTextField: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cars[row].verbose
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCar = cars[row]
        text = selectedCar?.verbose
    }
    
}

extension CarsTextField: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cars.count
    }
    
}
