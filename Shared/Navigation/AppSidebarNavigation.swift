//
//  AppSidebarNavigation.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct AppSidebarNavigation: View {

    enum NavigationItem {
        case all
        case active
        case downloading
        case seeding
    }

//    @EnvironmentObject private var model: FrutaModel
    @State private var selection: Set<NavigationItem> = [.all]
    @State private var presentingRewards = false
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: TorrentList(torrents: torrents)) {
                Label("All", systemImage: "list.bullet")
            }
            .accessibility(label: Text("All"))
            .tag(NavigationItem.all)
            
            NavigationLink(destination: Text("Active")) {
                Label("Favorites", systemImage: "heart")
            }
            .accessibility(label: Text("Active"))
            .tag(NavigationItem.active)
        
            NavigationLink(destination: Text("Downloading")) {
                Label("Downloading", systemImage: "book.closed")
            }
            .accessibility(label: Text("Downloading"))
            .tag(NavigationItem.downloading)
        }
        .overlay(Pocket(presentingRewards: $presentingRewards), alignment: .bottom)
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            #if os(macOS)
            sidebar.frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            #else
            sidebar
            #endif
            
            Text("Content List")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            #if os(macOS)
            Text("Select a Torrent")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar { Spacer() }
            #else
            Text("Select a Torrent")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
    }
    
    struct Placeholder: View {
        var title: String
        
        var body: some View {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle(title)
        }
    }
    
    struct Pocket: View {
        @Binding var presentingRewards: Bool
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                Button(action: { presentingRewards = true }) {
                    HStack {
                        Image(systemName: "settings")
                        Text("Settings")
                    }
                    .padding(6)
                    .contentShape(Rectangle())
                }
                .accessibility(label: Text("Rewards"))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .buttonStyle(PlainButtonStyle())
            }
            .sheet(isPresented: $presentingRewards) {
                #if os(iOS)
              
                #else
                VStack(spacing: 0) {
                    //RewardsView()
                    Divider()
                    HStack {
                        Spacer()
                        Button(action: { presentingRewards = false }) {
                            Text("Done")
                        }
                        .keyboardShortcut(.defaultAction)
                    }
                    .padding()
                    .background(VisualEffectBlur())
                }
                .frame(minWidth: 400, maxWidth: 600, minHeight: 350, maxHeight: 500)
//                .environmentObject(model)
                #endif
            }
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
//            .environmentObject(FrutaModel())
    }
}

struct AppSidebarNavigation_Pocket_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation.Pocket(presentingRewards: .constant(false))
            //.environmentObject(FrutaModel())
            .frame(width: 300)
    }
}

