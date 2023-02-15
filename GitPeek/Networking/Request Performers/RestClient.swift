//
//  RestClient.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

final class RestClient {
    let requestPerformer: RequestPerformer
    
    init(requestPerformer: RequestPerformer = DefaultRequestPerformer()) {
        self.requestPerformer = requestPerformer
    }
    
    @discardableResult
    func request(
        _ request: URLRequest,
        then perform: @escaping APIRequestCallback
    ) -> URLSessionTask {
        requestPerformer.perform(request, then: perform)
    }
    
    @discardableResult
    func request(
        _ requestBuilder: URLRequestConvertible,
        then perform: @escaping APIRequestCallback
    ) -> URLSessionTask? {
        do {
            let request = try requestBuilder.asURLRequest()
            return requestPerformer.perform(request, then: perform)
        } catch {
            perform(.failure(error))
            return nil
        }
    }
    
    @discardableResult
    func get<T>(
        requestData: APIRequestData,
        then perform: @escaping (Result<T, Error>) -> Void
    ) -> URLSessionTask? where T: Decodable {
        let requestBuilder = RequestBuilder(reqestData: requestData)
        
        return request(requestBuilder) { (result) in
            switch result {
            case .success(let data):
                let mappedData = JSONResponseMapper<T>().decode(data)
                perform(mappedData)
            case .failure(let error):
                perform(.failure(error))
            }
        }
    }
}
