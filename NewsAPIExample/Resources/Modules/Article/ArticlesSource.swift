//
//  ArticlesSource.swift
//  NewsAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ArticlesSource: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    // MARK: - implementation UI
    @IBOutlet weak var tblview: UITableView!
    private let disposeBag = DisposeBag()
    private let newsViewModel = NewsViewModel()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Top Headlines"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShimmerManager.feedShimmer(instanceOf: NewsShimmer(),containerView: self.containerView , visibility: true)
        configureProperties()
        configureLayout()
        configureReactiveBinding()
        
    }
    
    // MARK: -- todo: write init for [cellIdentifiers]
    private func configureProperties() {
        
        tblview.register(UINib(nibName: CellName.articleTableviewCell, bundle: nil), forCellReuseIdentifier: CellName.articleTableviewCell)
        navigationItem.title = listViewName
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureLayout() {
        
        tblview.contentInset.bottom = view.safeAreaInsets.bottom
        tblview.estimatedRowHeight = 108.0
        tblview.rowHeight = UITableView.automaticDimension
        
    }
    
    private func configureReactiveBinding() {
        
        searchController.searchBar.rx.text.asObservable()
            .map { ($0 ?? "").lowercased() }
            .map { ArticleAPIRequest(name: $0) }
            .flatMap { request -> Observable<[PhotoModel]> in
                return self.newsViewModel.send(apiRequest: request, containerView:self.containerView)
        }
            
          
                
            
        .bind(to: tblview.rx.items(cellIdentifier: CellName.articleTableviewCell, cellType: ArticleTableviewCell.self)) { row, viewModel, cell in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
        
        
        tblview.rx.modelSelected(PhotoModel.self)
            .subscribe(onNext: { item in
                
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticlesDetailSource") as? ArticlesDetailSource
                vc!.viewModel = item
                let url = Constants.photoURL
                var imgURL = url.replacingOccurrences(of: "{farm-id}", with: "\(item.farm!)")
                imgURL = imgURL.replacingOccurrences(of: "{id}", with:item.id!)
                imgURL = imgURL.replacingOccurrences(of: "{secret}", with:item.secret!)
                imgURL = imgURL.replacingOccurrences(of: "{server-id}", with:item.server!)
                
                vc!.imageURL = imgURL
                self.navigationController?.pushViewController(vc!, animated: true)
                
            }).disposed(by: self.disposeBag)
        
    }
    
}
