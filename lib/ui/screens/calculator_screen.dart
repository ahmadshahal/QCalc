import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/business_logic/bloc/cubits/calculator_cubit/calculator_cubit.dart';
import 'package:mycalculator/business_logic/bloc/cubits/theme_cubit/theme_cubit.dart';
import 'package:mycalculator/ui/components/my_buttons.dart';
import 'package:mycalculator/ui/utils/non_glow_scroll_behavior.dart';
import 'package:url_launcher/url_launcher.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorCubit calculatorCubit = BlocProvider.of<CalculatorCubit>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: _lightDarkButton(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height - 100) / 3.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: _calcText(context),
                  ),
                  const SizedBox(height: 10),
                  _answerText(context),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  _buttonsRow(
                    context,
                    firstButton: MyTextButton(
                      text: 'AC',
                      fontSize: 17,
                      textColor: Theme.of(context).colorScheme.secondary,
                      callBack: () {
                        calculatorCubit.clearPressed();
                      },
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
                    secondButton: MyTextButton(
                      text: '%',
                      textColor: Theme.of(context).colorScheme.secondary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('%');
                      },
                    ),
                    thirdButton: MyTextButton(
                      text: '÷',
                      fontSize: 21,
                      textColor: Theme.of(context).colorScheme.secondary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('÷');
                      },
                    ),
                    fourthButton: MyIconButton(
                      icon: Icons.backspace_outlined,
                      iconColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.backPressed();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buttonsRow(
                    context,
                    firstButton: MyTextButton(
                      text: '7',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('7');
                      },
                    ),
                    secondButton: MyTextButton(
                      text: '8',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('8');
                      },
                    ),
                    thirdButton: MyTextButton(
                      text: '9',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('9');
                      },
                    ),
                    fourthButton: MyIconButton(
                      icon: Icons.clear,
                      iconColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('×');
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buttonsRow(
                    context,
                    firstButton: MyTextButton(
                      text: '4',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('4');
                      },
                    ),
                    secondButton: MyTextButton(
                      text: '5',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('5');
                      },
                    ),
                    thirdButton: MyTextButton(
                      text: '6',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('6');
                      },
                    ),
                    fourthButton: MyIconButton(
                      icon: Icons.remove,
                      iconColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('-');
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buttonsRow(
                    context,
                    firstButton: MyTextButton(
                      text: '1',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('1');
                      },
                    ),
                    secondButton: MyTextButton(
                      text: '2',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('2');
                      },
                    ),
                    thirdButton: MyTextButton(
                      text: '3',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('3');
                      },
                    ),
                    fourthButton: MyIconButton(
                      icon: Icons.add,
                      iconColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('+');
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buttonsRow(
                    context,
                    firstButton: MyIconButton(
                      icon: Icons.favorite_border_rounded,
                      iconColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        launch('https://github.com/ahmadshahal/QCalc').then(
                          (bool launch) {
                            if (!launch) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Check your internet connection.'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                    secondButton: MyTextButton(
                      text: '0',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('0');
                      },
                    ),
                    thirdButton: MyTextButton(
                      text: '.',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.addChar('.');
                      },
                    ),
                    fourthButton: MyTextButton(
                      text: '=',
                      textColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      callBack: () {
                        calculatorCubit.equalPressed();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonsRow(
    BuildContext context, {
    required MyButton firstButton,
    required MyButton secondButton,
    required MyButton thirdButton,
    required MyButton fourthButton,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        firstButton,
        secondButton,
        thirdButton,
        fourthButton,
      ],
    );
  }

  Widget _lightDarkButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ThemeCubit>(context).changeTheme();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    state is ThemeLight
                        ? Icons.light_mode_rounded
                        : Icons.light_mode_outlined,
                    size: 19,
                    color:
                        state is ThemeLight ? Colors.black : Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    state is ThemeDark
                        ? Icons.dark_mode_rounded
                        : Icons.dark_mode_outlined,
                    size: 19,
                    color: state is ThemeDark ? Colors.white : Colors.grey[400],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _answerText(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: NonGlowScrollBehavior(),
          child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  state.answer,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color:
                        Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _calcText(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: NonGlowScrollBehavior(),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  state.expression,
                  style: TextStyle(
                    fontSize: 50,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
