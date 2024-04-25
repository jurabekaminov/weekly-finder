//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Jurabek Aminov on 16.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultTextField: UILabel!
    
    @IBAction func findDay(_ sender: UIButton)
    {
// проверка ввел ли что-нибдудь пользователь
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text else
        {
            return
        }
// создаем календарь
        let calendar  = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
// "EEEE" - формат даты д/м/г
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else
        {
            return
        } 
        let weekday = dateFormatter.string(from: date)
        
        resultTextField.text = weekday
    }
// убираем клавиатуру при тапе на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}

