//
//  TranslationViewController.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 24/01/2022.
//

import UIKit

class TranslationViewController: UIViewController {
  
  
    
    //OBJECTS
    @IBOutlet weak var textToTranslate: UITextView!
    
    
    //BUTTON
    
    @IBAction func tapTranslate(_ sender: UIButton) {
        showTranslate()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textToTranslate.resignFirstResponder()
    }
    
    // MARK: ExchangeServiceDelegate

    private func update(translate: Translate) {
        
        textToTranslate.text = translate.textTranslate
        
    }
    
    func showTranslate() {
        TranslateService.shared.getTranslate(text: textToTranslate.text) { (succes, translate) in
            DispatchQueue.main.async {
                if succes, let translate = translate {
                    self.update(translate: translate)

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



    
   

        
    
