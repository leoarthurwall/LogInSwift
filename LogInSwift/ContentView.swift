//
//  ContentView.swift
//  LogInSwift
//
//  Created by Leo Wall on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.75))
                VStack {
                    HStack {
                        Image(systemName: "figure.wave")
                            .font(.system(size: 40))
                            .foregroundColor(Color.blue)
                        
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .padding([.top, .bottom, .trailing])
                    }
                    
                        
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("login"){
                        authenticateUser(username: username, password: password)
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text( "You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                }
                
               
            }
            .navigationBarHidden(true)
        }
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "leo123" {
            wrongUsername = 0
            if password.lowercased() == "wall321" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
