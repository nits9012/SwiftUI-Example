//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Nitin Bhatt on 17/06/20.
//  Copyright © 2020 Nitin Bhatt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State private var showingAlert = false
    @State var isModal: Bool = false


    
    var body: some View {

        ZStack{
              Color(red: 50/255.0, green: 119/255.0, blue: 204/255.0, opacity: 1.0).edgesIgnoringSafeArea(.all)
                    VStack(spacing:20){
                        Text("Login").padding(.bottom,40).font(.system(size: 50)).foregroundColor(Color.white).frame(maxWidth: .infinity, alignment: .center)
            
                        VStack(alignment:.leading) {
                            Text("Username").font(.headline).foregroundColor(.white)
                            TextField("Username", text: $username).padding(.all) .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        }.padding(.horizontal, 25)
            
                            VStack(alignment:.leading){
                                Text("Password").font(.headline).foregroundColor(.white)
                                SecureField("Paswword", text: $password).padding(.all) .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                
                            }.padding(.horizontal, 25)
                        
                        Button(action: {
                            
                            if self.username.lowercased() == "test@test.com" && self.password.lowercased() == "login"{
                                self.isModal = true
                            }else{
                                self.showingAlert = true
                            }
                        }) {
                                  HStack {
                                      Spacer()
                                      Text("Login")
                                          .font(.headline)
                                      Spacer()
                                  }
                              }
                              .padding(.vertical, 20.0)
                        .background(Color.white).foregroundColor(Color(red: 50/255.0, green: 119/255.0, blue: 204/255.0, opacity: 1.0))
                        .padding(.horizontal, 20).padding(.top,30).alert(isPresented: $showingAlert) {
                            Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("ok")))
                        }.sheet(isPresented: $isModal, content: {
                            CountryView()
                        })
                         
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
