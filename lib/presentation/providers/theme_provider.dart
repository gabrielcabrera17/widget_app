//Estado => Para manejar un booleano
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarModeProvider = StateProvider((ref) => false);

//Lista de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//un simple int

final selectedColorProvider = StateProvider((ref) => 0,);