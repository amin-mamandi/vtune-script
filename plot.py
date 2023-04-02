import argparse
import pandas as pd
import matplotlib.pyplot as plt

# Parse the command line arguments
parser = argparse.ArgumentParser(description='Plot rows from a CSV file')
parser.add_argument('filename', type=str, help='Name of the CSV file')
parser.add_argument('rownames', type=str, nargs='+', help='Names of the rows to plot')
parser.add_argument('pattern', type=str, help='Pattern to match in column names')
args = parser.parse_args()

# Load the CSV file into a Pandas DataFrame
df = pd.read_csv(args.filename, index_col=0)

# Filter the DataFrame to select only columns that match the pattern
pattern_cols = [col for col in df.columns if args.pattern in col]
df = df[pattern_cols]

# Convert the row values to numeric if necessary
df = df.apply(pd.to_numeric)

# Define a custom sorting function that extracts the numerical part of a column name
def sort_key(col_name):
    num_part = ''.join(filter(str.isdigit, col_name))
    return int(num_part) if num_part else col_name

# Get a sorted list of the column names using the custom sorting function
sorted_cols = sorted(df.columns, key=sort_key)

# Reorder the DataFrame based on the sorted column names
df = df[sorted_cols]

# Create a bar plot with multiple rows
fig, ax = plt.subplots()
for i, rowname in enumerate(args.rownames):
    row = df.loc[rowname]
    x_coords = [x + i * 0.1 for x in range(len(sorted_cols))]
    ax.bar(x_coords, row, width=0.1, align='center', label=rowname)
ax.set_xticks(range(len(sorted_cols)))
ax.set_xticklabels(sorted_cols)
ax.set_xlabel('Column')
ax.set_ylabel('Value')
ax.set_title(', '.join(args.rownames))
ax.legend()

# Display the plot
plt.show()

