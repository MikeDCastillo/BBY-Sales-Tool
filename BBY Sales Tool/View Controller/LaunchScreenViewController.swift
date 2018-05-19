//
//  LaunchScreenViewController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/17/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

        // TODO: - Netowrk Connectivity status
            // indicator + textfield

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var sloganTextView: UITextView!
    @IBOutlet weak var networkActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var networkStatusTextField: UITextField!
    
   fileprivate let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackgorund()
        animateLogo()
        animateGradientLayer()
        timeToLeaveSplashScreen(time: 6)
    }
    
    
    // MARK: - Fileprivate
    
    @objc fileprivate func transitionToRecSheetView() {
        performSegue(withIdentifier: Keys.toCustomerRecSheetViewController, sender: nil)
    }
    
   fileprivate func timeToLeaveSplashScreen(time: Double) {
        let timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(transitionToRecSheetView), userInfo: nil, repeats: false)
    }

    fileprivate func setGradientBackgorund() {
        gradientLayer.frame.size = self.view.frame.size
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.blue.withAlphaComponent(1).cgColor]
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 1.0, y: -0.2)
        gradientLayer.endPoint = CGPoint(x: 1.2, y: 1.0)

    }
    
    fileprivate func animateLogo() {
        logoImageView.alpha = 0
        sloganTextView.alpha = 0
        
        view.bringSubview(toFront: sloganTextView)
        view.bringSubview(toFront: logoImageView)
        
        UIView.animate(withDuration: 3) {
            self.sloganTextView.alpha = 1.0
            self.logoImageView.alpha = 1.0
        }
    }

    fileprivate func animateGradientLayer() {
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 4
        gradientAnimation.toValue = [
            UIColor(red: 248/255, green: 240/255, blue: 0/255, alpha: 0.3).cgColor,
            UIColor(red: 11/255, green: 52/255, blue: 240/255, alpha: 0.8).cgColor,
            UIColor(red: 244/255, green: 223/255, blue: 6/255, alpha: 0.6).cgColor
            ]
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientLayer.add(gradientAnimation, forKey: "colorChange")
    }
    
}