FROM python:alpine
RUN python -m pip install flask
WORKDIR /app
COPY app.py /app/app.py
ENV PORT=5000
CMD ["python", "app.py"]
