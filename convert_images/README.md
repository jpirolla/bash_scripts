# Image Format Converter Script

## Overview

This Bash script automates the conversion of image files from one format to another using the `convert` command (from ImageMagick). The user provides a directory containing the images, specifies the input and output formats, and the script processes all matching files in the directory.

## How to Use

1. **Run the script:**
   ```sh
   ./convert_images.sh
   ```
   Make sure the script has execution permissions:
   ```sh
   chmod +x convert_images.sh
   ```

2. **Follow the prompts:**
   - Enter the directory where the images are stored.
   - Provide the input file extension (e.g., `.jpg`, `.png`).
   - Provide the desired output file extension (e.g., `.jpg`, `.png`).

3. **Processing:**
   - The script converts all images with the specified input format to the chosen output format.
   - If successful, it prints a confirmation message for each converted file.

## Example

```sh
Please enter the directory path where the images are stored:
/home/user/Pictures

Enter the file extension of the images to be converted (e.g., .jpg, .png):
.jpg

Enter the desired output file extension (e.g., .jpg, .png):
.png

File image1.jpg successfully converted to image1.png
File image2.jpg successfully converted to image2.png
Conversion process finished!
```

## Notes

- The script only processes files in the specified directory.
- Ensure that the directory exists before running the script.
- The script does not delete original files after conversion.

