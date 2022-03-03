//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 24/01/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // outlet
    @IBOutlet weak var city1Label: UILabel!
    @IBOutlet weak var city1CurrentWeather: UILabel!
    @IBOutlet weak var city1TempLabel: UILabel!
    
    @IBOutlet weak var city2Label: UILabel!
    @IBOutlet weak var city2CurrentWeather: UILabel!
    @IBOutlet weak var city2TempLabel: UILabel!
   
    @IBOutlet weak var currentDate: UILabel!
    
    @IBOutlet weak var city1Icon: UIImageView!
    @IBOutlet weak var city2Icon: UIImageView!
    
    override func viewDidLoad() {
        showWeather()
       
    }
    
    private func update(weather: Weather) {
        city1Label.text = weather.cityOne.name
        city1CurrentWeather.text = weather.cityOne.description
        city1TempLabel.text = "\(Int(round(weather.cityOne.temperature)))°C"
        city2Label.text = weather.cityTwo.name
        city2CurrentWeather.text = weather.cityTwo.description
        city2TempLabel.text = "\(Int(round(weather.cityTwo.temperature)))°C"
    }
    
    func showWeather() {
        WeatherService.shared.getWeather { (succes, weather) in
            DispatchQueue.main.async {
                if succes, let weather = weather {
                    self.update(weather: weather)
                    self.processDate(weather: weather)
                    self.processIcon(weather: weather)
                } else {
                    self.presentAlert()
                }
            }
        }
    }
    
    func processDate(weather: Weather) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY à HH:mm"
        currentDate.text = ("Mis à jour le \(dateFormatter.string(from: weather.date))")
    }
    
    func processIcon(weather: Weather) {
        let img = UIImage(named: weather.cityOne.icon)
        city1Icon.image = img
        let img2 = UIImage(named: weather.cityTwo.icon)
        city2Icon.image = img2
    }

    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "API data donwload failed", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
