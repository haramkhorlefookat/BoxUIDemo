//
//  AdvertiseCell.swift
//  BoxUIDemo
//
//  Created by Madhav on 01/06/19.
//  Copyright © 2019 Madhav. All rights reserved.
//

import UIKit

class AdvertiseCell: UITableViewCell {
    
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    var timer = Timer()
    var counter = 0
    var arrImages: NSArray!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeAdverties), userInfo: nil, repeats: true)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @objc func changeAdverties() {
        if counter < arrImages.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.adsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.adsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.pageView.currentPage = counter
        }
    }
    
}
