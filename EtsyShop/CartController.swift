//
//  CartController.swift
//  EtsyShop
//
//  Created by Maxim  Grozniy on 6/9/17.
//  Copyright © 2017 Maxim  Grozniy. All rights reserved.
//

import UIKit

class CartController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView:
    
    UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CartCell
        
        
        return cell
    }
    
    
    
    
    
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
