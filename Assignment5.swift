enum counterr: Error {
  case less

  var msg: String {
    switch self {
      case .less: return "ERROR: Prime number less than 3."
    }
  }
}

func checkprime(n: Int...) throws {
  var f=0,c=0

  for j in n {
    for i in 2...j-1 {
      guard j%i != 0 else {
        f=1
        c+=1
        break
      }
    }

    if(f==1) {
      print("\(j) is not prime")
    }
    else { 
      print("\(j) is prime")
    }

    f=0
  }

  if(c>3) {
    throw counterr.less
  }
}

func multi(n: inout Int) {
  n*=2
}

var n = Int(readLine()!) ?? 0
multi(n: &n) 
print("Multiply by 2 :: \(n)")

do {
  try checkprime(n: 10,15,20,9,7)
} catch {
  if let e = error as? counterr {
    print(e.msg)
  }
}
