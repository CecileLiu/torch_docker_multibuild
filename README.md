# torch_docker_multibuild
A template of using multistage build to reduce docker image size
  
### Usage  
1. modify the `requirements.txt`
2. (optional) remove/add dependencies in `image.Dockerfile` (line 6, line 7)
3. change the image name in `build_image.sh` and `run_image.sh`
4. build command:  
```  
# windows
bash build_image.sh
  
# unix-based  
./build_image.sh
```  

### Other  
Since this image is used for development, jupyter notebook is also installed. (see line 24 in `image.Dockerfile`)