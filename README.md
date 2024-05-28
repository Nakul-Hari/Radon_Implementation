# Radon Implementation 

This repository contains MATLAB code for implementing the Radon transform. The Radon transform is a mathematical operation that maps a function or an image from its domain into the space of lines in its codomain. This transformation is widely used in medical imaging, particularly in computed tomography (CT) scanning, where it forms the basis of image reconstruction algorithms.

## Theory

The Radon transform \( R_f(\theta, t) \) of a function \( f(x, y) \) is defined as the line integral of the function along lines that are perpendicular to the line defined by angle \( \theta \) and distance \( t \) from the origin. In mathematical terms:

\[ R_f(\theta, t) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} f(x, y) \delta(x\cos\theta + y\sin\theta - t) \,dx\,dy \]

In the context of image processing, the Radon transform provides valuable information about the internal structure of an object. It helps in tasks such as feature extraction, pattern recognition, and image reconstruction. By collecting Radon projections at different angles, a complete set of information about the object's interior can be obtained.

## Implementation

This repository provides MATLAB scripts for implementing the Radon transform for two common scenarios:

### Detectors in Place

The `radon_transform_detectors_in_place.m` script demonstrates the implementation of the Radon transform when the detectors remain stationary while the image is rotated. This scenario simulates a typical setup in medical CT scanning.

### Image in Place

The `radon_transform_image_in_place.m` script illustrates the scenario where the image remains stationary while the detectors rotate around it. This configuration is often used in industrial CT scanning and non-destructive testing applications.

Both scripts utilize MATLAB's built-in functions for performing line integrals and generating Radon projections. They provide a practical demonstration of how the Radon transform can be applied in real-world scenarios.

## Usage

To use the scripts:

1. Ensure you have MATLAB installed on your system.
2. Clone or download this repository to your local machine.
3. Open MATLAB and navigate to the directory where you saved the repository.
4. Run either `radon_transform_detectors_in_place.m` or `radon_transform_image_in_place.m` script depending on the scenario you want to simulate.
5. Follow the instructions provided in the comments within the script files to adjust parameters and understand the implementation.

## Contributors

- [Your Name] - [Your GitHub Profile](link)

## License

This project is licensed under the [MIT License](LICENSE).
