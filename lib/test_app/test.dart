List<String> fruits = [ 'apple', 'banana', 'grape'];


void hasFruit(){
  if(fruits.contains('grape')){
    print('has grape');
  }else if(fruits.remove('banana')){
    print('delete banana');
  }
}

bool hasLongFruits = fruits.any((fruit) => fruit.length > 6);

bool allFruitsStartWithA = fruits.every((fruits) => fruits.startsWith('A'));

List<String> newFruits = fruits.toList();

Iterable<String> longFruits = fruits.where((fruit) => fruit.length > 5);

String firstLongFruit = fruits.firstWhere((fruits) => fruits.length > 6, orElse: () => 'no Long Fruit');

int index = fruits.indexWhere((fruits) => fruits == 'banana');

List<int> length = fruits.map((fruits) => fruits.length).toList();

bool hasCitrus = fruits.any((fruit) => fruit.startsWith('o'));