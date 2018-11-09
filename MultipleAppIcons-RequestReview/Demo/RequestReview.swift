//
//  RequestReview.swift
//  Shrutify
//
//  Created by shruthi palchandar on 3/5/17.
//  Copyright © 2017 Shruezee. All rights reserved.
//

import Foundation
import StoreKit

let runIncrementerSetting = "numberOfRuns"
let minimumRunCount = 10

//MARK: - Counter for number of runs for the app.

func incrementAppRuns() {
    
    let usD = UserDefaults()
    let runs = getRunCounts() + 1
    usD.setValuesForKeys([runIncrementerSetting: runs])
    usD.synchronize()
    
}

//MARK: - Reads number of runs from UserDefaults and returns it.

func getRunCounts () -> Int {
    
    let usD = UserDefaults()
    let savedRuns = usD.value(forKey: runIncrementerSetting)
    
    var runs = 0
    if (savedRuns != nil) {
        
        runs = savedRuns as! Int
    }
    
    print("Run Counts are \(runs)")
    return runs
    
}

//MARK: - requesting review dialog based on number of runs

func showReview() {
    
    let runs = getRunCounts()
    print("Show Review")
    
    if (runs > minimumRunCount) {
        
        if #available(iOS 10.3, *) {
            print("Review Requested")
            SKStoreReviewController.requestReview()
            
        } else {
            // Fallback on earlier versions
        }
        
    } else {
        
        print("Runs are now enough to request review!")
        
    }
    
}
