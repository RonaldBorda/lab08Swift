//
//  User.swift
//  ProjectMVVM
//
//  Created by Ronald Meliton Borda Bernaola on 7/05/22.
//

import Foundation

struct User: Decodable{
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
    let gender: String
    let email: String
    let dateOfBirth: String
    let phone: String
    let location: Location
}

struct Location: Decodable{
    let city: String
    let street: String
    let country: String
}
