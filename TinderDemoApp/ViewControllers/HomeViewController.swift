//
//  ViewController.swift
//  TinderDemoApp
//
//  Created by 藤門莉生 on 2023/03/10.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        view.backgroundColor = .white
        
        let view1 = UIView()
        view1.backgroundColor = .yellow
        let view2 = UIView()
        view2.backgroundColor = .blue
        let view3 = BottomControlView()
        
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            view1.heightAnchor.constraint(equalToConstant: 100),
            view3.heightAnchor.constraint(equalToConstant: 120),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
        
    }


}

