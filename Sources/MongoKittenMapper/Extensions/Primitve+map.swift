//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension Primitive {
  mutating func map(with document: DocumentMap) {
    switch document.direction {
    case .document: self >>> document
    case .dictionary: self ->> document
    case .property: self = document.currentValue as! Self
    }
  }
}

extension Optional where Wrapped: Primitive {
  mutating func map(with document: DocumentMap) {
    switch document.direction {
    case .document: self >>> document
    case .dictionary: self ->> document
    case .property: self = document.currentValue as! Optional<Wrapped>
    }
  }
}
