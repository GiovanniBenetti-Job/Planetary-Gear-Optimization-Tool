# Planetary-Gear-Optimization-Tool
A MATLAB tool for optimizing planetary gear configurations (teeth number, geometry, and satellite count). Verified mechanical sizing and  a generated 3D rendering using Solid Edge.

This project presents a **MATLAB-based optimization tool** for the design and performance evaluation of **planetary gear systems**.  
The tool automates the calculation of kinematic and dynamic parameters, enabling the user to analyze different gear configurations and identify optimal combinations based on efficiency, torque capacity, and mass criteria.
The work was developed as part of an engineering study focused on **mechanical transmission systems**, with emphasis on modeling, numerical computation, and performance visualization.

## 💻 Software
- **MATLAB** - writing optimization codes and basic graphic design
- **Excel / CSV Export** - creation of tabulated results  
- **Solid Edge** - 3D rendering of the optimal configuration

## 🎯 Main Objectives
- Develop the numerical basis for a tool for optimizing planetary gears.
- Evaluate how design parameters (gear ratios, number of teeth, module, etc.) affect performance indices.
- Be able to provide easy-to-read data for setting up 3D rendering work.

## 🧩 Work Structure
- Determine the type of gears supplied: Positive or Negative Gearing
- Calculate the characteristic reduction ratio of the gear, compared to the reduction ratio to be obtained: τ → τ₀
- Evaluation of the actual reduction ratio with respect to the type of configuration: tao coupling - negative/positive gearing
- Calculation of the expected efficiency of the selected gearbox: η₀ → η
- Optimization of the number of teeth and satellites of the selected configuration
- Modular proportioning of the gear wheels and 3D rendering

## 📊 Key Results
The tool successfully computes and compares multiple planetary gear configurations, highlighting the impact of gear geometry and reduction ratio on performance.  
Preliminary results show:
- High correlation between total gear ratio and efficiency  
- Significant influence of component inertia on torque ripple  
- The possibility of identifying an **optimal gear set** balancing performance and mass

Following the results obtained from the codes, the work of selecting the supports (bearings) and dimensioning them and the gear teeth was done manually following the procedures specified in a mechanics manual (HOEPLI, second edition edited by LUIGI CALIGARIS, STEFANO FAVA, CARLO TOMASELLO). Once the strength of the teeth had been verified in terms of torque and bending, the 3D rendering of the gear was carried out using Solid Edge, following the actual dimensions obtained from the modular proportions.
(Representations of the results and the mechanism are available in the files)

## 📂 Project File
- [MATLAB_Scripts](Codes)
- [Gear Rendering](Report_and_Results/3D_Rendering.jpg)
- [Visual Simulation](Report_and_Results/Visual_Simulation.mp4)
- [Detailed Report](Report_and_Results/Technical_Report(IT).pdf)

## 👤 Author
**Giovanni Benetti**  
Mechanical Engineer – Energy & Mechanical Systems  
📧 giovanni.benetti@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/giovanni-benetti)  
