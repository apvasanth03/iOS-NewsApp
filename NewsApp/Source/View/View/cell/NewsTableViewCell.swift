//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 27/06/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import UIKit
import Presentation
import SDWebImage

/**
 News TableView Cell.
 */
class NewsTableViewCell: UITableViewCell {

    // MARK: - Properties.
    static let IDENTIFIER = "NewsTableViewCell"
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lAdditionalInfo: UILabel!
    
    // MARK: - UITableViewCell Methods.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initializeCell()
    }
    
    // MARK: - Public Methods.
    func populateCell(news: NewsArticleUIModel){
        var imageURL: URL? = nil
        if let urlToImage = news.urlToImage{
            imageURL = URL(string: urlToImage)
        }
        let additionalInfo = "\(news.source) - \(news.publishedAt)"
        
        ivImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "ic_default_thumbnail"))
        lTitle.text = news.title
        lAdditionalInfo.text = additionalInfo
    }
    
    // MARK: - Private Methods.
    private func initializeCell(){
        self.selectionStyle = .none
        
        lTitle.font = Font.body.value
        lTitle.textColor = Color.darkText.value
        
        lAdditionalInfo.font = Font.footnote.value
        lAdditionalInfo.textColor = Color.intermidiateText.value
    }
    
}
