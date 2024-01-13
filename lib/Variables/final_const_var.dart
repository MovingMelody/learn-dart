// ignore_for_file:  sort_constructors_first
// ignore_for_file: dangling_library_doc_comments, prefer_const_declarations, omit_local_variable_types, prefer_typing_uninitialized_variables, inference_failure_on_uninitialized_variable, public_member_api_docs, avoid_dynamic_calls

/*
* Created on 13 August 2023
* 
* @author Sai Sumanth
*/

///
/// final vs const vs var
///
/// These 3 keywords will be used to for variable declarations, each with
/// different behaviours and usecases
///
void main(List<String> args) {
  ///
  /// method getTotal with return type int
  ///
  int getTotal() {
    return 4;
  }

  ///
  /// FINAL: 💡 Variables declared as final can only be assigned once and this happens at runtime.
  ///
  /// 💡 Once assigned a value, that value cannot be changed.
  ///
  /// 💡 late keyword can be used along with final 💡
  ///
  print('******* 🏹 FINAL 🏹 ********');

  /// no need to specify the type explicitly for [finalSum] as we are assigning value at the time of declaration itself
  final finalSum = 30 + 7.9;
  print(finalSum); // 37

  final int finalValue;
  // print(finalValue); // Error - can't be read before initialization
  finalValue = 30;
  // finalValue = 34; // Error - final variable can only be set once
  print(finalValue); // 30
  print(finalValue.runtimeType); // int

  final int total = getTotal();
  print(total);

  ///
  /// final Strings
  ///
  final String name = 'bmw 🏎️';
  print(name); // bmw 🏎️

  final String name2;
  name2 = 'bmw';
  print(name2);

  final String? nullableString;
  // print(nullableString); // Error: Final variable 'nullableString' must be assigned before it can be used.
  nullableString = 'not-null-now 😎';
  print(nullableString); // not-null-now 😎

  String? personCanBeNull;
  print(personCanBeNull); // null

  ///
  /// 💡 late and final combination 💡
  ///
  late final int lateFinal;
  // print(lateFinal);  // 🚨 Error : The late local variable 'lateFinal' is definitely unassigned at this point.
  lateFinal = 78;
  // lateFinal = 90; // 🚨 Error : The late final local variable is already assigned.
  // Try removing the 'final' modifier, or don't reassign the value.

  print(lateFinal); // 78

  late int scoree;
  scoree = 88;
  scoree = 899; // can be assigned multiple time because of non-final
  scoree = 900;
  print(scoree); // 900

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  /// CONST: defines a constant
  /// 💡 const variables are compile-time constants.
  /// This means that the value of a const variable is known at compile time, not runtime.
  ///
  /// They are implicitly static, meaning they belong to the class itself, not to instances of the class.
  /// The value of a const variable is calculated at compile time and shared across all instances.
  ///
  /// check [ConstClass] to understand above two lines
  ///
  print('******* 💪 CONST 💪 ********');
  const pi = 3.14;
  print('pi value is : $pi');

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  /// VAR: var variables are the most flexible type of variable in Dart
  /// They can be changed at any time, and their type is inferred from the value that is assigned to them.
  ///
  /// The 'type' of a var variable can't be changed within the program once it is initialized at declaration.
  ///
  /// 💡 late keyword CAN be used along with var 👍
  ///
  /// 💡 final keyword can't be used with var 🙅
  ///
  print('******* 🧠 VAR 🧠 ********');

  // type of score is infered as int. since we are assinging the value during declaration
  var score = 99;
  score = 98;
  score = 100;

  // A value of type 'String' can't be assigned to a variable of type 'int'.
  // score = 'hundred'; not allowed. 🚨 Error
  print('var variable score value : $score'); // 100

  /// declaring a variable of type var (observe carefully no value assigned here)
  var maxFlexibleVar;
  print(
      'maxFlexibleVar runtimeType : ${maxFlexibleVar.runtimeType}'); // Null (with capital N - Null)
  print('maxFlexibleVar value : $maxFlexibleVar'); // null (with small n - null)

  maxFlexibleVar = 34; // initializing to int

  /// reassigning bool value (🚨 reassining of different type is possible here 🥲 because value isn't assigned to maxFlexibleVar at the time of declaration)
  maxFlexibleVar = bool;
  maxFlexibleVar = 'can be string also'; // reassinging to string value

  ///
  /// 💡 late and var combination
  ///
  late var lateAndVarUnassigned;
  // 🚨 Error The late local variable 'lateAndVarUnassigned' is definitely unassigned at this point.
  // print(lateAndVarUnassigned);
  lateAndVarUnassigned = 'late & final assigned now';
  print(lateAndVarUnassigned); // 'late & final assigned now'

  ///
  /// behaviour of final, const, var inside the classes
  ///
  classesMain();
}

/// ------------------------------ Final & Const with CLASSES -----------------------
///
/// final variables inside class
///
/// Marking a class itself as final means that the class cannot be subclassed or extended by other classes.
///
final class FinalClass {
  final String name;
  // ignore: avoid_field_initializers_in_const_classes
  final String cantBeChanged =
      'assigned during declaration & Cannot be changed later even while creating object';

  ///
  /// default const constructor
  /// creation of const constructor is possible because all the class fields or members are marked as final
  ///
  /// And const constructor can't have body {}. They should end with ; semicolon
  ///
  const FinalClass({required this.name});

  // 'cantBeChanged' is final and was given a value when it was declared, so it can't be set to a new value.
  // const FinalClass(this.name, this.cantBeChanged);

  /// getter
  String get emoji => 'cool 😎';
}

///
/// class ConstClass
///
/// If all the fields are marked as const in a class then during
/// instance or object creating no need to pass any value. because const values can be set only once
///
final class ConstClass {
  ///
  /// If we want to use a const variable inside a class we need to make it as static as well
  ///
  /// And the below value [pi] CAN'T 🙅 be accessed using instance of this class
  /// They can only be access directly [ConstClass.pi] without creating any instance. Because they are compile time constants
  ///
  /// Static Fields are independect of any instance and they are properties of class itself
  ///
  static const pi = 3.14;
  // const pi2 = 3.14; /// Not possible : Error 🚨 Only static fields can be declared as const
  static const weight = 60;
  const ConstClass();
}

///
/// class [VarClass]
///
final class VarClass {
  String name;

  /// You have to be very careful when fields are marked as var. If not initialized then they will be null by default
  var place;
  var maxAge;

  /// here const constructor is not possible because fields are not final
  ///
  /// only required param is [name] not [maxAge] because it's marked as var
  ///
  VarClass({required this.name}) {
    print('VarClass default constructor called');
    // this.maxAge = 100; // Valid Statement 👍
    maxAge = 100;
    name = 'Mr.$name';
    name = 'Dr.$name';

    /// name can be set any number of time because it's not final
  }

  VarClass.withDifferentAgeType({required this.place, required this.name});
}

///
/// final variables `declared` inside class can be intialized using constructor
/// but not const variables because value is already assigned (same applies for static fields - Static fields can't be intialized inside a constructor)
///

void classesMain() {
  print('******* Classes related Output ********');

  ///
  /// class with final variables
  ///
  const finalClassObj = FinalClass(name: 'Vikram');
  const finalClassObj2 = FinalClass(name: 'Vikram');
  print(identical(finalClassObj, finalClassObj2)); // true
  print(
      'comparing two FinalClass const constructors : ${finalClassObj == finalClassObj2}'); // true (because of const constructors)
  print(finalClassObj.emoji); // gettter - prints cool 😎
  print(finalClassObj.name); // Vikram

  ///
  /// class with const variables
  ///
  const constClassObj = ConstClass();

  /// creating instance
  print(constClassObj);
  print('Pi constant value inside ConstClass : ${ConstClass.pi}');
  print('Pi constant value inside ConstClass : ${ConstClass.weight}');

  ///
  /// class with var Variable
  ///
  final varClassObj = VarClass(name: 'only Username');
  print(varClassObj.name);
  print(varClassObj.place); // null
  // print(varClassObj.place / 10); // Runtime Error ⚠️ Exception NoSuchMethodError: The method '/' was called on null.
  print(varClassObj.maxAge); // 100
  print(varClassObj.maxAge /
      10); // 10.0 - Since are already initialized maxAge to 100 in default construtor no run time errors will happen here

  final varClassObjWithNamed =
      VarClass.withDifferentAgeType(place: 'Bengaluru', name: 'Jeet');
  print(varClassObjWithNamed.maxAge); // null
  print(varClassObjWithNamed.name); // Jeet
  print(varClassObjWithNamed.place); // Bengaluru
}

// class DifferentTypesOfVariableDeclarations {
//   final String name;
//   static const type = 'male';
//   final int age = 23;
//   var purpose;
//   DifferentTypesOfVariableDeclarations({required this.name});
// }
