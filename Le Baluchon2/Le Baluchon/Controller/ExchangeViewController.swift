//
//  ExchangeRateViewController.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 24/01/2022.
//

import UIKit


class ExchangeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var currencies: [Currency] = []
    var activeCurrency:Double = 0;
    
    //OBJECTS
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GETTING DATA
        showExchange()
    }
        
    //CREATING PICKER VIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = currencies[row].rate
    }
    
    //BUTTON
    
    @IBAction func action(_ sender: AnyObject) {
        if (input.text != "") {
        output.text = String(Double(input.text!)! * activeCurrency)
      }
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        input.resignFirstResponder()
    }
    
    // MARK: ExchangeServiceDelegate

    private func update(currencies: [Currency]) {
        self.currencies = currencies
        pickerView.reloadAllComponents()
        
    }
    
    func showExchange() {
        ExchangeService.shared.getExchange { (succes, currencies) in
            DispatchQueue.main.async {
                if succes {
                    self.update(currencies: currencies)

                } else {
                    self.presentAlert()
                }
            }
        }
    }
    
    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "API data donwload failed", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

    
   

   
