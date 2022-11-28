//
//  FavoriteChannel.swift
//  remotecontrol7
//
//  Created by Sayraj Kazi on 3/15/22.
//


import Foundation



    var favoriteChannels = [
        
        favoriteChannel(name: "ABC",
                        number: "1"),
        
        favoriteChannel(name: "NBC",
                        number: "2"),
        
        favoriteChannel(name: "CBS",
                        number: "3"),
        
        favoriteChannel(name: "FOX",
                        number: "4")
            ]

    class favoriteChannel {
        
        var name: String
        var number: String
        
        init(name: String, number: String) {
            self.name = name
            self.number = number
        }
    }

