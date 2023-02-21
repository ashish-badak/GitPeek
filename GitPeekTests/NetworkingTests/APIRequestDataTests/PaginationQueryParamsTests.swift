//
//  PaginationQueryParamsTests.swift
//  GitPeekTests
//
//  Created by Ashish Badak on 21/02/23.
//

import XCTest
@testable import GitPeek

final class PaginationQueryParamsTests: XCTestCase {
    var encoder: JSONEncoder!

    override func setUpWithError() throws {
        try super.setUpWithError()
        encoder = JSONEncoder()
    }
    
    func testEncodingWithCustomPageSize() throws {
        let paginationParams = PaginationQueryParams(page: 2, pageSize: 20)
        
        let data = try encoder.encode(paginationParams)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        XCTAssertEqual(jsonObject?.count, 2)
        XCTAssertEqual(jsonObject?["page"] as? Int, 2)
        XCTAssertEqual(jsonObject?["per_page"] as? Int, 20)
    }
    
    func testEncodingWithDefaultPageSize() throws {
        let paginationParams = PaginationQueryParams(page: 1)

        let data = try encoder.encode(paginationParams)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        XCTAssertEqual(jsonObject?.count, 2)
        XCTAssertEqual(jsonObject?["page"] as? Int, 1)
        XCTAssertEqual(jsonObject?["per_page"] as? Int, PaginationQueryParams.defaultPageSize)
    }
}
