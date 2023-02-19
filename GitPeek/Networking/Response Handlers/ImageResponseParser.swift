//
//  ImageResponseParser.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation

struct ImageResponseParser: APIResponseParser {
    func parse(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) -> Result<Data, Error> {
        guard error == nil else {
            return .failure(ImageError.fetchError)
        }
        
        if let data = data {
            return .success(data)
        } else {
            return .failure(ImageError.noData)
        }
    }
}
