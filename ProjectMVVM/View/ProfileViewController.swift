//
//  ProfileViewController.swift
//  ProjectMVVM
//
//  Created by Ronald Meliton Borda Bernaola on 7/05/22.
//

import UIKit

class ProfileViewController: UIViewController {
    let userViewModel = UserViewModel()
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblbirthday: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblgender: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblstreet: UILabel!
    @IBOutlet weak var lblcountry: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await setUpData()
        }       
    }
    func setUpData() async{
        await userViewModel.getDataUserFromAPI()
        let userName="\(userViewModel.users!.firstName) \(userViewModel.users!.lastName)"
        lblUser.text=userName
        imageUser.image=HelperImage.setImageFromUrl(url: userViewModel.users!.picture)!
        imageUser.layer.cornerRadius=imageUser.frame.size.width / 2
        lblemail.text=userViewModel.users?.email
        lblbirthday.text=userViewModel.users?.dateOfBirth
        lblphone.text=userViewModel.users?.phone
        lblcity.text=userViewModel.users?.location.city
        lblstreet.text=userViewModel.users?.location.street
        lblcountry.text=userViewModel.users?.location.country
        print(userViewModel.users!)
    }

}
