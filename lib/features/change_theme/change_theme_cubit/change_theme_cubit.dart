import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helper/sheared_preference.dart';
import 'package:news_app/features/change_theme/change_theme_cubit/change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  static ChangeThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = CacheHelper.getData(key: "isDark") ?? false ;

  changeTheme(){
    isDark =!isDark;
    CacheHelper.saveData(key: "isDark", value: isDark);

    emit(ChangeThemeSuccessState());
  }
}
