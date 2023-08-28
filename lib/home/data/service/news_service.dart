import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../baseModels/api_request_failure.dart';
import '../../../globalServices/apiServices/networkService/abstract_network_service.dart';
import '../../../globalServices/apiServices/networkService/network_exceptions.dart';
import '../../../utils/constant_keywords.dart';
import '../../../utils/urls.dart';
import '../models/article_response_model.dart';

class NewsServices extends GetxService {
  final networkService = Get.find<AbstractNetworkService>();

  Future<Either<ApiRequestFailure, ArticlesResponseModel>> getArticles(
      String source) async {
    String url = networkService.generateURLWithParams(
      {
        "source": source,
        "apiKey": "533af958594143758318137469b41ba9",
      },
      Urls.articlesUrl,
    );
    dynamic result;
    try {
      final response = await networkService.get(
        url,
        headers: {
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRiNTk5ZGU5ODc0NzEwZmIxMDEyNjZhMGQxZmM2OGNhMWEwNDkxNTQzMTM0ODg0MTljYTAyNjU0M2IxMzRmMzg1MGIyM2M3OTY1YzQ1YTUxIn0.eyJhdWQiOiIxIiwianRpIjoiZGI1OTlkZTk4NzQ3MTBmYjEwMTI2NmEwZDFmYzY4Y2ExYTA0OTE1NDMxMzQ4ODQxOWNhMDI2NTQzYjEzNGYzODUwYjIzYzc5NjVjNDVhNTEiLCJpYXQiOjE1OTQzOTgzNTAsIm5iZiI6MTU5NDM5ODM1MCwiZXhwIjoxNjI1OTM0MzUwLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.gG2BxbczbiaCR2_fBuzFO0yZZC5R0hUarPSC-DGoxLXI1S0PhusTe0s4yLeQwiZRtN1zJ75xPRy9OY_eh7Mi0-UHAdwilgtRFFld7gvVgUmE1ps0a4dkD02A9PF9Qqf0FAOt4CmxcR7TI1IIO8WWE-OkWVPKLDzdM61JRaUEP4KNbD5duCKLXRZx-jS9xm6DY7WKm392MmcHdcXAgSjeUIQS5KScu0A5jH4-8Xu7JPI-jEprHEif7ZcW8cQEx2D5bHL-HByotTpfKKrgXL5EbuY6cxYwbh0-24zwrxCHsElrt-XwtJ89zYE2XNne4NPoRh5wuOQxMFybxPfbXMVgpzEzmb2T-kQtZUwuBAhUif0XNOOVMeSXJkV911EjkPpTtNj9k2RgB7l9WQkMlOHntJsn5XeUNLdn0Yur7IaXmszDcTgBFXf5s_1kqsP_1FnapczZs8KHdbSA_zck0l3g6soWdwY8yq4RjsKpM7tUc919yuvIjB-d2hgkmz1mFa-G_qkUkJYFMKx-QbT355Qn4G9sylE2_qbNQf9MSR9ZwiC9NQYPPNSGomGcv0GO-HiHPjNIRVQk4cWi5_JcKue05Aun6sKO_5dso8bnR_rRsl0w2s1gRH3t-YQlnPmQD9qaubKf2Xn7A29mMVD5u8O9ZEg_k82i4nD40LIC8b0PAgg",
        },
      );
      if (response.runtimeType != String &&
          (response?.statusCode == ConstantKeys.successfullyApi200 ||
              response?.statusCode == ConstantKeys.successfullyApi201)) {
        result = await json.decode(response.toString());
        return right(articlesResponseModelFromJson(result));
      } else {
        return left(ApiRequestFailure(error: response));
      }
    } catch (e) {
      return left(
          ApiRequestFailure(error: await NetworkExceptions.getDioException(e)));
    }
  }
}
