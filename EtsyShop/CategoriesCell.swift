//
//  CategoriesCell.swift
//  EtsyShop
//
//  Created by Maxim  Grozniy on 6/9/17.
//  Copyright © 2017 Maxim  Grozniy. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    weak var category: Category? {
        didSet {
            if let categoryTitle = category?.short_name {
                title.text = categoryTitle
            }
            
            if let categorySubtitle = category?.page_description {
                subtitle.text = categorySubtitle
            }
        }
    }
    
    
    
    
    
}
