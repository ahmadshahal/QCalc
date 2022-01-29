import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState(answer: "0.0", expression: ""));

  final List<String> signs = ['+', '-', '%', '*', '/', '.'];

  String evaluate(String exp) {
    String newExp = "";
    for(int i = 0; i < exp.length; i++) {
      if(exp[i] == '×') {
        newExp += '*';
      }
      else if(exp[i] == '÷') {
        newExp += '/';
      }
      else {
        newExp += exp[i];
      }
    }
    return newExp;
  }

  String reEvaluate(String exp) {
    String newExp = "";
    for(int i = 0; i < exp.length; i++) {
      if(exp[i] == '*') {
        newExp += '×';
      }
      else if(exp[i] == '/') {
        newExp += '÷';
      }
      else {
        newExp += exp[i];
      }
    }
    return newExp;
  }

  void addChar(String char) {
    char = evaluate(char);
    state.expression = evaluate(state.expression);
    if(state.expression.isEmpty && signs.contains(char)) return;
    if (state.expression.isNotEmpty &&
        signs.contains(state.expression[state.expression.length - 1]) &&
        signs.contains(char)) return;
    state.expression += char;
    try {
      Expression exp = Parser().parse(state.expression);
      String answer =
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      emit(CalculatorState(answer: answer, expression: reEvaluate(state.expression)));
    } on Error {
      emit(CalculatorState(answer: state.answer, expression: reEvaluate(state.expression)));
    }
  }

  void equalPressed() {
    try {
      state.expression = evaluate(state.expression);
      Expression exp = Parser().parse(state.expression);
      String answer =
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      emit(CalculatorState(answer: answer, expression: state.answer));
    } on Error {
      emit(CalculatorState(answer: state.answer, expression: reEvaluate(state.expression)));
    }
  }

  void clearPressed() {
    emit(CalculatorState(answer: "0.0", expression: ""));
  }

  void backPressed() {
    try {
      state.expression = evaluate(state.expression);
      if (state.expression.length == 1) {
        emit(CalculatorState(answer: "0.0", expression: ""));
        return;
      } else if (state.expression.isNotEmpty) {
        state.expression = state.expression.substring(0, state.expression.length - 1);
      }
      Expression exp = Parser().parse(state.expression);
      String answer =
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      emit(CalculatorState(answer: answer, expression: reEvaluate(state.expression)));
    } on Error {
      emit(CalculatorState(answer: state.answer, expression: reEvaluate(state.expression)));
    }
  }
}
