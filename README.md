# processing-ECG-signals

A cleaned-up MATLAB/Octave project for exploring ECG limb leads, deriving
augmented leads, visualizing vectorcardiograms (VCG), and estimating heart
rate from a raw signal.

## Project structure

```
├── data/
│   └── ECG1_500Hz.mat     # Lead I & II signals sampled at 500 Hz
├── src/
│   ├── compute_augmented_leads.m
│   ├── compute_beat_rate.m
│   ├── compute_vcg.m
│   ├── load_ecg_signals.m
│   ├── plot_augmented_leads.m
│   └── plot_vcg.m
└── main.m                 # End-to-end demo
```

## Requirements

- MATLAB R2021a+ **or** GNU Octave 7+ (add the Signal Processing package for
  Octave: `pkg install -forge signal`)
- No external toolboxes beyond base math/plotting

## Running the demo

1. Open the repository root in MATLAB/Octave.
2. Run `main`.

The script will:
- Load `data/ECG1_500Hz.mat` (expects variables `I` and `II`).
- Plot the six limb leads (I, II, III, aVF, aVL, aVR).
- Print the estimated beat rate from Lead II using a simple threshold.
- Draw VCG trajectories for the T-wave (samples 401–538) and QRS complex
  (samples 6451–6498).

## Example outputs

- Augmented limb leads (I, II, III, aVF, aVL, aVR)  
  ![Augmented limb leads](https://user-images.githubusercontent.com/70627266/134860714-2901e33e-2f6c-4046-aa73-278c17bd114d.png)
- Vectorcardiogram trajectories for QRS and T-wave segments  
  ![VCG QRS](https://user-images.githubusercontent.com/70627266/134860735-c5b75636-b47a-4280-9380-52af91cdd1a0.png)
  ![VCG T-wave](https://user-images.githubusercontent.com/70627266/134860767-5c7e60ea-0c71-46c1-ba84-f364a3f43464.png)

## Function overview

- `load_ecg_signals`: Validates and loads the dataset, attaching metadata
  like sampling frequency and a time vector.
- `compute_augmented_leads`: Derives III, aVF, aVR, and aVL from leads I and II.
- `plot_augmented_leads`: Subplot visualizations for the six limb leads.
- `compute_beat_rate`: Counts rising edges above a configurable threshold to
  estimate beats per minute.
- `compute_vcg`: Computes VCG X/Y coordinates for any sample window using a
  closed-form solution (no symbolic math).
- `plot_vcg`: Utility for drawing the VCG trajectory with axis labels.

## Notes

- The sampling frequency defaults to **500 Hz**. Override by passing a second
  argument to `load_ecg_signals` and `compute_beat_rate`.
- Threshold-based beat detection is intentionally simple for clarity; tune the
  `threshold` argument or swap in a more advanced detector as needed.
- Figures use relative paths only; no hardcoded drive letters remain.
