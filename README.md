# WSO2 Identity Server

This image contains vanilla WSO2 IS installation.
In order to run execute the following command:
```run -d --name <container_name> -p 9763:9763 -p 9443:9443 -v <volume_name>:/opt/wso2/is/repository iktech/wso2is```

For example:
```run -d --name wso2is -p 9763:9763 -p 9443:9443 -v wso2is:/opt/wso2/is/repository iktech/wso2is```