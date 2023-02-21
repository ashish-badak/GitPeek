//
//  PRListAPIRequestQueryParamsTests.swift
//  GitPeekTests
//
//  Created by Ashish Badak on 21/02/23.
//

import XCTest
@testable import GitPeek

final class PRListAPIRequestQueryParamsTests: XCTestCase {
    var encoder: JSONEncoder!

    override func setUpWithError() throws {
        try super.setUpWithError()
        encoder = JSONEncoder()
    }
    
    func testEncodingWithCustomPageSizeAndState() throws {
        let queryParams = PRListAPIRequestQueryParams(page: 2, state: .closed)
        
        let data = try encoder.encode(queryParams)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        XCTAssertEqual(jsonObject?.count, 3)
        XCTAssertEqual(jsonObject?["page"] as? Int, 2)
        XCTAssertEqual(jsonObject?["per_page"] as? Int, PaginationQueryParams.defaultPageSize)
        XCTAssertEqual(jsonObject?["state"] as? String, PRFetchState.closed.rawValue)
    }
    
    func testEncodingWithDefaultPageSizeAndNoState() throws {
        let queryParams = PRListAPIRequestQueryParams(page: 1)
        
        let data = try encoder.encode(queryParams)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        XCTAssertEqual(jsonObject?.count, 2)
        XCTAssertEqual(jsonObject?["page"] as? Int, 1)
        XCTAssertEqual(jsonObject?["per_page"] as? Int, PaginationQueryParams.defaultPageSize)
        XCTAssertNil(jsonObject?["state"])
    }
}
