//
//  StoreSubscriber.swift
//  ReSwift
//
//  Created by Benjamin Encz on 12/14/15.
//  Copyright © 2015 ReSwift Community. All rights reserved.
//

public protocol AnyStoreSubscriber: AnyObject {
    // swiftlint:disable:next identifier_name
    func _newState(_ state: Any, for action: Action?)
}

public protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StoreSubscriberStateType

    func newState(_ state: StoreSubscriberStateType, for action: Action?)
}

extension StoreSubscriber {
    // swiftlint:disable:next identifier_name
    public func _newState(_ state: Any, for action: Action?) {
        if let typedState = state as? StoreSubscriberStateType {
            newState(typedState, for: action)
        }
    }
}
