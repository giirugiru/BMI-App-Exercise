//
//  CalculationModel.swift
//  BMI App Exercise
//
//  Created by Gilang Sinawang on 10/12/20.
//

import Foundation

func calculateBMI(height: Double, weight: Double) -> Float {
    let heightInMeter = height/100
    let result = (weight/(heightInMeter*heightInMeter))
    return Float(result)
}


