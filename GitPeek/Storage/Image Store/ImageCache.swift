//
//  ImageCache.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation
import UIKit

protocol ImageCache {
    func set(_ image: UIImage, forKey url: URL)
    func image(forKey url: URL) -> UIImage?
    func remove(forKey key: URL)
    func clear()
}

final class DefaultImageCache: ImageCache {
    static let shared: DefaultImageCache = DefaultImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    
    private init() { }
    
    func set(_ image: UIImage, forKey url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
    
    func image(forKey url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }
    
    func remove(forKey key: URL) {
        cache.removeObject(forKey: key as NSURL)
    }

    func clear() {
        cache.removeAllObjects()
    }
}
