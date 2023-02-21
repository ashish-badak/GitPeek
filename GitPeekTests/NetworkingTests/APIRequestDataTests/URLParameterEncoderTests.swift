//
//  URLParameterEncoderTests.swift
//  GitPeekTests
//
//  Created by Ashish Badak on 21/02/23.
//

import XCTest
@testable import GitPeek

final class URLParameterEncoderTests: XCTestCase {

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var urlRequest: URLRequest!
    var encoder: URLParameterEncoder!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        urlRequest = URLRequest(url: URL.GP.baseURL)
        encoder = URLParameterEncoder()
    }
    
    func testEncodingParameters() throws {
        let parameters: [String: Any] = [
            "page": 1,
            "per_page": 30,
            "state": PullRequest.State.closed
        ]
        
        try encoder.encode(urlRequest: &urlRequest, with: parameters)
        
        let expectedURLString = "https://api.github.com"
        let expectedURL = try XCTUnwrap(URL(string: expectedURLString))
        
        XCTAssertEqual(urlRequest.url?.scheme, expectedURL.scheme)
        XCTAssertEqual(urlRequest.url?.host, expectedURL.host)
        XCTAssertEqual(urlRequest.url?.path, expectedURL.path)
        
        let queryItems = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)?.queryItems
        let expectedQueryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "per_page", value: "30"),
            URLQueryItem(name: "state", value: "closed")
        ]
        XCTAssertEqual(queryItems, expectedQueryItems)
    }
    
    func testEmptyParameters() throws {
        try encoder.encode(urlRequest: &urlRequest, with: [:])
        let expectedURL = URL(string: "https://api.github.com")!
        XCTAssertEqual(urlRequest.url, expectedURL)
    }
}
