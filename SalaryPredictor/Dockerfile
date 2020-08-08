FROM centos:7
RUN yum install python36 -y
RUN python3 -m pip install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install matplotlib
RUN pip3 install sklearn 
RUN pip3 install joblib
RUN yum install httpd -y 
EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND

COPY ml.test /var/ww/cgi-bin/
ADD SalaryData.csv /MachineLearning/SalaryData.csv
ADD mycode.py /MachineLearning/mycode.py 
CMD ["python3","/MachineLearning/mycode.py"]
 
