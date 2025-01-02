import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:news_app/core/base_widgets/logic/obscure_text_cubit/obscure_text_state.dart';
import 'package:news_app/core/theme/color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onPressSuffix;
  final TextInputType? textInputType;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.emailAddress,
    this.isPasswordField = false,
    this.onPressSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return isPasswordField
        ? BlocProvider(
            create: (context) => ObscureTextCubit(),
            child: BlocBuilder<ObscureTextCubit, ObscureTextState>(
              builder: (context, state) {
                var cubit = ObscureTextCubit.get(context);
                return TextFormField(
                  controller: textEditingController,
                  keyboardType: textInputType,
                  obscureText: cubit.obscureText,
                  cursorColor: MyColors.myRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: MyColors.myLightGrey)),
                      hintText: hintText,
                      prefixIcon: prefixIcon,
                      hintStyle: const TextStyle(color: MyColors.myGrey),
                      prefixIconColor: MyColors.myRed,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.togglePasswordIcon();
                        },
                        icon: cubit.suffixIcon,
                        color: MyColors.myRed,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              },
            ),
          )
        : TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            cursorColor: MyColors.myRed,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.myLightGrey),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: MyColors.myGrey),
              prefixIconColor: MyColors.myRed,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon != null
                  ? IconButton(onPressed: onPressSuffix, icon: suffixIcon!)
                  : null,
              suffixIconColor: MyColors.myRed,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
  }
}
