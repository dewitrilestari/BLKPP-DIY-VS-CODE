def add(a, b):
    total = a + b
    return total


# jumlah = add(10, 5)
# print(f"Jumlah dari 10 + 5 = {jumlah}")


# def add2(a, b, c, d):
#     total2 = a + b * c / d
#     return total2


# jumlah2 = add2(10, 10, 2, 5)
# print(f"Jumlahnya adalah = {jumlah2}")


# def add3(a=None, b=None):
#     if a == None or b == None:
#         print(f"Parameter tidak lengkap")
#         return
#     total3 = a + b
#     return total3


# Pengurangan
def subsstract(a=None, b=None):
    if a == None or b == None:
        print(f"Parameter tidak lengkap")
        return
    total4 = a - b
    return total4


def BMI(berat=None, tinggi=None):
    if berat == None or tinggi == None:
        print(f"")
        return
    totalbmi = berat / (tinggi**2)
    return totalbmi

def BMI_check(BMI):
    if BMI<18.5:
        print('Kamu termasuk kategori kurang (Underweight)')
    elif BMI<=22.9:
        print('Kamu termasuk kategori normal (Ideal)')
    elif BMI<=24.9:
        print('Kamu termasuk kategori berat badan (Overweight)')
    else:
        print('Kamu termasuk kategori obesitas')