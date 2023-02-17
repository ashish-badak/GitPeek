//
//  PullRequestListPresenter.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import Foundation

final class PullRequestListPresenter: PullRequestListPresenterProtocol {
    private let interactor: PullRequestListInteractorProtocol
    weak var view: PullRequestListViewProtocol?
    
    init(interactor: PullRequestListInteractorProtocol) {
        self.interactor = interactor
    }
    
    // - TODO: Build view models with presentation logic
    
    // - TODO: Handle view delegation if required
}
