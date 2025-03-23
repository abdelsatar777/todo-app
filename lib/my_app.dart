import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/other/UI/screens/about_screen.dart';
import 'core/local/app_db.dart';
import 'core/local/theme_provider.dart';
import 'core/widgets/notification_controller.dart';
import 'features/actions/UI/manager/actions_cubit.dart';
import 'features/actions/UI/screens/add_screen.dart';
import 'features/other/UI/screens/setting_screen.dart';
import 'features/start/UI/manager/home/home_cubit.dart';
import 'features/start/UI/screens/home_screen.dart';
import 'features/start/UI/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String name = 'Awesome Notifications - Example App';
  static const Color mainColor = Colors.deepPurple;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppDB appDB;

  void access() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );

    super.initState();
    appDB = AppDB();
    appDB.createDB();
    access();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(appDB: appDB)..getTasks()),
        BlocProvider(create: (context) => ActionsCubit(appDB: appDB)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "home_screen": (context) => HomeScreen(),
          "add_screen": (context) => AddScreen(),
          "setting_screen": (context) => SettingScreen(),
          "about_screen": (context) => AboutScreen(),
        },
        theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: SplashScreen(),
      ),
    );
  }
}
