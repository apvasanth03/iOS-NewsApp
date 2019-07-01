//
//  ErrorView.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 27/06/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import UIKit

/**
 A View for Error states.
 */
@IBDesignable
class ErrorView: UIView{
    
    // MARK: - Properties.
    @IBInspectable
    var icon: UIImage? = nil{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var title: String = ""{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var message: String = ""{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lMessage: UILabel!
    
    // MARK: - Init.
    init(icon: UIImage?, title: String, message: String) {
        super.init(frame: CGRect.zero)
        
        self.icon = icon
        self.title = title
        self.message = message
        
        initializeView()
    }
    
    
    // MARK: - UIView Methods.
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    override func draw(_ rect: CGRect) {
        ivIcon.image = icon
        lTitle.text = title
        lMessage.text = message
    }
    
    // MARK: - Private Methods.
    func initializeView(){
        let bundle = Bundle(for: ErrorView.self)
        bundle.loadNibNamed(String(describing: ErrorView.self), owner: self, options: nil)
        
        // Pin the content to the view edges.
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame = self.frame
        self.addSubview(contentView)
        NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        
        // Style views.
        lTitle.font = Font.body.value
        lTitle.textColor = Color.darkText.value
        
        lMessage.font = Font.subHeadline.value
        lMessage.textColor = Color.darkText.value
    }
}
