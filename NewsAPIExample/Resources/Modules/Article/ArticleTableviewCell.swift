//
//  ArticleTableviewCell.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableviewCell: UITableViewCell{
    
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleAuthor: UILabel!
    @IBOutlet weak var imgviewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func bind(_ viewModel:PhotoModel) {
        
        self.lblArticleTitle?.text = viewModel.title
        self.lblArticleAuthor?.text = ""
        
        self.lblArticleAuthor?.adjustsFontSizeToFitWidth = true
        
        
           let url = Constants.photoURL
           var imgURL = url.replacingOccurrences(of: "{farm-id}", with: "\(viewModel.farm!)")
           imgURL = imgURL.replacingOccurrences(of: "{id}", with:viewModel.id!)
           imgURL = imgURL.replacingOccurrences(of: "{secret}", with:viewModel.secret!)
           imgURL = imgURL.replacingOccurrences(of: "{server-id}", with:viewModel.server!)
         
        if (imgURL.count > 0)
        {
                self.imageArticle?.kf.indicatorType = .activity
                self.imageArticle?.kf.setImage(with: URL(string: imgURL))
                self.imgviewHeightConstraint.constant = self.imageArticle.contentClippingRect.height
                self.layoutIfNeeded()
        }
        else
        {
             self.imageArticle.image = UIImage(named: imageName)
        }
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        layer.backgroundColor = UIColor.clear.cgColor
    }

}

