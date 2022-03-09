import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Option "mo:base/Option";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  // Challenge 1 **
  private func swap(array : [var Nat], i: Nat, j: Nat) : [var Nat] {
    var temp: Nat = array[i];
    array[i] := array[j];
    array[j] := temp;
    return array;
  };

  // Challenge 2 **
  public func init_count(n : Nat) : async [Nat] {
    let array : [var Nat] = Array.init<Nat>(n, 3);
    for (i in Iter.range(0, n-1)) {
        array[i] :=i;
    };
    return Array.freeze<Nat>(array);
  };

  // Challenge 3 **
  public func seven(array: [Nat]) : async Text {
    for (value in array.vals()) {
        if (value == 7) {
            return "Seven is found!";
        }
    };
    return "Seven not found";
  };

  // Challenge 4 **
  public func nat_opt_to_nat(n: ?Nat, m: Nat) : async ?Nat {
    if (n != null) {
        return n;
    }
    else {
        return Option.make(m);
    }
  };

  //Challenge 5 **
  public func day_of_the_week(n: Nat) : async ?Text {
    if (n > 0 and n < 8) {
      switch n {
        case 1 {
          return Option.make("Monday");
        };
        case 2 {
          return Option.make("Tuesday");
        };
        case 3 {
          return Option.make("Wednesday");
        };
        case 4 {
          return Option.make("Thursday");
        };
        case 5 {
          return Option.make("Friday");
        };
        case 6 {
          return Option.make("Saturday");
        };
        case 7 {
          return Option.make("Sunday");
        };
      };
    }
    else {
      return null;
    }; 
  };

  // Challenge 6 *
  private func null_replace(array: [Nat], counter: Nat) : [Nat] {
    let array_mutable = Array.thaw<Nat>(array);
    if (counter > 0) {
      if (array_mutable[counter-1] == 1) {
        array_mutable[counter-1] := 0;
      };
     
      return null_replace((Array.freeze(array_mutable),counter-1));
    }
    else {
      return (Array.freeze(array_mutable));
    };
  };

  public func populate_array(array: [Nat]) : async [Nat] {
    return null_replace(array,array.size());
  };

  // Challenge 7 **
  private func sum_array(array: [Nat], counter: Nat) : Nat {
    if (counter > 0) {
      return sum_array(array,counter - 1) + array[counter - 1];
    }
    else {
      return 0;
    };
  };

  public func sum_of_array(array: [Nat]) : async Nat {
    return sum_array(array,array.size());
  };

  // Challenge 8 **
  private func square_replace(array: [Nat], counter: Nat) : [Nat] {
    let array_mutable = Array.thaw<Nat>(array);
    if (counter > 0) {
      array_mutable[counter-1] := array_mutable[counter-1]**2;
      return square_replace((Array.freeze(array_mutable),counter-1));
    }
    else {
      return (Array.freeze(array_mutable));
    };
  };

  public func squared_array(array: [Nat]) : async [Nat] {
    return square_replace(array,array.size());
  };

  // Challenge 9 **
  private func index_add(array: [Nat], counter: Nat) : [Nat] {
    let array_mutable = Array.thaw<Nat>(array);
    if (counter > 0) {
      array_mutable[counter-1] += counter-1;
      return index_add((Array.freeze(array_mutable),counter-1));
    }
    else {
      return (Array.freeze(array_mutable));
    };
  };
  
  public func increase_by_index(array: [Nat]) : async [Nat] {
    return index_add(array,array.size());
  };

  // Challenge 10 *
  let f = func<A>(tuple: A, value: A) : Bool {
        if (tuple == value or tuple == value) {
            return true;
        }
        else {
          return false;
        };
    };

  private func contains<A>(array: [A], a: A, f: (A,A) -> Bool) : Bool {
    for (value in array.vals()) {
      if (f(a,value)) {
          return true;
      };
    };
    return false;
  };
};
