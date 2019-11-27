//
//  Constants.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import UIKit

// Applicaiton Shared Secret Key

let SECRET_API_KEY = "97cba130c588f71f"
let appApiKey = "api_key=22681a34404f07669d9ad5c1eacf9567"
let search = "text=news"
// Userdefaults
var userdefaults = UserDefaults.standard
var imageName = "Default.png"

// Navigation Title Name
var listViewName = "Top Headlines"
var detailViewName = "Top Headlines Detail"

// Application API Request
var applicationJosn = "application/json"
var acceptType = "Accept"

struct Constants {
    
  
    static var baseURL = "https://www.flickr.com/services/"
    static var searchNews = baseURL + "rest/?method=flickr.photos.search&\(appApiKey)&\(search)&format=json&nojsoncallback=1&textras=url_t"
       
       static var detailNews = baseURL + "rest/?nojsoncallback=1&format=json&secret=YOUR_APP_SECRET&photo_id=Photo_ID&api_key=YOUR_APP_KEY&method=flickr.photos.getInfo"
       
       static var photoURL = "https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
    
    
}

class CellName {
    static let articleTableviewCell = "ArticleTableviewCell"
}

