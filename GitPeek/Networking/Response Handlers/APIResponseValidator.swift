//
//  APIResponseValidator.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol APIResponseValidator {
    func validate(response: HTTPURLResponse) -> Result<Bool, APIRequestError>
}

extension APIResponseValidator {
    func validate(response: HTTPURLResponse) -> Result<Bool, APIRequestError> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 400: return .failure(.badRequest)
        default: return .failure(.failed)
        }
    }
}

struct DefaultAPIResponseValidator: APIResponseValidator { }
