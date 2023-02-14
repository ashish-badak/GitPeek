//
//  QueryParamsProvider.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol QueryParamsProvider {
    func getQueryParameters() -> Parameters
}
