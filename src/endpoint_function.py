import os

def ping(name="JM"):
    return {"status":"success","response":{"datos":"esto es un ping a los endpoints de "+name}}

def post_progress_user(json_value):
    return  {"status":"success","response":{"datos":json_value}}

def ip_publica():
    IP = os.popen("curl ifconfig.me").read()
    return IP

def ip_private():
    IP = os.popen("hostname -I | awk '{print $1}'").read()
    return IP

def ip_salida_():
    publica = ip_publica()
    privada = ip_private()
    return  {"status":"success","response":{"public":publica,"private":privada}}
