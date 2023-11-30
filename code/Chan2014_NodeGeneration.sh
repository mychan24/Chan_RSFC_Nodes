#!/bin/bash
##########################################################################
# Scripts to create Chan et al. 2014 PNAS brain nodes on GIFTI surfaces
##########################################################################
# Overview:
#   Script to generate surface nodeset in Chan et al. 2014. 
#
# # -- Required software and brain surfaces/files -- # 
# Software
# - Connectome Workbench (this script was tested with Workbench 1.5.0)
# - MATLAB & Gifti toolbox (this script was tested with )
#
# Files
# - Conte69 surface (GIFTI): https://balsa.wustl.edu/file/Nkwwk
# - WIG Boundary Map (GIFTI): https://gitlab.com/wiglab/rsfc-boundaries-and-snowballing
# - FreeSurfer medial wall (GIFTI): Provided in this repository for convenience. 
#      * Can also be extracted from Yeo et al. 2011 17 network 
#
# NOTES: script assumes all files needed are in the working directory
##########################################################################
#  myc 
#  udpated: 11/30/2023 (tested w/ workbench 1.5.0 and MATLAB 2019b)
#  original: 6/12/2014
##########################################################################

# 1. Identify vertex minima from Wig NI 2014 boundary surface
for h in L R; do
    surface=Conte69.${h}.midthickness.32k_fs_LR.surf.gii
    metricin=Wig_NI2014_RSFCBoundaries_32k_fs_LR_${h}.func.gii
    distance=8
    metricout=Wig_NI2014_RSFCBoundaries_32k_fs_LR_extrema_onlyminima_dis${distance}mm_fwhm0_${h}.func.gii

    wb_command -metric-extrema $surface $metricin $distance $metricout -only-minima
done


# 2. Export minima as txt file vertex number (count starts from 0)
#   This step masks the minima using the FreeSurfer medial wall and
#   exports the vertex number as text files.

matlab -nodesktop -nosplash "run('./mask_and_export_minima.m')"


# 3. Create Geodesic disks around the minima's vertex number (txt file)
for h in L R; do
    surface=Conte69.${h}.midthickness.32k_fs_LR.surf.gii
    limit=3 # geodesic distance limit from vertex, in mm (radius)
    vertexfile=minima_${h}_vertex_dis8mm_fwhm0.txt
    metricout=ROI_${h}_dis8_fwhm0_limit${limit}_overlapEXCLUDE.func.gii
    metricsummed=ROI_${h}_dis8_fwhm0_limit${limit}_overlapEXCLUDE_sum.func.gii

    #create ROI with wb_command
    wb_command -surface-geodesic-rois $surface $limit $vertexfile $metricout -overlap-logic EXCLUDE

    # Sum the ROIS into one surface
    wb_command -metric-reduce $metricout SUM $metricsummed
done