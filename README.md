# MLOpsSalaryPredictor
![Neon Green and White Professional LinkedIn (5)](https://user-images.githubusercontent.com/56602504/89702514-b5985000-d95f-11ea-94a6-d182b4f6ae2c.png)

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

After we are done writing scripts we can save the Dockerfile , Now to build the image for the Dockerfile which we just create we have to run one simple command
docker build -t salarypred . 
I use (.) to tell that I am in the current directory where my Dockerfile exists.
Now comes the jenkins part. This is my job1
As soon as the data of no of years of experience and expected salary is uploaded to the GitHub , Jenkins detects that the data has been uploaded or updated as well. It pull the code via Poll SCM build trigger and copies the data in a folder named machine learning as we are going to apply ML algorithm in that.
Also it mails to the admin that the data has been pulled and copied. To make an Admin up-to-date with the process going on.
JOB-2 of jenkins is to create an Image of above which I've already mentioned in the Dockerfile.
Exactly like this we make two more images for dynamicity
Also as pipeline keeps in building it sends an email to the admin that where the process is currently or finished last process.
After all the images have been build it copies it machine learning code to the location /var/www/cgi-bin/ from where clients can access the webpage and ask a query for which our trained machine will predicts the estimated answer.
So now it's time to test. With the help of web-server we can enter the no. of years of experience we have and it predicts the estimated salary.
Let's say user entered no of years of experience : 2 (x=2) . We get
Let's say user entered no of years of experience : 3 (x=3) . We get
Let's say user entered no of years of experience : 5 (x=5) . We get
Here is a demo video!!
