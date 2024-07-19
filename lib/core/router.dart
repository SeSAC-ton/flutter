import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/data/data_source/member_data_source/member_data_source_impl.dart';
import 'package:sesac_ton/data/data_source/worksheet_data_source/worksheet_data_source_impl.dart';
import 'package:sesac_ton/data/repository/member_repository/member_repository_impl.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository_impl.dart';
import 'package:sesac_ton/presentation/home/home_screen.dart';
import 'package:sesac_ton/presentation/login/login_screen.dart';
import 'package:sesac_ton/presentation/login/login_view_model.dart';
import 'package:sesac_ton/presentation/register/register_screen.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_screen.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        final memberDataSource = MemberDataSourceImpl();
        final memberRepository = MemberRepositoryImpl(memberDataSource);

        return ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(memberRepository),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        final memberDataSource = MemberDataSourceImpl();
        final memberRepository = MemberRepositoryImpl(memberDataSource);

        return ChangeNotifierProvider<RegisterViewModel>(
          create: (context) => RegisterViewModel(memberRepository),
          child: const RegisterScreen(),
        );
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/worksheet',
      builder: (context, state) {
        final worksheetDatasource = WorksheetDataSourceImpl();
        final worksheetRepository = WorksheetRepositoryImpl(worksheetDatasource);

        return ChangeNotifierProvider<WorksheetViewModel>(
          create: (context) => WorksheetViewModel(worksheetRepository),
          child: const WorksheetScreen(),
        );
      },
    ),
  ],
);
