//
//  ViewController.swift
//  Shrutify
//
//  Created by shruthi palchandar on 3/5/17.
//  Copyright © 2017 Shruezee. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
    //MARK:- Request Review

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:- Change this to be called based on userDefaults after some runs
        SKStoreReviewController.requestReview() // showReview()
    }

    //MARK:- Set Alternate Icon
    
    @IBAction func changeAppIcon(_ sender: Any) {
        
        if UIApplication.shared.supportsAlternateIcons {
            print("you can change this app's icon")
        }else {
            print("you cannot change this app's icon")
            return
        }
        
        if let _ = UIApplication.shared.alternateIconName {
            /// CHANGE TO PRIMARY
            Theme.setDark(self.view)
            
            UIApplication.shared.setAlternateIconName(nil) { _ in } /// 1
            
        }else {
            /// CHANGE TO ALTERNATE
            Theme.setLight(self.view)
            
            UIApplication.shared.setAlternateIconName("LightAppIcon") { (err:Error?) in
                print("set icon error：\(String(describing: err))") /// 2
            }
        }
    }
    
}

//MARK:- Setting Theme

struct Theme {
    
    static func setLight(_ forView:UIView) {
        
        forView.backgroundColor = UIColor.white
        
        for subView in forView.subviews {
            if let _ = subView as? UILabel{
                (subView as! UILabel).textColor = UIColor.darkText
            }
        }
        
    }
    
    static func setDark(_ forView:UIView) {
        
        forView.backgroundColor = UIColor.darkGray
        
        for subView in forView.subviews {
            if let _ = subView as? UILabel{
                (subView as! UILabel).textColor = UIColor.lightText
            }
        }
        
    }
    
    
}
