
def ping(name="JM"):
    return {"status":"success","response":{"datos":"esto es un ping a los endpoints de "+name}}

def post_progress_user(json_value):
    return  {"status":"success","response":{"datos":json_value}}

