//
//  ArticlesDetailSource.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import UIKit

class ArticlesDetailSource: UIViewController {
    
    var viewModel: PhotoModel?
    var imageURL : String?
    // MARK: - implementation UI Decleration
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    // MARK: - implementation loadview
    override func viewDidLoad() {
        
        // Navigation Title Setter
        
        navigationItem.title = detailViewName
        lblTitle.text = viewModel?.title
        lblDescription.text = viewModel?.title
   
        if (imageURL!.count > 0)
        {
            print(imageURL!)
            self.imageview?.kf.indicatorType = .activity
            self.imageview?.kf.setImage(with: URL(string: imageURL!))
        }
        else
        {
            self.imageview.image = UIImage(named: imageName)
        }
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
