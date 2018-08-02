//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

class PhotoController {
    
    // Create
    func createPhoto(withTitle title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    // Update
    func updatePhoto(for photo: Photo, title: String, imageData: Data)  {
        var photoInPhotos = photo
        photoInPhotos.imageData = imageData
        photoInPhotos.title = title
    }
    
    // Read
    var photos = [Photo]()
}
