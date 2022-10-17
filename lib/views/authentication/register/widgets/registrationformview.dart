import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/email_checker.dart';
import '../../../../providers/ap.dart';

class Registrationform extends StatefulWidget {
  const Registrationform({Key? key}) : super(key: key);

  @override
  RegistrationformState createState() => RegistrationformState();
}

class RegistrationformState extends State<Registrationform> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: ref.watch(usernameControllerProvider),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Enter Username"),
                validator: ((value) {
                  if (value!.isEmpty || RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                    return "Enter correct username";
                  } else {
                    return null;
                  }
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
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
