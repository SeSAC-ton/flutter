import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/data/data_source/chat_data_source/chat_data_source_impl.dart';
import 'package:sesac_ton/data/data_source/member_data_source/member_data_source_impl.dart';
import 'package:sesac_ton/data/data_source/profile_data_source/profile_data_source_impl.dart';
import 'package:sesac_ton/data/data_source/worksheet_data_source/worksheet_data_source_impl.dart';
import 'package:sesac_ton/data/repository/chat_repository/chat_repository_impl.dart';
import 'package:sesac_ton/data/repository/member_repository/member_repository_impl.dart';
import 'package:sesac_ton/data/repository/profile_repository/profile_repository_impl.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository_impl.dart';
import 'package:sesac_ton/presentation/achievement/achievement_screen.dart';
import 'package:sesac_ton/presentation/achievement/achievement_view_model.dart';
import 'package:sesac_ton/presentation/chat/chat_screen.dart';
import 'package:sesac_ton/presentation/chat/chat_view_model.dart';
import 'package:sesac_ton/presentation/explain/explain_screen.dart';
import 'package:sesac_ton/presentation/explain/explain_view_model.dart';
import 'package:sesac_ton/presentation/foot_print/foor_print_screen.dart';
import 'package:sesac_ton/presentation/foot_print/foot_print_view_model.dart';
import 'package:sesac_ton/presentation/home/home_screen.dart';
import 'package:sesac_ton/presentation/home/home_view_model.dart';
import 'package:sesac_ton/presentation/login/login_screen.dart';
import 'package:sesac_ton/presentation/login/login_view_model.dart';
import 'package:sesac_ton/presentation/problem/problem_screen.dart';
import 'package:sesac_ton/presentation/problem/problem_view_model.dart';
import 'package:sesac_ton/presentation/profile/profile_screen.dart';
import 'package:sesac_ton/presentation/register/register_screen.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';
import 'package:sesac_ton/presentation/splash/splash_screen.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_screen.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_view_model.dart';

import '../data/data_source/profile_data_source/mock_profile_data_soruce.dart';
import '../data/data_source/worksheet_data_source/mock_worksheet_data_source.dart';
import '../presentation/solved_worksheet/solved_worksheet_view_model.dart';
import '../presentation/solved_worksheet/sovled_worksheet_sreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final memberDataSource = MemberDataSourceImpl();
        final memberRepository = MemberRepositoryImpl(memberDataSource);

        return ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(memberRepository),
          child: const SplashScreen(),
        );
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
        final memberDataSource = MemberDataSourceImpl();
        final memberRepository = MemberRepositoryImpl(memberDataSource);

        return ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(memberRepository),
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/worksheet',
      builder: (context, state) {
        final worksheetDatasource = MockWorksheetDataSource();
        final worksheetRepository =
            WorksheetRepositoryImpl(worksheetDatasource);

        return ChangeNotifierProvider<WorksheetViewModel>(
          create: (context) => WorksheetViewModel(worksheetRepository),
          child: const WorksheetScreen(),
        );
      },
    ),
    GoRoute(
      path: '/explain/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;
        final worksheetDatasource = MockWorksheetDataSource();
        final worksheetRepository =
            WorksheetRepositoryImpl(worksheetDatasource);

        return ChangeNotifierProvider<ExplainViewModel>(
          create: (context) =>
              ExplainViewModel(worksheetRepository, int.parse(id)),
          child: const ExplainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/problem/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;
        final worksheetDatasource = MockWorksheetDataSource();
        final worksheetRepository =
            WorksheetRepositoryImpl(worksheetDatasource);

        return ChangeNotifierProvider<ProblemViewModel>(
          create: (context) =>
              ProblemViewModel(worksheetRepository, int.parse(id)),
          child: const ProblemScreen(),
        );
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final chatDataSource = ChatDataSourceImpl();
        final chatRepository = ChatRepositoryImpl(chatDataSource);

        return ChangeNotifierProvider<ChatViewModel>(
          create: (context) => ChatViewModel(chatRepository),
          child: const ChatScreen(),
        );
      },
    ),
    GoRoute(
      path: '/solved_worksheet',
      builder: (context, state) {
        final profileDataSource = MockProfileDataSoruce();
        final profileRepository = ProfileRepositoryImpl(profileDataSource);

        return ChangeNotifierProvider<SolvedWorksheetViewModel>(
          create: (context) => SolvedWorksheetViewModel(profileRepository),
          child: const SovledWorksheetSreen(),
        );
      },
    ),
    GoRoute(
      path: '/foot_print/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;
        final worksheetDatasource = WorksheetDataSourceImpl();
        final worksheetRepository =
            WorksheetRepositoryImpl(worksheetDatasource);

        return ChangeNotifierProvider<FootPrintViewModel>(
          create: (context) =>
              FootPrintViewModel(worksheetRepository, int.parse(id)),
          child: const FootPrintScreen(),
        );
      },
    ),
    GoRoute(
      path: '/achievement',
      builder: (context, state) {
        final profileDataSource = MockProfileDataSoruce();
        final profileRepository = ProfileRepositoryImpl(profileDataSource);

        return ChangeNotifierProvider<AchievementViewModel>(
          create: (context) => AchievementViewModel(profileRepository),
          child: const AchievementScreen(),
        );
      },
    ),
  ],
);
