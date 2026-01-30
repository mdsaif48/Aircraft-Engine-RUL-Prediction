
# Data-Driven Prognostics for Aircraft Engine Health Monitoring

PROBLEM STATEMENT: 
In this project, the objective is to estimate the Remaining Useful Life (RUL) of turbofan jet engines using multivariate time-series sensor data. The dataset represents run-to-failure simulations of aircraft engines generated using NASA’s C-MAPSS model. Each engine starts in a healthy state and progressively degrades due to one or more fault modes until failure.

The challenge lies in learning degradation patterns from noisy sensor measurements collected under different operational conditions and generalizing them across a fleet of engines with unknown initial wear and manufacturing variations. For the test engines, sensor data is available only up to a point before failure, and the task is to predict how many operational cycles remain before the engine reaches end-of-life


# Method overview :
1.Loaded and structured multivariate run-to-failure aircraft engine sensor data.

2.Preprocessed sensor signals and generated Remaining Useful Life (RUL) targets.

3.Extracted degradation-related features from time-series data.

4.Trained supervised regression models to predict RUL.

5.Evaluated model performance using prediction error metrics.

# Result 
RMSE value : 21.4592
[https://github.com/mdsaif48/Aircraft-Engine-RUL-Prediction/blob/e352797e76d5a1a310ccb209e7fb12b4f2beaafd/RUL_visuals/Pred_vs_Actual_RUL.pdf](predicted_v/s_actual)

# Limitations
• The analysis is based on simulated run-to-failure engine data, which may not fully capture real-world operational variability.

• Model performance depends on selected features and preprocessing steps, limiting generalization across different engine conditions.

• Random Forest models provide limited temporal modeling capability for long-term degradation trends.

• The study does not include real-time deployment or validation on operational aircraft data.

# Future scope 
• Incorporation of frequency-domain and health indicator features to improve degradation characterization.

• Exploration of sequence-based models to better capture temporal degradation behavior.

• Validation of the approach using real-world engine health monitoring data.

• Integration of uncertainty estimation for more reliable RUL prediction.


