import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewedly/presentations/components/default_button.dart';
import 'package:lewedly/presentations/components/text_form_field.dart';
import 'package:lewedly/presentations/constants/constants.dart';

class AjouterSignalement extends StatefulWidget {
  const AjouterSignalement({Key? key}) : super(key: key);

  @override
  State<AjouterSignalement> createState() => _AjouterSignalementState();
}

class _AjouterSignalementState extends State<AjouterSignalement> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController localizationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  bool submit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: (80),
        automaticallyImplyLeading: false,
        backgroundColor: whitecolor,
        title: Padding(
          padding: const EdgeInsets.only(top: (20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: primarycolor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Text(
                "Ajouter un signalement",
                style: textstyle.copyWith(
                    fontSize: (18),
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
              spaceLarge(30)
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kgrey50,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceLong(20),
                      Text(
                        "Nom complet",
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
                        "Age",
                        style: textstyle.copyWith(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                      spaceLong(5),
                      TextFormInput(
                        controller: ageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Age obligatoire';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                      spaceLong(18),
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
                        "Localization",
                        style: textstyle.copyWith(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                      spaceLong(5),
                      TextFormInput(
                        controller: localizationController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'localization obligatoire';
                          } else {
                            return null;
                          }
                        },
                      ),
                      spaceLong(18),
                      Text(
                        "Upload une image",
                        style: textstyle.copyWith(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                      spaceLong(5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: plightcolor.withOpacity(0.2)),
                            color: plightcolor.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Whatsapp",
                              style: textstyle.copyWith(
                                  fontSize: (14),
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            ),
                            FaIcon(
                              FontAwesomeIcons.upload,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      spaceLong(18),
                      Text(
                        "decription",
                        style: textstyle.copyWith(
                            fontSize: (14),
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                      spaceLong(5),
                      TextFormInput(
                        controller: descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'description obligatoire';
                          } else {
                            return null;
                          }
                        },
                        minLines: 5,
                        maxLines: 5,
                      ),
                      spaceLong(30),
                      DefaultButton(
                        onTap: () {},
                        width: double.infinity,
                        height: 45,
                        text: 'Ajouter',
                        textcolor: whitecolor,
                        color: primarycolor,
                      ),
                      spaceLong(30),
                    ],
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
