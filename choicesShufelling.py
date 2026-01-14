import os          # Provides functions to interact with the operating system (folders, files, paths)
import json        # Used to read and write JSON files
import random      # Used to shuffle MCQ choices randomly

# === CONFIG ===

folder_path = "cache"          # Folder that contains the original course JSON files
backup_folder = "cache_backup" # Folder to store backups before modifying files

# Create the backup folder if it does not already exist
# exist_ok=True prevents an error if the folder already exists
os.makedirs(backup_folder, exist_ok=True)

# Loop through every file name inside the cache folder
for filename in os.listdir(folder_path):

    # Process only files that end with .json
    if filename.endswith(".json"):

        # Build the full path to the JSON file (e.g., cache/course1.json)
        file_path = os.path.join(folder_path, filename)

        # ---- READ ORIGINAL JSON FILE ----
        # Open the JSON file in read mode using UTF-8 encoding
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)  # Convert JSON content into a Python dictionary

        # ---- BACKUP ORIGINAL FILE ----
        # Create the full path for the backup file
        backup_path = os.path.join(backup_folder, filename)

        # Write the original data to the backup folder
        with open(backup_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        # ---- SHUFFLE MCQ CHOICES ----
        # data structure example:
        # {
        #   "Course Name": {
        #       "mcq": [ {question, choices, answer}, ... ]
        #   }
        # }

        # Loop through each course inside the JSON file
        for course_name, content in data.items():

            # Check if this course contains MCQ questions
            if "mcq" in content:

                # Loop through each MCQ question
                for mcq in content["mcq"]:

                    # Get the choices dictionary (e.g., {"A": "...", "B": "...", "C": "..."})
                    choices = mcq["choices"]

                    # Store the correct answer key (e.g., "B")
                    correct_key = mcq["answer"]

                    # Store the correct answer value (actual text of the answer)
                    correct_value = choices[correct_key]

                    # Convert choices into separate lists of keys and values
                    keys = list(choices.keys())
                    values = list(choices.values())

                    # Combine keys and values into pairs so they stay linked
                    combined = list(zip(keys, values))

                    # Randomly shuffle the combined (key, value) pairs
                    random.shuffle(combined)

                    # Prepare a new choices dictionary after shuffling
                    new_choices = {}

                    # This will store the new key of the correct answer
                    new_answer_key = None

                    # Reassign new keys (A, B, C, ...)
                    for i, (old_key, value) in enumerate(combined):

                        # Generate a new key starting from 'A'
                        new_key = chr(ord('A') + i)

                        # Assign the shuffled value to the new key
                        new_choices[new_key] = value

                        # If this value is the correct answer, store its new key
                        if value == correct_value:
                            new_answer_key = new_key

                    # Update the MCQ with the shuffled choices
                    mcq["choices"] = new_choices

                    # Update the answer to the new correct key
                    mcq["answer"] = new_answer_key

        # ---- SAVE UPDATED JSON FILE ----
        # Overwrite the original file with the updated (shuffled) content
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)


print("All JSON files processed and choices rearranged.")

