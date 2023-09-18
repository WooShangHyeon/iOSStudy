//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by 우상현 on 2023/09/17.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatuerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let cities = ["Seoul", "Tokyo", "LA","Suwon"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    @IBAction func buttonClick(_ sender: Any) {
        cityName.text = cities.randomElement()
        
        let imageName = weathers.randomElement()!
        
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        temperatuerLabel.text = "\(randomTemp)°"
        print("도시 온도 날씨 이미지 변경")
    }
    
    
}
