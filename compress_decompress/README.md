
# File Compressor and Decompressor Script

This script provides an easy way to compress and decompress files using the `.tar.gz` format on Unix-like systems. It allows you to choose between compressing a list of files into a single archive or decompressing a `.tar.gz` archive into a specified directory.

## Features

- **Compress files**: Compress multiple files into a `.tar.gz` archive.
- **Decompress files**: Extract the contents of a `.tar.gz` archive into a specified directory.

## Usage

1. **To compress files**:
   - Run the script and choose the 'compress' option.
   - Enter the desired name for the output `.tar.gz` file.
   - Provide a list of files (separated by spaces) to be compressed.

2. **To decompress files**:
   - Run the script and choose the 'decompress' option.
   - Enter the name of the `.tar.gz` file to decompress.
   - Specify the destination directory where the files should be extracted.

## Example

### Compressing files:
```
$ ./file_compressor.sh
Enter the desired operation: 'compress' or 'decompress': compress
Enter the final file name (.tar.gz): my_archive.tar.gz
Enter the list of files (separated by spaces): file1.txt file2.txt folder1
Successfully compressed into my_archive.tar.gz
```

### Decompressing files:
```
$ ./file_compressor.sh
Enter the desired operation: 'compress' or 'decompress': decompress
Enter the file to decompress (.tar.gz): my_archive.tar.gz
Enter the destination directory: /path/to/destination
Successfully decompressed into /path/to/destination
```

