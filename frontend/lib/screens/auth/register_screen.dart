import 'package:flutter/material.dart';
import 'package:frontend/widgets/form_wrapper.dart';
import 'package:frontend/widgets/loading_screen_wrapper.dart';
import 'package:frontend/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String path = '/register';

  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _userProvider = Provider.of(context, listen: false);
  }

  void loginPressed() async {
    setState(() {
      _isLoading = true;
    });
    // Do stuff
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadableScreenWrapper(
      isLoading: _isLoading,
      child: AuthFormWrapper(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email...'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 5),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password...'),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 5),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(hintText: 'Confirm password...'),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 64),
            RoundedButton(text: 'SignUp', onPressed: () => loginPressed())
          ],
        ),
      ),
    );
  }
}
