import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'services/auth.dart';
import 'shared/prefs_data_control.dart';
import 'screens/home.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    var user = await logIn(data.name, data.password);
    if (user != null && user.id != null) {
      await addIdToSF(user.id!);
    }
    return Future.delayed(loginTime).then((_) {
      if (user == null || user.id == null) {
        return 'User not exists or password is not correct';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) async {
    var signed = await signUp(data.name!, data.password!);
    if (signed != null && signed.id != null) {
      await addIdToSF(signed.id!);
    }
    return Future.delayed(loginTime).then((_) {
      if (signed != null) {
        return null;
      }
      return 'User with that username already exist';
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  static String? nullValidator(value) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
        userValidator: nullValidator,
        onLogin: _authUser,
        hideForgotPasswordButton: true,
        onSignup: _signupUser,
        userType: LoginUserType.name,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        },
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(
          primaryColor: const Color.fromARGB(255, 210, 177, 236),
          accentColor: Colors.yellow,
          errorColor: Colors.deepOrange,
          titleStyle: const TextStyle(
            color: Colors.greenAccent,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
          bodyStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          textFieldStyle: const TextStyle(
            color: Colors.orange,
            shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
          ),
          buttonStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.yellow,
          ),
          cardTheme: CardTheme(
            color: const Color.fromARGB(255, 253, 245, 253),
            elevation: 5,
            margin: const EdgeInsets.only(top: 15),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
          ),
          inputTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.purple.withOpacity(.1),
            contentPadding: EdgeInsets.zero,
            errorStyle: const TextStyle(
              backgroundColor: Colors.orange,
              color: Colors.white,
            ),
            labelStyle: const TextStyle(fontSize: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
              borderRadius: inputBorder,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
              borderRadius: inputBorder,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade700, width: 7),
              borderRadius: inputBorder,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 8),
              borderRadius: inputBorder,
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 5),
              borderRadius: inputBorder,
            ),
          ),
          buttonTheme: LoginButtonTheme(
            splashColor: Colors.purple,
            backgroundColor: Colors.pinkAccent,
            highlightColor: Colors.lightGreen,
            elevation: 9.0,
            highlightElevation: 6.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // shape: CircleBorder(side: BorderSide(color: Colors.green)),
            // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
          ),
        ));
  }
}
