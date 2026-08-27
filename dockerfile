#Use a lightweight Base Image
FROM python:3.12-slim

#Set Environment Variables to prevent python from write .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

# Now, set the working directory inside the container
WORKDIR /app

#Copy only the required Files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

#Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Expose the port app runs on
EXPOSE 5600

#Run the Application
CMD ["python","app.py"]
