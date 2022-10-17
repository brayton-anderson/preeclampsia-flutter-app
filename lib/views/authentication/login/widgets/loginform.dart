import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/email_checker.dart';
import '../../../../providers/ap.dart';

class Loginform extends StatefulWidget {
  const Loginform({Key? key}) : super(key: key);

  @override
  LoginformState createState() => LoginformState();
}

class LoginformState extends State<Loginform> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: ref.watch(emailControllerProvider),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Enter Email"),
                validator: ((value) {
                  if (value!.isEmpty || EmailChecker.isNotValid(value)) {
                    return "Enter correct email";
                  } else {
                    return null;
                  }
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: ref.watch(controllerProvider),
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(labelText: "Enter Password"),
                validator: ((value) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty || !regex.hasMatch(value)) {
                    return "Enter valid password";
                  } else {
                    return null;
                  }
                }),
              ),
            ],
          ));
    });
  }
}
