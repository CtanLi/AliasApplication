//
//  Extensions.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

protocol Reusable: class {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func dequeReusableCell<T: UITableViewCell>(_ index: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: index) as! T
    }
    
    func dequeReusableView<T: UITableViewCell>() -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.identifier) as! T
    }
}

extension UICollectionView {
    func dequeReusableCell<T: UICollectionViewCell>(_ index: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: index) as! T
    }
}

extension UIViewController {
    func hideKeyboardWhenViewIsTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIImageView {
    func loadImageUsingCacheWithURLString(urlString: String) {
        if urlString == "" {
            return
        }
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async {
                if let downloadedImages = UIImage(data: data!) {
                    imageCache.setObject(downloadedImages, forKey: urlString as NSString)
                    self.image = downloadedImages
                }
            }
        }).resume()
    }
}

extension UIColor {
    convenience init(hexString:String) {
        let hexString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
    public class var blueLightTheme:UIColor {
        return UIColor(red: 40/255, green: 169/255, blue: 225/255, alpha: 1.0)
    }
    
    public class var blueDarkTheme:UIColor {
        return UIColor(red: 0/255, green: 117/255, blue: 168/255, alpha: 1.0)
    }
    
    public class var orangeTheme:UIColor {
        return UIColor(red: 240/255, green: 87/255, blue: 46/255, alpha: 1.0)
    }
    
    public class var lightBlueText:UIColor {
        return UIColor(red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0)
    }
    
    public class var cellExpandBG:UIColor {
        return UIColor(hexString: "eeeeee")
    }
    
    public class var greenAnnotation:UIColor {
        return UIColor(hexString: "003333")
    }
    
    public class var grayTheme:UIColor {
        return UIColor(hexString: "999999")
    }
}
