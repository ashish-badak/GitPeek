//
//  DefaultHeaderProviderTests.swift
//  GitPeekTests
//
//  Created by Ashish Badak on 21/02/23.
//

import XCTest
@testable import GitPeek

final class DefaultHeaderProviderTests: XCTestCase {

    func testHeaderProvider()  {
        let headerProvider = DefaultHeaderProvider()
        let headers = headerProvider.getHeaders()
        XCTAssertEqual(headers[HTTPHeader.authorization.key], HTTPHeader.authorization.value)
        XCTAssertEqual(headers[HTTPHeader.apiVersion.key], HTTPHeader.apiVersion.value)
        XCTAssertEqual(headers[HTTPHeader.contentType.key], HTTPHeader.contentType.value)
    }

}
