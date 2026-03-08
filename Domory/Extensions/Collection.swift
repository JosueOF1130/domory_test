//
//  Collection.swift
//  Domory Test
//
//  Created by Leonardo Arias
//


extension Collection {
  /// A Boolean value indicating whether the collection is not empty.
  ///
  /// This is the inverse of isEmpty, and can be used to improve readability
  /// in conditionals where you want to check if a collection has elements.
  public var isNotEmpty: Bool {
	return !isEmpty
  }
}
