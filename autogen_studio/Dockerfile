FROM python:slim

RUN apt-get update && apt-get upgrade
RUN pip install --upgrade pip
RUN pip install autogenstudio

ENV PATH="/home/app/.local/bin:${PATH}"
ENV PYTHONPATH="/home/app/.local/bin:/app:${PYTHONPATH}"

ENV OPENAI_API_KEY="your-key-here"

RUN autogenstudio version

EXPOSE 8081

ENTRYPOINT [ "autogenstudio", "ui", "--host", "0.0.0.0", "--port", "8081"]

# https://github.com/WaywardHayward/autogen-studio-dockerfile/tree/main
# docker build -t autogenstudio .
# docker run -it --rm -p 8081:8081  -e "OPENAI_API_KEY=your_openai_api_key" autogenstudio
