module {
  public type Animal = {
  species : Text;
  energy : Nat;
  };
  
  // Challenge 4
  public func create_animal_then_takes_a_break(species: Text, energy: Nat) : Animal {
    let newAnimal: Animal = (species, energy);
    return newAnimal;
  };
}
