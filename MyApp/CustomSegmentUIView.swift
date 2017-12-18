//
//  CustomSegmentUIView.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/14/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

@IBDesignable class CustomSegmentUIView : UIControl{
    var buttons = [UIButton]()
    var selector = UIView()
    var selectedSegmentIndex = 0
    
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
    
    @IBInspectable
    var textColor : UIColor = UIColor.darkGray {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectColor : UIColor = UIColor.blue {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectTextColor : UIColor = UIColor.brown{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
  
        subviews.forEach{(view) in
            view.removeFromSuperview()
            }
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles{
            let button = UIButton(type:.system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        let width = frame.width
        let selectorWidth = width/CGFloat(buttons.count)
        selector = UIView(frame: CGRect(x: 0 , y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectColor
        addSubview(selector)
        
        let sv = UIStackView(arrangedSubviews:buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = . fillProportionally
        addSubview(sv)
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
         sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
         sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height/2
    }
    
    @objc func buttonTapped(button : UIButton){
        for (Index , btn)  in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                btn.setTitleColor(selectTextColor, for: .normal)
                selectedSegmentIndex = Index
                let selectorPosition =  frame.width / CGFloat(buttons.count) * CGFloat(Index)
                UIView.animate(withDuration: 0.3, animations:{
                    self.selector.frame.origin.x = selectorPosition
                })
            }
        }
        sendActions(for: .valueChanged)
        
    }
}
