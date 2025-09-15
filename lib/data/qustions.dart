import 'package:quis_app/models/question_model.dart';

const questions = [
  QuestionModel('What Are the main building blocks of Flutter UIs?', [
    'widgets',
    'Components',
    'Blocks',
    'Functions',
  ]),

  QuestionModel('Which programming language is used to build Flutter apps?', [
    'Dart',
    'Java',
    'Kotlin',
    'JavaScript',
  ]),
  QuestionModel('How are Flutter UIs built?', [
    'By combining widgets in a widget tree',
    'By writing HTML and CSS',
    'By using XML layouts',
    'By editing JSON files',
  ]),
  QuestionModel('Which widget is commonly used for layout in Flutter?', [
    'Column and Row',
    'Div and Span',
    'Section and Article',
    'Box and Frame',
  ]),
  QuestionModel('What command is used to create a new Flutter project?', [
    'flutter create project_name',
    'flutter new project_name',
    'flutter init project_name',
    'flutter start project_name',
  ]),
];
