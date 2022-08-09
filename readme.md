**_Ansible Play book_** to do the following two tasks
> 1. Execute a shell script
> 2. Copy the output (a text file) to S3 Bucket

#### Task-1

```console
 - name: create directory
   shell: mkdir -p logs
```

- We are creating the folder logs to store the log files. 
- -p parameter is given if in case the folder already exists it will not throw an error.

#### Task-2

```console
 - name: shell script
   shell: bash {{ SCRIPT_NAME }}.sh {{ ENVIRONMENT }} {{ ORG_NAME }} {{ PORT }} >> logs/log.txt
```

- We are using the module ‘shell’ provided by ansible to execute the shell script.
- We are sending SCRIPT_NAME, ENVIRONMENT, ORG_NAME, PORT parameters to the script.
- We are storing the output of the shell script in log.txt file.

#### Task-3

```console
 - name: s3 Upload
   s3_sync:
    bucket: "s3-bucket-name"
    region: "ap-south-1"
    file_root: logs`
```

- We are using the module ‘s3_sync’ provided by ansible to copy the files to S3.
