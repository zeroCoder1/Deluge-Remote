//
//  TorrentOptionView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 7/5/20.
//

import SwiftUI

struct TorrentOptionView: View {
    
   var torrent: Torrent
    
    var body: some View {
        List{
            Section(header: Text("Bandwidth"))
            {
                HStack
                {
                    Text("Max Download Speed (KiB/s)")
                    Spacer()
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct TorrentOptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TorrentOptionView(torrent: torrents[0])
        }
    }
}
