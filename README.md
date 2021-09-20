# jb-test-prioritization-task
The scripts in this repository build [astminer](https://github.com/JetBrains-Research/astminer) and [morphia](https://github.com/MorphiaOrg/morphia) projects for each of the 100 last commits in the repository and output if each build succeeded or failed. For each failed build, logs can be found in `errors_log_astminer.txt` and `errors_log_morphia.txt` files respectively.
## astminer
To successfully build astminer you must set your JDK version to 11 and install [srcML](https://www.srcml.org/).
### Usage
```
bash astminer-builder.sh
```

## morphia
To successfully build morphia you must set your JDK version to 11 and install [maven](https://maven.apache.org/).\
To successfully run morphia tests you must also start [MongoDB](https://www.mongodb.com/).\
On some systems in some timezones ISO Date tests(mentioned [here](https://github.com/MorphiaOrg/morphia/pull/1572)) may fail.
### Usage
```
bash morphia-builder-no-tests.sh
bash morphia-builder.sh
```
