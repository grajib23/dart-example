//  dart --enable-asserts  built_in_types.dart

/*
  The Dart language has special support for the following types:

  numbers
  strings
  booleans
  lists (also known as arrays)
  sets
  maps
  runes (for expressing Unicode characters in a string)
  symbols
*/
// Both int and double are subtypes of num. If a number includes a decimal, it is a double.
void main() {
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // The int type specifies the traditional bitwise shift (<<, >>), AND (&), and OR (|) operators.
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111


  // A Dart string is a sequence of UTF-16 code units. You can use either single or double quotes to create a string:

  var s1 = 'This is random string';
  var s2 = 'this is random string';
  var s3 = 'it\'s random string';
  print(s1);
  print(s2);
  print(s3);

  // Another way to create a multi-line string: use a triple quote with either single or double quotation marks
  var s4 = '''
    You can create
    multi-line strings like this one.
    ''';

  var s5 = """This is also a
    multi-line string.""";
  print(s4);
  print(s5);

  // You can create a “raw” string by prefixing it with r:
  var s6 = r'In a raw string, not even \n gets special treatment.';
  print(s6);

  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList'
  print(validConstString);
  
  // const inValidString = '$aNum $aBool $aString';

  /*
    To represent boolean values, Dart has a type named bool. Only two objects have type bool:
     the boolean literals true and false, which are both compile-time constants.
  */

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero
  var  hitPoints = 0;
  assert(hitPoints <= 0 );

  // check for null

  var unicorn;
  assert(unicorn == null);

  // check for NaN
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  /*
    Perhaps the most common collection in nearly every programming language is the array, or ordered group of objects.
    In Dart, arrays are List objects, so most people just call them lists.
  */
  var list = [1, 2, 3];
  print(list);

  /*
    Note: Dart infers that list has type List<int>. If you try to add non-integer objects to this list,
     the analyzer or runtime raises an error.Lists use zero-based indexing, where 0 is the index of the first element and list.length - 1 is the index of the last element. 
  */
  var list1 = [1, 2, 3];
  assert(list1.length == 3);
  assert(list1[1] == 2);
  list1[1] = 1;
  assert(list1[1] == 1);

  // To create a list that’s a compile-time constant, add const before the list literal
  var constList = const [1, 2, 3];
  // constList.add(5);
  print(constList);

  // you can use the spread operator (...) to insert all the elements of a list into another list:
  var list3 = [1, 2, 3];
  var list4 = [0, ...list3];
  print(list4);

  // If the expression to the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator (...?):
  var list5;
  var list6 = [0, ...?list5];
  assert(list6.length == 1);

  // Here’s an example of using collection if to create a list with three or four items in it:
  const promoActive = false;
  var nav = [
    'Home',
    'Account',
    if(promoActive) 'Promo'
  ];
  print(nav);

  // ere’s an example of using collection for to manipulate the items of a list before adding them to another list:
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for( var i in listOfInts) '#$i'
  ];
  print(listOfStrings);

  // A set in Dart is an unordered collection of unique items. Dart support for sets is provided by set literals and the Set type.
  var set1 = { 'red', 'green', 'white', 'blue' };
  print(set1);

  // To create an empty set, use {} preceded by a type argument, or assign {} to a variable of type Set:
  var set2 = <String> {};
  Set<String> set3 = {};
  var notSet = {}; // create a map, not set

  // To create a set that’s a compile-time constant, add const before the set literal:
  final constantSet = const {
    'test-1',
    'tedst-2',
    'test-3'
  };
  // constantSet.add('value'); // Uncommenting this causes an error

  /* 
    In general, a map is an object that associates keys and values. Both keys and values can be any type of object.
    Each key occurs only once, but you can use the same value multiple times. Dart support for maps is provided by map literals and the Map type.
  */
  var gifts1 = {
    'first': 'green',
    'second': 'red'
  };
  print(gifts1);
  var numberKeyMap = {
    2: 'red',
    '10': 'green'
  };
  print(numberKeyMap);

  /*
   Note: Dart infers that gifts has the type Map<String, String> and nobleGases has the type Map<int, String>.
    If you try to add the wrong type of value to either map, the analyzer or runtime raises an error. For more information,
  */
  var gifts = Map();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases = Map();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // To create a map that’s a compile-time constant, add const before the map literal:
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // constantMap[2] = 'Helium'; // Uncommenting this causes an error.

  // TODO: Runes and grapheme clusters

  // TODO: Symbols
}