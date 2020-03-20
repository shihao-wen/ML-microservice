FROM python:3.7.3-stretch

## Step 1:
# Create a working directory

WORKDIR /app
## Step 2:
# Copy source code to working directory

COPY app.py .
COPY requirements.txt .
COPY model_data/ ./model_data
#COPY output_txt_files ./output_txt_files
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt
## Step 4:
# Expose port 80
EXPOSE 8080
## Step 5:
# Run app.py at container launch
CMD ["python","app.py"]