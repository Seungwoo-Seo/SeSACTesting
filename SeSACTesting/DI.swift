//
//  DI.swift
//  SeSACTesting
//
//  Created by 서승우 on 2023/12/12.
//

import Foundation

// B가 변화했을 때, A에게 영향을 미친다. => A가 B가 의존한다
// 휴님(상위 모듈) -> 브랜반점(하위 모듈) 형태로 의존 관계가 형성이 되어 있기 때문에,
// 브랜반점에서의 코드 변화가 휴님에게 영향을 미치는 것을 확인할 수 있다.
// 하위모듈에서의 코드 변화가 상위모듈에게 영향을 미치는 것을 확인할 수 있다.
// => 하위모듈의 변화가 상위모듈에 영향을 미치지 않게 하려면?
// => 즉 중국집이 바뀌어도, 중국집의 주인장이 바뀌어도 휴님의 코드에는 영향ㅇ이 없으려면?
// 브랜반점과 코종반점이 중국집 프로토콜을 따르도록
// 브랜과 코코종은 주방장레시피 프로토콜을 따르도록
// => 구현체가 아닌 추상화에 의존하도록 변경!
// => 인터페이스(프로토콜)로 의존 관계를 추상화 (어려운 말로!)

// DI: Dependency Injection 의존 관계 주입
// DIP: Dependency Inversion Principle 의존 역전 원칙
// 이니셜라이저 시점에 주입을 하고,
// DI(의존성 주입)를 통해 객체의 생성과 사용을 분리한다!

// => DI를 한다고 해서 DIP를 준수하는 것은 아니다.
// => DIP를 구현하는 기법 중의 하나로 DI를 사용할 수 있다.

// 추상화. 인터페이스. 프로토콜.

// 상황을 먼저 눈에 보이게 설명하고
// 그 상황에서 발생한 이슈를 설명
// 그 이슈로 인해 만들어진 개념을 설명하면 깔끔

protocol 중국집 {
    func 근사한점심메뉴() -> String
}

protocol 주방장레시피 {
    func 요리1() -> String
    func 요리2() -> String
    func 요리3() -> String
}

// 코종반점의 생성 시점과 사용을 분리!
// 객체의 생성과 사용의 관심을 분리한다. 즉, 생성자를 통해서 의존성을 주입한다.

class 휴님 {
    var 중국집: 중국집

    init(중국집: 중국집) {
        self.중국집 = 중국집
    }

    func 점심밥() -> String {
        return 중국집.근사한점심메뉴()
    }
}

class 브랜반점: 중국집 {
    private var 주인: 주방장레시피!

    func 근사한점심메뉴() -> String {
        return 주인.요리1() + 주인.요리2() + 주인.요리3()
    }
}

class 코종반점: 중국집 {
    private var 주인: 주방장레시피

    init(주인: 주방장레시피) {
        self.주인 = 주인
    }

    func 근사한점심메뉴() -> String {
        return 주인.요리1() + 주인.요리2() + 주인.요리3()
    }
}

class 브랜: 주방장레시피 {
    func 요리1() -> String {
        return "돈까스"
    }

    func 요리2() -> String {
        return "특제꿔바로우"
    }

    func 요리3() -> String {
        return "평양냉면"
    }
}

class 코코종: 주방장레시피 {
    func 요리1() -> String {
        return "코종의 특별한 마법 소스가 들어간 탕수육"
    }

    func 요리2() -> String {
        return "마장동 한우 소머리국밥"
    }

    func 요리3() -> String {
        return "코종의 최애 밀면"
    }
}

// => 구현체가 아닌 인터페이스 추상화에 의존한다


// 인터넷이 연결이 되어 있어야만 테스트가 성공하겠군 -> X
// 외부환경에 영향을 받으면 안됌

protocol NetworkProvider {
    func fetchLotto()
}

// 네트워크를 테스트할 때는, Mock데이터를 통해 실제 네트워크 통신을 하지 않고 테스트를 진행하는 것이 적합

class NetworkManager: NetworkProvider {
    func fetchLotto() { // 실제 네트워크 통신을 진행하는 부분

    }
}
