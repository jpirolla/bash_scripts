#! /bin/bash

echo "Please enter the directory path where the images are stored:"
read directory

# Check if the directory exists
if [ ! -d "$directory" ]; then
	echo "The directory $directory doesn't exist. Aborting the process."
	exit 1
fi

echo "Enter the file extension of the images to be converted (e.g., .jpg, .png):"
read input_extension

echo "Enter the desired output file extension (e.g., .jpg, .png):"
read output_extension

# Change to the provided directory
cd "$directory" || exit

# Convert all files of the given input extension to the desired output extension
for image in *$input_extension; do
    if [ -f "$image" ]; then
        # Remove the input extension and add the output extension
        name_without_extension="${image%$input_extension}"
        convert "$image" "$name_without_extension$output_extension"
        if [ $? -eq 0 ]; then
            echo "File $image successfully converted to $name_without_extension$output_extension"
        else
            echo "Failed to convert the file $image."
        fi
    else
        echo "No $input_extension files found in the directory."
        break
    fi
done

echo "Conversion process finished!"
