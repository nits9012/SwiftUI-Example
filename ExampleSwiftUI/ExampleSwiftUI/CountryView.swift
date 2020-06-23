//
//  CountryView.swift
//  ExampleSwiftUI
//
//  Created by Nitin Bhatt on 19/06/20.
//  Copyright © 2020 Nitin Bhatt. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    
    @ObservedObject var results = FetchCountries()
    var body: some View {
        List(results.countries) { item in
            VStack{
                HStack{
                    Image("wordMap").resizable().frame(width: 65, height: 65)
                    VStack(alignment:.leading){
                        Text(item.name!).font(.headline)
                        Text(item.alpha2Code!)
                        HStack{
                            Text("Population:")
                            Text(String(format: "%.0f",item.population))
                        }
                    }.padding(.leading,20)
                }
              
            }
       
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
