//
//  CustomerRecSheetViewController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/16/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
// https://www.raywenderlich.com/87899/make-simple-drawing-app-uikit-swift
// https://www.raywenderlich.com/159481/uiscrollview-tutorial-getting-started
// https://github.com/Ricky-Choi/UIScrollView-AutoLayout

import UIKit

class CustomerRecSheetViewController: UIViewController {
    // TODO: - scale pdf before loading into imageView
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recSheetImageView: UIImageView!
    @IBOutlet weak var zoomSlider: UISlider!
    @IBOutlet weak var recSheetImageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var recSheetImageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var recSheetImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var recSheetImageViewTrailingConstraint: NSLayoutConstraint!
    
    
    // MARK: - Properties
    
    fileprivate var lineColor: UIColor!
    fileprivate var lineWidth: CGFloat!
    fileprivate var path: UIBezierPath!
    fileprivate var touchPoint: CGPoint!
    fileprivate var startingPoint: CGPoint!
    fileprivate var scrollingIsEnabled: Bool = true
    fileprivate var drawingIsEnabled: Bool = false
    fileprivate var highlightingIsEnabled: Bool = false
    fileprivate var whiteOutIsEnabled: Bool = false
    fileprivate var scrollViewMin = 0.0
    fileprivate var scrolViewMax = 4.0
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSubviews()
        //Set initial Zoom of ScrollView
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        
    }
    
    // MARK: - IBActions
    
    @IBAction func addSkuButtonTapped(_ sender: Any) {
    }
    @IBAction func minusButtonTapped(_ sender: Any) {
        scrollView.zoomScale -= 0.15
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
        scrollView.zoomScale += 0.15
    }
    @IBAction func zoomSliderValueChanged(_ sender: UISlider) {
        zoomSlider.minimumValue = Float(scrollViewMin)
        zoomSlider.maximumValue = Float(scrolViewMax)
        scrollView.zoomScale = CGFloat(sender.value)
    print("\(sender.value)")
    }
    
    
    //     MARK: - Fileprivate
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
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
        // this gets continously called everytime movement is detected
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    fileprivate func layoutSubviews() {
        self.recSheetImageView.clipsToBounds = true
        self.recSheetImageView.isMultipleTouchEnabled = false
        
        // TODO: - uncomment below lines and allow user inputted values
        lineColor = UIColor.black //setDrawingColor(selectedColor: <#T##UIColor#>)
        lineWidth = 1 //setDrawingLineWidth(width: <#T##CGFloat#>)
    }
    
    fileprivate func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        // can animate this step
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        // Makes line more smooth
        shapeLayer.lineCap = kCALineCapRound
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.recSheetImageView.layer.addSublayer(shapeLayer)
        self.recSheetImageView.setNeedsDisplay()
    }
    
    fileprivate func clearDrawnObjects() {
        path.removeAllPoints()
        self.recSheetImageView.layer.sublayers = nil
        recSheetImageView.setNeedsDisplay()
    }
    
    fileprivate func setDrawingLineWidth(width: CGFloat) -> CGFloat {
        // TODO: - This is where the user selects the line width
        var width = width
        return width
    }
    
    fileprivate func setDrawingColor(selectedColor: UIColor) -> UIColor {
        // TODO: - this is where User selected color goes
        var selectedColor = selectedColor
        return selectedColor
    }
    
    /// This method calculates the zoom scale for the scroll view
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / recSheetImageView.bounds.width
        let heightScale = size.height / recSheetImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
    
    fileprivate func updateConstraintsForSizes(_ size: CGSize) {
        //        let yOffset = max(0, (size.height - recSheetImageView.frame.height) / 2)
        //        recSheetImageViewTopConstraint.constant = yOffset
        //        recSheetImageViewBottomConstraint.constant = yOffset
        recSheetImageView.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor)
        recSheetImageView.centerYAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerYAnchor)
        //        let xOffset = max(0, (size.width - recSheetImageView.frame.width) / 2)
        //        recSheetImageViewLeadingConstraint.constant = xOffset
        //        recSheetImageViewTrailingConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
    
}


// MARK: - ScrollView Delegate

extension CustomerRecSheetViewController: UIScrollViewDelegate {
    
    /// called everytime scroll interaction is detected
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSizes(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return recSheetImageView
    }
    
}
