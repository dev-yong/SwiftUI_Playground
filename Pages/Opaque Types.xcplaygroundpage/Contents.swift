//: [Previous](@previous)
import SwiftUI
/*:
 # Opaque Types
 
 ## Generic Type
 - Generic Type은 함수를 호출하는 코드에서 함수의 parameter에 대한 Type을 선택하고, 구현부에서 추상화된 방식으로 값을 반환한다.
 - 구현부의 외부에서 Type을 알 수 있다. (외부에 Type을 노출하게 된다.)
 ```
 func generic<T: Shape>() -> T { ... }

 let x: Rectangle = generic() // T == Rectangle, chosen by caller
 let x: Circle = generic() // T == Circle, chosen by caller
 ```
 */
example("Generic") {
    func genericMax<T>(_ lhs: T, _ rhs: T) -> T where T: Comparable {
     
        return lhs < rhs ? rhs : lhs
    }
    genericMax(0, 1) // T == Int
}
/*:
 ## Opaque Type
 
 - Opaque Result Types (불투명한 result type)
 - Generic Type의 반대로 생각(Reverse generic type)할 수 있다.
 ```
 func reverseGeneric() -> <T: Shape> T { return Rectangle(...) }

 let x = reverseGeneric() // abstracted type chosen by reverseGeneric's implementation
 ```
 ```
 func reverseGeneric() -> some Shape { return Rectangle(...) }

 let x = reverseGeneric() // abstracted type chosen by reverseGeneric's implementation
 ```
 - Opaque Type은 함수 구현부에서 값(함수를 호출하는 코드에서 추상화되어진 방식으로 반환되는)에 대한 Type을 선택한다.
 - Opqaue Type은 `Any`, `AnyObject`, `Protocol`,  `Base class` 만 지정해야한다.
 - `some` 키워드를 붙여 opaque type임을 나타낸다.
 */
example("Complex type") {
    // `some View`를 반환하고 있기 때문에, 마지막 반환값이 어떠한 것이 되더라도 `View` protocol을 채택하기만 하면 된다.
    func opaqueResult() -> some View {
        
        // Text
        let text = Text("Hello")
        //  List<Never, ForEach<Range<Int>, Int, HStack<Text>>>
        let list = List(0..<10) { _ in text }
        // VStack<List<Never, ForEach<Range<Int>, Int, HStack<Text>>>>
        let vstack = VStack { list }
        return vstack
    }
    opaqueResult()
}
/*:
 - Opaque type은 **Type Identity**를 보존하기 때문에 특정 유형임을 나타낼 수 있고, 따라서 `associatedtype`, `Self`를 사용하는 protocol도 반환할 수 있다.
 */
example("Opaque type is preserve type identity") {
    func someEquatable() -> some Equatable {
        return String()
    }
}
example("Protocol type isn't preserve type identity") {
//    func equatable() -> Equatable {
//        return String()
//    }
}
/*:
 - 하나의 Type만의 반환이 가능하다. 여러 개의 Type을 반환할 경우 compile error가 발생한다.
 */
example("Opaque multiple result") {
//    func opaqueMultiple(isVStack: Bool) -> some View {
//        if isVStack {
//            return VStack {}
//        } else {
//            return HStack {}
//        }
//    }
}
/*:
 ## Reference
 - [Swift Language Guide](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html)
 - [Swift Evolution](https://github.com/apple/swift-evolution/blob/master/proposals/0244-opaque-result-types.md)
 */
//: [Next](@next)
