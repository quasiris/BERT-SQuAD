FROM ubuntu:18.04

COPY requirements.txt /
COPY api.py bert.py utils.py /app/

RUN apt-get update --fix-missing
RUN apt-get install make automake gcc g++ subversion python3-dev python3-pip -y
RUN pip3 install -r /requirements.txt

# Workaround for issue: https://github.com/huggingface/transformers/issues/438
RUN sed -i -e 's/"classifier"/"qa_outputs"/g' /usr/local/lib/python3.6/dist-packages/transformers/modeling_bert.py

WORKDIR /app

CMD ["python3", "api.py"]