// MARK: - Mocks generated from file: Data/Source/Mapper/NewsArticleEntityMapper.swift at 2019-07-05 06:48:44 +0000

//
//  NewsArticleEntityMapper.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Data

import Domain
import Foundation


public class MockNewsArticleEntityMapper: NewsArticleEntityMapper, Cuckoo.ClassMock {
    
    public typealias MocksType = NewsArticleEntityMapper
    
    public typealias Stubbing = __StubbingProxy_NewsArticleEntityMapper
    public typealias Verification = __VerificationProxy_NewsArticleEntityMapper

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NewsArticleEntityMapper?

    public func enableDefaultImplementation(_ stub: NewsArticleEntityMapper) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func mapFromEntity(entity: NewsArticleEntity) -> NewsArticle {
        
    return cuckoo_manager.call("mapFromEntity(entity: NewsArticleEntity) -> NewsArticle",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.mapFromEntity(entity: entity)
                ,
            defaultCall: __defaultImplStub!.mapFromEntity(entity: entity))
        
    }
    

	public struct __StubbingProxy_NewsArticleEntityMapper: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func mapFromEntity<M1: Cuckoo.Matchable>(entity: M1) -> Cuckoo.ClassStubFunction<(NewsArticleEntity), NewsArticle> where M1.MatchedType == NewsArticleEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsArticleEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNewsArticleEntityMapper.self, method: "mapFromEntity(entity: NewsArticleEntity) -> NewsArticle", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NewsArticleEntityMapper: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func mapFromEntity<M1: Cuckoo.Matchable>(entity: M1) -> Cuckoo.__DoNotUse<(NewsArticleEntity), NewsArticle> where M1.MatchedType == NewsArticleEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(NewsArticleEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("mapFromEntity(entity: NewsArticleEntity) -> NewsArticle", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NewsArticleEntityMapperStub: NewsArticleEntityMapper {
    

    

    
    public override func mapFromEntity(entity: NewsArticleEntity) -> NewsArticle  {
        return DefaultValueRegistry.defaultValue(for: (NewsArticle).self)
    }
    
}


// MARK: - Mocks generated from file: Data/Source/Repository/NewsArticleRemoteDataStore.swift at 2019-07-05 06:48:44 +0000

//
//  NewsArticleRemoteDataStore.swift
//  Data
//
//  Created by Vasanthakumar Annadurai on 08/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import Cuckoo
@testable import Data

import Foundation
import RxSwift


public class MockNewsArticleRemoteDataStore: NewsArticleRemoteDataStore, Cuckoo.ProtocolMock {
    
    public typealias MocksType = NewsArticleRemoteDataStore
    
    public typealias Stubbing = __StubbingProxy_NewsArticleRemoteDataStore
    public typealias Verification = __VerificationProxy_NewsArticleRemoteDataStore

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NewsArticleRemoteDataStore?

    public func enableDefaultImplementation(_ stub: NewsArticleRemoteDataStore) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func getNewsArticles() -> Single<[NewsArticleEntity]> {
        
    return cuckoo_manager.call("getNewsArticles() -> Single<[NewsArticleEntity]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getNewsArticles())
        
    }
    

	public struct __StubbingProxy_NewsArticleRemoteDataStore: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getNewsArticles() -> Cuckoo.ProtocolStubFunction<(), Single<[NewsArticleEntity]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockNewsArticleRemoteDataStore.self, method: "getNewsArticles() -> Single<[NewsArticleEntity]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NewsArticleRemoteDataStore: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getNewsArticles() -> Cuckoo.__DoNotUse<(), Single<[NewsArticleEntity]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getNewsArticles() -> Single<[NewsArticleEntity]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NewsArticleRemoteDataStoreStub: NewsArticleRemoteDataStore {
    

    

    
    public func getNewsArticles() -> Single<[NewsArticleEntity]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[NewsArticleEntity]>).self)
    }
    
}

