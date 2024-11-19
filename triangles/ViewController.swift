//
//  ViewController.swift
//  triangles
//
//  Created by Мирлан Каныбеков on 12.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sideATextField: UITextField!
    @IBOutlet weak var sideBTextField: UITextField!
    @IBOutlet weak var sideCTextField: UITextField!
    
    @IBAction func checkButton(_ sender: Any) {
        guard let sideA = Double(sideATextField.text ?? ""),
              let sideB = Double(sideBTextField.text ?? ""),
              let sideC = Double(sideCTextField.text ?? "") else {
            showAlert(message: "Введите корректные числа для всех сторон.")
            return
        }
        
        if sideA + sideB > sideC && sideA + sideC > sideB && sideB + sideC > sideA {
                    if sideA == sideB && sideB == sideC {
                        showAlert(message: "Это равносторонний треугольник.")
                    } else if sideA == sideB || sideA == sideC || sideB == sideC {
                        showAlert(message: "Это равнобедренный треугольник.")
                    } else {
                        showAlert(message: "Это разносторонний треугольник.")
                    }
                } else {
                    showAlert(message: "Треугольник с такими сторонами не существует.")
                }
    }
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Результат", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default))
            present(alert, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}

