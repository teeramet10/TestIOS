//
//  CustomSegmentUIView.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/14/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

@IBDesignable class CustomSegmentUIView : UIView{
    var buttons = [UIButton]()
    
    @IBInspectable
    var borderwidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderwidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
   
    @IBInspectable
    var commaSeparatedButtonTitles: String = ""{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles{
            let button = UIButton(type:.system)
            button.setTitle(buttonTitle, for: .normal)
            buttons.append(button)
        }
        
        let sv = UIStackView(arrangedSubviews:buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = . fillProportionally
        addSubview(sv)
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height/2
    }
}
