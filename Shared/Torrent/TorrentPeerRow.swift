//
//  TorrentPeerRow.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/29/20.
//

import SwiftUI

struct TorrentPeerRow: View {
    let peerData: PeerMetadata
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20){
            Spacer()
            VStack (alignment: .leading, spacing: 3){
            
                HStack(alignment: .center)
                {
                    Text(peerData.client)
                        .font(.callout)
                }
                HStack(spacing: 15)
                {
                    peerData.flag
                        .padding(.leading, 3)
                    Text(peerData.ip)
                        .font(.caption)

                }
                HStack(alignment: .center, spacing: 20)
                {
                    Text("↑ \(peerData.up_speed.transferRateString())")
                        .font(.caption)
                    
                    Text("\(peerData.down_speed.transferRateString()) ↓")
                        .font(.caption)
    
                }
            }
            Spacer()
            VStack(alignment: .center)
            {
                CircularProgressView(progress: peerData.progress/100)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            Spacer()
        }
    }
}

struct TorrentPeerRow_Previews: PreviewProvider {
    static var previews: some View {
        TorrentPeerRow(peerData: PeerMetadata(down_speed: 8000, ip: "178.63.87.131:51413", up_speed: 34454322, client: "Transmission 2.9.2", country: "US", progress: 43, seed: 2))
    }
}
