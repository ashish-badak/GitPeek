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
                self.buildViewModels(from: pullRequests)
                self.view?.showPullRequests()
            case .failure(let error):
                self.handelError(error)
            }
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
        
        // TODO: Pass error to view to display
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
