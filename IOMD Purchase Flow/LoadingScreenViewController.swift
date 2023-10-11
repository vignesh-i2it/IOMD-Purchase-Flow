//
//  LoadingScreenViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let scaleFactor: CGFloat = 2.0
        loadingSpinner.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)

        loadingSpinner.startAnimating()
        

        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(navigateToPurchaseViewController), userInfo: nil, repeats: false)
    
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
    }
    
    @objc func navigateToPurchaseViewController() {
//
//        let purchaseVC = storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
//        self.navigationController?.pushViewController(purchaseVC, animated: true)
//
        let tabBar = storyboard?.instantiateViewController(withIdentifier: "MainNavController") as! MainNavController
        self.navigationController?.pushViewController(tabBar, animated: true)
        
    }
}
