import aritmatika as art

BB = float(input('Masukkan Berat Badan (kg): '))
TB = float(input('Masukkan Tinggi Badan (meter): '))

BMI = art.BMI(BB, TB)
print('BMI kamu adalah', BMI)

art.BMI_check(BMI)