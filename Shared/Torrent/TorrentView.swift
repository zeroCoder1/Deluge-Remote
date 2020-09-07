//
//  TorrentView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct TorrentView: View {
    
    let torrent: Torrent
    
    var body: some View {
        TabView {
            TorrentInfoView(torrent: torrent)
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Info")
                }
            TorrentFileView(torrentFileStructure: fileStructure)
                .tabItem {
                    Image(systemName: "folder")
                    Text("Files")
                }
            TorrentOptionView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Options")
                }
        }
        .navigationTitle(torrent.name)
    }
}


struct TorrentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            let torrent = torrents.first{ $0.hash == "2ba9ef753d4d6e26469b058f562033fc43518abe"}!
            TorrentView(torrent: torrent)
        }
        
    }
}


