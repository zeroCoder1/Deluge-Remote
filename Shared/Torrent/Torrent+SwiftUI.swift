//
//  Torrent+SwiftUI.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

extension Torrent
{
    var ratioText: String {
        return String(format: "%.3f", self.ratio.roundTo(places: 3))
    }
}

extension PeerMetadata
{
    var flag: Image {
        return Image("flag/\(country.lowercased())", label: Text("\(country) flag"))
            .renderingMode(.original)
    }
}
