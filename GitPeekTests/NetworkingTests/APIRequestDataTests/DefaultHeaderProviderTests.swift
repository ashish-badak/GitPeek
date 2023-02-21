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
        XCTAssertEqual(
            headers["Authorization"],
            "Bearer \(Constants.apiKey)"
        )
        XCTAssertEqual(
            headers["Accept"],
            "application/vnd.github+json"
        )
        XCTAssertEqual(
            headers["X-GitHub-Api-Version"],
            "2022-11-28"
        )
    }
}
