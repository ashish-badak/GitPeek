//
//  ImageStore.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation
import UIKit

typealias ImageCallback = (Result<UIImage, ImageError>) -> Void

final class ImageStore {
    let downloader: ImageDownloader
    let cache: ImageCache
    
    static let shared = ImageStore(
        downloader: DefaultImageDownloader.shared,
        cache: DefaultImageCache.shared
    )
    
    init(downloader: ImageDownloader, cache: ImageCache) {
        self.downloader = downloader
        self.cache = cache
    }
    
    public func fetchImage(
        for url: URL,
        completion: @escaping ImageCallback
    ) {
        if let cachedImage = cache.image(forKey: url) {
            completion(.success(cachedImage))
            return
        }
        
        downloader.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.cache.set(image, forKey: url)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
