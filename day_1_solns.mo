import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
  public func say_hello(name : Text) : async Text {
    return "Hello, " # name # "!";
  };  

  // << Challenge 1 -> sum of n & m >>
  public func add(n: Nat, m: Nat) : async Nat {
    return n + m;
  };

  // << Challenge 2 -> square of n >>
  public func square(n: Nat) : async Nat {
    return n * n;
  };

  // << Challenge 3 -> convert n days to seconds >>
  public func days_to_second(n: Nat) : async Nat {
    return n * 86400; // 1 day = 86400 secs
  };

  // << Challenge 4 -> increment & clear counters >>
  var counter : Nat = 0;
  public func increment_counter(n: Nat) : async Nat {
    counter += n;
    return counter; 
  };
  public func clear_counter() {
    counter := 0; 
  };

  // << Challenge 5 -> if y divides x >>
  public func divide(x: Nat, y: Nat) : async Bool {
    return ((x % y) == 0); 
  };

  // << Challenge 6 -> is n even >>
  public func is_even(n: Nat) : async Bool {
    return ((n % 2) == 0); 
  };

  // << Challenge 7 -> sum of array >>
  public func sum_of_array(array: [Nat]) : async Nat {
    var array_sum : Nat = 0;
    for (value in array.vals()) {
      array_sum += value;
    };
    return array_sum; 
  };

  // << Challenge 8 -> maximum of array >>
  public func maximum(array: [Nat]) : async Nat {
    var array_max : Nat = 0;
    for (value in array.vals()) {
      if (value > array_max) {
        array_max := value;
      } 
    };
    return array_max; 
  };
  
  // << Challenge 9 -> remove n from array >>
  public func remove_from_array(array: [Nat], n: Nat) : async [Nat] {
    return Array.filter(array, func(value: Nat) : Bool { n != value });    
  };

  // << Challenge 10 -> selection sort >>
  public func selection_sort(array: [Nat]) : async [Nat] {
    let array_sorted: [var Nat] = Array.thaw(array);
    var temp: Nat = array_sorted[0];
    var position: Nat = 0;  

    for (i in array.keys()) {
      position := i;
      for (j in Iter.range(position, array.size() - 1)) {
        if (array_sorted[j] < array_sorted[position]) {
          position := j;
        };
      };
      temp := array_sorted[position];
      array_sorted[position] := array_sorted[i];
      array_sorted[i] := temp;
    };
    return Array.freeze(array_sorted);   
  };
};
