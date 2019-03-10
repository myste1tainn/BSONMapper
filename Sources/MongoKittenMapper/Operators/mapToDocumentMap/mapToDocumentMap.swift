//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

// Algebraic operator for the function
infix operator >>>: AdditionPrecedence

public func >>><T: Primitive>(left: T?, right: Map) {
  map(value: left, to: right)
}

public func >>><T: Primitive>(left: T, right: Map) {
  map(value: left, to: right)
}

public func >>><T: DocumentMappable>(left: T, right: Map) {
  map(value: left, to: right)
}

public func >>><T: DocumentMappable>(left: T?, right: Map) {
  map(value: left, to: right)
}

public func >>><T: DocumentMappable>(left: [T], right: Map) {
  map(value: left, to: right)
}

public func map<T: Primitive>(value: T?, to map: Map) {
  map.currentValue = value
  set(value: map.currentValue, to: map, on: .document)
}

public func map<T: DocumentMappable>(value: [T], to map: Map) {
  map.currentValue = value
  set(value: map.currentValue, to: map, on: .document)
}

enum ValueSetProperty {
  case document
  case dictionary
}

func set(value: Primitive?, to map: Map, on vsp: ValueSetProperty) {
  guard let key = map.currentKey,
        let value = map.currentValue else {
    return
  }
  switch vsp {
  case .document: map.document[key] = value
  case .dictionary: map.dictionary[key] = value
  }
}

