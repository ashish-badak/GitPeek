//
//  PaginatedContentProvider.swift
//  GitPeek
//
//  Created by Ashish Badak on 17/02/23.
//

import Foundation

typealias PaginationCallback<T: Decodable> = (Result<[T], Error>) -> Void

protocol PaginationCompatibleContentProvider {
    associatedtype Item: Decodable
    func fetchNextPage(page: Int, completion: @escaping PaginationCallback<Item>)
}

final class PaginatedContentProvider<Provider: PaginationCompatibleContentProvider> {
    private var requestPage: Int
    private var isDataRequestInProgress: Bool
    private let contentProvider: Provider
    
    init(contentProvider: Provider) {
        requestPage = 0
        isDataRequestInProgress = false
        self.contentProvider = contentProvider
    }

    func fetchItems(completion: @escaping PaginationCallback<Provider.Item>) {
        if isDataRequestInProgress { return }
        
        isDataRequestInProgress = true
        requestPage += 1
        
        contentProvider.fetchNextPage(page: requestPage) { [weak self] (result) in
            
            if case .failure = result {
                self?.requestPage -= 1
            }
            
            self?.isDataRequestInProgress = false
            
            completion(result)
        }
    }
    
    func isPaginatedRequest() -> Bool {
        requestPage > 0
    }
}
