//
//  CustomerRecSheetViewController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/16/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
// https://www.raywenderlich.com/87899/make-simple-drawing-app-uikit-swift

import UIKit

class CustomerRecSheetViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var recSheetImageView: UIImageView!
    @IBOutlet weak var zoomSlider: UISlider!
    
    
    // MARK: - IBActions

    @IBAction func addSkuButtonTapped(_ sender: Any) {
    }
    @IBAction func minusButtonTapped(_ sender: Any) {
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
    }
    @IBAction func zoomSliderValueChanged(_ sender: Any) {
    }
    
    
    // MARK: - Properties
   
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
        func layoutSubviews() {
            self.recSheetImageView.clipsToBounds = true
            self.recSheetImageView.isMultipleTouchEnabled = false
            lineColor = UIColor.black //setDrawingColor(selectedColor: <#T##UIColor#>)
            lineWidth = 1 //setDrawingLineWidth(width: <#T##CGFloat#>)
    }
    
    /// runs when initial touch is detected
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self.recSheetImageView)
    }
    
    /// runs when movement detected during touch interaction
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self.recSheetImageView)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        ///this gets continously called everytime movement is detected
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        // can animate this step
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        /// Makes line more smooth
        shapeLayer.lineCap = kCALineCapRound
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.recSheetImageView.layer.addSublayer(shapeLayer)
        self.recSheetImageView.setNeedsDisplay()
    }
    
    func clearDrawnObjects(){
        path.removeAllPoints()
        self.recSheetImageView.layer.sublayers = nil
        recSheetImageView.setNeedsDisplay()
    }
    
    func setDrawingLineWidth(width: CGFloat) -> CGFloat {
                // TODO: - This is where the user selects the line width
        var width = width
        return width
    }
    
    func setDrawingColor(selectedColor: UIColor) -> UIColor {
                // TODO: - this is where User selected color goes
        var selectedColor = selectedColor
        return selectedColor
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSubviews()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - Fileprivate

extension CustomerRecSheetViewController {}
