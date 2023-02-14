//
//  ResponseMapper.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol ResponseMapper {
    associatedtype Input
    associatedtype Output

    func decode(_ data: Input) -> Result<Output, Error>
}
