//
//  ImageDownloader.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation

protocol ImageDownloader {
    func fetchImage(
        from url: URL,
        completion: @escaping ImageCallback
    )
}

final class DefaultImageDownloader: ImageDownloader {
    private var completionCallbacks = [URL: [ImageCallback]]()
    private let requestPerformer = DefaultRequestPerformer(
        responseParser: ImageResponseParser()
    )
    
    static let shared = DefaultImageDownloader()
    private init() {}
    
    func fetchImage(
        from url: URL,
        completion: @escaping ImageCallback
    ) {
        if completionCallbacks[url] != nil {
            completionCallbacks[url]?.append(completion)
            return
        } else {
            completionCallbacks[url] = [completion]
        }
        
        let request = URLRequest(url: url)
        
        requestPerformer.perform(request) { [weak self] result in
            guard let self = self else { return }
            
            defer {
                self.completionCallbacks.removeValue(forKey: url)
            }
            
            switch result {
            case .success(let data):
                if let image = data.image {
                    self.completionCallbacks[url]?.forEach { callback in
                        callback(.success(image))
                    }
                } else {
                    self.completionCallbacks[url]?.forEach { callback in
                        callback(.failure(.corruptImage))
                    }
                }
                
            case .failure(let error):
                let imageError = error as? ImageError ?? .noData
                self.completionCallbacks[url]?.forEach { callback in
                    callback(.failure(imageError))
                }
            }
        }
    }
}
