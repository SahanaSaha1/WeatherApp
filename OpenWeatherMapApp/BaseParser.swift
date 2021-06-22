//
//  BaseParser.swift
//  OpenWeatherMapApp
//
//  Created by AssetTelematics Pvt Ltd on 6/21/21.
//  Copyright © 2021 Asset Telematics. All rights reserved.
//

import UIKit

typealias weatherDetail = (WeatherDetail) -> Void

class ServiceCall: NSObject {
      
    static let shared = ServiceCall()
    
   let Base_URL = "https://api.openweathermap.org/data/2.5"
    var Latitude_URL = "12.9082847623315"
     var Longitude_URL = "77.65197822993314"
    
    func updatedURL() -> String{
        
        
        let  buildUrl = Base_URL + "/onecall?lat=" + Latitude_URL + "&lon=" + Longitude_URL + "&units=imperial&appid=b143bb707b2ee117e62649b358207d3e"
        
        return buildUrl
    }
    
    func updatedLat(latitude : String){
        Latitude_URL = latitude
    }
    
    func updatedLon(longitude : String){
        Latitude_URL = longitude
    }
    
    func getWeatherDetail(completion : @escaping weatherDetail) {
        
        let FromUrl : URL = URL(string : updatedURL())!
        var request = URLRequest(url: FromUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do {
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode(WeatherDetail.self, from:
                             dataResponse) //Decode JSON Response Data
                print(model)
                DispatchQueue.main.async {
                    completion(model)
                }
            } catch let parsingError {
                print("Error", parsingError)
            }

        }
        task.resume()
    }

}
