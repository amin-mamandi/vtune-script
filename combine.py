import os
import pandas as pd


# Define a sorting function to sort the columns based on their names
def sort_column_names(col_name):
    # Sort by the first 5 characters of the column name
    return col_name[:5]


# Set the directory containing the CSV files to be combined
directory = "/home/a972m888/Desktop/mba80-16c"

# Get a list of all the CSV files in the directory
csv_files = [f for f in os.listdir(directory) if f.endswith('.csv')]

# Create an empty dictionary to hold the DataFrames for each file
dfs = {}

# Loop through the CSV files and read them into DataFrames
for csv_file in csv_files:
    # Read the CSV file into a DataFrame
    temp_df = pd.read_csv(os.path.join(directory, csv_file), index_col=0)

    # Rename the columns to include the file name (without the .csv extension)
    temp_df = temp_df.add_prefix(os.path.splitext(csv_file)[0] + '_')

    # Add the DataFrame to the dictionary
    dfs[csv_file] = temp_df

# Concatenate the DataFrames into a single DataFrame with each file as a separate column
df = pd.concat(dfs.values(), axis=1, keys=dfs.keys())

# Delete every other column starting from column 4
to_delete = [i for i in range(4, df.shape[1], 2)]
df = df.drop(df.columns[to_delete], axis=1)

# Sort the columns based on the sorting function
#df = df.sort_index(axis=1, key=sort_column_names)

# Write the combined DataFrame to a new CSV file
df.to_csv(os.path.join(directory, 'combined.csv'),  index=False)
