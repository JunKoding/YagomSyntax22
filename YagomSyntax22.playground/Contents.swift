import Cocoa

// 옵셔널 체이닝과 nil 병합 연산자
// optional chaining and nil - coalescing operator



// 옵셔널 체이닝

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또 다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다.

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        self.buildingNumber = dong
        self.roomNumber = ho
    }
}

let jun: Person? = Person(name: "jun")
let apart: Apartment? = Apartment(dong: "218", ho: "1902")
let yuri: Person? = Person(name: "yuri")

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널이다.

// 만약 우리집의 경비원의 직업이 궁금하다면..?

// 1. 옵셔널 체이닝을 사용하지 않을 때
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)이다.")
                } else {
                    print("우리집 경비원은 직업이 없다.")
                }
            }
        }
    }
}

guardJob(owner: jun)

// 2. 옵셔널 체이닝을 사용할 때
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)이다.")
    } else {
        print("우리집 경비원은 직업이 없다.")
    }
}

guardJobWithOptionalChaining(owner: jun)
// 우리집 경비원은 직업이 없다.

jun?.home?.guard?.job // nil

jun?.home = apart
jun?.home // Optional(Apratment)

jun?.home?.guard // nil
jun?.home?.guard = yuri
jun?.home?.guard // Optional(Person)

jun?.home?.guard?.name // yuri
jun?.home?.guard?.job // nil

jun?.home?.guard?.job = "경비원"

                                                
            
                                                            
// nil 병합 연산자

var guardJob: String

guardJob = jun?.home?.guard?.job ?? "유리" // jun?.home?.guard?.job 이게 nil 이라면 "유리"를 넣어라.
print(guardJob) // 경비원

jun?.home?.guard?.job = nil // jun?.home?.guard?.job에 nil을 할당

guardJob = jun?.home?.guard?.job ?? "유리"
print(guardJob) // 유리
