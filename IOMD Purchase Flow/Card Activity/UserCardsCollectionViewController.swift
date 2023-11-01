//
//  UserCardsCollectionViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 01/11/23.
//

import UIKit

class UserCardsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var table1Button: UIButton!
    @IBOutlet weak var table2Button: UIButton!
    @IBOutlet weak var table3Button: UIButton!
    
    @IBOutlet weak var button1View: UIView!
    @IBOutlet weak var button2View: UIView!
    @IBOutlet weak var button3View: UIView!
    
    var currentTableIndex: Int = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        button1View.isHidden = true
        button2View.isHidden = true
        button3View.isHidden = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 0
                }

        let collectionCellNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        
        collectionView.register(collectionCellNib, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        collectionView.scrollToItem(at: IndexPath(item: currentTableIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    @IBAction func table1ButtonTapped(_ sender: UIButton) {
            currentTableIndex = 0
            collectionView.scrollToItem(at: IndexPath(item: currentTableIndex, section: 0), at: .centeredHorizontally, animated: true)
        }

    @IBAction func table2ButtonTapped(_ sender: UIButton) {
            currentTableIndex = 1
            collectionView.scrollToItem(at: IndexPath(item: currentTableIndex, section: 0), at: .centeredHorizontally, animated: true)
        }

    @IBAction func table3ButtonTapped(_ sender: UIButton) {
            currentTableIndex = 2
            collectionView.scrollToItem(at: IndexPath(item: currentTableIndex, section: 0), at: .centeredHorizontally, animated: true)
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
           return cell
       }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return collectionView.frame.size
       }
}
