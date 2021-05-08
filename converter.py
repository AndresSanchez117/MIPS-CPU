from ensamblador import instructions

file = open("instructions.txt","w+")

n = len(instructions)

for x in range(n):
    opcode = ""
    firstOp = ""
    secondOp = ""
    thirdOp = ""
    inmediate = ""

    base = ""
    convertedInst = ""

    opR = "000000"
    shamt = "00000"
    fn = ""

    jump = ""

    count1 = 0
    count2 = 0
    count3 = 0
    count4 = 0

    #Instruction type:
    # 1: ADDI, ANDI, ORI, BEQ
    # 2: SW, LW 
    # 3: Rtype
    # 4: J
    instType = 0


    #For Opcode
    for i in instructions[x]:
        count1 += 1
        if (i.isspace()) == True:
            break

        opcode += i

    if opcode == "ADDI":
        convertedInst += "001000"
        instType = 1
    elif opcode == "ANDI":
        convertedInst += "001100"
        instType = 1
    elif opcode == "ORI":
        convertedInst += "001101"
        instType = 1
    elif opcode == "BEQ":
        convertedInst += "000100"
        instType = 1
    elif opcode == "SW":
        convertedInst += "101011"
        instType = 2
    elif opcode == "LW":
        convertedInst += "100011"
        instType = 2
    elif opcode == "ADD":
        convertedInst += opR
        fn = "100000"
        instType = 3
    elif opcode == "SUB":
        convertedInst += opR
        fn = "100010"
        instType = 3
    elif opcode == "MUL":
        convertedInst += opR
        fn = "011000"
        instType = 3
    elif opcode == "DIV":
        convertedInst += opR
        fn = "011010"
        instType = 3
    elif opcode == "AND":
        convertedInst += opR
        fn = "100100"
        instType = 3
    elif opcode == "OR":
        convertedInst += opR
        fn = "100101"
        instType = 3
    elif opcode == "XOR":
        convertedInst += opR
        fn = "100110"
        instType = 3
    elif opcode == "NOR":
        convertedInst += opR
        fn = "100111"
        instType = 3
    elif opcode == "SLT":
        convertedInst += opR
        fn = "101010"
        instType = 3
    elif opcode == "J":
        convertedInst += "000010"
        instType = 4


    if instType == 1:
        #For FirstOp
        for j in instructions[x]:
            if count2 > count1+2:
                break
            elif count2 > count1:
                firstOp += j

            count2 += 1

        #For SecondOp
        for k in instructions[x]:
            if count3 > count2+4:
                break
            elif count3 > count2+2:
                secondOp += k

            count3 += 1

        #For Immediate value
        for l in instructions[x]:
            if count4 > count3+2:
                inmediate += l
            
            count4 += 1

        #Conversions
        firstOpInt = int(firstOp)
        secondOpInt = int(secondOp)
        inmediateInt = int(inmediate)

        firstOpBin = format(firstOpInt,'05b')
        secondOpBin = format(secondOpInt,'05b')
        inmediateBin = format(inmediateInt,'016b')

        #Concatenate
        convertedInst += secondOpBin
        convertedInst += firstOpBin
        convertedInst += inmediateBin

    elif instType == 2:
        #For firstOp
        for j in instructions[x]:
            if count2 > count1+2:
                break
            elif count2 > count1:
                firstOp += j

            count2 += 1

        #For offset
        for k in instructions[x]:
            if count3 > count2+4:
                break
            elif count3 > count2+2:
                inmediate += k

            count3 += 1

        #For base
        for l in instructions[x]:
            if count4 > count3+3:
                break
            elif count4 > count3+1:
                base += l
            
            count4 += 1

        #Conversions
        firstOpInt = int(firstOp)
        inmediateInt = int(inmediate)
        baseInt = int(base)

        firstOpBin = format(firstOpInt,'05b')
        inmediateBin = format(inmediateInt,'016b')
        baseBin = format(baseInt,'05b')

        #Concatenate
        convertedInst += baseBin
        convertedInst += firstOpBin
        convertedInst += inmediateBin

    elif instType == 3:
        #For FirstOp
        for j in instructions[x]:
            if count2 > count1+2:
                break
            elif count2 > count1:
                firstOp += j

            count2 += 1

        #For SecondOp
        for k in instructions[x]:
            if count3 > count2+4:
                break
            elif count3 > count2+2:
                secondOp += k

            count3 += 1

        #For ThirdOP
        for l in instructions[x]:
            if count4 > count3+4:
                break
            elif count4 > count3+2:
                thirdOp += l

            count4 += 1
        
        #Conversions
        firstOpInt = int(firstOp)
        secondOpInt = int(secondOp)
        thirdOpInt = int(thirdOp)

        firstOpBin = format(firstOpInt,'05b')
        secondOpBin = format(secondOpInt,'05b')
        thirdOpBin = format(thirdOpInt,'05b')

        #Concatenate
        convertedInst += secondOpBin
        convertedInst += thirdOpBin
        convertedInst += firstOpBin
        convertedInst += shamt
        convertedInst += fn

    elif instType == 4:
        #For Jump offset
        for j in instructions[x]:
            if count2 > count1+2:
                break
            elif count2 > count1:
                jump += j

            count2 += 1

        #Conversions
        jumpInt = int(jump)
        jumpBin = format(jumpInt,'026b')

        #Concatenate
        convertedInst += jumpBin

    #Separeting in 8 bit format
    listInst = list(convertedInst)
    listInst.insert(8,' ')
    listInst.insert(17,' ')
    listInst.insert(26,' ')

    finalInst = ''.join(listInst)

    file.write(finalInst)
    file.write("\n")

file.close()
