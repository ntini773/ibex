# bin2vmem.py
import sys

with open(sys.argv[1], "rb") as f:
    data = f.read()

base = 0x00100000
print(f"@{base:08X}", end=" ")

for i in range(0, len(data), 4):
    word = data[i:i+4]
    if len(word) < 4:
        word = word + b'\x00' * (4 - len(word))  # padding
    print(word[::-1].hex().upper(), end=" ")
    base += 1
    if base % 8 == 0:
        print(f"\n@{base:08X}", end=" ")
print()
