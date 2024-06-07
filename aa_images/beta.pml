delete all

load ../aa_model/VAL_model.pdb
load ../aa_model/ILE_model.pdb
load ../aa_model/THR_model.pdb

fit /VAL_model////n+ca+c, /ILE_model////n+ca+c, matchmaker=-1
fit /THR_model////n+ca+c, /ILE_model////n+ca+c, matchmaker=-1

set_view (\
     0.165589988,    0.612089694,    0.773244143,\
    -0.961044908,   -0.075772040,    0.265791357,\
     0.221271902,   -0.787133098,    0.575707614,\
    -0.000381663,    0.000034883,  -15.657435417,\
    53.966224670,   77.984649658,   66.646339417,\
    12.017109871,   19.278739929,  -20.000000000 )

# set_view (\
#      0.165589988,    0.612089694,    0.773244143,\
#     -0.961044908,   -0.075772040,    0.265791357,\
#      0.221271902,   -0.787133098,    0.575707614,\
#     -0.000381663,    0.000034883,  -17.928565979,\
#     53.966224670,   77.984649658,   66.646339417,\
#     14.288230896,   21.549869537,  -20.000000000 )

set_view (\
     0.165589988,    0.612089694,    0.773244143,\
    -0.961044908,   -0.075772040,    0.265791357,\
     0.221271902,   -0.787133098,    0.575707614,\
    -0.000383741,    0.000032783,  -15.676591873,\
    54.003097534,   77.643722534,   66.720947266,\
    12.017109871,   19.278739929,  -20.000000000 )

set_view (\
     0.177817136,    0.640326679,    0.747223973,\
    -0.949978769,   -0.086403228,    0.300113231,\
     0.256726742,   -0.763210177,    0.592942417,\
    -0.000383741,    0.000032783,  -15.676591873,\
    54.003097534,   77.643722534,   66.720947266,\
    12.017109871,   19.278739929,  -20.000000000 )

#viewport 1200,1200

bg white

alter 1/n, formal_charge=+1
alter 1/oxt, formal_charge=-1
alter 1/n, formal_charge=+1
alter 1/oxt, formal_charge=-1
alter 1/n, formal_charge=+1
alter 1/oxt, formal_charge=-1

h_add 1/n
remove 1/hxt

set_dihedral /VAL_model////n, /VAL_model////ca, /VAL_model////cb, /VAL_model////cg1, 180. 
set_dihedral /ILE_model////n, /ILE_model////ca, /ILE_model////cb, /ILE_model////cg1, 300.
set_dihedral /THR_model////n, /THR_model////ca, /THR_model////cb, /THR_model////og1, 300.
unpick

util.cbaw 1/

# cat(paste0("color ", sub("#", "0x", rgb(t(col2rgb(cols)), maxColorValue=255)), ", 1/", names(cols)), sep="\n")

color 0x61D04F, 1/HA
color 0x2297E6, 1/HB
color 0x9E9E9E, 1/HG12
color 0xF5C710, 1/HG13
color 0xCD0BBC, 1/HG2*
color 0xFFC0CB, 1/HD1*

color 0x9E9E9E, /VAL_model////HG1*

#draw 1200,1200

disable VAL_model
disable ILE_model
disable THR_model

enable VAL_model
png val180.png, 6cm, 6cm, 300, 1
disable VAL_model

enable ILE_model
png ile300.png, 6cm, 6cm, 300, 1
disable ILE_model

enable THR_model
png thr300.png, 6cm, 6cm, 300, 1
disable THR_model
