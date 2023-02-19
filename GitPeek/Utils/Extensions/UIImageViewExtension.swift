//
//  UIImageViewExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(withURL url: URL?, placeholderImageName: String = "") {
        image = nil
        
        if !placeholderImageName.isEmpty {
            let placeholderImage = UIImage(named: placeholderImageName)
            image = placeholderImage
        }
        
        guard let imageURL = url else { return }
        
        ImageStore.shared.fetchImage(for: imageURL) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.image = image
                }
                
            case .failure:
                // leave the placeholder image as it is if set
                break
            }
        }
    }
}
