# This is the Docker file created by Rajesh 

FROM python:alpine3.10
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
     
EXPOSE 5000
COPY . /app
ENTRYPOINT ["python", "./launch.py"]

#CMD python ./launch.py
#COPY requirements.txt /app/requirements.txt
#ENTRYPOINT ["python", "./launch.py"]
