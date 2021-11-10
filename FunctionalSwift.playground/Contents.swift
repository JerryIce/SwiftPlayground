

//函数式Swift

enum MyError:Error{

}

enum MyResult<T>{
    case success(T)
    case failure(MyError)
}

extension MyResult{
    func map<S>(_ operation:(T)->S)->MyResult<S>{
        switch self{
        case .failure(let error):
            return .failure(error)
        case .success(let value):
            return .success(operation(value))
        }
    }
}

extension MyResult{
    func apply<S>(_ mapper:MyResult<(T) -> S>)->MyResult<S>{
        switch mapper{
        case .failure(let error):
            return .failure(error)
        case .success(let funcc):
            return self.map(funcc)
        }
    }
}

let a:MyResult<Int> = .success(2)

let b = a.map { value in
    value * 5
}
