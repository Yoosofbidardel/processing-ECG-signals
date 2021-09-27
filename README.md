# processing-ECG-signals

# augmented leads

we are given leads I and II  and based on relations between these two and the other leads, we can determine them.

here is the output:

![image](https://user-images.githubusercontent.com/70627266/134860714-2901e33e-2f6c-4046-aa73-278c17bd114d.png)

# VCG and QRS

also, we calculated and depicted the VCG and QRS based on mathematical relations.


![image](https://user-images.githubusercontent.com/70627266/134860735-c5b75636-b47a-4280-9380-52af91cdd1a0.png)
![image](https://user-images.githubusercontent.com/70627266/134860767-5c7e60ea-0c71-46c1-ba84-f364a3f43464.png)


# beat rate

I used a threshold to determine the pulses. when passing 600 threshold, the boolean if would become 1. and at the end, half of the numbers is the pace.(since we calculated them twice)>



# how to run

for using the code you can simply open * main.m *  and uncomment the code.

ECG1_500Hz.mat  is the dataset
