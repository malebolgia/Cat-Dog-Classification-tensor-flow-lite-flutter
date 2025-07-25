# Tutorial: cat-dog-classification-tflite-flutter

This Flutter project classifies images as either **cat** or _dog_ using a pre-trained TFLite model. The app allows users to select an image from their device, and then uses the model to predict whether the image contains a cat or a dog. It uses the `tflite_flutter` and `tflite_flutter_helper` packages to interact with the model and pre-process/post-process the images. The model itself is stored as an asset within the app.

**Source Repository:** [https://github.com/malebolgia/Cat-Dog-Classification-tensor-flow-lite-flutter](https://github.com/malebolgia/Cat-Dog-Classification-tensor-flow-lite-flutter)

```mermaid
flowchart TD
    A0["TFLite Model"]
    A1["tflite_flutter Package"]
    A2["tflite_flutter_helper Package"]
    A3["Image Picker (image_picker package)"]
    A4["Asset Management (assets/ directory)"]
    A1 -- "Loads and runs" --> A0
    A2 -- "Simplifies interaction" --> A1
    A3 -- "Provides input image" --> A1
    A4 -- "Stores model file" --> A0
    A1 -- "Loads from" --> A4
```

## Chapters

1. [Image Picker (`image_picker` package)
   ](01_image_picker___image_picker__package__.md)
2. [Asset Management (assets/ directory)
   ](02_asset_management__assets__directory__.md)
3. [TFLite Model
   ](03_tflite_model_.md)
4. [`tflite_flutter` Package
   ](04__tflite_flutter__package_.md)
5. [`tflite_flutter_helper` Package
   ](05__tflite_flutter_helper__package_.md)

---

Generated by [AI Codebase Knowledge Builder](https://github.com/The-Pocket/Tutorial-Codebase-Knowledge)
