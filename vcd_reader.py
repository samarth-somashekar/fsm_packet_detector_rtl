from vcdvcd import VCDVCD

# Load VCD and get items safely
vcd = VCDVCD("packet.vcd", store_tvs=True)
data_items = list(vcd.data.items())

# Correct signal mappings based on your debug:
Y_data = data_items[0][1]["tv"]        # "!" = Y
state_data = data_items[1][1]["tv"]    # "\"" = state[1:0]
X_data = data_items[2][1]["tv"]        # "#" = X[7:0]

# Helper function to get value at time t
def get_val(tv_list, t):
    last = "x"
    for time, val in tv_list:
        if time > t:
            break
        last = val
    return last

print("\n=== FSM Signal Timeline ===\n")

for t, x_val in X_data:
    state = get_val(state_data, t)
    y_val = get_val(Y_data, t)

    print(f"Time: {t} ns | X: {x_val} | State: {state} | Y: {y_val}")

    if state == "11" and y_val == "1":
        print(f"\n✅ PACKET DETECTED at {t} ns!")
        break
