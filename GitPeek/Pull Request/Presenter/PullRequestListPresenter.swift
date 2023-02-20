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
    
    private var viewModels: [PullRequestViewModel] = []
    
    init(interactor: PullRequestListInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        fetchPullRequests()
    }
    
    func viewWillDisplayLastItem() {
        fetchPullRequests()
    }
    private func fetchPullRequests() {
        interactor.fetchPullRequests { [weak self] result in
            guard let self = self else  { return }
            switch result {
            case .success(let pullRequests):
                self.buildViewModels(from: pullRequests)
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
