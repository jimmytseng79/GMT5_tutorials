
### Table of Contents
1. [Overview](/index.md)
2. [Introduction](/intro_specfem.md)
3. [Part I: Setting up SPECFEM3D_GLOBE](/setup_specfem3d.md)
4. [Part II: Continental-scale Simulations](/prepare_data.md)
5. [Part III: Visualization](/vis_seismo.md)
6. [Part IV: Adjoint Simulations (Bonus)](/run_adj_solver.md)
7. [Further Work](/further_work.md)
8. [Resources](/resources.md)


## Overview

This tutorial will show you how to set up and run a continental-scale
simulation using SPECFEM3D_GLOBE.

The tutorial consists of four parts. In the first part, we will look at how to
set up SPECFEM3D_GLOBE. In part two, we use SPECFEM3D_GLOBE to run a
continental-scale simulation. In part three, we explore how to visualize the
output simulation data using ObsPy and Paraview, and in part four, we will look 
at how to run adjoint simulations using SPECFEM3D_GLOBE.

The event that we will be focusing on in this tutorial is the 2014 [South Napa
earthquake](https://en.wikipedia.org/wiki/2014_South_Napa_earthquake).


### Requirements
In order to complete this tutorial, the following software must be installed

      Intel compilers   (version >= 16.0.4)
      Python            (version >= 3.3.0)
      Obspy             (version >= 1.0.3)
      Paraview          (version >= 5.1.2)

### Part I: Setting up SPECFEM3D_GLOBE: 

* **Description:** In the first part of the tutorial, we will go through the steps
  that are required to obtain the SPECFEM3D_GLOBE source code, and look at how
  to properly configure and compile it.

* **Learning goals:**
    * Understand the steps required to set up SPECFEM3D_GLOBE
    * Get an idea of how to set up SPECFEM3D_GLOBE in your own environment


### Part II: Continental-scale Simulations:

* **Description:** In the second part of the tutorial, we will look at how to prepare
  the input data for the continental-scale simulation. This includes providing
  the source characteristics, providing the station locations, and setting the
  simulation parameters. We will also go through how to mesh the model, and how
  to run the solver.

* **Learning goals:**
    * Understand the steps required to run a continental-scale simulation with SPECFEM3D_GLOBE
    * Get an overview of what data must be set in order to run a simulation with SPECFEM3D_GLOBE
    * Learn how to change the resolution of a simulation
    * Get an idea of how to submit the mesh and solver job on the cluster


### Part III: Visualization:

* **Description:** In part three, we will look at how to visualize the
  simulation output using ObsPy and Paraview. This includes looking at the
  output seismograms, visualizing the model mesh, and creating a surface movie
  for the simulation data.

* **Learning goals:**
    * Get an idea of how to plot the output seismograms using ObsPy
    * Learn the steps needed to output and visualize the model mesh with
      different component models (e.g. vp, vs) using Paraview
    * Learn how to create a surface movie for the simulation data


### Part IV: Adjoint Simulations (Bonus):

* **Description:** In part four, we go through the steps that are needed to run
  adjoint simulations using SPECFEM3D_GLOBE.

* **Learning goals:**
    * Get an idea of what steps are required to run adjoint simulations using
      SPECFEM3D_GLOBE
    * Learn how to generate adjoint sources


---

[Next section](/intro_specfem.md)
