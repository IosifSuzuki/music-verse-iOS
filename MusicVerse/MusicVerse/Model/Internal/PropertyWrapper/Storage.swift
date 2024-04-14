//
//  Storage.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 14.04.2024.
//

import Foundation
import Combine

protocol AnyOptional {
  var isNil: Bool { get }
}

@propertyWrapper
struct Storage<Value> {
  let key: String
  let defaultValue: Value
  var container: UserDefaults = .standard
  private let publisher = PassthroughSubject<Value, Never>()
  
  var wrappedValue: Value {
    get {
      return container.object(forKey: key) as? Value ?? defaultValue
    }
    set {
      if let optional = newValue as? AnyOptional, optional.isNil {
        container.removeObject(forKey: key)
      } else {
        container.set(newValue, forKey: key)
      }
      publisher.send(newValue)
    }
  }
  
  var projectedValue: AnyPublisher<Value, Never> {
    publisher.eraseToAnyPublisher()
  }
}

extension Optional: AnyOptional {
  
  var isNil: Bool {
    self == nil
  }
  
}

extension Storage where Value: ExpressibleByNilLiteral {
  
  init(key: String, _ container: UserDefaults = .standard) {
    self.init(key: key, defaultValue: nil, container: container)
  }
  
}
