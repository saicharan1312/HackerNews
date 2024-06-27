//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import XCTest
@testable import HackerNews

class HackerNewsTests: XCTestCase {
    
    var mockAPIObj: MockAPI?
    var viewModelObj: NewsViewModel?
    override func setUpWithError() throws {
        mockAPIObj = MockAPI()
        viewModelObj = NewsViewModel()
    }

    override func tearDownWithError() throws {
        mockAPIObj = nil
        viewModelObj = nil
    }

    func testMockAPI() throws {
        viewModelObj?.fetchData(url: "None") {}
        XCTAssertEqual(viewModelObj?.getCountTotalNews(), 1)
        let a = viewModelObj?.getNewsFor(row: 0)
        XCTAssertEqual(a?.author, "Sai")
    }

    func testDecodeData() throws {
        let jsonStr = """
                        {
                            hits : [
                                    {
                                      author: "Ram",
                                      created_at: "1-1-1",
                                      num_comments: 123,
                                      points: 199,
                                      title: "India is developing",
                                      url: "No Url"
                                    }
                                   ]
                            }
                        """
        let jsonData = jsonStr.data(using: .utf8)!
        let decodedNews = APIManager.shared.decodeData(data: jsonData)
        print(decodedNews)
        //XCTAssertNotNil(decodedNews?.hits)
        
    }
   
}
