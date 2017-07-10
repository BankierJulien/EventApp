//
//  arrayExtension.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/19/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//


extension Array {
    
    func filterDuplicates( includeElement: (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element]{
        var results = [Element]()
        forEach { (element) in let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        
        return results
    }

}
