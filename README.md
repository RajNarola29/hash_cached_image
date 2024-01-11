# Hash Cached Image

`hash_cached_image` is a powerful Flutter package designed to streamline image loading, caching, and error handling within your Flutter applications. With support for blur hash placeholders, customizable widgets, and smooth animations, this package simplifies the process of displaying images from network URLs while maintaining a high-quality user experience.

---

## Features

- **Efficient Image Loading**: Utilize `CachedNetworkImageProvider` for efficient image caching and loading.
- **Blur Hash Placeholders**: Display blurred placeholders while images are loading for a seamless user experience.
- **Customizable Widgets**: Customize placeholder and error widgets globally or per instance to match your app's design.
- **Smooth Animations**: Add fade-in and fade-out animations to enhance image transitions.
- **High-Quality Filters**: Choose from various image filter quality options to optimize visual appearance.

---

## Installation

To integrate `hash_cached_image` into your Flutter project, follow these steps:

1. Add the following line to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     hash_cached_image: ^1.0.0
   ```

2. Run `flutter pub get` in your terminal to install the package.

---

## Usage

### Basic Usage

To use `hash_cached_image` in your Flutter project, follow these steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     hash_cached_image: ^1.0.0
   ```

2. Import the package in your Dart code:

   ```dart
   import 'package:hash_cached_image/hash_cached_image.dart';
   ```

3. Use the `HashCachedImage` widget to display images with cached network loading and optional blur hash placeholders and error handling. Here's a basic example:

   ```dart
   HashCachedImage(
     imageUrl: 'https://example.com/image.jpg',
     hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
     height: 200,
     width: 200,
     placeholder: (context) => const CircularProgressIndicator(),
     errorWidget: (context, error, stackTrace) => const Icon(Icons.error),
     fit: BoxFit.cover,
   )
   ```

   In this example, replace `'https://example.com/image.jpg'` with the URL of the image you want to display. The `hash` parameter is optional and can be used for blur hash placeholders. You can customize the placeholder and error widgets, as well as other properties like `height`, `width`, and `fit` to suit your UI requirements.

### Global Configuration

You can set global placeholder and error widgets for your entire application:

```dart
import 'package:hash_cached_image/hash_cached_image.dart';

void main() {
  HashCachedImageGlobalParameter().setGlobalParameter(
    globalPlaceholderWidget: (context) => const CircularProgressIndicator(),
    globalErrorWidget: (context, error, stackTrace) => const Icon(Icons.error),
  );
  runApp(const MyApp());
}
```

---

## API Reference

### `HashCachedImage` Class

| Constructor Parameter       | Description                                                                                                                                                                          |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `imageUrl`                  | The URL of the image to display. (Required)                                                                                                                                          |
| `hash`                      | The blur hash string for the placeholder.                                                                                                                                             |
| `fadeInCurve`               | The curve for the fade-in animation.                                                                                                                                                 |
| `fadeOutCurve`              | The curve for the fade-out animation.                                                                                                                                                |
| `fadeInDuration`            | The duration of the fade-in animation.                                                                                                                                               |
| `fadeOutDuration`           | The duration of the fade-out animation.                                                                                                                                              |
| `placeholderFadeInDuration` | The duration of the placeholder fade-in animation.                                                                                                                                   |
| `filterQuality`             | The quality of image filtering.                                                                                                                                                      |
| `colorBlendMode`            | The blend mode for the image color.                                                                                                                                                   |
| `repeat`                    | How the image should be repeated if it does not fill its bounds.                                                                                                                      |
| `height`                    | The height of the image.                                                                                                                                                             |
| `width`                     | The width of the image.                                                                                                                                                              |
| `placeholder`               | The builder for the placeholder widget.                                                                                                                                               |
| `errorWidget`               | The builder for the error widget.                                                                                                                                                     |
| `imageBuilder`              | The builder for customizing the image widget.                                                                                                                                        |
| `color`                     | The color to blend with the image.                                                                                                                                                    |
| `alignment`                 | How to align the image within its bounds.                                                                                                                                             |
| `fit`                       | How the image should be inscribed into the given box.                                                                                                                                 |

---

## Contributors

We welcome contributions from the community to improve `hash_cached_image`. Here are the contributors who have helped enhance this package:

- [Raj Narola](https://github.com/RajNarola29)

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Feedback and Contributions

We welcome feedback, bug reports, and contributions to improve `hash_cached_image`. Feel free to [open an issue](https://github.com/RajNarola29/hash_cached_image/issues) or submit a [pull request](https://github.com/RajNarola29/hash_cached_image/pulls) on GitHub.

---

## Support

For support or inquiries, please contact us at [raj.work68@gmail.com](mailto:raj.work68@gmail.com).

---

## Acknowledgements

We would like to thank the Flutter community and the developers of dependencies used in this package for their valuable contributions.

Thank you for using `hash_cached_image`! We hope it enhances your Flutter development experience.