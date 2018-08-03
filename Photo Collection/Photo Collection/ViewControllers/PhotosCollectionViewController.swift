//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView?.reloadData()
    }
    
    // MARK: - Properties
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    // MARK: - Custom functions
    
    func setTheme() {
        guard let preference: String = themeHelper.themePrefeference else { return }
        switch preference {
        case "Dark":
            collectionView?.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case "Orange":
            collectionView?.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        default:
            return
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddPhotoSegue":
            guard let destVC = segue.destination as? PhotoDetailViewController
                 else { return }
            destVC.photoController = photoController
            destVC.themeHelper = themeHelper
        case "ShowDetailSegue":
            guard let destVC = segue.destination as? PhotoDetailViewController,
                let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
            destVC.photo = photoController.photos[index]
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
//        guard let index0 = collectionView.indexPathsForSelectedItems,
//            let index1 = index0.first?.item else { fatalError("Error in index") }
        cell.photo = photoController.photos[indexPath.item]
        
        return cell
    }


}
