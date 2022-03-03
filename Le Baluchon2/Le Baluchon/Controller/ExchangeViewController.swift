//
//  ExchangeRateViewController.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 24/01/2022.
//

import UIKit


class ExchangeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ExchangeServiceDelegate {
  
    private let service = ExchangeService()
    
    var currencies = [Currency]()
    var activeCurrency:Double = 0;
    
    //OBJECTS
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GETTING DATA
        self.service.delegate = self
        self.service.updateRates(base: "EUR")
    }
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        input.resignFirstResponder()
    }
    
    // MARK: ExchangeServiceDelegate
    func ratesUpdated(result: [Currency])
    {
        self.currencies = result
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
    }
}
   
