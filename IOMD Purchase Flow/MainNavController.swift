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
        
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: "GreenScreenViewController") as! GreenScreenViewController
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
        let userInfoVC = storyboard?.instantiateViewController(withIdentifier: "SavedInformationViewController") as! SavedInformationViewController

        viewControllers = [settingsVC, homeVC, userInfoVC]
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true

        selectedIndex = 1
    }
}






