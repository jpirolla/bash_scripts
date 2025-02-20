read -p "Enter the desired operation: 'compress' or 'decompress': " operation

case "$operation" in
        "compress")
                read -p "Enter the final file name (.tar.gz): " output_file
                read -p "Enter the list of files (separated by spaces): " files
                tar -czf "$output_file" $files
                echo "Successfully compressed into $output_file"
        ;;
        "decompress")
                read -p "Enter the file to decompress (.tar.gz): " file
                read -p "Enter the destination directory: " directory
                tar -xzf "$file" -C "$directory"
                echo "Successfully decompressed into $directory"
        ;;
        *)
        echo "Invalid operation!"
        echo "Please select either 'decompress' or 'compress'."
        exit 1
esac
