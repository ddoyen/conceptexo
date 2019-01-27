@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ data_conjugaison.txt [data.txt]


title = Conjugaison d'un verbe

before ==
import json
import random
with open('data.txt') as json_file:  
    data = json.load(json_file)
    verbe=random.choice(list(data["verbe"].keys()))
    t=data["verbe"][verbe]['terminaison']
    sol=data["verbe"][verbe]['base']+data["terminaison"][t]['2p']
    
text="""Conjuguer le verbe {} à la 2e personne du pluriel""".format(verbe)
==

form==
<div class="input-group">
<input id="form_answer" type="text" class="form-control" value="{{ answers__.answer }}" required/>
</div>
==

evaluator ==
ans=response['answer']
if sol==ans:
    grade=(100,"Bonne réponse")
else:
    grade=(0,"Mauvaise réponse")
==



