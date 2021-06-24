import 'package:flutter/material.dart';
import 'package:health_and_beyond/features/core/widgets/snackbar_message.dart';
import 'package:intl/intl.dart';
import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/add_record/data/models/add_record_object_model.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/disease.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient.dart';

class AddRecordBody extends StatefulWidget {
  final String uid, type, drUid, drFirstName;
  final Patient patient;
  final List<Disease> diseases;

  AddRecordBody({
    required this.uid,
    required this.type,
    required this.drUid,
    required this.drFirstName,
    required this.patient,
    required this.diseases,
  });

  @override
  _AddRecordBodyState createState() => _AddRecordBodyState(
        uid: uid,
        type: type,
        drUid: drUid,
        drFirstName: drFirstName,
        patient: patient,
        diseases: diseases,
      );
}

class _AddRecordBodyState extends State<AddRecordBody> {
  final String uid, type, drUid, drFirstName;
  final Patient patient;
  final List<Disease> diseases;

  late String _selectedDisease;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _prescriptionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  _AddRecordBodyState({
    required this.uid,
    required this.type,
    required this.drUid,
    required this.drFirstName,
    required this.patient,
    required this.diseases,
  });

  @override
  void initState() {
    super.initState();
    _selectedDisease = diseases[0].name;
    _nameController.text = patient.firstName;
    _cityController.text = patient.city;
    _stateController.text = patient.state;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: _size.width,
        height: _size.height - AppDimensions.d128,
        padding: const EdgeInsets.all(AppDimensions.d8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.d8),
                    child: TextField(
                      readOnly: true,
                      controller: _nameController,
                      decoration: AppStyles.inputDecoration.copyWith(
                        helperText: AppStrings.firstName,
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.d8),
                      child: DropdownButton<String>(
                        style: AppStyles.textStyle.copyWith(
                          fontSize: AppDimensions.d16,
                        ),
                        value: _selectedDisease,
                        onTap: () {},
                        onChanged: (disease) {
                          setState(() => _selectedDisease = disease!);
                        },
                        items: List.generate(
                          diseases.length,
                          (index) => DropdownMenuItem(
                            value: diseases[index].name,
                            child: Text(
                              diseases[index].name,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.d8),
              child: TextField(
                controller: _descriptionController,
                decoration: AppStyles.inputDecoration.copyWith(
                  helperText: AppStrings.description,
                ),
                minLines: 6,
                maxLines: 6,
                maxLength: 150,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.d8),
              child: TextField(
                controller: _prescriptionController,
                decoration: AppStyles.inputDecoration.copyWith(
                  helperText: AppStrings.prescription,
                ),
                minLines: 6,
                maxLines: 6,
                maxLength: 150,
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.d8),
                    child: TextField(
                      readOnly: true,
                      controller: _cityController,
                      decoration: AppStyles.inputDecoration.copyWith(
                        helperText: AppStrings.city,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.d8),
                    child: TextField(
                      readOnly: true,
                      controller: _stateController,
                      decoration: AppStyles.inputDecoration.copyWith(
                        helperText: AppStrings.state,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.d64),
              child: MaterialButton(
                color: AppColors.activeColor,
                child: Text(
                  AppStrings.submit,
                  style: AppStyles.textStyle.copyWith(
                    fontSize: AppDimensions.d16,
                    color: AppColors.primaryColor,
                  ),
                ),
                onPressed: () async {
                  if (_descriptionController.text.length > 0 && _prescriptionController.text.length > 0) {
                    final DateTime dateTime = DateTime.now();
                    final DateFormat format = DateFormat('yyyy-MM-dd');
                    await AppRequests.addPatientRecord(
                      addRecordObjectModel: AddRecordObjectModel(
                        uid: uid,
                        type: type,
                        firstName: patient.firstName,
                        disease: _selectedDisease,
                        description: _descriptionController.text.replaceAll('.', '\<br\/>'),
                        prescription: _prescriptionController.text.replaceAll('.', '\<br\/>'),
                        city: patient.city,
                        state: patient.state,
                        uploadDate: format.format(dateTime),
                        dob: patient.dob,
                        drUid: drUid,
                        drFirstName: drFirstName,
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    SnackBarMessage.displayMessage(
                      context: context,
                      message: AppStrings.inputsCannotBeEmpty,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
