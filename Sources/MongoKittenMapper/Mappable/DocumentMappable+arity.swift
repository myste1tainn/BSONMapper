//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON
import MongoKitten

extension Array where Element: DocumentMappable {
  var documents: [Document] {
    return reduce([Document]()) {
      $0 + [$1.makeDocument()]
    }
  }
  
  var dictionaries: [[String: Primitive]] {
    return reduce([[String: Primitive]]()) {
      $0 + [$1.makeDictionary()]
    }
  }
}
