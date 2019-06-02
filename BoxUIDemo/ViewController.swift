//
//  ViewController.swift
//  BoxUIDemo
//
//  Created by Madhav on 01/06/19.
//  Copyright © 2019 Madhav. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var customTableView: UITableView!
        
    let arrImages:[UIImage] = [UIImage(named: "ad_1.jpg")!,
    UIImage(named: "ad_2.jpg")!,
    UIImage(named: "ad_3.jpg")!,
    UIImage(named: "ad_4.jpg")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customTableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CatCell")
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.customTableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdvertiseCell
            cell.adsCollectionView.delegate = self
            cell.adsCollectionView.dataSource = self
            cell.arrImages = arrImages as NSArray
            cell.pageView.numberOfPages = arrImages.count
            return cell
        } else {
            let cell = self.customTableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CategoriesCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath)
        let image = cell.viewWithTag(3) as! UIImageView
        image.image = arrImages[indexPath.row]
        
        return cell
    }
}
