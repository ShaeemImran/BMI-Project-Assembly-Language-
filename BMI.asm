
msg1 byte 0dh,0ah,"BMI Calculator",0dh,0ah,0
msg2 byte "Metric Systems:",0dh,0ah,0
msg3 byte "1. Metric Units",0dh,0ah,0
msg4 byte "2. US Units",0dh,0ah,0
msg5 byte "Choose Metric System (option number): ",0
msg6 byte "Enter your age (2-120): ",0
msg7 byte "Enter your gender (Male/Female): ",0
msg81 byte "Enter your height (centimeters): ",0
msg82 byte "Enter your height (inches): ",0
msg91 byte "Enter your weight (kilograms): ",0
msg92 byte "Enter your weight (pounds): ",0
msg10 byte "Severe Thinness",0
msg11 byte "Moderate Thinness",0
msg12 byte "Mild Thinness",0
msg13 byte "Normal",0
msg14 byte "Overweight",0
msg15 byte "Obese Class I",0
msg16 byte "Obese Class II",0
msg17 byte "Obese Class III",0
msg18 byte "Underweight",0
msg19 byte "Healthy Weight",0
msg20 byte "At Risk of Overweight",0
msg21 byte "Overweight",0
msg22 byte "Weight-for-age Percentile: ",0
msg23 byte "Height-for-age Percentile: ",0
msg24 byte "Ponderal Index: ",0
msg25 byte "Your BMI: ",0
msg26 byte "Invalid Gender Entry! Enter either male or female.",0dh,0ah,0
msg27 byte "Invalid Age Entry! Please provide an age between 2 and 120.",0dh,0ah,0
system dword ?
age dword ?
gender byte 7 dup(?)
height dword ?
weight dword ?
bmi dword ?
.code
main proc
mov edx,offset msg1         ;Printing BMI Calculator
call WriteString

bmi_calculator:
call crlf
mov edx,offset msg2         ;Unit System Choice (line 41-50)
call WriteString
mov edx,offset msg3
call WriteString
mov edx,offset msg4
call WriteString
mov edx,offset msg5
call WriteString
call ReadInt
mov system,eax

mov edx,offset msg6         ;Age Input (line 52-55)
call WriteString
call ReadInt
mov age,eax

mov edx,offset msg7         ;Gender Input (line 57-61)
call WriteString
mov edx, offset gender
mov ecx,7
call ReadString

cmp system,1                ;Jumping to Chosen System 
je metric_unit

us_unit:
mov edx,offset msg82
call WriteString
call ReadInt
mov height,eax
mov edx,offset msg92
call WriteString
call ReadInt
mov weight,eax
mov eax,age
cmp eax, 2
jl invalid_age
cmp eax, 120
jg invalid_age
mov eax, height
imul eax, eax
mov ecx, eax           ; height*height
mov eax, weight
imul eax,703
cdq                    ; sign-extend eax into edx:eax
idiv ecx               
mov bmi, eax
mov edx, offset msg25
call WriteString
call WriteDec
jmp functionality

metric_unit:
mov edx,offset msg81
call WriteString
call ReadInt
mov height,eax
mov edx,offset msg91
call WriteString
call ReadInt
mov weight,eax
mov eax,age
cmp eax, 2
jl invalid_age
cmp eax, 120
jg invalid_age
mov eax, height
imul eax, eax
mov ecx, eax           ; height*height
mov eax, weight
imul eax, 10000        ; Calculate BMI = (weight * 10000) / (height * height)
cdq                    ; sign-extend eax into edx:eax
idiv ecx               
mov bmi, eax
mov edx, offset msg25
call WriteString
call WriteDec
jmp functionality

functionality:
call crlf
mov eax,age
cmp eax, 20
jge adults

child_teens:
mov al, gender[0] 
cmp al, "f"
cmp al, "F"
je female

cmp al, "m"
cmp al, "M"
je male
jne invalid_gender 

male:
mov eax, bmi
cmp eax, 17
jl underweight
cmp eax, 22
jle h_weight
cmp eax, 24
jle r_weight
jg c_overweight

female:
mov eax, bmi
cmp eax, 16
jl underweight
cmp eax, 21
jle h_weight
cmp eax, 23
jle r_weight
jg c_overweight

underweight:
mov edx, offset msg18
call WriteString
exit

h_weight:
mov edx, offset msg19
call WriteString
exit

r_weight:
mov edx, offset msg20
call WriteString
exit

c_overweight:
mov edx, offset msg21
call WriteString
exit

adults: 
mov eax,bmi
cmp eax, 16
jl s_thin
cmp eax, 17
jle md_thin
cmp eax, 18
jle m_thin
cmp eax, 25
jle normal
cmp eax, 30
jle overweight
cmp eax, 35
jle o_c1
cmp eax, 40
jle o_c2
jg o_c3

s_thin:
mov edx, offset msg10
call WriteString
exit

md_thin:
mov edx, offset msg11
call WriteString
exit

m_thin:
mov edx, offset msg12
call WriteString
exit

normal:
mov edx, offset msg13
call WriteString
exit

overweight:
mov edx, offset msg14
call WriteString
exit

o_c1:
mov edx, offset msg15
call WriteString
exit

o_c2:
mov edx, offset msg16
call WriteString
exit

o_c3:
mov edx, offset msg17
call WriteString
exit

invalid_gender:
mov edx,offset msg26
call WriteString
jmp bmi_calculator

invalid_age:
mov edx,offset msg27
call WriteString
jmp bmi_calculator

exit
main endp
end main
