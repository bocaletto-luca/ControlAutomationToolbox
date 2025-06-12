# ControlAutomationToolbox

A MATLAB & Simulink toolbox for Control & Automation  
• PID, LQR, H∞ controller synthesis  
• Stability analysis (Bode, Nyquist, Root-Locus)  
• Auto code generation for MCU (Embedded Coder) & FPGA (HDL Coder)

## 📂 Repo Layout

- **models/**: Simulink block-diagrams  
- **scripts/**: MATLAB .m scripts for synthesis & analysis  
- **src/**: utility functions (cleanup, logging)  
- **docs/**: User guide & API reference  
- **.github/**: CI workflows & CODEOWNERS  

## 🚀 Quick Start

1. Clone repo  
2. Open MATLAB, set path:  

``` matlab ```

addpath(genpath(pwd))
1. scripts/synthesize_controllers
2. scripts/analyze_stability

#### Open Simulink models in models/ and generate code:
#### Embedded Coder → PID_Controller.slx → rtwbuild('PID_Controller')
#### HDL Coder → Hinf_Controller.slx → HDL Workflow Advisor

📖 Documentation

🛠 CI / Quality

    GitHub Actions runs MATLAB unit tests on push/PR

    CODEOWNERS auto-assigns reviewers

    .gitignore excludes artifacts, cache & logs
