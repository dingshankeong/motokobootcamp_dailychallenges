import Cat "custom"; 
import Animal "animal";  
import List "mo:base/List";

actor {
  // Challenge 1 *
  public type Cat = Cat.custom;
  let myCat : Cat = {
    breed = "ragdoll";
    age = 7;
    isMale = true;
  };
  
  public func fun<Cat>() : Text {
    return myCat.breed;
  };
  
  // Challenge 2 *
  public type Animal = Animal.animal;
  let animal : Cat = {
    species = "lion";
    energy = 75;
  };
  
  // Challenge 5 *
  public type List<Animal> = ?(Animal, List<Animal>);
  
  // Challenge 6 *
  public func push_animal<Animal>(animal: Animal, list: List<Animal>) : List<Animal> = ?(animal, list);
  
  public func get_animals() : asyn [Animal] {
    return toVarArray(list);    
  };
};
