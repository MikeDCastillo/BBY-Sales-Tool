//
//  ToolCollectionCell.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 6/19/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout

class ToolCollectionCell: CollectionViewSlantedCell, Nameable {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var gradient = CAGradientLayer()
    private var sellingTools: [SellingTool] {
        return SellingToolController.shared.sellingTools
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let backgroundView = backgroundView {
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.frame = backgroundView.bounds
            backgroundView.layer.addSublayer(gradient)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let backgroundView = backgroundView {
            gradient.frame = backgroundView.bounds
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    func offset(_ offset: CGPoint) {
        imageView.frame = self.imageView.bounds.offsetBy(dx: offset.x, dy: offset.y)
    }
    
}
