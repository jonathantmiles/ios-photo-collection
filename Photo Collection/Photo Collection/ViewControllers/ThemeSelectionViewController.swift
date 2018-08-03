//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Button fuctions
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectOrangeTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToOrange()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Properties
    
    var themeHelper: ThemeHelper?

}
