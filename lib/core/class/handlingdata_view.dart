import 'package:flutter/material.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:lottie/lottie.dart';

class HandlingdataView extends StatelessWidget {
  //-- المتغيرات -------------------------------
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingdataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  //-- build-----------------------------------------
  @override
  Widget build(BuildContext context) {
    return
    // --LOADING---------------------------------------------
    statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppAssets.loading))
        // --OFFLINE FAILURE-------------------------------------
        : statusRequest == StatusRequest.oflinefailure
        ? Center(child: Lottie.asset(AppAssets.ofline))
        // --SERVER FAILURE--------------------------------------
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(AppAssets.serverError))
        // --FAILURE--------------------------------------
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(AppAssets.noData))
        : widget;
  }
}

//=========================================================
//=========================================================
class HandlingdataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingdataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  //-- build-----------------------------------------
  @override
  Widget build(BuildContext context) {
    return
    // --LOADING---------------------------------------------
    statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppAssets.loading))
        // --OFFLINE FAILURE-------------------------------------
        : statusRequest == StatusRequest.oflinefailure
        ? Center(child: Lottie.asset(AppAssets.ofline))
        // --SERVER FAILURE--------------------------------------
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(AppAssets.serverError))
        // --FAILURE--------------------------------------
        : widget;
  }
}
