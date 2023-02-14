//
//  JSONResponseMapper.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

struct JSONResponseMapper<Output: Decodable>: ResponseMapper {
    typealias Input = Data
    let decoder: JSONDecoder
    
    func decode(_ data: Input) -> Result<Output, Error> {
        do {
            let mappedData = try decoder.decode(Output.self, from: data)
            return .success(mappedData)
        } catch {
            return .failure(APIRequestError.decodingFailure)
        }
    }
}
