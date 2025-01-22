import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lewedly/busuness_logic/cubit/registre_cubit.dart';
import 'package:lewedly/presentations/components/default_button.dart';
import 'package:lewedly/presentations/components/text_form_field.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/strings.dart';

class Registre extends StatefulWidget {
  const Registre({Key? key}) : super(key: key);

  @override
  State<Registre> createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController confirmeCodeController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  bool submit = true;
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
                spaceLong(50),
                Center(
                  child: Text(
                    "LEWEDLY",
                    style: textstyle.copyWith(
                        fontSize: (50),
                        fontWeight: FontWeight.w800,
                        color: pdarkcolor),
                  ),
                ),
                spaceLong(50),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                }),
                            Text(
                              "Creation du compte",
                              style: textstyle.copyWith(
                                  fontSize: (22),
                                  fontWeight: FontWeight.w700,
                                  color: pdarkcolor),
                            ),
                            spaceLarge(25),
                          ],
                        ),
                        spaceLong(40),
                        Text(
                          "Nom",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: nomController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'nom obligatoire';
                            } else {
                              return null;
                            }
                          },
                        ),
                        spaceLong(18),
                        Text(
                          "Prenom",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: prenomController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prenom obligatoire';
                            } else {
                              return null;
                            }
                          },
                          // maxLength: 10,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          // ],
                          keyboardType: TextInputType.text,
                        ),
                        Text(
                          "Numero de telephone",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: telephoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'telephone obligatoire';
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
                        Text(
                          "Mot de passe",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: codeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Mot de passe obligatoire';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          obsecure: true,
                        ),
                        spaceLong(18),
                        Text(
                          "Confirmer le mot de passe",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        spaceLong(5),
                        TextFormInput(
                          controller: confirmeCodeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Mot de passe obligatoire';
                            } else if (codeController.text !=
                                confirmeCodeController.text) {
                              return 'les Mots de passe ne sont pas egaux';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          obsecure: true,
                        ),
                        spaceLong(30),
                        BlocConsumer<RegistreCubit, RegistreState>(
                          listener: (context, state) {
                            if (state is RegistreLoded) {
                              Navigator.pushNamed(context, loginPage);
                            }
                          },
                          builder: (context, state) {
                            return state is RegistreLoding
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: primarycolor,
                                  ))
                                : DefaultButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<RegistreCubit>(context)
                                            .registre(
                                                nomController.text,
                                                prenomController.text,
                                                 telephoneController.text,
                                                codeController.text,
                                                context);
                                      }
                                    },
                                    width: double.infinity,
                                    height: 45,
                                    text: 'Creation',
                                    textcolor: whitecolor,
                                    color: primarycolor,
                                  );
                          },
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
