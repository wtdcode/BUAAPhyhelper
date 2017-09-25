from collections import OrderedDict
from math import pow
from math import floor

zx_21 = [
    1e-3, # x10000
    1e-3, # x1000
    1e-3, # x100
    2e-3, # x10
    5e-3, # x1
    5e-2, # x0.1
]

g3 = 1.7320508075688772

def get_precise(num):
    num = str(num)
    length = len(num)
    for index in range(length):
        if num[index] == '.':
            return length - index - 1
    else:
        return -1

        
def get_int_length(num):
    return len(str(int(floor(float(num)))))

def input_float(prompt, precise = 6):
    while True:
        num = input(prompt)
        try:
            float(num)
        except ValueError:
            print("输入有误，请重新输入")
            continue
        else:
            if get_precise(num) > precise or  get_int_length(num) > 5 or float(num) < 0:
                print("输入有误，请重新输入")
                continue
            else:
                return float(num)

def input_data():
    data = OrderedDict({})
    data['deltas'] = OrderedDict({})
    data['us'] = OrderedDict({})
    data['raws'] = OrderedDict({})
    data['raws']['R1'] = input_float("R1=", 1)
    data['raws']['U1'] = input_float("U1=")
    data['raws']['Ux'] = input_float("Ux=")
    return data

def cal_delta(data):

    # calculate delta_r1
    tp_r1 = str(data['raws']['R1']).replace(".",""); # for alignment
    index = -len(tp_r1)
    delta = 0.0
    print("delta_R1 = ", end = "")
    while index < 0:
        digi = int(tp_r1[index])*pow(10, -2 - index)
        print("%.1fx%.3f + " % (digi,float(zx_21[index])), end="")
        delta += digi*zx_21[index]
        index = index + 1
    print(" 0.02", end="")
    delta += 0.02
    print(" = %0.5f" % delta)
    data['deltas']['R1'] = delta
    
    # calculate delta_U1
    data['deltas']['U1'] = 0.0001*(data['raws']['U1'] + 0.1/10)
    print("delta_Ux = 0.01%%x(U1+U0/10) = %.10f" % data['deltas']['U1'])
    
    # calculate delta_Ux
    data['deltas']['Ux'] = 0.0001*(data['raws']['Ux'] + 0.1/10)
    print("delta_Ux = 0.01%%x(Ux+U0/10) = %.10f" % data['deltas']['Ux'])
    
    return
    
def cal_u(data):
    for name,value in data['deltas'].items():
        u = value/g3
        print("u_%s = delta_%s/√3 = %0.10f" % (name, name, u))
        data['us'][name] = u
    return

def cal_urx_div_by_rx(data):
    r1 = data['raws']['R1']
    ur1 = data['us']['R1']
    u1 = data['raws']['U1']
    uu1 = data['us']['U1']
    ux = data['raws']['Ux']
    uux = data['us']['Ux']
    print(r1, ur1, u1, uu1, ux, uux)
    urx_div_by_rx = pow(pow(ur1/r1,2)+pow(uux/ux,2)+pow(uu1/u1,2),0.5)
    print("u_Rx/Rx = √((u_R1/R1)^2 + (u_Ux/Ux)^2 + (u_U1/U1)^2) = %.10f" % urx_div_by_rx)
    data['urx_div_by_rx'] = urx_div_by_rx
    return
    
def main():
    print("实验：箱式电位差计测固定电阻")
    print("所有结果均保留了十位")
    print("R1->变阻箱阻值（请保留一位小数） Ux->固定电阻两段阻值 U1->变阻箱两段阻值")
    data = input_data()
    cal_delta(data)
    cal_u(data)
    cal_urx_div_by_rx(data)
    return

if __name__ == "__main__":
    main()