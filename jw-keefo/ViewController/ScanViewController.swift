//
//  ScanViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import LabCodeSDK

class ScanViewController: DetectViewController, DetectViewControllerProtocol {
    
    func abnormalExecution(reason: String) {
        
    }
    
    func getDetectResult(data: Dictionary<String, Any>) {
        
    }
    
    
    //MARK: = View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.activateLabTracking(uniqueValue: "스냅태그")
        print("ScanViewController ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
