//
//  AuthViewModelTests.swift
//  happy-trackerTests
//
//  Created by Mirna Helmy on 4/5/22.
//

import XCTest
@testable import happy_tracker


class AuthViewModelTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_AuthViewModel_isError_shouldBeFalse() {
   
     //   let isError: Bool = Bool.random()

        
        let vm = AuthViewModel()
        
        
     
        XCTAssertFalse(vm.isError)
        XCTAssertNil(vm.authError)
    }
    

    
    
    func test_AuthViewModel_setError_isErrorShouldBeTrue() {
   
     //   let isError: Bool = Bool.random()

    // Given
        let vm = AuthViewModel()
        
        let randomError = [AuthError.emptyName, AuthError.passwordConfirmFailure].randomElement()!
        
     // When
        vm.setError(randomError)
    
        
     // Then
        XCTAssert(vm.authError = AuthError.emptyName)
        XCTAssertTrue(vm.isError)
    }
    
    
    
}


