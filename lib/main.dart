
import 'package:dharmesh_widget_component/utils/export.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_widgets/custom_transfprm_page_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setPreferredOrientations();
  runApp(const MyApp());
}

Future<void> _setPreferredOrientations() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {

  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus!.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(393, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          getPages: AppPages.routes,
          showSemanticsDebugger: false,
          initialRoute: AppPages.INITIAL,
          scrollBehavior: AppScrollBehavior(),
          debugShowCheckedModeBanner: false,
          transitionDuration: Durations.short4,
          defaultTransition: Transition.downToUp,
          locale: const Locale('en_US'),
          fallbackLocale: const Locale('en_US'),
          theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
                scrolledUnderElevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.primary,
              ),
              elevatedButtonTheme: elevatedBtnTheme,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary)),
        ),
      ),
    );
  }

  ElevatedButtonThemeData get elevatedBtnTheme => ElevatedButtonThemeData(
    style: ButtonStyle(
      iconSize: const WidgetStatePropertyAll(24),
      fixedSize: WidgetStatePropertyAll(Size(context.width, 56)),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade200;
        }
        return AppColors.primary;
      }),
      iconColor: WidgetStateProperty.resolveWith((states) {
        return Colors.white;
      }),
      shadowColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        return AppColors.primary;
      }),
      elevation: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return 0;
        }
        return 5;
      }),
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return GoogleFonts.poppins().copyWith(
            fontSize: 16.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          );
        }
        return GoogleFonts.poppins().copyWith(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
      }),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    ),
  );
}
