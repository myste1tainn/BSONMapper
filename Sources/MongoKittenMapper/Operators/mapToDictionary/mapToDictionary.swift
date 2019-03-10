//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

infix operator ->>: AdditionPrecedence

public func ->><T>(left: T?, right: Map) where T: Primitive {
  mapDictionaries(value: left, to: right)
}

public func ->><T>(left: [T], right: Map) where T: DocumentMappable {
  mapDictionaries(value: left, to: right)
}

public func mapDictionaries<T: Primitive>(value: T?, to map: Map) {
  map.currentValue = value
  set(value: map.currentValue, to: map, on: .dictionary)
}

public func mapDictionaries<T: DocumentMappable>(value: [T], to map: Map) {
  map.currentValue = value.dictionaries
  set(value: map.currentValue, to: map, on: .dictionary)
}
