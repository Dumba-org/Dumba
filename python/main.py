from fastapi import FastAPI
from fastapi.responses import JSONResponse
import json

app = FastAPI()

@app.get('/')
async def index():
    return {'message': 'connection confirmation'}

@app.get('/blog')
async def getblog():
    with open('blogs.json') as f:
        blogs = json.load(f)
    return JSONResponse(blogs)