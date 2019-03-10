//
// Created by Arnon Keereena on 2/12/2017 AD.
//

import MongoKitten

/// Base class for all mongodb entity
public protocol MongoEntity {
  var db: Database { get }
  var collectionName: String { get }
  var collection: MongoCollection { get set }
  init()
}