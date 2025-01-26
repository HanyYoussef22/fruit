import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/auth/presentation/cubit/sinup_cubit/sinup_cubit.dart';
import 'package:fruit/features/auth/presentation/sinup_widgets/email_and_password.dart';
import 'package:fruit/features/auth/presentation/sinup_widgets/have_account.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import 'check_books.dart';

class SinupBody extends StatefulWidget {
  const SinupBody({super.key});

  @override
  State<SinupBody> createState() => _SinupBodyState();
}
class _SinupBodyState extends State<SinupBody> {
  late bool isClickBox = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            EmailAndPasswordSinup(),
            SizedBox(
              height: 16.h,
            ),
            CheckBooks(onChecked: (bool value) {
              isClickBox=value;
            },),
            SizedBox(
              height: 20.h,
            ),
            customButton(text: 'إنشاء حساب جديد', onTap:() {
                  validateSinUp(context);
                }),
            SizedBox(
              height: 26.h,
            ),
            haveAreadyAccount(context),


          ],
        ),
      ),
    );
  }

  void validateSinUp(BuildContext context)
  {
    if(context.read<SinUpCubit>().formKey.currentState!.validate()){
      context.read<SinUpCubit>().formKey.currentState?.save();
      if(isClickBox){

        context.read<SinUpCubit>().emitSinupState();

      }
      else{
        CustomSnackBar.show(context, 'يجب الموافقة على الشروط والأحكام');
      }
    }

    else{
      setState(() {
        context.read<SinUpCubit>().autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
