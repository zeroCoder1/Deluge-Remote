//
//  TorrentList.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct TorrentList: View {
    
    var torrents: [Torrent]
    @State private var selection: Torrent?
    
    var content: some View {
        List(selection: $selection) {
            
            ForEach(torrents) { torrent in
                NavigationLink(
                    destination: TorrentView(torrent: torrent),
                    tag: torrent,
                    selection: $selection
                ) {
                    TorrentRow(torrent: torrent)
                }
                .tag(torrent)
            }
        }.navigationTitle("Torrents")
        
    }
    
    @ViewBuilder var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 270, idealWidth: 500, maxWidth: 800, maxHeight: .infinity)
            .toolbar { Spacer() }
        #endif
    }
}

struct TorrentList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            NavigationView {
                TorrentList(torrents: torrents)
            }
            .preferredColorScheme(scheme)
        }
    }
}
