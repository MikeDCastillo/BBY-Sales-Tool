//
//  UIImageHelper.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/21/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// Scale a .PDF file into a high resolution UIImage
    ///
    /// - Parameter url: use CRW URL here
    /// - Returns: upscaled UIImage for readability
    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        let dpi: CGFloat = 300.0 / 72.0
        let pageRect = page.getBoxRect(.mediaBox)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: pageRect.size.width * dpi, height: pageRect.size.height * dpi))
        
        let img1 = renderer.jpegData(withCompressionQuality: 1.0, actions: { cnv in
            UIColor.white.set()
            cnv.fill(pageRect)
            cnv.cgContext.translateBy(x: 0.0, y: pageRect.size.height * dpi);
            cnv.cgContext.scaleBy(x: dpi, y: -dpi);
            cnv.cgContext.drawPDFPage(page);
            
        })
        let img2 = UIImage(data: img1)
        return img2
    }
    
}

