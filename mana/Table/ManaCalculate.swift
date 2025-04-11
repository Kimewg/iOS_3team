//
//  mana.calculate.swift
//  mana
//
//  Created by 강성훈 on 4/9/25.
//
import UIKit

func calculatePrice(_ comicCountDic: [String:Int]) -> Int {
    var total = 0
    for (title,count) in comicCountDic{
        if let comic = comicTitle[title]{
            total += comic.price * count
        }
    }
    return total
}
