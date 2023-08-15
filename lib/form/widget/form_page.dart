import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/form/bloc/form_bloc.dart';
import 'package:untitled/gen/assets.gen.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/theme_data.dart';
import 'package:untitled/widget/elevated_button.dart';
import 'package:untitled/widget/textfield_with_title.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _addressNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _firstAddressController = TextEditingController();
  final TextEditingController _secondAddressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _addressNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _firstAddressController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _secondAddressController.dispose();
    super.dispose();
  }

  bool get emailValid => (_emailController.text.isNotEmpty && _emailController.text.length >= 5);

  bool get addressNameValid => (_addressNameController.text.isNotEmpty && _addressNameController.text.length >= 5);

  bool get firstNameValid => (_firstNameController.text.isNotEmpty && _firstNameController.text.length >= 5);

  bool get lastNameValid => (_lastNameController.text.isNotEmpty && _lastNameController.text.length >= 5);

  bool get companyNameValid => (_companyNameController.text.isNotEmpty && _companyNameController.text.length >= 5);

  bool get countryValid => (_countryController.text.isNotEmpty && _countryController.text.length >= 5);

  bool get cityValid => (_cityController.text.isNotEmpty && _cityController.text.length >= 5);

  bool get stateValid => (_stateController.text.isNotEmpty && _stateController.text.length == 2);

  bool get zipValid => (_zipController.text.isNotEmpty && _zipController.text.length == 2);

  bool get phoneValid => (_phoneController.text.isNotEmpty && _phoneController.text.length >= 5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Assets.images.logo.image(height: 64, width: 176),
              const SizedBox(height: 14),
              ColoredBox(
                color: AppColors.primaryRed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.keyboard_backspace_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 14, 14),
                      child: Text(
                        'Add New Ship From Address',
                        style: Theme.of(context).h16.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 29),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: RichText(
                        text: const TextSpan(
                          text: '*',
                          children: [
                            TextSpan(
                              text: ' — Fields obligatory for filling',
                              style: TextStyle(
                                fontFamily: "Arial",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                color: Colors.black,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            fontFamily: "Arial",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryRed,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Address Name',
                        controller: _addressNameController,
                        isRequired: true,
                        onChange: (value) => setState(() {}),
                        textInputAction: TextInputAction.next,
                        haveError: _addressNameController.text.isNotEmpty && !addressNameValid,
                        errorMessage: 'Text is too short',
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColorMain),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              TextFieldWithTitle(
                                text: 'First Name',
                                controller: _firstNameController,
                                isRequired: true,
                                onChange: (value) => setState(() {}),
                                textInputAction: TextInputAction.next,
                                haveError: _firstNameController.text.isNotEmpty && !firstNameValid,
                                errorMessage: 'Text is too short',
                              ),
                              const SizedBox(height: 14),
                              TextFieldWithTitle(
                                text: 'Last Name',
                                controller: _lastNameController,
                                isRequired: true,
                                onChange: (value) => setState(() {}),
                                textInputAction: TextInputAction.next,
                                haveError: _lastNameController.text.isNotEmpty && !lastNameValid,
                                errorMessage: 'Text is too short',
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.borderColorMain,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.borderColorMain,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              TextFieldWithTitle(
                                text: 'Company Name',
                                controller: _companyNameController,
                                isRequired: true,
                                onChange: (value) => setState(() {}),
                                textInputAction: TextInputAction.next,
                                haveError: _companyNameController.text.isNotEmpty && !companyNameValid,
                                errorMessage: 'Text is too short',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: BlocBuilder<FormBloc, BossFormState>(
                        builder: (context, state) {
                          return TextFieldWithTitle(
                            text: 'Address 1',
                            controller: _firstAddressController,
                            isRequired: true,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              context.read<FormBloc>().add(FormEvent.validateAddress(_firstAddressController.text));
                            },
                            errorMessage: 'Address is invalid',
                            haveError: !state.addressValid,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Address 2',
                        controller: _secondAddressController,
                        textInputAction: TextInputAction.next,
                        haveError: _secondAddressController.text.length < 5,
                        errorMessage: 'Text is too short',
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Country',
                        controller: _countryController,
                        isRequired: true,
                        onChange: (value) => setState(() {}),
                        textInputAction: TextInputAction.next,
                        haveError: _countryController.text.isNotEmpty && !countryValid,
                        errorMessage: 'Text is too short',
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CityInfo(
                        cityController: _cityController,
                        stateController: _stateController,
                        zipController: _zipController,
                        cityValid: cityValid,
                        zipValid: zipValid,
                        stateValid: stateValid,
                        onChange: () => setState(() {}),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Phone',
                        controller: _phoneController,
                        isRequired: true,
                        onChange: (value) => setState(() {}),
                        textInputAction: TextInputAction.next,
                        haveError: _phoneController.text.isNotEmpty && !phoneValid,
                        errorMessage: 'Text is too short',
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Email',
                        controller: _emailController,
                        isRequired: true,
                        onChange: (value) => setState(() {}),
                        textInputAction: TextInputAction.next,
                        haveError: _emailController.text.isNotEmpty && !emailValid,
                        errorMessage: 'Text is too short',
                      ),
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CustomTextButton(
                        onPressed: emailValid &&
                                countryValid &&
                                cityValid &&
                                stateValid &&
                                zipValid &&
                                phoneValid &&
                                emailValid &&
                                ((firstNameValid && lastNameValid) || companyNameValid)
                            ? () {}
                            : null,
                        text: 'Create address',
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityInfo extends StatelessWidget {
  const CityInfo({
    required this.cityController,
    required this.stateController,
    required this.zipController,
    required this.cityValid,
    required this.stateValid,
    required this.zipValid,
    required this.onChange,
    super.key,
  });

  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;
  final VoidCallback onChange;
  final bool cityValid;
  final bool stateValid;
  final bool zipValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 128,
          child: TextFieldWithTitle(
            text: 'City',
            controller: cityController,
            isRequired: true,
            onChange: (value) => onChange.call(),
            textInputAction: TextInputAction.next,
            haveError: cityController.text.isNotEmpty && !cityValid,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 80,
          child: TextFieldWithTitle(
            text: 'State',
            controller: stateController,
            isRequired: true,
            onChange: (value) => onChange.call(),
            maxLength: 2,
            textInputAction: TextInputAction.next,
            haveError: stateController.text.isNotEmpty && !stateValid,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 80,
          child: TextFieldWithTitle(
            maxLength: 2,
            keyboardType: TextInputType.number,
            text: 'Zip',
            controller: zipController,
            onChange: (value) => onChange.call(),
            isRequired: true,
            textInputAction: TextInputAction.next,
            haveError: zipController.text.isNotEmpty && !zipValid,
          ),
        ),
      ],
    );
  }
}
