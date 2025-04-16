## 添加取反运算
* 指令格式 0000_1110_DR_0000
* 汇编语句 NOT DR
* 操作数个数 1
* CZVS ....
* 指令类型 A组指令
* 功能说明 DR <- ~DR

## 添加无符号除法运算
* 指令格式 0000_1111_DR_SR
* 汇编语句 DIV DR,SR
* 操作数个数 2
* CZVS ****
* 指令类型 A组指令
* 功能说明 DR <- DR/SR

## 添加无符号乘法运算
* 指令格式 0001_0000_DR_SR
* 汇编语句 MUL DR,SR
* 操作数个数 2
* CZVS ****
* 指令类型 A组指令
* 功能说明 DR <- DR*SR

## 添加堆栈指针操作命令
* 指令格式 PUSH 1000_0100_0000_SR   POP 1000_0101_DR_0000
* 汇编语句 PUSH SR          POP DR
* 操作数个数 1
* CZVS ....
* 指令类型 B组指令
* 功能说明 PUSH [SP - 1] <- SR      SP <- SP - 1
           POP  DR <- [SP]      SP <- SP + 1

## 添加循环左移右移命令（使用寄存器作为移位次数）
* 指令格式 ROL 0001_0001_DR_SR   ROR 0001_0010_DR_SR
* 汇编语句 ROL DR SR             ROR DR SR
* 操作数个数 2
* CZVS ....
* 指令类型 A组指令
* 功能说明  ROL DR <- (DR << SR)    ROR DR <- (DR >> SR)