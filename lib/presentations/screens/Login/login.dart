import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lewedly/busuness_logic/cubit/auth_cubit.dart';
import 'package:lewedly/presentations/components/default_button.dart';
import 'package:lewedly/presentations/components/text_form_field.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController telephonecontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kgrey50,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceLong(100),
                Center(
                  child: Text(
                    "LEWEDLY",
                    style: textstyle.copyWith(
                        fontSize: (56),
                        fontWeight: FontWeight.w800,
                        color: pdarkcolor),
                  ),
                ),
                spaceLong(100),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: plightcolor.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular((16)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spaceLong(15),
                        Center(
                          child: Text(
                            "Connexion",
                            style: textstyle.copyWith(
                                fontSize: (22),
                                fontWeight: FontWeight.w700,
                                color: pdarkcolor),
                          ),
                        ),
                        spaceLong(40),
                        Text(
                          "Numero du telephone",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: telephonecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Numero obligatoire';
                            } else {
                              return null;
                            }
                          },
                          maxLength: 8,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                        ),
                        spaceLong(7),
                        Text(
                          "Mot de passe",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: codecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Mot de passe obligatoire';
                            } else {
                              return null;
                            }
                          },
                          // maxLength: 8,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(
                          //       RegExp('[0-9]')),

                          // ],
                          keyboardType: TextInputType.number,
                          obsecure: true,
                        ),
                        spaceLong(30),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthLoded) {
                              Navigator.pushNamed(context, home);
                            }
                            if (state is Autherror) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red,
                                content: Text("Identifiants de connexion invalides!"),
                                duration:
                                    Duration(seconds: 4),
                                     // Durée d'affichage
                                // action: SnackBarAction(
                                //   label: "Fermer",
                                //   onPressed: () {
                                //     // Action lorsqu'on appuie sur "Fermer"
                                //     ScaffoldMessenger.of(context)
                                //         .hideCurrentSnackBar();
                                //   },
                                // ),
                              ));
                            }
                          },
                          builder: (context, state) {
                            return state is AuthLoding
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: primarycolor,
                                  ))
                                : DefaultButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .login(telephonecontroller.text,
                                                codecontroller.text, context);
                                      }
                                    },
                                    width: double.infinity,
                                    height: 45,
                                    text: 'Connexion',
                                    textcolor: whitecolor,
                                    color: primarycolor,
                                  );
                          },
                        ),
                        spaceLong(20),
                        DefaultButton(
                          onTap: () {
                            Navigator.pushNamed(context, registre);
                          },
                          width: double.infinity,
                          height: 45,
                          text: 'Créer un compte',
                          textcolor: pdarkcolor,
                          hasborder: true,
                          color: whitecolor,
                        ),
                        spaceLong(30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
