import os          
import json        
import random      



folder_path = "cache"          
backup_folder = "cache_backup" 

os.makedirs(backup_folder, exist_ok=True)

for filename in os.listdir(folder_path):

    if filename.endswith(".json"):

        file_path = os.path.join(folder_path, filename)

        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)  

        backup_path = os.path.join(backup_folder, filename)

        with open(backup_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        for course_name, content in data.items():

            if "mcq" in content:

                for mcq in content["mcq"]:
                    choices = mcq["choices"]
                    correct_key = mcq["answer"]
                    correct_value = choices[correct_key]
                    keys = list(choices.keys())
                    values = list(choices.values())
                    combined = list(zip(keys, values))
                    random.shuffle(combined)
                    new_choices = {}
                    new_answer_key = None
                    for i, (old_key, value) in enumerate(combined):
                        new_key = chr(ord('A') + i)
                        new_choices[new_key] = value
                        if value == correct_value:
                            new_answer_key = new_key
                    mcq["choices"] = new_choices
                    mcq["answer"] = new_answer_key
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)


print("All JSON files processed and choices rearranged.")

