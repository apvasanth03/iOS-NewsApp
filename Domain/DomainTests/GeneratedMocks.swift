// MARK: - Mocks generated from file: Domain/Source/Repository/NewsArticlesRepository.swift at 2019-07-03 12:44:03 +0000

//
//  NewsArticlesRepository.swift
//  Domain
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Domain

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

