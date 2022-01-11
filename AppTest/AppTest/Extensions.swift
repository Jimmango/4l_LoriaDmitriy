//
//  Extensions.swift
//  AppTest
//
//  Created by Dima Loria on 24.05.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static func mainPink() -> UIColor {
        return UIColor.rgb(red: 221, green: 94, blue: 86)
    }
    static func blue() -> UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237)
    }
    
    static func purple() -> UIColor {
        return UIColor.rgb(red: 98, green: 0, blue: 238)
    }
    
    static func pink() -> UIColor {
        return UIColor.rgb(red: 255, green: 148, blue: 194)
    }
    
    static func teal() -> UIColor {
        return UIColor.rgb(red: 3, green: 218, blue: 197)
    }
}

var news: NewsAPI? = nil

enum Colors: Int, CaseIterable {
    case Purple
    case Pink
    case Teal
    
    var description: String {
        switch self {
        case .Purple: return "Purple"
        case .Pink: return "Pink"
        case .Teal: return "Teal"
        }
    }
    
    var color: UIColor {
        switch self {
        case .Purple: return UIColor.purple()
        case .Pink: return UIColor.pink()
        case .Teal: return UIColor.teal()
        }
    }
}

extension UIView {
    
    func center(inView view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,  paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
}
