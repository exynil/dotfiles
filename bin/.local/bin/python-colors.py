rows = 30
cols = 12

for i in range(0, rows):
    for j in range(1, cols + 1):
        color = i * cols + j
        print("\033[38;5;{}m [{:3}]\033[0;0m".format(color, color), end='')

    print()