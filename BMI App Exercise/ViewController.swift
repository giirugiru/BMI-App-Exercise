//
//  ViewController.swift
//  BMI App Exercise
//
//  Created by Gilang Sinawang on 08/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ExplanationLabel: UILabel!
    @IBOutlet weak var ResultImage: UIImageView!
    @IBOutlet weak var HeightField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var CalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make the keyboard type numberPad
        HeightField.keyboardType = .numberPad
        WeightField.keyboardType = .numberPad
        
        // Hide keyboard when tapped outside
        self.hideKeyboardWhenTappedAround()
        
    }

    @IBAction func CalculateButtonClicked(_ sender: Any) {
        showResult()
    }
    
    
    // MARK: Function to show calculation result
    func showResult() {
        
        // Validate if the text field is empty
        if HeightField.text != "" && WeightField.text != "" {
            
            // Cast textfield inputs as constants
            let heightInput = Double(HeightField.text!)
            let weightInput = Double(WeightField.text!)

            // Call function to calculate BMI
            let result = calculateBMI(height: heightInput!, weight: weightInput!)

            // Change label to result
            //ResultLabel.text = "\(Float(result))"
            // Format to 2 digit after comma
            ResultLabel.text = String(format: "%.2f", result)
            
            // Change image based on the result
            switch result {
            case 0...18.49:
                ExplanationLabel.text = "You are underweight"
                ResultImage.image = UIImage(named: "Underweight")
            case 18.5...24.99:
                ExplanationLabel.text = "You are normal"
                ResultImage.image = UIImage(named: "Normal")
            case 25...29.99:
                ExplanationLabel.text = "You are overweight"
                ResultImage.image = UIImage(named: "Overweight")
            case 30...34.99:
                ExplanationLabel.text = "You are obese"
                ResultImage.image = UIImage(named: "Obese")
            case 35...:
                ExplanationLabel.text = "You are extremely obese"
                ResultImage.image = UIImage(named: "Extremely Obese")
            default:
                print("Input error")
            }
            
        } else {
            
            // Call alert function
            callAlert()
            
        }
    }
    
    // MARK: Function to show alert when textfield is empty
    func callAlert(){
        
        let alert = UIAlertController(title: "Input is Empty", message: "Please input your height and weight!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


// MARK: Open source code to hide keyboard when tapped outside
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

