//
//  NewsListViewModelTest.swift
//  PresentationTests
//
//  Created by Vasanthakumar Annadurai on 04/07/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Foundation
import XCTest
import RxSwift
import RxTest
import Cuckoo
@testable import Presentation
@testable import Domain
@testable import HttpClient

/**
 A Class containes Test cases for "NewsListViewModel" class.
 */
class NewsListViewModelTest: XCTestCase{
    
    // MARK: - Properties.
    fileprivate var viewModel: NewsListViewModel!
    fileprivate var scheduler: TestScheduler!
    fileprivate var disposeBag: DisposeBag!
    
    // Mocks
    fileprivate var mockGetNewsArticleUseCase: MockGetNewsArticlesUseCase!
    fileprivate var mockMapper: MockNewsArticleUIMapper!
    
    // MARK: - XCTestCase Methods.
    override func setUp() {
        super.setUp()
        
        let mockNewsArticlesRepository = MockNewsArticlesRepository()
        mockGetNewsArticleUseCase = MockGetNewsArticlesUseCase(newsArticlesRepository: mockNewsArticlesRepository)
        mockMapper = MockNewsArticleUIMapper()
        let schedulerProvider = TestSchedulerProvider()
        
        viewModel = NewsListViewModel(getNewsArticleUseCase: mockGetNewsArticleUseCase, mapper: mockMapper, schedulerProvider: schedulerProvider)
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    // MARK: - Test Methods.
    func test_FetchNewsArticles_WhenUseCaseReturnsSuccess_ShouldSendSuccessToView(){
        let newsArticle = NewsArticleFactory.makeNewsArticle()
        let newsArticleUIModel = NewsArticleUIModelFactory.makeNewsArticleUIModel()
        stub(mockMapper){ stub in
            stub.mapToUI(domain: equal(to: newsArticle)).thenReturn(newsArticleUIModel)
        }
        stub(mockGetNewsArticleUseCase){ stub in
            stub.execute().thenReturn(Single.just([newsArticle]))
        }
        
        let viewStateObserver = scheduler.createObserver(NewsListViewModel.ViewState.self)
        viewModel.viewState
            .subscribe(viewStateObserver)
            .disposed(by: disposeBag)
        let dataSourceObserver = scheduler.createObserver([NewsArticleUIModel].self)
        viewModel.newsArticlesDataSource
            .subscribe(dataSourceObserver)
            .disposed(by: disposeBag)
        
        viewModel.fetchNewsArticles()
        
        XCTAssertRecordedElements(viewStateObserver.events, [.initial, .loading, .data])
        XCTAssertRecordedElements(dataSourceObserver.events, [[], [newsArticleUIModel]])
    }
    
    func test_FetchNewsArticles_WhenUseCaseReturnsError_ShouldSendErrorToView(){
        stub(mockGetNewsArticleUseCase){ stub in
            stub.execute().thenReturn(Single.error(HttpClientError.noNetworkError))
        }
        
        let viewStateObserver = scheduler.createObserver(NewsListViewModel.ViewState.self)
        viewModel.viewState
            .subscribe(viewStateObserver)
            .disposed(by: disposeBag)
        
        viewModel.fetchNewsArticles()
        
        XCTAssertRecordedElements(viewStateObserver.events, [.initial, .loading, .noInternet])
    }
    
    func test_OnNewsArticleItemClicked_ShouldGoToNewsDetailScreen(){
        let newsArticleUIModel = NewsArticleUIModelFactory.makeNewsArticleUIModel()
        viewModel.newsArticlesDataSource.onNext([newsArticleUIModel])
        
        let goToNewsDetailScreenObserver = scheduler.createObserver(NewsArticleUIModel.self)
        viewModel.goToNewsDetailScreen
            .subscribe(goToNewsDetailScreenObserver)
            .disposed(by: disposeBag)
        
        viewModel.onNewsArticleItemClicked(at: 0)
        
        XCTAssertRecordedElements(goToNewsDetailScreenObserver.events, [newsArticleUIModel])
    }
    
    
}
