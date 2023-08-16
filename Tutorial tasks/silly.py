def silly ():
 i = 0
 while (i < 60):
   print(" Silly" ,end='')
   i += 1


def main ():
    name = input("What is your name ? ")
    if (name == "Dilni") or (name == "Zafarayab"):
        print(" is an awesome name! ")
    else:
      silly ()
     # i = 0
     # while (i < 60):
     #      print(" Silly")
     # i += 1
main()