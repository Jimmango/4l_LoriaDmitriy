//
//  NewsCell.swift
//  AppTest
//
//  Created by Dima Loria on 24.05.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Futura", size: 18)
        label.text = "123"
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Futura", size: 16)
        label.text = "Leren Ipsilum"
        label.textColor = .black
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 8, paddingRight: 8)

        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 8, paddingRight: 8)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        selectionStyle = .none
//
//        let stack = UIStackView(arrangedSubviews: [titleLabel,
//                                                   descriptionLabel])
//
//        // В этом было все дело! //translatesAutoresizingMaskIntoConstraints
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.distribution = .fill
//        stack.spacing = 8
//
//        addSubview(stack)
//        stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 8, paddingRight: 8)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Helper Function
    
//    func animateMenu(shouldExpand: Bool, completion: ((Bool) -> Void)? = nil) {
//
//        if shouldExpand {
//            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
//                self.descriptionLabel.alpha = 1
//            }, completion: nil)
//            self.contentView.layoutIfNeeded()
//        } else {
//            self.descriptionLabel.alpha = 0
//            UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            }, completion: completion)
//            self.contentView.layoutIfNeeded()
//        }
//    }
}


