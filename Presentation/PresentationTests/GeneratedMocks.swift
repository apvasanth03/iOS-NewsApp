// MARK: - Mocks generated from file: ../Domain/Domain/Source/Repository/NewsArticlesRepository.swift at 2019-07-05 06:48:45 +0000

//
//  NewsArticlesRepository.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Presentation

import Foundation
import RxSwift


public class MockNewsArticlesRepository: NewsArticlesRepository, Cuckoo.ProtocolMock {
    
    public typealias MocksType = NewsArticlesRepository
    
    public typealias Stubbing = __StubbingProxy_NewsArticlesRepository
    public typealias Verification = __VerificationProxy_NewsArticlesRepository

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NewsArticlesRepository?

    public func enableDefaultImplementation(_ stub: NewsArticlesRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func getNewsArticles() -> Single<[NewsArticle]> {
        
    return cuckoo_manager.call("getNewsArticles() -> Single<[NewsArticle]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getNewsArticles())
        
    }
    

	public struct __StubbingProxy_NewsArticlesRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getNewsArticles() -> Cuckoo.ProtocolStubFunction<(), Single<[NewsArticle]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockNewsArticlesRepository.self, method: "getNewsArticles() -> Single<[NewsArticle]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NewsArticlesRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getNewsArticles() -> Cuckoo.__DoNotUse<(), Single<[NewsArticle]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getNewsArticles() -> Single<[NewsArticle]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NewsArticlesRepositoryStub: NewsArticlesRepository {
    

    

    
    public func getNewsArticles() -> Single<[NewsArticle]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[NewsArticle]>).self)
    }
    
}


// MARK: - Mocks generated from file: ../Domain/Domain/Source/UseCase/GetNewsArticlesUseCase.swift at 2019-07-05 06:48:45 +0000

//
//  GetNewsArticlesUseCase.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Presentation

import Foundation
import RxSwift


public class MockGetNewsArticlesUseCase: GetNewsArticlesUseCase, Cuckoo.ClassMock {
    
    public typealias MocksType = GetNewsArticlesUseCase
    
    public typealias Stubbing = __StubbingProxy_GetNewsArticlesUseCase
    public typealias Verification = __VerificationProxy_GetNewsArticlesUseCase

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GetNewsArticlesUseCase?

    public func enableDefaultImplementation(_ stub: GetNewsArticlesUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func execute() -> Single<[NewsArticle]> {
        
    return cuckoo_manager.call("execute() -> Single<[NewsArticle]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.execute()
                ,
            defaultCall: __defaultImplStub!.execute())
        
    }
    

	public struct __StubbingProxy_GetNewsArticlesUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func execute() -> Cuckoo.ClassStubFunction<(), Single<[NewsArticle]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsArticlesUseCase.self, method: "execute() -> Single<[NewsArticle]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_GetNewsArticlesUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func execute() -> Cuckoo.__DoNotUse<(), Single<[NewsArticle]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("execute() -> Single<[NewsArticle]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class GetNewsArticlesUseCaseStub: GetNewsArticlesUseCase {
    

    

    
    public override func execute() -> Single<[NewsArticle]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[NewsArticle]>).self)
    }
    
}


// MARK: - Mocks generated from file: Presentation/Source/Mapper/NewsArticleUIMapper.swift at 2019-07-05 06:48:45 +0000

//
//  NewsArticleUIMapper.swift
//  Presentation
//
//  Created by Vasanthakumar Annadurai on 09/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Presentation

import Domain
import Foundation


public class MockNewsArticleUIMapper: NewsArticleUIMapper, Cuckoo.ClassMock {
    
    public typealias MocksType = NewsArticleUIMapper
    
    public typealias Stubbing = __StubbingProxy_NewsArticleUIMapper
    public typealias Verification = __VerificationProxy_NewsArticleUIMapper

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NewsArticleUIMapper?

    public func enableDefaultImplementation(_ stub: NewsArticleUIMapper) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    public override var publishedAtDateFormatter: DateFormatter {
        get {
            return cuckoo_manager.getter("publishedAtDateFormatter",
                superclassCall:
                    
                    super.publishedAtDateFormatter
                    ,
                defaultCall: __defaultImplStub!.publishedAtDateFormatter)
        }
        
        set {
            cuckoo_manager.setter("publishedAtDateFormatter",
                value: newValue,
                superclassCall:
                    
                    super.publishedAtDateFormatter = newValue
                    ,
                defaultCall: __defaultImplStub!.publishedAtDateFormatter = newValue)
        }
        
    }
    

    

    
    
    
    public override func mapToUI(domain: NewsArticle) -> NewsArticleUIModel {
        
    return cuckoo_manager.call("mapToUI(domain: NewsArticle) -> NewsArticleUIModel",
            parameters: (domain),
            escapingParameters: (domain),
            superclassCall:
                
                super.mapToUI(domain: domain)
                ,
            defaultCall: __defaultImplStub!.mapToUI(domain: domain))
        
    }
    

	public struct __StubbingProxy_NewsArticleUIMapper: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var publishedAtDateFormatter: Cuckoo.ClassToBeStubbedProperty<MockNewsArticleUIMapper, DateFormatter> {
	        return .init(manager: cuckoo_manager, name: "publishedAtDateFormatter")
	    }
	    
	    
	    func mapToUI<M1: Cuckoo.Matchable>(domain: M1) -> Cuckoo.ClassStubFunction<(NewsArticle), NewsArticleUIModel> where M1.MatchedType == NewsArticle {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsArticle)>] = [wrap(matchable: domain) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNewsArticleUIMapper.self, method: "mapToUI(domain: NewsArticle) -> NewsArticleUIModel", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NewsArticleUIMapper: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var publishedAtDateFormatter: Cuckoo.VerifyProperty<DateFormatter> {
	        return .init(manager: cuckoo_manager, name: "publishedAtDateFormatter", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func mapToUI<M1: Cuckoo.Matchable>(domain: M1) -> Cuckoo.__DoNotUse<(NewsArticle), NewsArticleUIModel> where M1.MatchedType == NewsArticle {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsArticle)>] = [wrap(matchable: domain) { $0 }]
	        return cuckoo_manager.verify("mapToUI(domain: NewsArticle) -> NewsArticleUIModel", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NewsArticleUIMapperStub: NewsArticleUIMapper {
    
    
    public override var publishedAtDateFormatter: DateFormatter {
        get {
            return DefaultValueRegistry.defaultValue(for: (DateFormatter).self)
        }
        
        set { }
        
    }
    

    

    
    public override func mapToUI(domain: NewsArticle) -> NewsArticleUIModel  {
        return DefaultValueRegistry.defaultValue(for: (NewsArticleUIModel).self)
    }
    
}

