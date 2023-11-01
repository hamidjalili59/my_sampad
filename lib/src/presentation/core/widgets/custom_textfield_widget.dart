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
  final bool isdynamicSize;
  final bool enabled;
  final bool islabel;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function(String?)? onSubmitted;
  const CustomTextField({
    super.key,
    required this.width,
    required this.name,
    this.isdynamicSize = false,
    required this.heghit,
    required this.controller,
    this.validator,
    this.onChange,
    this.labelText,
    this.onSubmitted,
    required this.keyboardType,
    required this.islabel,
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
    if (isdynamicSize) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: heghit, minWidth: width, maxWidth: width + 1),
        child: MainTextField(
          isLabley: islabel,
          keyboardType: keyboardType,
          enabled: enabled,
          style: style,
          maxLength: null,
          expand: false,
          haveIcon: haveIcon,
          sIcon: sIcon,
          labelText: labelText,
          labelStyle: labelStyle,
          haveBorder: haveBorder,
          onSubmitted: onSubmitted,
          controller: controller,
          name: name,
          validator: validator,
          onChange: onChange,
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: heghit,
        child: MainTextField(
            isLabley: islabel,
            keyboardType: keyboardType,
            enabled: enabled,
            style: style,
            maxLength: maxLength,
            haveIcon: haveIcon,
            sIcon: sIcon,
            labelText: labelText,
            labelStyle: labelStyle,
            haveBorder: haveBorder,
            onSubmitted: onSubmitted,
            controller: controller,
            name: name,
            validator: validator,
            onChange: onChange),
      );
    }
  }
}

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.keyboardType,
    required this.enabled,
    required this.style,
    required this.maxLength,
    required this.haveIcon,
    required this.sIcon,
    required this.labelText,
    required this.labelStyle,
    required this.haveBorder,
    required this.isLabley,
    required this.onSubmitted,
    required this.controller,
    required this.name,
    this.expand = true,
    required this.validator,
    required this.onChange,
  });

  final TextInputType keyboardType;
  final bool enabled;
  final bool expand;
  final bool isLabley;
  final TextStyle? style;
  final int? maxLength;
  final bool? haveIcon;
  final IconData? sIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool haveBorder;
  final void Function(String? p1)? onSubmitted;
  final TextEditingController controller;
  final String name;
  final String? Function(String? p1)? validator;
  final void Function(String? p1)? onChange;

  @override
  Widget build(BuildContext context) {
    return formtext.FormBuilderTextField(
      keyboardType: keyboardType,
      expands: expand,
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
              hintText: isLabley ? null : labelText,
              hintStyle: isLabley ? null : labelStyle,
              label: isLabley ? Text(labelText ?? '', style: labelStyle) : null,
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
              floatingLabelAlignment: FloatingLabelAlignment.start,
              alignLabelWithHint: true,
              hintText: isLabley ? null : labelText,
              hintStyle: isLabley ? null : labelStyle,
              label: isLabley ? Text(labelText ?? '', style: labelStyle) : null,
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
    );
  }
}
