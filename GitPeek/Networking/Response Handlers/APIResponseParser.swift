//
//  APIResponseParser.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol APIResponseParser {
    func parse(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, Error>
}

struct DefaultAPIResponeParser: APIResponseParser {
    let responseValidator: APIResponseValidator
    
    init(responseValidator: APIResponseValidator = DefaultAPIResponseValidator()) {
        self.responseValidator = responseValidator
    }
    
    func parse(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) ->  Result<Data, Error> {
        
        if let error = error {
            return .failure(error)
        }
        
        guard let response = response as? HTTPURLResponse else {
            return .failure(APIRequestError.invalidResponse)
        }
        
        let result = responseValidator.validate(response: response)
        
        switch result {
        case .success:
            if let data = data {
                return .success(data)
            } else {
                return .failure(APIRequestError.noData)
            }
            
        case .failure(let error):
            return .failure(error)
        }
    }
}
