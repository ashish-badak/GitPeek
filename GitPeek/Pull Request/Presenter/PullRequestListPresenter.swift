//
//  PullRequestListPresenter.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import Foundation

final class PullRequestListPresenter {
    private let interactor: PullRequestListInteractorProtocol
    weak var view: PullRequestListViewProtocol?
    
    private var viewModels: [PullRequestViewModel] = []
    
    init(interactor: PullRequestListInteractorProtocol) {
        self.interactor = interactor
    }
    
    private func fetchPullRequests(isPaginated: Bool) {
        if !isPaginated {
            view?.showLoading()
        }
        
        interactor.fetchPullRequests { [weak self] result in
            guard let self = self else  { return }
            if !isPaginated {
                self.view?.hideLoading()
            }
            
            switch result {
            case .success(let pullRequests):
                self.handelAPIResponse(pullRequests: pullRequests, isPaginated: isPaginated)
            case .failure(let error):
                self.handelError(error)
            }
        }
    }
    
    private func handelAPIResponse(pullRequests: [PullRequest], isPaginated: Bool) {
        buildViewModels(from: pullRequests)
        
        if isPaginated {
            let newStartIndex = viewModels.count - pullRequests.count
            view?.showNewPullRequests(
                newStartIndex: newStartIndex,
                newEndIndex: viewModels.endIndex - 1
            )
        } else {
            view?.showPullRequests()
        }
    }
    
    private func buildViewModels(from pullRequests: [PullRequest]) {
        let newViewModels = pullRequests.map { PullRequestViewModel(pullRequest: $0) }
        viewModels.append(contentsOf: newViewModels)
    }
    
    private func handelError(_ error: Error) {
        if interactor.isPaginatedRequest() {
            return
        }
        
        if let error = error as? APIRequestError {
            view?.showError(message: error.description)
        } else {
            view?.showError(message: error.localizedDescription)
        }
    }
}

extension PullRequestListPresenter: PullRequestListPresenterProtocol {
    func viewDidLoad() {
        fetchPullRequests(isPaginated: false)
    }
    
    func viewWillDisplayLastItem() {
        fetchPullRequests(isPaginated: true)
    }
    
    func getNumberOfViewModels() -> Int {
        viewModels.count
    }
    
    func getViewModel(atIndex index: Int) -> PullRequestViewModel? {
        viewModels[safe: index]
    }
}
