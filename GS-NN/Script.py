import numpy as np
import argparse
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.callbacks import EarlyStopping, ModelCheckpoint
import pandas as pd

def main():
    parser = argparse.ArgumentParser(description='Analyze non-linear relationships between gene expression and phenotype using Neural Networks')
    parser.add_argument('-i', '--input', required=True, help='Path to gene expression data file')
    parser.add_argument('-p', '--phenotype', required=True, help='Path to phenotype data file')
    parser.add_argument('-o', '--output', required=True, help='Path to output results file')

    args = parser.parse_args()

    # 读取数据
    gene_expression = pd.read_csv(args.input, sep='\t')
    phenotype = pd.read_csv(args.phenotype, sep='\t', header=None)

    # 分割数据为训练集和测试集
    X_train, X_test, y_train, y_test = train_test_split(gene_expression, phenotype, test_size=0.2, random_state=42)

    # 数据标准化
    scaler = StandardScaler()
    X_train = scaler.fit_transform(X_train)
    X_test = scaler.transform(X_test)

    # 创建和训练神经网络模型
    model = Sequential([
        Dense(256, activation='relu', input_shape=(X_train.shape[1],)),
        Dense(128, activation='relu'),
        Dense(64, activation='relu'),
        Dense(1)
    ])

    model.compile(optimizer='adam', loss='mse', metrics=['mae'])

    early_stopping = EarlyStopping(patience=10)
    model_checkpoint = ModelCheckpoint('best_model.h5', save_best_only=True)

    model.fit(X_train, y_train, epochs=100, batch_size=32, callbacks=[early_stopping, model_checkpoint])
    
    # 在测试集上测试模型
    y_pred = model.predict(X_test)
    
    # 计算和打印均方误差
    mse = mean_squared_error(y_test, y_pred)

    # 输出模型摘要和MSE
    model.summary()
    print(f"Mean Squared Error: {mse}")

if __name__ == '__main__':
    main()
