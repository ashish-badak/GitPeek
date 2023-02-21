//
//  RequestBuilderTests.swift
//  GitPeekTests
//
//  Created by Ashish Badak on 22/02/23.
//

import XCTest
@testable import GitPeek

class MockAPIRequestData: APIRequestData {
    let baseURL: URL
    let path: String
    let httpMethod: HTTPMethod
    let extraHeaders: HTTPHeaders?
    let parameters: Parameters
    let encoder: ParameterEncoder
    
    init(
        baseURL: URL,
        path: String,
        httpMethod: HTTPMethod,
        extraHeaders: HTTPHeaders?,
        parameters: Parameters,
        encoder: ParameterEncoder
    ) {
        self.baseURL = baseURL
        self.path = path
        self.httpMethod = httpMethod
        self.extraHeaders = extraHeaders
        self.parameters = parameters
        self.encoder = encoder
    }
}

final class RequestBuilderTests: XCTestCase {
    func testURLRequestConversion() throws {
        let apiRequestData = MockAPIRequestData(
            baseURL: URL(string: "https://api.github.com")!,
            path: "/test/random/path",
            httpMethod: .get,
            extraHeaders: ["header_key": "header_value"],
            parameters: ["page": 1, "per_page": 10],
            encoder: URLParameterEncoder()
        )
        
        let requestBuilder = RequestBuilder(
            reqestData: apiRequestData,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30.0
        )

        let urlRequest = try requestBuilder.asURLRequest()
        
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(urlRequest.cachePolicy, .reloadIgnoringLocalCacheData)
        XCTAssertEqual(urlRequest.timeoutInterval, 30.0)
        
        let urlString: String = try XCTUnwrap(urlRequest.url?.absoluteString)
        let urlComponents: URLComponents = try XCTUnwrap(URLComponents(string: urlString))
        
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.github.com")
        XCTAssertEqual(urlComponents.path, "/test/random/path")
        
        let queryItems: [URLQueryItem] = try XCTUnwrap(urlComponents.queryItems)
        XCTAssertEqual(queryItems.count, 2)
        XCTAssertTrue(queryItems.contains(URLQueryItem(name: "page", value: "1")))
        XCTAssertTrue(queryItems.contains(URLQueryItem(name: "per_page", value: "10")))
        
        
        let headers = try XCTUnwrap(urlRequest.allHTTPHeaderFields)
        XCTAssertEqual(headers.count, 4)
        var expectedHeaders = DefaultHeaderProvider().getHeaders()
        expectedHeaders["header_key"] = "header_value"
        XCTAssertEqual(headers, expectedHeaders)
    }
    
    func testURLRequestConversionWithNoParameters() throws {
        let apiRequestData = MockAPIRequestData(
            baseURL: URL(string: "https://api.github.com")!,
            path: "/test/random/path",
            httpMethod: .get,
            extraHeaders: nil,
            parameters: [:],
            encoder: URLParameterEncoder()
        )
        
        let requestBuilder = RequestBuilder(
            reqestData: apiRequestData,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30.0
        )

        let urlRequest = try requestBuilder.asURLRequest()
        
        let urlString: String = try XCTUnwrap(urlRequest.url?.absoluteString)
        let urlComponents: URLComponents = try XCTUnwrap(URLComponents(string: urlString))
        
        XCTAssertNil(urlComponents.queryItems)
        let headers = try XCTUnwrap(urlRequest.allHTTPHeaderFields)
        XCTAssertEqual(headers.count, 3)
        let expectedHeaders = DefaultHeaderProvider().getHeaders()
        XCTAssertEqual(headers, expectedHeaders)
    }
}
