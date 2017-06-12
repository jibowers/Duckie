//
//  VentViewController.swift
//  Duckie
//
//  Created by appleone on 6/7/17.
//  Copyright © 2017 jbowers. All rights reserved.
//

import UIKit

class VentViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var worriesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        worriesTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        // make pretty fade in and out animation for entered text
        
        
        let label = UILabel(frame: CGRectMake(0, 0, 200, 21))
        
        // get screen size
        let bounds = UIScreen.mainScreen().bounds
        let screenHeight = UInt32(bounds.size.height)
        let screenWidth = UInt32(bounds.size.width)
        
        // choose random point (at least 50 away from edge) to put label's center
        let labelX = CGFloat(arc4random_uniform(screenWidth - 100) + 50)
        let labelY = CGFloat(arc4random_uniform(screenHeight - 100) + 50)
        label.center = CGPointMake(labelX, labelY)

        // set alignment, text, font size, and color of label
        label.textAlignment = NSTextAlignment.Center
        label.text = worriesTextField.text
        label.font = label.font.fontWithSize(12)
        label.textColor = UIColor.whiteColor()
        
        // sets label as transparent
        label.alpha = 0.0
        
        
        // remove text from worriesTextField
        worriesTextField.text = ""
        
        // label fades in and out
        let fadeInTime:NSTimeInterval = 2.0
        let fadeOutTime:NSTimeInterval = 2.0
        UIView.animateWithDuration(fadeInTime, animations:
            {label.alpha = 0.8}, completion: {(complete: Bool) in UIView.animateWithDuration(fadeOutTime, animations: {label.alpha = 0.0})})
        /*
        
*/
        
      
        
        self.view.addSubview(label)
    }
    
    
    
}

/*
public extension UIView {
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeIn(duration duration: NSTimeInterval = 5.0) {
        
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(duration duration: NSTimeInterval = 5.0) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0.0
        })
    }
    
}
*/
