//
//  WeatherDetailVC.swift
//  OpenWeatherMapApp
//
//  Created by AssetTelematics Pvt Ltd on 6/21/21.
//  Copyright © 2021 Asset Telematics. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherDetailVC: UIViewController,CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var currentLocation : CLLocation?
    var city = ""
    var weatherReport : WeatherDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func getLocation(){
        if(CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
             self.currentLocation = location
            
            let latitude : Double = self.currentLocation?.coordinate.latitude ?? 0.0
            let longitude : Double = self.currentLocation?.coordinate.longitude ?? 0.0
            
            ServiceCall.shared.updatedLat(latitude: "\(latitude)")
            ServiceCall.shared.updatedLon(longitude: "\(longitude)")
             let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error{
                    debugPrint(error.localizedDescription)
                    
                }
                
                if let placemarks = placemarks{
                    if placemarks.count > 0 {
                        let placemark = placemarks[0]
                        if let city = placemark.locality{
                            self.city = city
                        }
                    }
                }
            }
            
            
        }
       
    }
    
    
    func getWeather(){
        ServiceCall.shared.getWeatherDetail { (weatherResult) in
            self.weatherReport = weatherResult
            
        }
    }
    
    

}
