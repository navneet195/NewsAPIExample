//
//  APIClient.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import RxSwift

class NewsViewModel {
    
    // RxSWift API Callback
    private let baseURL = URL(string: Constants.searchNews)!
    
    func send<PhotoModel: Decodable>(apiRequest: APIRequest, containerView:UIView) -> Observable<[PhotoModel]> {
        return Observable<[PhotoModel]>.create { [unowned self] observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                do {
                    let decoder = JSONDecoder()
                    let model:PhotosList = try decoder.decode(ResponseModel.self, from:
                        dataResponse).photos!  //Decode JSON Response Data
                    let pagesModel = model.photo as! [PhotoModel]
              DispatchQueue.main.async { ShimmerManager.feedShimmer(instanceOf: NewsShimmer(),containerView:containerView , visibility: false)
              }
                    observer.onNext(pagesModel)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}




