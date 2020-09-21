// MARK: - Mocks generated from file: HenriPotier/Data/Network/BooksNetwork.swift at 2020-09-28 09:03:00 +0000

//
//  BooksNetwork.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockBooksNetwork: BooksNetwork, Cuckoo.ProtocolMock {
    
     typealias MocksType = BooksNetwork
    
     typealias Stubbing = __StubbingProxy_BooksNetwork
     typealias Verification = __VerificationProxy_BooksNetwork

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BooksNetwork?

     func enableDefaultImplementation(_ stub: BooksNetwork) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getBooks() -> Single<[RemoteBook]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[RemoteBook]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    
    
    
     func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]> {
        
    return cuckoo_manager.call("getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>",
            parameters: (bookIds),
            escapingParameters: (bookIds),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCommercialOffers(for: bookIds))
        
    }
    

	 struct __StubbingProxy_BooksNetwork: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ProtocolStubFunction<(), Single<[RemoteBook]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNetwork.self, method: "getBooks() -> Single<[RemoteBook]>", parameterMatchers: matchers))
	    }
	    
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.ProtocolStubFunction<([String]), Single<[RemoteCommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNetwork.self, method: "getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksNetwork: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[RemoteBook]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[RemoteBook]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.__DoNotUse<([String]), Single<[RemoteCommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return cuckoo_manager.verify("getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksNetworkStub: BooksNetwork {
    

    

    
     func getBooks() -> Single<[RemoteBook]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[RemoteBook]>).self)
    }
    
     func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[RemoteCommercialOffer]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Data/Network/BooksNetworkImplementation.swift at 2020-09-28 09:03:00 +0000

//
//  BooksNetworkImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import Moya
import RxSwift


 class MockBooksNetworkImplementation: BooksNetworkImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = BooksNetworkImplementation
    
     typealias Stubbing = __StubbingProxy_BooksNetworkImplementation
     typealias Verification = __VerificationProxy_BooksNetworkImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: BooksNetworkImplementation?

     func enableDefaultImplementation(_ stub: BooksNetworkImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func getBooks() -> Single<[RemoteBook]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[RemoteBook]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getBooks()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    
    
    
     override func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]> {
        
    return cuckoo_manager.call("getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>",
            parameters: (bookIds),
            escapingParameters: (bookIds),
            superclassCall:
                
                super.getCommercialOffers(for: bookIds)
                ,
            defaultCall: __defaultImplStub!.getCommercialOffers(for: bookIds))
        
    }
    

	 struct __StubbingProxy_BooksNetworkImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ClassStubFunction<(), Single<[RemoteBook]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNetworkImplementation.self, method: "getBooks() -> Single<[RemoteBook]>", parameterMatchers: matchers))
	    }
	    
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.ClassStubFunction<([String]), Single<[RemoteCommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNetworkImplementation.self, method: "getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksNetworkImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[RemoteBook]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[RemoteBook]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.__DoNotUse<([String]), Single<[RemoteCommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return cuckoo_manager.verify("getCommercialOffers(for: [String]) -> Single<[RemoteCommercialOffer]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksNetworkImplementationStub: BooksNetworkImplementation {
    

    

    
     override func getBooks() -> Single<[RemoteBook]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[RemoteBook]>).self)
    }
    
     override func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[RemoteCommercialOffer]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Data/Repositories/BooksRepository.swift at 2020-09-28 09:03:00 +0000

//
//  BooksRepository.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockBooksRepository: BooksRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = BooksRepository
    
     typealias Stubbing = __StubbingProxy_BooksRepository
     typealias Verification = __VerificationProxy_BooksRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BooksRepository?

     func enableDefaultImplementation(_ stub: BooksRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getBooks() -> Single<[Book]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[Book]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    
    
    
     func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]> {
        
    return cuckoo_manager.call("getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>",
            parameters: (bookIds),
            escapingParameters: (bookIds),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCommercialOffers(for: bookIds))
        
    }
    

	 struct __StubbingProxy_BooksRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ProtocolStubFunction<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksRepository.self, method: "getBooks() -> Single<[Book]>", parameterMatchers: matchers))
	    }
	    
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.ProtocolStubFunction<([String]), Single<[CommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksRepository.self, method: "getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[Book]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.__DoNotUse<([String]), Single<[CommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return cuckoo_manager.verify("getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksRepositoryStub: BooksRepository {
    

    

    
     func getBooks() -> Single<[Book]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Book]>).self)
    }
    
     func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[CommercialOffer]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Data/Repositories/BooksRepositoryImplementation.swift at 2020-09-28 09:03:00 +0000

//
//  BooksRepositoryImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockBooksRepositoryImplementation: BooksRepositoryImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = BooksRepositoryImplementation
    
     typealias Stubbing = __StubbingProxy_BooksRepositoryImplementation
     typealias Verification = __VerificationProxy_BooksRepositoryImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: BooksRepositoryImplementation?

     func enableDefaultImplementation(_ stub: BooksRepositoryImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func getBooks() -> Single<[Book]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[Book]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getBooks()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    
    
    
     override func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]> {
        
    return cuckoo_manager.call("getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>",
            parameters: (bookIds),
            escapingParameters: (bookIds),
            superclassCall:
                
                super.getCommercialOffers(for: bookIds)
                ,
            defaultCall: __defaultImplStub!.getCommercialOffers(for: bookIds))
        
    }
    

	 struct __StubbingProxy_BooksRepositoryImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ClassStubFunction<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksRepositoryImplementation.self, method: "getBooks() -> Single<[Book]>", parameterMatchers: matchers))
	    }
	    
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.ClassStubFunction<([String]), Single<[CommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksRepositoryImplementation.self, method: "getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksRepositoryImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[Book]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCommercialOffers<M1: Cuckoo.Matchable>(for bookIds: M1) -> Cuckoo.__DoNotUse<([String]), Single<[CommercialOffer]>> where M1.MatchedType == [String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String])>] = [wrap(matchable: bookIds) { $0 }]
	        return cuckoo_manager.verify("getCommercialOffers(for: [String]) -> Single<[CommercialOffer]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksRepositoryImplementationStub: BooksRepositoryImplementation {
    

    

    
     override func getBooks() -> Single<[Book]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Book]>).self)
    }
    
     override func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[CommercialOffer]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Data/Repositories/CartRepository.swift at 2020-09-28 09:03:00 +0000

//
//  CartRepository.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation


 class MockCartRepository: CartRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = CartRepository
    
     typealias Stubbing = __StubbingProxy_CartRepository
     typealias Verification = __VerificationProxy_CartRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CartRepository?

     func enableDefaultImplementation(_ stub: CartRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func save(cart: Cart)  {
        
    return cuckoo_manager.call("save(cart: Cart)",
            parameters: (cart),
            escapingParameters: (cart),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.save(cart: cart))
        
    }
    
    
    
     func load() -> Cart? {
        
    return cuckoo_manager.call("load() -> Cart?",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.load())
        
    }
    

	 struct __StubbingProxy_CartRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func save<M1: Cuckoo.Matchable>(cart: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Cart)> where M1.MatchedType == Cart {
	        let matchers: [Cuckoo.ParameterMatcher<(Cart)>] = [wrap(matchable: cart) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCartRepository.self, method: "save(cart: Cart)", parameterMatchers: matchers))
	    }
	    
	    func load() -> Cuckoo.ProtocolStubFunction<(), Cart?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCartRepository.self, method: "load() -> Cart?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CartRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func save<M1: Cuckoo.Matchable>(cart: M1) -> Cuckoo.__DoNotUse<(Cart), Void> where M1.MatchedType == Cart {
	        let matchers: [Cuckoo.ParameterMatcher<(Cart)>] = [wrap(matchable: cart) { $0 }]
	        return cuckoo_manager.verify("save(cart: Cart)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func load() -> Cuckoo.__DoNotUse<(), Cart?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("load() -> Cart?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CartRepositoryStub: CartRepository {
    

    

    
     func save(cart: Cart)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func load() -> Cart?  {
        return DefaultValueRegistry.defaultValue(for: (Cart?).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Data/Repositories/CartRepositoryImplementation.swift at 2020-09-28 09:03:00 +0000

//
//  CartRepositoryImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation


 class MockCartRepositoryImplementation: CartRepositoryImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = CartRepositoryImplementation
    
     typealias Stubbing = __StubbingProxy_CartRepositoryImplementation
     typealias Verification = __VerificationProxy_CartRepositoryImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: CartRepositoryImplementation?

     func enableDefaultImplementation(_ stub: CartRepositoryImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func save(cart: Cart)  {
        
    return cuckoo_manager.call("save(cart: Cart)",
            parameters: (cart),
            escapingParameters: (cart),
            superclassCall:
                
                super.save(cart: cart)
                ,
            defaultCall: __defaultImplStub!.save(cart: cart))
        
    }
    
    
    
     override func load() -> Cart? {
        
    return cuckoo_manager.call("load() -> Cart?",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.load()
                ,
            defaultCall: __defaultImplStub!.load())
        
    }
    

	 struct __StubbingProxy_CartRepositoryImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func save<M1: Cuckoo.Matchable>(cart: M1) -> Cuckoo.ClassStubNoReturnFunction<(Cart)> where M1.MatchedType == Cart {
	        let matchers: [Cuckoo.ParameterMatcher<(Cart)>] = [wrap(matchable: cart) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCartRepositoryImplementation.self, method: "save(cart: Cart)", parameterMatchers: matchers))
	    }
	    
	    func load() -> Cuckoo.ClassStubFunction<(), Cart?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCartRepositoryImplementation.self, method: "load() -> Cart?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CartRepositoryImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func save<M1: Cuckoo.Matchable>(cart: M1) -> Cuckoo.__DoNotUse<(Cart), Void> where M1.MatchedType == Cart {
	        let matchers: [Cuckoo.ParameterMatcher<(Cart)>] = [wrap(matchable: cart) { $0 }]
	        return cuckoo_manager.verify("save(cart: Cart)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func load() -> Cuckoo.__DoNotUse<(), Cart?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("load() -> Cart?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CartRepositoryImplementationStub: CartRepositoryImplementation {
    

    

    
     override func save(cart: Cart)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func load() -> Cart?  {
        return DefaultValueRegistry.defaultValue(for: (Cart?).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Domain/UseCases/BooksUseCase.swift at 2020-09-28 09:03:00 +0000

//
//  BooksUseCase.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockBooksUseCase: BooksUseCase, Cuckoo.ProtocolMock {
    
     typealias MocksType = BooksUseCase
    
     typealias Stubbing = __StubbingProxy_BooksUseCase
     typealias Verification = __VerificationProxy_BooksUseCase

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BooksUseCase?

     func enableDefaultImplementation(_ stub: BooksUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getBooks() -> Single<[Book]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[Book]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    

	 struct __StubbingProxy_BooksUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ProtocolStubFunction<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksUseCase.self, method: "getBooks() -> Single<[Book]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[Book]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksUseCaseStub: BooksUseCase {
    

    

    
     func getBooks() -> Single<[Book]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Book]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Domain/UseCases/BooksUseCaseImplementation.swift at 2020-09-28 09:03:00 +0000

//
//  BooksUseCaseImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockBooksUseCaseImplementation: BooksUseCaseImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = BooksUseCaseImplementation
    
     typealias Stubbing = __StubbingProxy_BooksUseCaseImplementation
     typealias Verification = __VerificationProxy_BooksUseCaseImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: BooksUseCaseImplementation?

     func enableDefaultImplementation(_ stub: BooksUseCaseImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func getBooks() -> Single<[Book]> {
        
    return cuckoo_manager.call("getBooks() -> Single<[Book]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getBooks()
                ,
            defaultCall: __defaultImplStub!.getBooks())
        
    }
    

	 struct __StubbingProxy_BooksUseCaseImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getBooks() -> Cuckoo.ClassStubFunction<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksUseCaseImplementation.self, method: "getBooks() -> Single<[Book]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksUseCaseImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getBooks() -> Cuckoo.__DoNotUse<(), Single<[Book]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getBooks() -> Single<[Book]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksUseCaseImplementationStub: BooksUseCaseImplementation {
    

    

    
     override func getBooks() -> Single<[Book]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Book]>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Domain/UseCases/CartUseCase.swift at 2020-09-28 09:03:00 +0000

//
//  CartUseCase.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockCartUseCase: CartUseCase, Cuckoo.ProtocolMock {
    
     typealias MocksType = CartUseCase
    
     typealias Stubbing = __StubbingProxy_CartUseCase
     typealias Verification = __VerificationProxy_CartUseCase

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CartUseCase?

     func enableDefaultImplementation(_ stub: CartUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func createCart(for books: [Book]) -> Single<Cart> {
        
    return cuckoo_manager.call("createCart(for: [Book]) -> Single<Cart>",
            parameters: (books),
            escapingParameters: (books),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createCart(for: books))
        
    }
    
    
    
     func getCart() -> Single<Cart?> {
        
    return cuckoo_manager.call("getCart() -> Single<Cart?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCart())
        
    }
    

	 struct __StubbingProxy_CartUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func createCart<M1: Cuckoo.Matchable>(for books: M1) -> Cuckoo.ProtocolStubFunction<([Book]), Single<Cart>> where M1.MatchedType == [Book] {
	        let matchers: [Cuckoo.ParameterMatcher<([Book])>] = [wrap(matchable: books) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCartUseCase.self, method: "createCart(for: [Book]) -> Single<Cart>", parameterMatchers: matchers))
	    }
	    
	    func getCart() -> Cuckoo.ProtocolStubFunction<(), Single<Cart?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCartUseCase.self, method: "getCart() -> Single<Cart?>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CartUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func createCart<M1: Cuckoo.Matchable>(for books: M1) -> Cuckoo.__DoNotUse<([Book]), Single<Cart>> where M1.MatchedType == [Book] {
	        let matchers: [Cuckoo.ParameterMatcher<([Book])>] = [wrap(matchable: books) { $0 }]
	        return cuckoo_manager.verify("createCart(for: [Book]) -> Single<Cart>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCart() -> Cuckoo.__DoNotUse<(), Single<Cart?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCart() -> Single<Cart?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CartUseCaseStub: CartUseCase {
    

    

    
     func createCart(for books: [Book]) -> Single<Cart>  {
        return DefaultValueRegistry.defaultValue(for: (Single<Cart>).self)
    }
    
     func getCart() -> Single<Cart?>  {
        return DefaultValueRegistry.defaultValue(for: (Single<Cart?>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Domain/UseCases/CartUseCaseImplementation.swift at 2020-09-28 09:03:00 +0000

//
//  CartUseCaseImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import RxSwift


 class MockCartUseCaseImplementation: CartUseCaseImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = CartUseCaseImplementation
    
     typealias Stubbing = __StubbingProxy_CartUseCaseImplementation
     typealias Verification = __VerificationProxy_CartUseCaseImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: CartUseCaseImplementation?

     func enableDefaultImplementation(_ stub: CartUseCaseImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func createCart(for books: [Book]) -> Single<Cart> {
        
    return cuckoo_manager.call("createCart(for: [Book]) -> Single<Cart>",
            parameters: (books),
            escapingParameters: (books),
            superclassCall:
                
                super.createCart(for: books)
                ,
            defaultCall: __defaultImplStub!.createCart(for: books))
        
    }
    
    
    
     override func getCart() -> Single<Cart?> {
        
    return cuckoo_manager.call("getCart() -> Single<Cart?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getCart()
                ,
            defaultCall: __defaultImplStub!.getCart())
        
    }
    

	 struct __StubbingProxy_CartUseCaseImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func createCart<M1: Cuckoo.Matchable>(for books: M1) -> Cuckoo.ClassStubFunction<([Book]), Single<Cart>> where M1.MatchedType == [Book] {
	        let matchers: [Cuckoo.ParameterMatcher<([Book])>] = [wrap(matchable: books) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCartUseCaseImplementation.self, method: "createCart(for: [Book]) -> Single<Cart>", parameterMatchers: matchers))
	    }
	    
	    func getCart() -> Cuckoo.ClassStubFunction<(), Single<Cart?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCartUseCaseImplementation.self, method: "getCart() -> Single<Cart?>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CartUseCaseImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func createCart<M1: Cuckoo.Matchable>(for books: M1) -> Cuckoo.__DoNotUse<([Book]), Single<Cart>> where M1.MatchedType == [Book] {
	        let matchers: [Cuckoo.ParameterMatcher<([Book])>] = [wrap(matchable: books) { $0 }]
	        return cuckoo_manager.verify("createCart(for: [Book]) -> Single<Cart>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCart() -> Cuckoo.__DoNotUse<(), Single<Cart?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCart() -> Single<Cart?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CartUseCaseImplementationStub: CartUseCaseImplementation {
    

    

    
     override func createCart(for books: [Book]) -> Single<Cart>  {
        return DefaultValueRegistry.defaultValue(for: (Single<Cart>).self)
    }
    
     override func getCart() -> Single<Cart?>  {
        return DefaultValueRegistry.defaultValue(for: (Single<Cart?>).self)
    }
    
}


// MARK: - Mocks generated from file: HenriPotier/Presentation/Scenes/Books/BooksNavigator.swift at 2020-09-28 09:03:00 +0000

//
//  BooksNavigator.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Cuckoo
@testable import HenriPotier

import Foundation
import Swinject
import UIKit


 class MockBooksNavigator: BooksNavigator, Cuckoo.ProtocolMock {
    
     typealias MocksType = BooksNavigator
    
     typealias Stubbing = __StubbingProxy_BooksNavigator
     typealias Verification = __VerificationProxy_BooksNavigator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BooksNavigator?

     func enableDefaultImplementation(_ stub: BooksNavigator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func start()  {
        
    return cuckoo_manager.call("start()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.start())
        
    }
    
    
    
     func toCart()  {
        
    return cuckoo_manager.call("toCart()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.toCart())
        
    }
    

	 struct __StubbingProxy_BooksNavigator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func start() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNavigator.self, method: "start()", parameterMatchers: matchers))
	    }
	    
	    func toCart() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNavigator.self, method: "toCart()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksNavigator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func start() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("start()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func toCart() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("toCart()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksNavigatorStub: BooksNavigator {
    

    

    
     func start()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func toCart()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockBooksNavigatorImplementation: BooksNavigatorImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = BooksNavigatorImplementation
    
     typealias Stubbing = __StubbingProxy_BooksNavigatorImplementation
     typealias Verification = __VerificationProxy_BooksNavigatorImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: BooksNavigatorImplementation?

     func enableDefaultImplementation(_ stub: BooksNavigatorImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func start()  {
        
    return cuckoo_manager.call("start()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.start()
                ,
            defaultCall: __defaultImplStub!.start())
        
    }
    
    
    
     override func toCart()  {
        
    return cuckoo_manager.call("toCart()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.toCart()
                ,
            defaultCall: __defaultImplStub!.toCart())
        
    }
    

	 struct __StubbingProxy_BooksNavigatorImplementation: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func start() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNavigatorImplementation.self, method: "start()", parameterMatchers: matchers))
	    }
	    
	    func toCart() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockBooksNavigatorImplementation.self, method: "toCart()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_BooksNavigatorImplementation: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func start() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("start()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func toCart() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("toCart()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class BooksNavigatorImplementationStub: BooksNavigatorImplementation {
    

    

    
     override func start()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func toCart()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

