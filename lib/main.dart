import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';
import 'package:simple_tic_tac_toe/services/export_services.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'package:simple_tic_tac_toe/view/export_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set Orientation Just Potrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<BoardCubit>(create: (_) => BoardCubit()),
        BlocProvider<PlayerCubit>(create: (_) => PlayerCubit()),
      ],
      child: Sizer(
        builder: (_, __, ___) => FutureBuilder<SharedPreferences>(
          future: SharedPreferencesService.prefs,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return MaterialApp(
                title: VariableConst.appName,
                debugShowCheckedModeBanner: false,
                theme: ThemeConfig.lightTheme(context),
                home: const HomePage(),
              );
            }
            bool value =
                snapshot.data!.getBool(VariableConst.keyTheme) ?? false;

            // Update State
            ThemeCubitHandle.watch(context).setTheme(value);

            return MaterialApp(
              title: VariableConst.appName,
              debugShowCheckedModeBanner: false,
              theme: (value)
                  ? ThemeConfig.darkTheme(context)
                  : ThemeConfig.lightTheme(context),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
