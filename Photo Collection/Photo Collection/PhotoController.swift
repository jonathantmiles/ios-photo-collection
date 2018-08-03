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
    
    // Update ... using Will's pattern for changing values
    func updatePhoto(for photo: Photo, title: String, imageData: Data)  {
        guard let index = photos.index(of: photo) else { return } // make sure to find the index so you know whre in the array this model belongs
        let photoInPhotos = photos[index] // make a scratch constant
        
        if title != photoInPhotos.title { // check value against "scratch"
            photos[index].title = title // change property of model directly
        }
        if imageData != photoInPhotos.imageData { // repeat
            photos[index].imageData = imageData
        }
    }
    
    // Read
    var photos: [Photo] = []
}
