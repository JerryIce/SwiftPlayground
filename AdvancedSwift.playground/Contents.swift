


let x = [1,2,3,4,5,6,7,8,9,10,11,12]
var y = x

let square = x.map{$0 * $0}
x
square

extension Sequence{
    func first(predicate:(Element)->Bool)->Element?{
        for value in self where predicate(value) {
            return value
        }
        return nil
    }
    
    func flatMapC<T>(_ transform:(Element)->[T])->[T]{
        var results:[T] = []
        for value in self {
            results.append(contentsOf: transform(value))
        }
        return results
    }
}

let a = square.first { value in
    value > 71
}

let b = square.flatMapC { num in
    [num+1]
}



