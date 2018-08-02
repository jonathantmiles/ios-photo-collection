//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - Custom functions
    
    func setTheme() {
        let preference: String? = themeHelper.themePrefeference
        switch preference {
        case "Dark":
            self.view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case "Orange":
            self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        default:
            return
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddPhotoSegue":
            guard let destVC = segue.destination as? PhotoDetailViewController, let index = collectionView?.indexPathsForSelectedItems?.first?.row else { return }
            destVC.photo = photoController.photos[index]
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
        case "ShowDetailSegue":
            guard let destVC = segue.destination as? PhotoDetailViewController else { return }
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
        case "ThemeSelectSegue":
            guard let destVC = segue.destination as? ThemeSelectionViewController else { return }
            destVC.themeHelper = themeHelper
        default:
            return
        }

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        let index = collectionView.indexPathsForSelectedItems?.first?.row
        cell.photo = photoController.photos[index!]
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
    
}
