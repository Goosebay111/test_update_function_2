import 'package:test_update_function_2/enum_values.dart';

abstract class Modifier {
  ClassVariables get key;
  Function get value;
}

class ModifyAge implements Modifier {
  
  @override
  ClassVariables get key => ClassVariables.age;

  @override
  Function get value => calculateAge;
}

class ModifyBlank implements Modifier {
  
  @override
  ClassVariables get key => ClassVariables.blank;

  @override
  Function get value => () => print('blank');
}

class ModifyName implements Modifier {
  @override
  ClassVariables get key => ClassVariables.name;

  @override
  Function get value => calculateName;
}

class ModifySurname implements Modifier {
  @override
  ClassVariables get key => ClassVariables.surname;

  @override
  Function get value => calculateSurname;
}

int calculateAge() => 100 + 20;

String calculateName() => 'Rocking to the oldies';

String calculateSurname() => 'The oldies';
