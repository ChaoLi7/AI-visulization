import numpy as np
import argparse
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import pandas as pd

def main():
    parser = argparse.ArgumentParser(description='Analyze non-linear relationships between gene expression and phenotype using Random Forests')
    parser.add_argument('-i', '--input', required=True, help='Path to gene expression data file')
    parser.add_argument('-p', '--phenotype', required=True, help='Path to phenotype data file')
    parser.add_argument('-o', '--output', required=True, help='Path to output results file')

    args = parser.parse_args()

    # 读取数据
    gene_expression = pd.read_csv(args.input, sep='\t')
    phenotype = pd.read_csv(args.phenotype, sep='\t', header=None)

    # 分割数据为训练集和测试集
    X_train, X_test, y_train, y_test = train_test_split(gene_expression, phenotype, test_size=0.2, random_state=42)

    # 使用随机森林回归器训练模型
    regr = RandomForestRegressor(random_state=42)
    regr.fit(X_train, y_train.values.ravel())
    
    # 在测试集上测试模型
    y_pred = regr.predict(X_test)
    
    # 计算和打印均方误差
    mse = mean_squared_error(y_test, y_pred)

    # 获取特征重要性并保存到文件
    feature_importances = regr.feature_importances_
    feature_importance_df = pd.DataFrame({'Gene': gene_expression.columns, 'Importance': feature_importances})
    feature_importance_df.to_csv(args.output, sep='\t', index=False)

    print(f"Mean Squared Error: {mse}")

if __name__ == '__main__':
main()
