//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let data = photo?.imageData,
            let image = UIImage(data: data) else { return }
        photoImageView.image = image
        photoTitleLabel.text = photo?.title
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
}
