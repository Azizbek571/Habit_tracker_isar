
import 'package:flutter/material.dart';
import 'package:habit_tracker_isar/database/habit_database.dart';
import 'package:habit_tracker_isar/pages/home_page.dart';
import 'package:habit_tracker_isar/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main ()async{  
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();
  


  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> HabitDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
  child: MyApp(), 
  
  )
  
  );
}

  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme:  Provider.of<ThemeProvider>(context).themeData
    // lightMode,
    
    );
  }
}