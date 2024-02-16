import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late String userName;
  late String email;
  late String password;
  late TextEditingController birthdayController = TextEditingController();
  @override
  void dispose() {
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconButton: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/images/signup.jpg",
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 3),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            // hintText: "email",
            suffixIcon: const Icon(Icons.person),
            onSumbitted: (value) {},
            onChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Field is Required";
              }
              return "Error";
            },
            controller: null,
            obsureText: false,
            label: 'user name',
            onTap: () {},
          ),
          CustomTextFormField(
            // hintText: "password",
            suffixIcon: const Icon(Icons.calendar_today),
            onSumbitted: (value) {
              password = value;
            },
            onChanged: (value) {
              password = value;
            },
            validator: (value) {
              if (birthdayController.text.isEmpty) {
                return "Field is Required";
              }
              return "Error";
            },
            controller: birthdayController,
            obsureText: false,
            label: 'birthday',
            onTap: () {
              pickDate();
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          CustomTextFormField(
            // hintText: "email",
            suffixIcon: const Icon(Icons.email),
            onSumbitted: (value) {
              email = value;
            },
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Field is Required";
              }
              return "Error";
            },
            controller: null,
            obsureText: false,
            label: 'email',
            onTap: () {},
          ),
          CustomTextFormField(
            // hintText: "password",
            suffixIcon: const Icon(Icons.lock),
            onSumbitted: (value) {
              password = value;
            },
            onChanged: (value) {
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Field is Required";
              }
              return null;
            },
            controller: null,
            obsureText: true,
            label: 'password',
            onTap: () {},
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            text: "login",
            onPressed: () {},
            width: 330,
            height: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "have an account? ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                  color: kPrimaryColor),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Text(
                "SignIn",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rubik",
                  color: Colors.blue,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      setState(() {
        birthdayController.text = picker.toString().split(" ")[0];
      });
    } else {
      birthdayController.text = "";
    }
  }
}
