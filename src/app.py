from typing import Optional
import uvicorn
from fastapi import FastAPI
from __init__ import environment
from endpoint_function import ping,post_progress_user

if (environment == 'production'):
    app = FastAPI()
else:
    app = FastAPI(debug=True)


@app.get("/",status_code=200)
def status():
    return ping()

@app.get("/ping_nombre/{name}",status_code=200)
def ping_nombre(name:str):#def read_item(item_id: int, q: Optional[str] = None):#@app.get("/items/{item_id}")#http://localhost:8080/items/1?q=ola
    return ping(name)

@app.post("/ping_nombre_post/", status_code = 201)
def progreso_usuario(json_value):
    return post_progress_user(json_value)


if __name__ == "__main__":
    if (environment == 'production'):
        uvicorn.run(app, host="0.0.0.0", port=8080,debug=True)
    