//
//  BottomControlView.swift
//  TinderDemoApp
//
//  Created by 藤門莉生 on 2023/03/10.
//

import UIKit

class BottomControlView: UIView {
    
    let view1 = BottomButtonView(frame: .zero, width: 50, imageName: "reload")
    let view2 = BottomButtonView(frame: .zero, width: 60, imageName: "nope")
    let view3 = BottomButtonView(frame: .zero, width: 50, imageName: "superlike")
    let view4 = BottomButtonView(frame: .zero, width: 60, imageName: "like")
    let view5 = BottomButtonView(frame: .zero, width: 50, imageName: "boost")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseStackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4, view5])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [
            baseStackView.topAnchor.constraint(equalTo: topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
            
        ].forEach { $0.isActive = true }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomButtonView: UIView {
    var button: BottomButton?
    
    init(frame: CGRect, width: CGFloat, imageName: String) {
        super.init(frame: frame)
        
        button = BottomButton(type: .custom)
        button?.setImage(UIImage(named: imageName)?.resize(size: .init(width: width * 0.4, height: width * 0.4)), for: .normal)
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width / 2
            
        button?.layer.shadowOffset = .init(width: 1.5, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
            
        button?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(button!)
       [
        button?.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        button?.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        button?.widthAnchor.constraint(equalToConstant: width),
        button?.heightAnchor.constraint(equalToConstant: width)
       ].forEach{ $0?.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomButton: UIButton {
    // アニメーション
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
            }
                
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
