# BMI-Project-Assembly-Language-
Here is a clean, professional README for your **BMI Calculator (Assembly Language)** project:

---

# BMI Calculator (x86 Assembly Language)

Overview:
This project is a BMI (Body Mass Index) Calculator developed in x86 Assembly Language using the Irvine32 library. The program calculates BMI based on user input and categorizes the result according to age and gender.

Technologies Used:
* Language: x86 Assembly
* Library: Irvine32
* Environment: MASM (Microsoft Macro Assembler)

Features:
* Supports two measurement systems:

  * Metric Units (centimeters, kilograms)
  * US Units (inches, pounds)

* Accepts:

  * Age (2–120)
  * Gender (Male/Female)
  * Height
  * Weight

* Validates:

  * Age range
  * Gender input

* Calculates BMI using:

  Metric Formula:
  BMI = (weight × 10000) / (height × height)

  US Formula:
  BMI = (weight × 703) / (height × height)

* Categorizes BMI based on:
  * Adults (20+ years)
  * Children and Teens (2–19 years, gender-based ranges)

Adults:
* Severe Thinness
* Moderate Thinness
* Mild Thinness
* Normal
* Overweight
* Obese Class I
* Obese Class II
* Obese Class III

Children and Teens:
* Underweight
* Healthy Weight
* At Risk of Overweight
* Overweight

 Program Flow:
1. User selects measurement system
2. User enters age and gender
3. User inputs height and weight
4. BMI is calculated
5. BMI category is displayed
6. Invalid inputs restart the program

Concepts Demonstrated:
* Use of registers (EAX, ECX, EDX)
* Integer arithmetic (IMUL, IDIV)
* Conditional branching (CMP, JE, JL, JG)
* Input/Output using Irvine32
* Procedure structure in assembly



If you want, I can also make a slightly more technical version (better for internships) or a simpler one (for quick GitHub upload).
