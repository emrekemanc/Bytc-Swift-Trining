//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol returnManager{
    func returnData(string:String)
}
struct CoinManager {
    var returnManagerDelegate:returnManager?
   
    let apiKey = "Your API"
    
    func getData(mony:String){
        let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/\(mony)?apikey=\(apiKey)&invert=true&output_format=Json"
        returnJson(URLL: baseURL)
    }
    func returnJson(URLL:String){
        if let url=URL(string: URLL){
            let sesion=URLSession(configuration: .default)
            let task=sesion.dataTask(with: url){data,urlRespons,error in
                if error != nil{
                    return
                    
                }else{
                    if let safeData=data{
                        if let veri=self.persJson(data: safeData){
                            self.returnManagerDelegate?.returnData(string: veri)
                            print(veri)
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
    func persJson(data:Data)->String?{
        let decoder=JSONDecoder()
        do{
            let veri = try decoder.decode(Model.self, from: data)
         
            return String(format:"%.2f",veri.rate)
        }catch{
            print(error)
            return nil
        }
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
}
