//
//  Torrent+SwiftUI.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import Foundation

extension Torrent
{
    var ratioText: String {
        return String(format: "%.3f", self.ratio.roundTo(places: 3))
    }
}
