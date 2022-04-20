import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tic_tac_toe/cubit/export_cubit.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({
    Key? key,
    required this.light,
    required this.dark,
  }) : super(key: key);
  final Widget light, dark;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      selector: (state) => state.isDark,
      builder: (context, isDark) => (isDark) ? dark : light,
    );
  }
}
