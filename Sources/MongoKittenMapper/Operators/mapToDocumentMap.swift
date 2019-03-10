//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

public func map<T: Primitive>(primitive: T?, to map: DocumentMap) {
  map.currentValue = primitive
  guard let key = map.currentKey,
        let value = map.currentValue else {
    return
  }
  map.document[key] = value
}

public func map<T: DocumentMappable>(mappables: [T], to map: DocumentMap) {
  map.currentValue = mappables
  guard let key = map.currentKey,
        let value = map.currentValue else {
    return
  }
  map.document[key] = value
}
