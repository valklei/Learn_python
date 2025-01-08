import os
import argparse
import subprocess

def main():
    parser = argparse.ArgumentParser(description="Execute a Python script.")
    parser.add_argument("--exec", type=str, required=True, help="Path to the Python script")
    args = parser.parse_args()

    script_path = args.exec
    if not os.path.exists(script_path):
        print(f"Ошибка: файл '{script_path}' не существует.")
        return

    if not script_path.endswith(".py"):
        print(f"Ошибка: файл '{script_path}' не является Python-скриптом.")
        return

    try:
        # result = subprocess.run(["python", script_path], check=True, text=True, capture_output=True)
        print("Script executed successfully:")
        os.system(f"python {script_path}")
        # print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Error while executing script:")
        print(e.stderr)

#
# if __name__ == "__main__":
#     main()
#



import os
import argparse

def list_tree():
    parser = argparse.ArgumentParser()
    parser.add_argument('directory', type=str)
    args = parser.parse_args()



    if not os.path.isdir(args.directory):
        print(f"Ошибка: Директория {args.directory} не существует.")
        return

    for root, dirs, files in os.walk(args.directory):
        for dir_name in dirs:
            dir_path = os.path.join(root, dir_name)
            print(f"Директория: {dir_path}")
        for file_name in files:
            file_path = os.path.join(root, file_name)
            print(f"Файл: {file_path}")

if __name__ == "__main__":
    list_tree()
