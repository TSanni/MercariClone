//
//  AppStateManager.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/13/23.
//

import Foundation
import SwiftUI

class AppStateManager: ObservableObject {
    @Published var tabSelection = 0
    @Published var revertBackTab = 0

    @Published var signedIn = false
    @Published var showFullScreenCover = false
}
