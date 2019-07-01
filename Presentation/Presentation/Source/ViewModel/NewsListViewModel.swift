//
//  NewsListViewModel.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 09/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import RxSwift
import Domain
import HttpClient

/**
 ViewModel for our NewsList Screen.
 */
public class NewsListViewModel{
    
    // MARK: Inner Types.
    public enum ViewState{
        case initial
        case loading
        case data
        case noInternet
        case error
    }
    
    // MARK: Properties.
    // Public View properties.
    public let viewState: BehaviorSubject<ViewState> = BehaviorSubject(value: .initial)
    public let newsArticlesDataSource: BehaviorSubject<[NewsArticleUIModel]> = BehaviorSubject(value: [])
    public let goToNewsDetailScreen: PublishSubject<NewsArticleUIModel> = PublishSubject()
    
    // Other propeties.
    fileprivate let getNewsArticleUseCase: GetNewsArticlesUseCase
    fileprivate let mapper: NewsArticleUIMapper
    fileprivate lazy var globalScheduler = ConcurrentDispatchQueueScheduler(queue:
        DispatchQueue.global())
    fileprivate let disposeBag = DisposeBag()
    
    // MARK: Init.
    public init(getNewsArticleUseCase: GetNewsArticlesUseCase, mapper: NewsArticleUIMapper){
        self.getNewsArticleUseCase = getNewsArticleUseCase
        self.mapper = mapper
    }
    
    // MARK: Public View Methods.
    public func fetchNewsArticles(){
        lFetchNewsArticles()
    }
    
    public func onNewsArticleItemClicked(at index: Int){
        if let newsArticles = try? newsArticlesDataSource.value(){
            let newArticle = newsArticles[index]
            goToNewsDetailScreen.onNext(newArticle)
        }
    }
}

// MARK: - Fetch NewsArticles.
extension NewsListViewModel{
    
    fileprivate func lFetchNewsArticles(){
        viewState.onNext(.loading)
        getNewsArticleUseCase.execute()
            .map{ newsArticles in
                newsArticles.map{self.mapper.mapToUI(domain: $0)}
            }
            .subscribeOn(globalScheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { newsArticles in
                self.fetchNewsArticlesSuccess(newsArticles: newsArticles)
            }, onError: { error in
                self.fetchNewsArticlesFailure(error: error)
            })
            .disposed(by: disposeBag)
    }
    
    fileprivate func fetchNewsArticlesSuccess(newsArticles: [NewsArticleUIModel]){
        viewState.onNext(.data)
        newsArticlesDataSource.onNext(newsArticles)
    }
    
    fileprivate func fetchNewsArticlesFailure(error: Error){
        if let httpClientError = error as? HttpClientError{
            switch httpClientError{
            case .noNetworkError:
                viewState.onNext(.noInternet)
            default:
                viewState.onNext(.error)
            }
        }else{
            viewState.onNext(.error)
        }
    }
    
}
