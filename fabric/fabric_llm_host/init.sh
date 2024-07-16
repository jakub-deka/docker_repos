#!/usr/bin/env bash

ollama serve &
ollama list
ollama pull llama3:instruct

ollama serve &
ollama list
ollama pull phi3:latest