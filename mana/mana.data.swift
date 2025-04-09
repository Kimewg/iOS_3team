//
//  Untitled.swift
//  mana
//
//  Created by 강성훈 on 4/8/25.
//

import Foundation
//Comic 구조체
struct comic {
    let title: String
    let price: Int
    let category: String
    let imageName: String
}

// 데이터 저장용 딕셔너리
// 카테고리로 접근
var comicCategory: [String: [comic]] = [:]
// 타이틀로 접근
var comicTitle: [String: comic] = [:]

//전체 데이터 초기화
let allComic: [comic] = [
    // 액션
      comic(title: "원피스", price: 9000, category: "액션", imageName: "one"),
      comic(title: "원펀맨", price: 8000, category: "액션", imageName: "punch"),
      comic(title: "귀멸의 칼날", price: 9000, category: "액션", imageName: "demon"),
      comic(title: "주술회전", price: 7500, category: "액션", imageName: "kaisen"),
      comic(title: "스파이 패밀리", price: 7500, category: "액션", imageName: "spy"),
      comic(title: "괴수 8호", price: 7000, category: "액션", imageName: "eight"),
      comic(title: "나루토", price: 8000, category: "액션", imageName: "naruto"),
      comic(title: "블리치", price: 8800, category: "액션", imageName: "bleach"),
      comic(title: "드래곤볼", price: 8600, category: "액션", imageName: "dragon"),
      comic(title: "헌터헌터", price: 8200, category: "액션", imageName: "hunter"),
      comic(title: "이누야샤", price: 8400, category: "액션", imageName: "inu"),
      comic(title: "도쿄리벤져스", price: 7800, category: "액션", imageName: "revenge")

    // 호러
//    comic(title: "도쿄구울", price: 8800, category: "호러"),
//    comic(title: "미래일기", price: 7600, category: "호러"),
//    comic(title: "어나더", price: 9000, category: "호러"),
//    comic(title: "피안도", price: 6200, category: "호러"),
//    comic(title: "천공침범", price: 8300, category: "호러"),
//    comic(title: "미스미소우", price: 7400, category: "호러"),
//    comic(title: "혈해의 노아", price: 8200, category: "호러"),
//    comic(title: "이비츠", price: 7600, category: "호러"),
//    comic(title: "식량인류", price: 7500, category: "호러"),
//    comic(title: "신체찾기", price: 6700, category: "호러"),
//    comic(title: "십자가의 6인", price: 7700, category: "호러"),
//    comic(title: "펌프킨 나이트", price: 8800, category: "호러"),
//
//    // 로맨스
//    comic(title: "너에게 닿기를", price: 8800, category: "로맨스"),
//    comic(title: "손끝과 연연", price: 8200, category: "로맨스"),
//    comic(title: "야마다 군 Lv999의 사랑을 하다", price: 9000, category: "로맨스"),
//    comic(title: "내 마음의 위험한 녀석", price: 8600, category: "로맨스"),
//    comic(title: "아름다운 초저녁달", price: 7800, category: "로맨스"),
//    comic(title: "태양보다 눈부신 별", price: 8000, category: "로맨스"),
//    comic(title: "하나노이 군과 상사병", price: 8400, category: "로맨스"),
//    comic(title: "러브 팬텀", price: 7600, category: "로맨스"),
//
//    // 스포츠
//    comic(title: "하이큐", price: 7000, category: "스포츠"),
//    comic(title: "크게 휘두르며", price: 8500, category: "스포츠"),
//    comic(title: "슬램덩크", price: 9000, category: "스포츠"),
//    comic(title: "블루록", price: 9000, category: "스포츠"),
//    comic(title: "H2", price: 6800, category: "스포츠"),
//    comic(title: "테니스 왕자", price: 7000, category: "스포츠"),
//    comic(title: "유도 야와라", price: 7100, category: "스포츠"),
//    comic(title: "골프천재 탄도", price: 6900, category: "스포츠"),
//    comic(title: "원아웃", price: 6000, category: "스포츠"),
//    comic(title: "프리", price: 8000, category: "스포츠"),
//    comic(title: "겁쟁이 페달", price: 7700, category: "스포츠"),
//    comic(title: "츠루네 -궁도부-", price: 8400, category: "스포츠"),
//
//    // 추억의 만화
//    comic(title: "무인도에서 살아남기", price: 8000, category: "추억의 만화"),
//    comic(title: "무서운게 딱 좋아", price: 8000, category: "추억의 만화"),
//    comic(title: "메이플 스토리", price: 8500, category: "추억의 만화"),
//    comic(title: "그리스 로마 신화", price: 7500, category: "추억의 만화"),
//    comic(title: "마법천자문", price: 7000, category: "추억의 만화"),
//    comic(title: "인기있는 아이, 인기없는 아이", price: 6500, category: "추억의 만화"),
//    comic(title: "먼나라 이웃나라", price: 6000, category: "추억의 만화"),
//    comic(title: "만화로 보는 졸라맨", price: 8000, category: "추억의 만화"),
//    comic(title: "위기탈출 넘버원", price: 8000, category: "추억의 만화"),
//    comic(title: "삼국지", price: 6000, category: "추억의 만화"),
//    comic(title: "Why? 똥", price: 7800, category: "추억의 만화"),
//    comic(title: "수학도둑", price: 9000, category: "추억의 만화")
]

//딕셔너리 구성 viewdidload에 이 함수를 넣어줘야 딕셔너리 만들어짐.
func setupComic() {
    for comics in allComic {
        comicCategory[comics.category, default: []].append(comics)
        comicTitle[comics.title] = comics
    }
}
