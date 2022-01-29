import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycalculator/business_logic/Shared/shared.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeDark());

  void changeTheme() {
    if(state is ThemeLight) {
      Shared.sharedPreferences?.setBool('isDark', true);
      emit(ThemeDark());
    }
    else {
      Shared.sharedPreferences?.setBool('isDark', false);
      emit(ThemeLight());
    }
  }

  void initTheme(bool isDark) {
    if(isDark) {
      emit(ThemeDark());
    }
    else {
      emit(ThemeLight());
    }
  }
}

