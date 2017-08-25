SRAD - HEART WALL
=====================

The Heart Wall application tracks the movement of a mouse heart over a sequence of 104 609x590 ultrasound images to record response to the stimulus. In its initial stage, the program performs image processing operations on the first image to detect initial, partial shapes of inner and outer heart walls. These operations include: edge detection, SRAD despeckling (part of Rodinia suite), morphological transformation and dilation. In order to reconstruct approximated full shapes of heart walls, the program generates ellipses that are superimposed over the image and sampled to mark points on the heart walls (Hough Search). In its final stage (Heart Wall Tracking presented here), program tracks movement of surfaces by detecting the movement of image areas under sample points as the shapes of the heart walls change throughout the sequence of images.


Note: Original benchmark taken from the [Rodinia Benchmark Suite]  (https://www.cs.virginia.edu/~skadron/wiki/rodinia)

