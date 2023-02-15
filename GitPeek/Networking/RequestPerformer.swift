//
//  RequestPerformer.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

typealias APIRequestCallback = (Result<Data, Error>) -> Void

protocol RequestPerformer {
    func perform(
        _ request: URLRequest,
        then perform: @escaping APIRequestCallback
    ) -> URLSessionTask
}

final class DefaultRequestPerformer: RequestPerformer {
    private let session: URLSession
    private let responseParser: APIResponseParser
    
    init(
        session: URLSession = .shared,
        responseParser: APIResponseParser = DefaultAPIResponeParser()
    ) {
        self.session = session
        self.responseParser = responseParser
    }
    
    func perform(
        _ request: URLRequest,
        then perform: @escaping APIRequestCallback
    ) -> URLSessionTask {
        let task = session.dataTask(with: request) { [weak self] (data, response, error)  in
            guard let self = self else { return }
            
            let apiResult = self.responseParser.parse(
                data: data,
                response: response,
                error: error
            )
            perform(apiResult)
        }
        
        task.resume()
        return task
    }
}
