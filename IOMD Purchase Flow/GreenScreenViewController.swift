//
//  GreenScreenViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 15/09/23.
//

import UIKit

class GreenScreenViewController: UIViewController {

    @IBOutlet weak var startOverButton: UIButton!
    
    @IBOutlet weak var cardActivityButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func startOverButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cardActivityButtonTapped(_ sender: Any) {
        
        let cardActivityScreen = storyboard?.instantiateViewController(withIdentifier: "UsedCardsViewController") as! UsedCardsViewController

        self.navigationController?.pushViewController(cardActivityScreen, animated: true)
        
        
    }

    
    
    
    
    
}
