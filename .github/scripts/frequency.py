import sys
from collections import Counter


def count_vowels(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        text = file.read().lower()

    counts = Counter(text)
    return {vowel: counts[vowel] for vowel in "aeiou"}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 frequency.py <file_path>", file=sys.stderr)
        sys.exit(1)

    try:
        result = count_vowels(sys.argv[1])
    except FileNotFoundError:
        print(f"File not found: {sys.argv[1]}", file=sys.stderr)
        sys.exit(1)

    print(result)