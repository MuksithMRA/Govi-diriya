import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Models/user.dart';
import 'package:govidiriya/Models/user_data.dart';
import 'package:govidiriya/Service/auth.dart';
import 'package:govidiriya/providers/personal_details.dart';
import 'package:govidiriya/providers/signup_visibility.dart';
import 'package:govidiriya/providers/time_date.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'homepage_providers.dart';
import 'login_backend.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<MediaResponsive>(
    create: (context) => MediaResponsive(),
  ),
  ChangeNotifierProvider<HomePageProviders>(
    create: (context) => HomePageProviders(),
  ),
  ChangeNotifierProvider<SignupVisibility>(
    create: (context) => SignupVisibility(),
  ),
  ChangeNotifierProvider<NewDateTime>(
    create: (context) => NewDateTime(),
  ),
  ChangeNotifierProvider<LoginBackend>(
    create: (context) => LoginBackend(),
  ),
  ChangeNotifierProvider<ShowPesonalDetails>(
    create: (context) => ShowPesonalDetails(),
  ),
  ChangeNotifierProvider<UserData>(
    create: (context) => UserData(),
  ),
  StreamProvider<AppUser?>.value(
    value: AuthService().user,
    initialData: null,
  ),
];
