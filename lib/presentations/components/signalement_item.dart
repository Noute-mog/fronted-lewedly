import 'package:flutter/material.dart';
import 'package:lewedly/presentations/constants/constants.dart';

Widget signalementItem({
  BuildContext? context,
  String? nom,
  String? telephone,
  String? age,
  String? location,
  String? image,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: plightcolor),
        color: whitecolor,
        borderRadius: BorderRadius.circular((12)),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular((12)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image!,
              height: 120,
            ),
          ),
          spaceLong(10),
          Row(
            children: [
              Text(
                "Nom",
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w400,
                    color: kgrey500),
              ),
              spaceLarge(8),
              Text(
                nom ?? '',
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w600,
                    color: blackcolor),
              ),
            ],
          ),
          spaceLong(6),
          Row(
            children: [
              Text(
                "Age",
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w400,
                    color: kgrey500),
              ),
              spaceLarge(8),
              Text(
                age ?? '',
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w600,
                    color: blackcolor),
              ),
            ],
          ),
          spaceLong(6),
          Row(
            children: [
              Text(
                "Telephone",
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w400,
                    color: kgrey500),
              ),
              spaceLarge(8),
              Text(
                telephone ?? '',
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w600,
                    color: blackcolor),
              ),
            ],
          ),
          spaceLong(6),
          Row(
            children: [
              Text(
                "Localization",
                style: textstyle.copyWith(
                    fontSize: (14),
                    fontWeight: FontWeight.w400,
                    color: kgrey500),
              ),
              spaceLarge(8),
              SizedBox(
                width: 80,
                child: Text(
                  location ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: textstyle.copyWith(
                      fontSize: (14),
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
