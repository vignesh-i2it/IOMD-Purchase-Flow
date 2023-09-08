//
//  ViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        showLoadingScreenViewController()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTapGesture()
    }
    
    private func setupTapGesture() {
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    private func showLoadingScreenViewController() {
        
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "LoadingScreenViewController") as! LoadingScreenViewController
        
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.modalPresentationStyle = .fullScreen

        self.navigationController?.pushViewController(destinationVC, animated: true)
    }

}

