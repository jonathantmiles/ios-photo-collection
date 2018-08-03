//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jonathan T. Miles on 8/2/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init () { // sets a default theme before the user has a chance to pick one
        if themePrefeference == nil {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey: String = "ThemePreferenceKey" // to keep our key name consistent
    
    func setThemePreferenceToDark() { // sets theme preference to dark
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToOrange() { // sets theme preference to orange
        UserDefaults.standard.set("Orange", forKey: themePreferenceKey)
    }
    
    var themePrefeference: String? { // holds the current theme preference
        let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey)
        return themePreference // which is computed here
    }
}
