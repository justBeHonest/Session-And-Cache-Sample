import 'package:flutter/material.dart';
import 'package:strapi_first_try/login/login_view_model.dart';

class LoginView extends LoginViewModel {
  final EdgeInsets paddingLow = const EdgeInsets.all(8.0);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final String emailText = 'Email';
  final String passwordText = 'Password';
  final String buttonText = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: paddingLow,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      alignment: WrapAlignment.end,
      runSpacing: 10,
      children: [
        TextFormField(
          controller: controllerEmail,
          decoration: InputDecoration(
            labelText: emailText,
            border: const OutlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: controllerPassword,
          decoration: InputDecoration(
            labelText: passwordText,
            border: const OutlineInputBorder(),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchUserLogin(
                controllerEmail.text,
                controllerPassword.text,
              );
            }
          },
          child: const Icon(Icons.check),
        ),
      ],
    );
  }
}
