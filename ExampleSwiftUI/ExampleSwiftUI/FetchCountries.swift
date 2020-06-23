//
//  FetchCountries.swift
//  ExampleSwiftUI
//
//  Created by Nitin Bhatt on 23/06/20.
//  Copyright © 2020 Nitin Bhatt. All rights reserved.
//

import Foundation

public class FetchCountries: ObservableObject {

    @Published var countries = [Countries]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Countries].self, from: d)
                    DispatchQueue.main.async {
                        self.countries = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
                print(error)
            }
            
        }.resume()
         
    }
}


//struct Countries:Decodable{
//    public var alpha2Code: String?
//    public var name: String?
//    public var population: String?
//}

struct Countries:Codable,Identifiable{
    public var id = UUID()// Int
    public var alpha2Code: String?
    public var name: String?
    public var population: Double

    enum CodingKeys: String, CodingKey {
           case alpha2Code = "alpha2Code"
           case name = "name"
case population = "population"
    }
}
