# hash_cached_image

A flutter widget to use both CachedNetworkImage and BlurHash combine.


## Features

 - CachedNetworkImage is provided.
 - BlurHash is provided.
 - Predefined loader while image is loading.

## Getting started

To use this package, add hash_cached_image as a dependency in your pubspec.yaml file.

## Usage

Minimal example:

```dart
    HashCachedImage(imageUrl: "your image url", hash: "your hash")
```

Custom settings:

```dart
    HashCachedImage(
          imageUrl: "your image url",
          hash: "your hash",
          fit: BoxFit.fill,
          height: 200,
          width: 200,
          alignment: Alignment.center,
          placeholder: (context, url) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
```
