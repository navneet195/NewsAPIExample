//
//  ArticleModel.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation

struct ResponseModel : Decodable {
    let stat: String?
    let photos : PhotosList?
}

struct PhotosList : Decodable {
    let page : Int?
    let pages : Int?
    let perpage : Int?
    let total : String?
    let photo : [PhotoModel]
}

struct PhotoModel: Decodable {

       var farm : Int?
       var id : String?
       var isfamily : Int?
       var isfriend : Int?
       var ispublic : Int?
       var owner : String?
       var secret : String?
       var server : String?
       var title : String?
}
