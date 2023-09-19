//
//  MainNavController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 19/09/23.
//

import UIKit

class MainNavController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

           // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
            let settingsVC = storyboard?.instantiateViewController(withIdentifier: "GreenScreenViewController") as! GreenScreenViewController
            let homeVC = storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
            let userInfoVC = storyboard?.instantiateViewController(withIdentifier: "SavedInformationViewController") as! SavedInformationViewController


            viewControllers = [settingsVC, homeVC, userInfoVC]

            selectedIndex = 1
        }
    }






