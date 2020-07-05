import Combine
import SwiftUI
import PlaygroundSupport

public func display<V: View>(_ view: V) {
    
    PlaygroundPage.current.liveView = UIHostingController(rootView: view)
}


public func example(_ description: String, _ body: ()->()) {
    
    print("-----\(description)-----")
    body()
}
