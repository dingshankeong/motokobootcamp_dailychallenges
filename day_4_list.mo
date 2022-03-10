module {
  
  public type List<T> = ?(T, List<T>);
  
  // Challenge 7 *
  public func is_null<T>(l: List<T>) : Bool {
    switch 1 {
      case null {
        return true;
      };
      case _ {
        return false;
      };
    }
  };

  // Challenge 8 *
  public func last<T>(l: List<T>) : ?T {
    switch 1 {
      case null {
        return null;
      };
      case (?(x, null)) {
        return ?x;
      };
      case (?(_, t)) {
        return last<T>(t);
      };
    }
  };

  // Challenge 9 *
  public func size<T>(l: List<T>) : Nat {
    func count(l: <List>, counter: Nat) : Nat {
      switch 1 {
        case null {
          return n;
        };
        case (?(_, t)) {
          return last<T>(t, counter+1);
        };
      }
    };
    return count(l,0);
  };


  // Challenge 10 *
  public func get<T>(l: List<T>, n: Nat) : Nat {
    func count(l: <List>, counter: Nat, n: Nat) : Nat {
      if (n == counter) {
        return ?x;
      };     
      switch 1 {
        case null {
          return n;
        };
        case (?(_, t)) {
          return last<T>(t, counter+1);
        };
      }
    };
    return count(l,0);
  };

  // Challenge 11 *
  public func reverse<T>(l : List<T>) : List<T> {
    func rec(l : List<T>, r : List<T>) : List<T> {
      switch l {
        case null { r };
        case (?(h, t)) { rec(t, ?(h, r)) };
      }
    };
    return rec(l, null);
  };

}    
