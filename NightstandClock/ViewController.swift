//
//  ViewController.swift
//  NightstandClock
//
//  Created by Stephen Testen on 12/24/17.
//  Copyright © 2017 Stephen Testen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minuteCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var hourMinuteColonLabel: UILabel!
    @IBOutlet weak var minuteSecondColonLabel: UILabel!
    let clock = Clock()
    var timer: Timer?
    var hours: String?
    var minutes: String?
    var seconds: String?
    var alpha: CGFloat!
    var previousTranslation: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeLabel()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        alpha = 1;
        previousTranslation = 0;
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        
        if recognizer.state == .ended { previousTranslation = 0 }
        else {
            let change = (translation.y - previousTranslation) / self.view.frame.size.height
            previousTranslation = translation.y
            alpha = alpha - change
            if alpha > 1 { alpha = 1 }
            if alpha < 0 { alpha = 0 }
            updateTextAlpha()
        }
        NSLog("Alpha = " + String(describing: alpha))
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.allButUpsideDown
    }
    
    func updateTextAlpha() {
        hourLabel.alpha = alpha;
        minuteLabel.alpha = alpha;
        secondLabel.alpha = alpha;
        hourMinuteColonLabel.alpha = alpha;
        minuteSecondColonLabel.alpha = alpha;
    }
    
    @objc func updateTimeLabel() {
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "HH"
        hourLabel.text = hourFormatter.string(from: clock.currentTime as Date);
        
        let minuteFormatter = DateFormatter()
        minuteFormatter.dateFormat = "mm"
        minuteLabel.text = minuteFormatter.string(from: clock.currentTime as Date);
        
        let secondFormatter = DateFormatter()
        secondFormatter.dateFormat = "ss"
        secondLabel.text = secondFormatter.string(from: clock.currentTime as Date);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
}

