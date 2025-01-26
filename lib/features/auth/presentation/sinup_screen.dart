import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/routing/routes.dart';

import 'package:fruit/core/theming/style/styles.dart';
import 'package:fruit/features/auth/presentation/cubit/sinup_cubit/sinup_cubit.dart';

import 'package:fruit/features/auth/presentation/sinup_widgets/sinup_body.dart';

import '../../../core/theming/style/colors.dart';
import '../../../core/widgets/custom_snackbar.dart';
import 'cubit/sinup_cubit/sinup_state.dart';

class SinupScreen extends StatelessWidget {
  const SinupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {

              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'حساب جديد',
            style: Styles.font19Grayscale950W700,
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
            child: BlocConsumer<SinUpCubit, SinUpState>(
          listener: (context, state) {
            state.whenOrNull(
                loading: () {

              showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManger.primaryColor,
                      ),

                    );
                  });
            }, success: (userEntity) {
              context.pop();
              context.pop();
            }, error: (error) {
              context.pop();

              CustomSnackBar.show(context,error,backgroundColor: Colors.grey);
            });
          },
          builder: (context, state) {
            return SinupBody();
          },
        )));
  }
}
