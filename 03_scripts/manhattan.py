import pandas as pd
import matplotlib.pyplot as plt

# 读取数据
df = pd.read_csv('your_file.csv', delimiter='\t')

# 计算曼哈顿坐标
chromosomes = df['chromosome'].unique()
positions = []
for chromosome in chromosomes:
    pos = df.loc[df['chromosome'] == chromosome, 'position']
    cum_pos = pos.cumsum() - pos.iloc[0]
    positions.append(cum_pos)

# 绘制曼哈顿图
fig, ax = plt.subplots(figsize=(10, 6))
colors = plt.cm.Set1.colors
for i, (chromosome, pos) in enumerate(zip(chromosomes, positions)):
    ax.scatter(pos, -df.loc[df['chromosome'] == chromosome, 'pvalue'],
               c=colors[i % len(colors)], label=chromosome)
ax.set_xlabel('Position')
ax.set_ylabel('-log10(p-value)')
ax.set_title('Manhattan plot')
ax.legend()
plt.show()
