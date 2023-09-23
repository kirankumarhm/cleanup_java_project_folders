#!/bin/bash

# Check for the provided path
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

# Path to the directory where you want to start the deletion
start_path="$1"

# # Specify the folders and files you want to delete
# folders_to_delete=(".metadata" ".settings" "bin" "target" ".mvn" ".git" ".idea")
# files_to_delete=(".classpath" ".project" ".gitignore" "jkube-demo.iml")

# # Function to delete folders and their contents recursively
# delete_folders() {
#   local folder
#   for folder in "$@"; do
#     local folder_path="$start_path/$folder"
#     if [ -d "$folder_path" ]; then
#       echo "Deleting folder: $folder_path"
#       rm -r "$folder_path"
#     else
#       echo "Folder does not exist: $folder_path"
#     fi
#   done
# }

# # Function to delete specific files
# delete_files() {
#   local file
#   for file in "$@"; do
#     local file_path="$start_path/$file"
#     if [ -e "$file_path" ]; then
#       echo "Deleting file: $file_path"
#       rm "$file_path"
#     else
#       echo "File does not exist: $file_path"
#     fi
#   done
# }

# # Call functions to delete specified folders and files
# delete_folders "${folders_to_delete[@]}"
# delete_files "${files_to_delete[@]}"

# echo "Deletion of specified folders and files within $start_path completed."



# Specify the folder where you want to start the deletion
start_folder=$start_path

# Specify the file extensions you want to delete
files_to_delete=(".classpath" ".project" ".gitignore" ".gitignore" ".iml")
folders_to_delete=(".metadata" ".settings" "bin" "target" ".mvn" ".git" ".idea")


# Use a loop to iterate through each file extension and delete matching files
for file in "${files_to_delete[@]}"; do
  # find "$start_folder" -type f -name "*.$file" -exec rm -f \;
  # find $start_folder  -type f -name $file -depth +4 -print0 -exec rm -rf {} +
  find $start_folder -type f -name $file -exec rm -f {} \;
done

# Optionally, you can also delete empty directories left behind after deleting files
# find "$start_folder" -type d -empty -delete

echo "Deletion of specified file extensions in $start_folder and its subfolders completed."

# Use a loop to iterate through each file extension and delete matching files
for folder in "${folders_to_delete[@]}"; do
  # find $start_folder -type d -name "$folder" -exec rm -rf \;
  # find $start_folder  -type d -name $folder -depth +4 -print0 -exec rm -rf {} +
  find $start_folder -type d -name $folder  -exec rm -rf {} \;
done

echo "Deletion of specified folders in $start_folder and its subfolders completed."
