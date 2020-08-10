# MLOpsSalaryPredictor
![Neon Green and White Professional LinkedIn (5)](https://user-images.githubusercontent.com/56602504/89702514-b5985000-d95f-11ea-94a6-d182b4f6ae2c.png)

1.Project Title: Employees Salary Predictor.

2. Gist About the Project:
As in the companies when employees get hired, HR is the
one who decides the salary based on multiple criteria one could be : number of years of
experience he/she has. Deciding the salary of employees according to what he/she
deserves could be an important task. As HR being a non-technical person might not be
familiar with high-end technologies.
I’ve created a project using technologies like Machine Learning and DevOps
approach. I’ve provided a web-interface where an HR writes the number of years of
experiences an employee has and using a Machine Learning regression algorithm it
predicts the estimated salary. Also we can update the data and it automatically
updates the current data to the latest data provided and predicts accordingly.

3. Technologies Used: 
I’ve used Machine Learning Linear Regression Algorithm
as the data contains two columns namely : Years of Experience and Salary. Using the
historical data we can predict the salary of an employee.
Also I’ve created a Docker environment using the concept of conterization we can
create a separate environment where we train our machine learning model. So that we
don’t face any dependencies issue. I’ve also used Jenkins for CI/CD as it pulls the ML
code and data from GitHub and does the further automatic process.

4. Conclusion: 
The whole process is when the developer pushes the ML model with
dataset to GitHub , Jenkins being a CI/CD tool pulls the code automatically as soon
as it senses the code has been uploaded to some Source Control Management
System and perform the task i.e building Docker images and run our ML code in
docker environment.
Also with the help of a web-server it provides a URL from which we can access the
webpage. For this complete pipeline admin will be up-to-date where the process is
executing and what all process it has completed by sending admin an email
automatically.

5. Future Scope:
Yes, it has a future scope as we can deploy it on a Mobile App which
would be much easier to manage.

I’ve created a basic project that works on the concept of Applying Machine Learning on DevOps.
We as a developers face problems while installing some softwares but it fails and shoots an error : dependency is not satisfiable. Even to run some application successful we have to downgrade or upgrade some dependencies and we have to keep on changing our environment.
But using the concept of conterization we can create a separate environment where we want to train our machine learning model. We use Docker , With Docker, it’s all just a matter of executing a couple of commands to spin up a container. Docker container can be shipped across platforms , it means the program that runs on Windows development web-server never fails to run on a Linux Production server.

Let's see how's it done..
I have mentioned the required libraries and dependencies to create a separate environment to train ML model. For this I've created a Dockerfile which is an executable script and creates an environment according to our requirement.
![image](https://user-images.githubusercontent.com/56602504/89702553-14f66000-d960-11ea-9039-6d05944ae214.png)

In the first line we use FROM keyword which sets the Base Image / OS for our Dockerfile. Then we write RUN command to run the following commands and to install the following libraries and dependencies.
After this we add the historical dataset which we have and machine learning code to the current folder which here is /MachineLearnig.
We use the CMD to execute our python code for that we give an entrypoint python3 (Version 3) , So that it understands its a python code.
![image](https://user-images.githubusercontent.com/56602504/89702562-29d2f380-d960-11ea-9bba-f88b346f5e34.png)

I also want my Dockerfile to have a web-server configured so I've mentioned to install httpd package and enabled web-server services and exposed it to 80 port number so that our clients have a access.
![image](https://user-images.githubusercontent.com/56602504/89702585-5c7cec00-d960-11ea-9d92-72a41fb62d51.png)

![image](https://user-images.githubusercontent.com/56602504/89702614-9f3ec400-d960-11ea-8b2c-cc31b9bc99e7.png)

After we are done writing scripts we can save the Dockerfile , Now to build the image for the Dockerfile which we just create we have to run one simple command
docker build -t salarypred . 
I use (.) to tell that I am in the current directory where my Dockerfile exists.
Now comes the jenkins part. This is my job1
As soon as the data of no of years of experience and expected salary is uploaded to the GitHub , Jenkins detects that the data has been uploaded or updated as well. It pull the code via Poll SCM build trigger and copies the data in a folder named machine learning as we are going to apply ML algorithm in that.
Also it mails to the admin that the data has been pulled and copied. To make an Admin up-to-date with the process going on.

![image](https://user-images.githubusercontent.com/56602504/89702623-c4333700-d960-11ea-9725-752bf75855b3.png)
![image](https://user-images.githubusercontent.com/56602504/89702655-11afa400-d961-11ea-89e2-3c4ba18ea9af.png)


JOB-2 of jenkins is to create an Image of above which I've already mentioned in the Dockerfile.
![image](https://user-images.githubusercontent.com/56602504/89702695-84208400-d961-11ea-8d43-cf01d727995b.png)
![image](https://user-images.githubusercontent.com/56602504/89702702-9a2e4480-d961-11ea-8d16-37095c36a05e.png)


Exactly like this we make two more images for dynamicity
![image](https://user-images.githubusercontent.com/56602504/89702711-af0ad800-d961-11ea-8a71-40e4f1bf0ca4.png)
![image](https://user-images.githubusercontent.com/56602504/89702714-bf22b780-d961-11ea-9b58-50250cfa0175.png)

Also as pipeline keeps in building it sends an email to the admin that where the process is currently or finished last process.
After all the images have been build it copies it machine learning code to the location /var/www/cgi-bin/ from where clients can access the webpage and ask a query for which our trained machine will predicts the estimated answer.
So now it's time to test. With the help of web-server we can enter the no. of years of experience we have and it predicts the estimated salary.
Let's say user entered no of years of experience : 2 (x=2) . We get
![image](https://user-images.githubusercontent.com/56602504/89702723-cf3a9700-d961-11ea-931d-e9a9d363c9cc.png)

Let's say user entered no of years of experience : 3 (x=3) . We get
![image](https://user-images.githubusercontent.com/56602504/89702730-e2e5fd80-d961-11ea-9a0f-7550961645f6.png)

Let's say user entered no of years of experience : 5 (x=5) . We get
![image](https://user-images.githubusercontent.com/56602504/89702740-ef6a5600-d961-11ea-8556-f343108b2b24.png)

Here is a demo video!!

https://youtu.be/HF_jFQw6x8g


For future scope of this project , I've also integrated my machine learning model with the flutter app, You can find the link below.
https://www.linkedin.com/posts/activity-6698557372614410240-XK_2
