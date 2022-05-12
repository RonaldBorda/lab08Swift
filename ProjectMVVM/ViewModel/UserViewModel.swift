//
//  UserViewModel.swift
//  ProjectMVVM
//
//  Created by Ronald Meliton Borda Bernaola on 7/05/22.
//

import Foundation

class UserViewModel{
    
    var users: User? = nil
    let URL_API_USER = "https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca"
    let appId = "626c31c5df0af1efad6b2d4c"
    
    func getDataUserFromAPI() async {
        do {
            var request = URLRequest(url: HelperString.getURLFromString(url: URL_API_USER)!)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            let (data, _) = try await URLSession.shared.data(for: request)
            if let decoder = try? JSONDecoder().decode(User.self, from: data){
                DispatchQueue.main.async(execute: {
                    self.users=decoder
                })
            }
        } catch{
            print("error")
        }
    }
}
