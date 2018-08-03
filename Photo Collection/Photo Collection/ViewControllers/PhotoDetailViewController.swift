//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        updateViews()
        setTheme()
    }
    
    // MARK: - Button functions
    
    @IBAction func addPhoto(_ sender: Any) {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        switch authStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else { return }
                if status == .authorized {
                    self.presentImagePickerController() } }
        default:
            let alert = UIAlertController(title: "Permission Required", message: "Photo Collection neds access to your photos. Please enable access in Settings > Apps > Photo Collection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                NSLog("The \"Change permsissions in Settings\" alert occurred.")
            }))
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let image = detailPhotoImageView.image,
            let imageData = UIImagePNGRepresentation(image),
            let title = detailPhotoTitleTextField.text else { return }
        if photo == nil {
            photoController?.createPhoto(withTitle: title, imageData: imageData)
        } else {
            guard let photo = photo else { return }
            photoController?.updatePhoto(for: photo, title: title, imageData: imageData)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Custom functions
    
    func setTheme() {
        let preference: String? = themeHelper?.themePrefeference
        switch preference {
        case "Dark":
            self.view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case "Orange":
            self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        default:
            return
        }
    }
    
    func updateViews() {
        if photo != nil {
            guard let imageData = photo?.imageData,
                let image = UIImage(data: imageData),
                let title = photo?.title else { return }
            detailPhotoImageView.image = image
            detailPhotoTitleTextField.text = title
        } else {
            return
        }
    }
    
    // MARK: - Photos functions
    
    func presentImagePickerController() {
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        } else { return }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        detailPhotoImageView.image = image
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var detailPhotoImageView: UIImageView!
    @IBOutlet weak var detailPhotoTitleTextField: UITextField!
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}
