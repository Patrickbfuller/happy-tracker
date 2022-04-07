//
//  RecordSessionViewModel.swift
//  happy-trackerTests
//
//  Created by Mirna Helmy on 4/5/22.
//

import XCTest
@testable import happy_tracker

class RecordSessionViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    

    func test_RecordSessionViewModel_submitSession_statusShoulEqualToDone() {
        //Given
        for _ in 0..<30 {
        let vm = RecordSessionViewModel()
        }

        //When
        let vm = RecordSessionViewModel()

        //Then

        XCTAssertTrue(vm.self.status == .done)
    }
    
    
    

    func test_RecordSessionViewModel_status_shouldEqualToisRecording() {
        //Given


        //When
        let vm = RecordSessionViewModel()
        
        //Then

        XCTAssertTrue(vm.self.status  == .isRecording)

    }
    
    
    
    func test_RecordSessionViewModel_status_shouldNotEqualToisRecording() {
        //Given
      
        
        //When
        let vm = RecordSessionViewModel()
        
        //Then
   
        XCTAssertFalse(vm.self.status  == .isRecording)
    
    }
    
    
    func test_RecordSessionViewModel_stopwatchCounter_shouldStartAsZero() {
        //Given
        for _ in 0..<20 {
            let vm = RecordSessionViewModel()
        }
        
        //When
        let vm = RecordSessionViewModel()
        
        //Then
        XCTAssertTrue(vm.stopwatchCounter == 0)

    }
    


}
