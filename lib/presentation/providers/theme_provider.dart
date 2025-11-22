//Estado => Para manejar un booleano
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarModeProvider = StateProvider((ref) => false);

//Lista de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//un simple int
final selectedColorProvider = StateProvider((ref) => 0,);

// Un objeto de tipo AppTheme
//aquí tenemos StateNotifierProvider<null,object?> donde le primero (null) es el nombre de la clase que controlará el estado y el segundo es el estado en si
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


//Controlar el theme
class ThemeNotifier extends StateNotifier<AppTheme>{
  //En el constructor creamos el primer appTheme con sus valores por defectos, una instancia de la clase
  //State = Estado = new AppTheme();
  ThemeNotifier():super(AppTheme());

  void toogleDarkMode(){
    state = state.copyWith( isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex );
  }
  

}