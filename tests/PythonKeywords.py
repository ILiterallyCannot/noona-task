from random import randint

def lib_keyword(string):
    print(string)

def return_array_length(array):
    return len(array[0])

def find_answer(array, thing_name):
    for thing in array[0]:
        if thing.get("name") == thing_name:     
            return thing.get("answer_count")
    raise Exception(f"{thing_name} not found")

def generate_thing():
    return "macaroni_" + str(randint(1,10000))