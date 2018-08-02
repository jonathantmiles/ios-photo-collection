//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Button functions
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var detailPhotoImageView: UIImageView!
    
    @IBOutlet weak var detailPhotoTitleTextField: UITextField!
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}