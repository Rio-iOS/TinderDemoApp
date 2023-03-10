//
//  UIImage+Extension.swift
//  TinderDemoApp
//
//  Created by 藤門莉生 on 2023/03/10.
//

import UIKit

extension UIImage {
    func resize(size _size: CGSize) -> UIImage? {
        let widthRatio = _size.width / size.width
        let heihtRatio = _size.height / size.height
        let ratio = widthRatio < heihtRatio ? widthRatio : heihtRatio
        
        let resizeSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(resizeSize, false, 0.0)
        draw(in: CGRect(origin: .zero, size: resizeSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
