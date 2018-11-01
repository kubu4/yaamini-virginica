# `scripts` Subdirectory Structure

- **[2018-10-12-Bismark-Revised-Parameters.sh](https://github.com/fish546-2018/yaamini-virginica/blob/master/scripts/2018-10-12-Bismark-Revised-Parameters.sh)**: Initial script used to run `bismark` alignment on Mox. Path to `samtools` was not specified in the alignment step, so output was written out as SAMfiles instead of BAMfiles. `bismark` run on Mox was terminated during the deduplication step.
- **[2018-10-31-Bismark-Revised-Parameters-Samtools.sh](https://github.com/fish546-2018/yaamini-virginica/blob/master/scripts/2018-10-31-Bismark-Revised-Samtools.sh)**: Revised script with `--samtools_path` specified in the `bismark` alignment step. Mox run was initiated 2018-10-31.
