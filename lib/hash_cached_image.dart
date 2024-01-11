library hash_cached_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'r_blurhash.dart';
import 'r_cached_network_image.dart';

typedef PlaceholderWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
);

typedef ProgressIndicatorBuilder = Widget Function(
  BuildContext context,
  String url,
  DownloadProgress progress,
);

class HashCachedImage extends StatelessWidget {
  const HashCachedImage(
      {required this.imageUrl,
      this.hash,
      this.height,
      this.width,
      this.placeholder,
      this.errorWidget,
      this.color,
      this.loaderColor,
      this.alignment = Alignment.center,
      this.fit,
      super.key});

  final String imageUrl;
  final String? hash;

  final double? height;
  final double? width;

  final PlaceholderWidgetBuilder? placeholder;

  final LoadingErrorWidgetBuilder? errorWidget;

  final Color? color;
  final Color? loaderColor;

  final Alignment alignment;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return hash == null || hash == ""
        ? RCachedNetworkImage(
            imageUrl: imageUrl,
            hash: hash,
            height: height,
            width: width,
            color: color,
            alignment: alignment,
            fit: fit,
            placeholder: placeholder ??
                (context, url) => Center(
                        child: CupertinoActivityIndicator(
                      color: loaderColor,
                    )),
            errorWidget:
                errorWidget ?? (context, url, error) => const Icon(Icons.error),
          )
        : height == 1 && width == 1
            ? Stack(
                fit: StackFit.expand,
                children: [
                  RBlurHash(
                    hash: hash,
                    height: height!.round(),
                    width: width!.round(),
                    fit: fit,
                  ),
                  RCachedNetworkImage(
                    imageUrl: imageUrl,
                    hash: hash,
                    height: height,
                    width: width,
                    color: color,
                    alignment: alignment,
                    fit: fit,
                    errorWidget: errorWidget ??
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ],
              )
            : SizedBox(
                height: height,
                width: width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RBlurHash(
                      hash: hash,
                      height: height?.round() ?? 34,
                      width: width?.round() ?? 34,
                      fit: fit,
                    ),
                    RCachedNetworkImage(
                      imageUrl: imageUrl,
                      hash: hash,
                      height: height,
                      width: width,
                      color: color,
                      alignment: alignment,
                      fit: fit,
                      errorWidget: errorWidget ??
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ],
                ),
              );
  }
}
