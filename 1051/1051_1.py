from math import pow
from math import floor
from collections import OrderedDict

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

    
def input_float(prompt):
    while True:
        num = input(prompt)
        try:
            float(num)
        except ValueError:
            print("输入有误，请重新输入")
            continue
        else:
            if get_precise(num) != 1 or  get_int_length(num) > 5 or float(num) < 0:
                print("输入有误，请重新输入")
                continue
            else:
                return float(num)

def input_int(prompt):
    while True:
        num = input(prompt)
        try:
            int(num)
        except ValueError:
            print("输入有误，请重新输入")
            continue
        else:
            return int(num)
            
                
def input_data():
    data = OrderedDict({})
    data['raws'] = OrderedDict({})
    data['divs'] = OrderedDict({})
    data['deltas'] = OrderedDict({})
    data['us'] = OrderedDict({})
    data['div'] = 0
    data['Ex'] = 0.0
    data['u_ex_div_by_ex'] = 0.0
    print("实验：自组电位差计")
    print("请参照课本P165表格输入，其中R\'\'为灵敏度测量两个阻值")
    print("要求输入的数字小于99999.9大于0.0，保留一位有效数字")
    data['raws']['R1'] = input_float("R1=")
    data['raws']['R2'] = input_float("R2=")
    data['raws']['R1\''] = input_float("R1\'=")
    data['raws']['R2\''] = input_float("R2\'=")
    data['divs']['R1\'\''] = input_float("R1\'\'=")
    data['divs']['R2\'\''] = input_float("R2\'\'=")
    data['div'] = input_int("div=")
    return data
    
def cal_delta(data):
    print("HINT：下面的数值都多保留了一些小数，请根据“四舍六入五取偶”来取舍")
    for name, value in data['raws'].items():
        delta = 0.0
        value = str(value).replace(".","") # for alignment
        index = -len(value)
        print("delta_%s = " % name, end = "")
        while index < 0:
            digi = int(value[index])*pow(10, -2 - index)
            print("%.1fx%.3f + " % (digi,float(zx_21[index])), end="")
            delta += digi*zx_21[index]
            index = index + 1
        print(" 0.02", end="")
        delta += 0.02
        print(" = %0.5f" % delta)
        data['deltas'][name] = delta
    return

def cal_u(data):
    for name,value in data['deltas'].items():
        u = value/g3
        print("u_%s = delta_%s/√3 = %0.4f" % (name, name, u))
        data['us'][name] = u
    return

def cal_s(data):
    S = data['div']/(0.001*data['divs']['R1\'\''] - 0.001*data['raws']['R1\''])
    print("S = %d/(%.5f-%.5f) = %.04f" % (data['div'], 0.001*data['divs']['R1\'\''], 0.001*data['raws']['R1\''], S))
    data['Ex'] = 0.001*data['raws']['R1\''];
    data['deltas']['L_Ex'] = 0.2/S
    print("delta_L_Ex = 0.2/S = %0.10f" % data['deltas']['L_Ex'] )
    data['us']['L_Ex'] = data['deltas']['L_Ex'] / g3;
    print("u_L_Ex = delta_Ex/√3 = %0.10f" % data['us']['L_Ex'] )
    return

def cal_delta_ex_div_by_ex(data):
    r1 = data['raws']['R1']
    ur1 = data['us']['R1']
    r2 = data['raws']['R2']
    ur2 = data['us']['R2']
    r1p = data['raws']['R1\'']
    ur1p =data['us']['R1\'']
    r2p = data['raws']['R2\'']
    ur2p =data['us']['R2\'']
    data['u_ex_div_by_ex'] = (1/(r1+r2))*pow((pow((r2*ur1)/r1,2) + pow(ur2,2) + pow((r2p*ur1p)/r1p,2)+pow(ur2p,2)),0.5)
    print("u_Ex/Ex = （公式太长了，自己看书吧） = %0.8f" % data['u_ex_div_by_ex'])
    return
    
    
def cal_u_ex(data):
    data['us']['Ex'] = data['Ex']*data['u_ex_div_by_ex']
    print("u_Ex = Ex x (u_Ex/Ex) = %.08f" % data['us']['Ex'])
    return

def main():
    data = input_data()
    cal_delta(data)
    cal_u(data)
    cal_s(data)
    cal_delta_ex_div_by_ex(data)
    cal_u_ex(data)
    
if __name__ == "__main__":
    main()