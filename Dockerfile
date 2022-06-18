from python:3.7-slim
expose 8501
cmd mkdir -p /app
WORKDIR /app
copy requirements.txt ./requirements.txt
copy haarcascade_frontalface_default.xml ./haarcascade_frontalface_default.xml
copy Case_1.h5 ./Case_1.h5 
RUN pip install --upgrade pip
run pip install -r requirements.txt
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
ENTRYPOINT [ "streamlit","run"]
CMD [ "main.py" ]
