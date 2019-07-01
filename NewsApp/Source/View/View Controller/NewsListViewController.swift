//
//  ViewController.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import HttpClient
import Domain
import Data
import Remote
import Presentation
import SafariServices
import Swinject

/**
 News List View Controller.
 */
class NewsListViewController: UIViewController {
    
    // MARK: - Properties.
    @IBOutlet weak var tvNews: UITableView!
    @IBOutlet weak var aiProgress: UIActivityIndicatorView!
    
    // Dependencies.
    fileprivate var viewModel: NewsListViewModel!
    
    fileprivate var errorView: ErrorView?
    fileprivate let disposeBag = DisposeBag()
    
    // MARK: - UIViewController Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeDependencies()
        initializeViews()
        addListeners()
        setUpViewModelBindings()
        
        viewModel.fetchNewsArticles()
    }
    
    // MARK: - Private Methods.
    fileprivate func initializeDependencies(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Create child asembler - newsListAssembler - which can access all dependencies registerd in appAssembler.
        let newsListAssembly = NewsListAssembly()
        let newsListAssembler = Assembler([newsListAssembly], parent: appDelegate.appAssembler)
        
        self.viewModel = newsListAssembler.resolver.resolve(NewsListViewModel.self)!
    }
    
    fileprivate func initializeViews(){
        navigationController?.navigationBar.barTintColor = Color.theme.value
        navigationController?.navigationBar.tintColor = Color.background.value
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.navigationTitleText.value, NSAttributedString.Key.font: Font.headline.value]
        self.title = "news_article_list_title".localized
        
        view.backgroundColor = Color.background.value
        
        tvNews.register(UINib(nibName: NewsTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.IDENTIFIER)
        tvNews.estimatedRowHeight = 100
        tvNews.rowHeight = UITableView.automaticDimension
        tvNews.tableFooterView = UIView()
        
        aiProgress.color = Color.theme.value
        aiProgress.stopAnimating()
    }
    
    fileprivate func addListeners(){
        tvNews.rx.itemSelected
            .subscribe(onNext: { indexPath in
                self.viewModel.onNewsArticleItemClicked(at: indexPath.row)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - ViewModel Bindings Extension
extension NewsListViewController{
    
    fileprivate func setUpViewModelBindings(){
        bindViewState()
        bindNewsDataSource()
        bindGoToNewsDetailScreen()
    }
    
    // Bind ViewState.
    fileprivate func bindViewState(){
        viewModel.viewState
            .subscribe(onNext: { state in
                switch state{
                case .initial:
                    self.populateInitialViewState()
                case .loading:
                    self.populateLoadingViewState()
                case .data:
                    self.populateDataViewState()
                case .noInternet:
                    self.populateNoInternetViewState()
                case .error:
                    self.populateErrorViewState()
                }
            }).disposed(by: disposeBag)
    }
    
    fileprivate func populateInitialViewState(){
        
    }
    
    fileprivate func populateLoadingViewState(){
        errorView?.removeFromSuperview()
        tvNews.isHidden = true
        aiProgress.startAnimating()
    }
    
    fileprivate func populateDataViewState(){
        errorView?.removeFromSuperview()
        tvNews.isHidden = false
        aiProgress.stopAnimating()
    }
    
    fileprivate func populateNoInternetViewState(){
        tvNews.isHidden = true
        aiProgress.stopAnimating()
        
        populateErrorView(title: "no_network_error_title".localized, message: "no_network_error_message".localized)
    }
    
    fileprivate func populateErrorViewState(){
        tvNews.isHidden = true
        aiProgress.stopAnimating()
        
        populateErrorView(title: "unknown_error_title".localized, message: "unknown_error_message".localized)
    }
    
    fileprivate func populateErrorView(title: String, message: String){
        errorView = ErrorView(icon: UIImage(named: "ic_error_outline"), title: title, message: message)
        
        if let errorView = errorView{
            // Pin the errorView to the view edges.
            errorView.translatesAutoresizingMaskIntoConstraints = false
            errorView.frame = view.frame
            view.addSubview(errorView)
            NSLayoutConstraint(item: errorView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: errorView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: errorView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: errorView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        }
    }
    
    // Bind DataSource.
    fileprivate func bindNewsDataSource(){
        viewModel.newsArticlesDataSource
            .bind(to: tvNews.rx.items(cellIdentifier: NewsTableViewCell.IDENTIFIER, cellType: NewsTableViewCell.self)){ (row, element, cell) in
                cell.populateCell(news: element)
            }.disposed(by: disposeBag)
    }
    
    // Bind "GoToNewsDetailScreen"
    fileprivate func bindGoToNewsDetailScreen(){
        viewModel.goToNewsDetailScreen
            .subscribe(onNext: { newsArticle in
                self.goToNewsDetailScreen(newsArticle: newsArticle)
            }).disposed(by: disposeBag)
    }
    
    fileprivate func goToNewsDetailScreen(newsArticle: NewsArticleUIModel){
        if let url = URL(string: newsArticle.url){
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true)
        }
    }
    
}

