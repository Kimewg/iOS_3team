# 마나Check - 만화 구매 시뮬레이터 앱

만화를 장르별로 둘러보고 장바구니에 담아 결제할 수 있는 iOS 앱입니다.  

---

## 주요 기능

- 다양한 장르의 만화 필터링 (`스포츠`, `호러`, `로맨스`, `액션`, `추억의 만화`)
- 컬렉션 뷰에서 만화 추가 버튼으로 장바구니에 담기
- 테이블 뷰에서 수량 조절 (`+`, `-`) 가능
- 결제 시 총 금액과 개수 계산
- 마나 부족 알림 및 결제 완료 알림
- 전체 취소 버튼으로 초기화 가능

---

## 기술 스택

- **UIKit**
- **SnapKit**: 오토레이아웃 구성
- **MVVM 패턴** 적용
- **NotificationCenter**: 뷰 간 통신

---
## View 구조 및 사용된 컴포넌트

📱 ViewController

├─ UILabel        : 상단 타이틀 ("마나Check")
├─ UIScrollView   : 장르 선택 바 (가로 스크롤)
│   └─ UIStackView + UIButton : 장르 선택 버튼들
├─ UICollectionView : 장르에 맞는 만화 목록 (가로 스크롤)
├─ UITableView     : 장바구니 목록 (선택한 만화들, 수량 조절 포함)
├─ UILabel        : 총 개수 라벨
├─ UILabel        : 결제 금액 라벨
├─ UIButton        : 결제하기
└─ UIButton        : 전체취소


![Simulator Screenshot - iPhone 16 Pro - 2025-04-10 at 21 00 48](https://github.com/user-attachments/assets/03562bf1-8e5c-4363-aa33-2785140aca5b)

