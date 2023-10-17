import math

num = int(input("Enter the number of q-points: "))
temp1, temp2, temp3 = 0, 0, 0
qx, qy, qz = 0, 0, 0
qx1, qy1, qz1 = 0, 0, 0
q = [0.0] * 500  # coordinate of q
freq = [[0.0] * 9 for _ in range(500)]  # phonon frequencies

# Input - Copy the content of the freq file
for i in range(num):
    qx, qy, qz = map(float, input().split())
    for j in range(9):
        temp1, temp2, freq[i][j], temp3 = map(float, input().split())
    
    temp = (qx - qx1) ** 2 + (qy - qy1) ** 2 + (qz - qz1) ** 2
    if i != 0:
        q[i] = math.sqrt(temp) + q[i - 1]
    else:
        q[i] = math.sqrt(temp)
    qx1, qy1, qz1 = qx, qy, qz

# Output
for i in range(num):
    print(q[i], end=' ')
    for j in range(9):
        print(freq[i][j], end=' ')
    print()

