import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart' as formtext;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double heghit;
  final int? maxLength;
  final String name;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final String? labelText;
  final IconData? sIcon;
  final bool? haveIcon;
  final bool haveBorder;
  final bool enabled;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function(String?)? onSubmitted;
  const CustomTextField({
    super.key,
    required this.width,
    required this.name,
    required this.heghit,
    required this.controller,
    this.validator,
    this.onChange,
    this.labelText,
    this.onSubmitted,
    required this.keyboardType,
    this.sIcon,
    this.haveIcon,
    this.enabled = true,
    this.style,
    this.labelStyle,
    this.maxLength = 50,
    this.haveBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heghit,
      child: formtext.FormBuilderTextField(
        keyboardType: keyboardType,
        expands: true,
        textDirection: TextDirection.rtl,
        enabled: enabled,
        autofocus: true,
        maxLines: null,
        style: style,
        maxLength: maxLength,
        decoration: haveIcon ?? false
            ? InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                suffixIcon: Icon(sIcon),
                hintTextDirection: TextDirection.rtl,
                hintText: labelText,
                hintStyle: labelStyle,
                border: InputBorder.none,
                counterText: '',
                disabledBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
                enabledBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
                focusedBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
              )
            : InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                hintTextDirection: TextDirection.rtl,
                hintText: labelText,
                hintStyle: labelStyle,
                border: InputBorder.none,
                counterText: '',
                disabledBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
                enabledBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
                focusedBorder: haveBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: GeneralConstants.mainColor,
                        ),
                      )
                    : InputBorder.none,
              ),
        onSubmitted: onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        name: name,
        textAlign: TextAlign.center,
        validator: validator,
        onChanged: onChange,
      ),
    );
  }
}
