//
//  mana.data.swift
//  mana
//
//  Created by 강성훈 on 4/8/25.
//

import Foundation
//Comic 구조체
var comicCountDic: [String:Int] = [:]

struct Comic {
    let title: String
    let price: Int
    let category: String
    let imageName: String
}

// 데이터 저장용 딕셔너리
// 카테고리로 접근
var comicCategory: [String: [Comic]] = [:]
// 타이틀로 접근
var comicTitle: [String: Comic] = [:]

//전체 데이터 초기화
let allComic: [Comic] = [
    // 액션
    Comic(title: "원피스", price: 9000, category: "액션", imageName: "one"),
    Comic(title: "원펀맨", price: 8000, category: "액션", imageName: "punch"),
    Comic(title: "귀멸의 칼날", price: 9000, category: "액션", imageName: "demon"),
    Comic(title: "주술회전", price: 7500, category: "액션", imageName: "kaisen"),
    Comic(title: "스파이 패밀리", price: 7500, category: "액션", imageName: "spy"),
    Comic(title: "괴수 8호", price: 7000, category: "액션", imageName: "eight"),
    Comic(title: "나루토", price: 8000, category: "액션", imageName: "naruto"),
    Comic(title: "블리치", price: 8800, category: "액션", imageName: "bleach"),
    Comic(title: "드래곤볼", price: 8600, category: "액션", imageName: "dragon"),
    Comic(title: "헌터헌터", price: 8200, category: "액션", imageName: "hunter"),
    Comic(title: "이누야샤", price: 8400, category: "액션", imageName: "inu"),
    Comic(title: "도쿄리벤져스", price: 7800, category: "액션", imageName: "revenge"),

    // 호러
    Comic(title: "도쿄구울", price: 8800, category: "호러", imageName: "ghoul"),
    Comic(title: "미래일기", price: 7600, category: "호러", imageName: "mirae"),
    Comic(title: "어나더", price: 9000, category: "호러", imageName: "another"),
    Comic(title: "피안도", price: 6200, category: "호러", imageName: "piando"),
    Comic(title: "천공침범", price: 8300, category: "호러", imageName: "invasion"),
    Comic(title: "미스미소우", price: 7400, category: "호러", imageName: "mis"),
    Comic(title: "혈해의 노아", price: 8200, category: "호러", imageName: "noa"),
    Comic(title: "이비츠", price: 7600, category: "호러", imageName: "Ibitz"),
    Comic(title: "식량인류", price: 7500, category: "호러", imageName: "humanity"),
    Comic(title: "신체찾기", price: 6700, category: "호러", imageName: "body"),
    Comic(title: "십자가의 6인", price: 7700, category: "호러", imageName: "six"),
    Comic(title: "펌프킨 나이트", price: 8800, category: "호러", imageName: "pumpkin"),

    // 로맨스
    Comic(title: "너에게 닿기를", price: 8800, category: "로맨스", imageName: "kimini"),
    Comic(title: "손끝과 연연", price: 8200, category: "로맨스", imageName: "finger"),
    Comic(title: "야마다 군 Lv999의 사랑을 하다", price: 9000, category: "로맨스", imageName: "yamada"),
    Comic(title: "내 마음의 위험한 녀석", price: 8600, category: "로맨스", imageName: "kokoro"),
    Comic(title: "아름다운 초저녁달", price: 7800, category: "로맨스", imageName: "moon"),
    Comic(title: "태양보다 눈부신 별", price: 8000, category: "로맨스", imageName: "star"),
    Comic(title: "하나노이 군과 상사병", price: 8400, category: "로맨스", imageName: "hananoi"),
    Comic(title: "러브 팬텀", price: 7600, category: "로맨스", imageName: "phantom"),

    // 스포츠
    Comic(title: "하이큐", price: 7000, category: "스포츠", imageName: "high"),
    Comic(title: "크게 휘두르며", price: 8500, category: "스포츠", imageName: "big"),
    Comic(title: "슬램덩크", price: 9000, category: "스포츠", imageName: "slam"),
    Comic(title: "블루록", price: 9000, category: "스포츠", imageName: "blue"),
    Comic(title: "H2", price: 6800, category: "스포츠", imageName: "H2"),
    Comic(title: "테니스 왕자", price: 7000, category: "스포츠", imageName: "tennis"),
    Comic(title: "유도 야와라", price: 7100, category: "스포츠", imageName: "yudo"),
    Comic(title: "골프천재 탄도", price: 6900, category: "스포츠", imageName: "glof"),
    Comic(title: "원아웃", price: 6000, category: "스포츠", imageName: "oneout"),
    Comic(title: "프리", price: 8000, category: "스포츠", imageName: "free"),
    Comic(title: "겁쟁이 페달", price: 7700, category: "스포츠", imageName: "pedal"),
    Comic(title: "츠루네 -궁도부-", price: 8400, category: "스포츠", imageName: "gungdo"),

    // 추억의 만화
    Comic(title: "무인도에서 살아남기", price: 8000, category: "추억의 만화", imageName: "survive"),
    Comic(title: "무서운게 딱 좋아", price: 8000, category: "추억의 만화", imageName: "scary"),
    Comic(title: "메이플 스토리", price: 8500, category: "추억의 만화", imageName: "maple"),
    Comic(title: "그리스 로마 신화", price: 7500, category: "추억의 만화", imageName: "rome"),
    Comic(title: "마법천자문", price: 7000, category: "추억의 만화", imageName: "maho"),
    Comic(title: "인기있는 아이, 인기없는 아이", price: 6500, category: "추억의 만화", imageName: "popular"),
    Comic(title: "먼나라 이웃나라", price: 6000, category: "추억의 만화", imageName: "far"),
    Comic(title: "만화로 보는 졸라맨", price: 8000, category: "추억의 만화", imageName: "jolla"),
    Comic(title: "위기탈출 넘버원", price: 8000, category: "추억의 만화", imageName: "number"),
    Comic(title: "삼국지", price: 6000, category: "추억의 만화", imageName: "three"),
    Comic(title: "Why? 똥", price: 7800, category: "추억의 만화", imageName: "why"),
    Comic(title: "수학도둑", price: 9000, category: "추억의 만화", imageName: "math")
]

//딕셔너리 구성 viewdidload에 이 함수를 넣어줘야 딕셔너리 만들어짐.
func setupComic() {
    for comics in allComic {
        comicCategory[comics.category, default: []].append(comics)
        comicTitle[comics.title] = comics
    }
}


