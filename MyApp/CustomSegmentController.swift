//
//  CustomSegmentController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/14/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class CustomSegmentController: UISegmentedControl {
    let selectedBackgroundColor = UIColor(red: 19/255, green: 59/255, blue: 85/255, alpha: 0.5)
    var sortedViews: [UIView]!
    var currentIndex: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure(){
        sortedViews = self.subviews.sorted(by:{$0.frame.origin.x < $1.frame.origin.x})
        changeSelectIndex(to: currentIndex)
        self.tintColor = UIColor.white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        let unselectedAttributes = [NSAttributedStringKey.foregroundColor: UIColor.blue,
                                    NSAttributedStringKey.font:  UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)]
        let selectAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white,
                               NSAttributedStringKey.font:  UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)]
        self.setTitleTextAttributes(unselectedAttributes, for: .normal)
        self.setTitleTextAttributes(selectAttribute, for: .selected)
    
    }
    
    func changeSelectIndex(to newIndex: Int){
        sortedViews[currentIndex].backgroundColor = UIColor.clear
        currentIndex = newIndex
        self.selectedSegmentIndex = UISegmentedControlNoSegment
        sortedViews[currentIndex].backgroundColor = selectedBackgroundColor
    }
 

}
