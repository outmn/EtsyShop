//
//  CategoriesController.swift
//  EtsyShop
//
//  Created by Maxim  Grozniy on 6/9/17.
//  Copyright © 2017 Maxim  Grozniy. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories = [Category]()
    
    var categoriesURL = "https://openapi.etsy.com/v2/taxonomy/categories?api_key=l6pdqjuf7hdf97h1yvzadfce"
    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grabData(url: categoriesURL)
    
    }
    
    
    func grabData(url: String) {
        Alamofire.request(url).responseJSON { response in
            
            self.parseData(JSONData: response.data!)
            
            
        }
        
        
        
        
    }
    
    
    func parseData(JSONData: Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            
            print(readableJSON)
            
            if let pagination = readableJSON["pagination"] as? JSONStandard {
                if let results = pagination["results"] {
                    for i in 0..<results.count {
                        let item = results[i] as! JSONStandard
                        let category = Category()
                        category.short_name = item["short_name"] as! String
                        category.page_description = item["page_description"] as! String
                        
                        categories.append(category)
                        self.collectionView.reloadData()
                    }
                }
            }
            
        } catch {
            print(error)
        }
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
        cell.category = categories[indexPath.item]
        return cell
    }
    
    
    
    @IBAction func search(_ sender: UIBarButtonItem) {
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
