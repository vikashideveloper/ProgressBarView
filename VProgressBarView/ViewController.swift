//
//  ViewController.swift
//  VProgressBarView
//
//  Created by Vikash on 13/10/18.
//  Copyright © 2018 Vikash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var progressBar: VProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runProress()
    }
    
    func runProress() {
        var progress: CGFloat = 0.0
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (t) in
            progress += 0.005
            
            if progress < 1.0 {
                self.progressBar.progress = progress
            } else {
                t.invalidate()
            }

        }
    }

}

