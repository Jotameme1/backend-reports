import os

def ping(name="JM"):
    return {"status":"success","response":{"datos":"esto es un ping a los endpoints de "+name}}

def post_progress_user(json_value):
    return  {"status":"success","response":{"datos":json_value}}

def ip_salida_():
    IP = os.popen(" curl ifconfig.me").read()
    return  {"status":"success","response":{"datos":IP}}
