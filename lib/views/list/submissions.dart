import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rabbit_oj_mobile/components/submission_list.dart';
import 'package:rabbit_oj_mobile/models/general_response.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';
import 'package:rabbit_oj_mobile/utils/urls.dart';

class SubmissionsView extends StatefulWidget {
  @override
  _SubmissionsViewState createState() => _SubmissionsViewState();
}

class _SubmissionsViewState extends State<SubmissionsView> {
  List<SubmissionLite> _data;

  @override
  void initState() {
    _data = [
      SubmissionLite.demo(1, "AC"),
      SubmissionLite.demo(2, "NO"),
      SubmissionLite.demo(3, "ING")
    ];
    super.initState();
  }

  Future<GeneralListResponse<SubmissionLite>> getList(int page) async {
    int uid = 1; // todo
    Response response = await Dio()
        .get(ApiUrl.submission.getUserList(uid.toString(), page.toString()));
    GeneralResponse<GeneralListResponse<SubmissionLite>> data = response.data;

    if (data.code == 200) {
      return data.message;
    } else {
      throw (data.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SubmissionListComponent(data: _data);
  }
}
