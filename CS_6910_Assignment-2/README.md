# CS_6910_Assignment2
## PART-A
### 1) CNN_for_inatuaralist_dataset:

To run the code in this repository, you need to have the following dependencies installed:

- Python 3.x
- PyTorch
- torchvision
- scikit-learn
- wandb
- tqdm
- 
#### Data loading and Normalization:
-In this section, the data from the iNaturalist dataset is loaded and normalized for further processing. Normalization ensures that the pixel values of the images are scaled to a range that is more suitable for training, often between 0 and 1. 

#### Preprocessing Section:
- Data augumentation and resizes training, validation, and test dataset images to 224x224 pixels.

#### Defining Classes of the Subset of iNaturalist Dataset:
- Defines the classes of the subset of the iNaturalist dataset.

#### Constructing CNN Section:
- Contains the `CNN` class with the following functions:
  - `__init__()`: Takes dropout probability, a list of the number of kernels in each layer, activation function, a list of kernel size of each layer, and the number of neurons in the dense layer as parameters. Constructs the architecture of CNN based on these parameters.
  - `forward()`: Applies the CNN on the given input.

#### Training Model Section:
- Contains the `train_and_evaluate()` function, which trains the CNN model on the training data. It has the following parameters:
  - `model`: The model architecture created from the `ConvNet` class.
  - `criteria`: The loss function, which is taken as cross-entropy here.
  - `optimizer`: Adam optimizer is used here.
  - Number of epochs.
  - train_loader.
  - val_loader

#### Hyperparameter Tuning Section:
- Contains the `train()` function for sweep. The hyperparameters considered for the sweep include:
``
sweep_config = {
    'method': 'bayes', 
    'metric': {
        'name': 'val_accuracy',
        'goal': 'maximize'
    },
    'parameters': {
        'filter_sizes': {
            'values': [[3, 3, 3, 3, 3], [4, 4, 4, 4, 4], [5, 5, 5, 5, 5]]
        },
        'activation': {
            'values': [['leaky_relu', 'leaky_relu', 'leaky_relu', 'leaky_relu', 'leaky_relu'], ['relu', 'relu', 'relu', 'relu','relu'], ['relu', 'gelu', 'silu', 'mish','relu'],['gelu', 'mish', 'gelu', 'relu','gelu']]
        },
        'num_dense': {
            'values': [128, 256]
        },
        'batch_norm': {
            'values': [True, False]
        },
        'filter_organization': {
            'values': [[64, 128, 256, 512, 1024], [32, 32, 32, 32, 32], [32, 64, 64, 64, 128], [32, 64, 128, 256, 512]]
        },
        'dropout_rate': {
            'values': [0.2, 0.3]  
        },
        'data_augmentation': {
            'values': [True, False] 
        }
    }
}
``

#### Test data Preprocessing Section:
- Normalizes and resizes test dataset images to 224x224 pixels.

#### Defining Classes of the Subset of iNaturalist Dataset:
- Defines the classes of the subset of the iNaturalist dataset.

#### Evaluating Best Model Section:
- Parameters corresponding to the best validation accuracy obtained in the sweep are used to train the best model.

#### Plotting Grid for Test Data and its Prediction Section:
- Contains code for plotting a 610x3 grid containing sample images from the test data and predictions made by the best model.

#### Visualizing All Filters Section:
- Contains code for visualizing all the filters in the first layer of the best model for a random image from the test set. It creates an 8x8 grid as the number of filters in the first layer of the best model is 64.

2. **Best sweep config**:
``
best_sweep_config = {
    'method': 'bayes', 
    'metric': {
        'name': 'val_accuracy',
        'goal': 'maximize'
    },
    'parameters': {
        'filter_sizes': {
            'values': [[3, 3, 3, 3, 3]]
        },
        'activation': {
            'values': [['relu', 'gelu', 'silu', 'mish','relu']]
        },
        'num_dense': {
            'values': [256]
        },
        'batch_norm': {
            'values': [False]
        },
        'filter_organization': {
            'values': [[32, 32, 32, 32, 32]]
        },
        'dropout_rate': {
            'values': [0.3]  
        },
        'data_augmentation': {
            'values': [False] 
        }
    }
}
``

### Results
- **Accuracy on Best Model**: 34.07%
- **Best Validation Accuracy**: 34.07%
- **Best Training Accuracy**: 32.95%
- **Best Test Accuracy**: 25.16%

### Acknowledgments
- The code utilizes the PyTorch deep learning framework.
- Weights and Biases (WandB) platform is used for hyperparameter tuning and experiment tracking. Sweep configuration is employed to efficiently search for optimal hyperparameters.

## PART-B
# ResNet50 Model Training with Hyperparameter Tuning

This repository contains code for training a ResNet50-based image classification model using PyTorch, along with hyperparameter tuning using the Weights & Biases (wandb) platform.

## Requirements

To run the code in this repository, you need to have the following dependencies installed:

- Python 3.x
- PyTorch
- torchvision
- scikit-learn
- wandb
- tqdm


## Dataset

The model is trained on the iNaturalist dataset. Ensure that you have downloaded and extracted the dataset to the specified directory.

4. This script will execute a series of training runs with different hyperparameters configurations defined in the `sweep_config`. The training progress will be logged to the wandb platform.

## Sweep Configuration

The hyperparameter sweep configuration (`sweep_config`) includes the following parameters:

- `num_epochs`: Number of epochs for training.
- `learning_rate`: Learning rate for the optimizer.
- `freeze_percentage`: Percentage of layers to freeze in the ResNet50 model.
- `optimizer`: Choice of optimizer (Adam or SGD).
``
sweep_config = {
    'method': 'random',
    'metric': {
        'name': 'val_accuracy',
        'goal': 'maximize'
    },
    'parameters': {
        'num_epochs': {
            'values': [1, 2, 3]  # Fixed typo in parameter name
        },
        'learning_rate': {
            'values': [1e-3, 1e-4, 1e-5]
        },
        'freeze_percentage': {
            'values': [0.30, 0.50, 0.80]
        },
        'optimizer': {
            'values': ['adam', 'SGD']
        }
    }
}
``

## Results Visualization

The training progress and results for each hyperparameter configuration are logged to the wandb platform. You can visualize the results and compare different configurations using the wandb dashboard.
- **Accuracy on Best Model**: 81.7%
- **Best Validation Accuracy**: 77.15%
- **Best Training Accuracy**: 94.93%
