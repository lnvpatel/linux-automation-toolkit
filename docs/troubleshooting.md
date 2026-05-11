# Troubleshooting Notes

## Common Issues Encountered

### 1. Permission Denied Errors

While running cleanup and user management scripts inside GitHub Codespaces, certain system directories such as `/var/log/private` were restricted.

#### Resolution

* Redirected permission errors using:

```bash
2>/dev/null
```

* Added safer validation and fallback handling in scripts.

---

### 2. Gateway Reachability Failure

The network health check script reported:

```bash
Gateway Status : UNREACHABLE OR RESTRICTED
```

#### Reason

GitHub Codespaces uses isolated container networking where ICMP traffic may be restricted.

#### Resolution

* Improved internet connectivity checks using `curl`
* Added better container-aware diagnostics

---

### 3. mysqldump Command Not Found

Database backup script initially failed due to missing MySQL client utilities.

#### Resolution

* Added dependency validation
* Added fallback demo backup generation

---

### 4. Shell Formatting Issues

Several scripts initially failed due to missing `echo` statements or formatting corruption.

#### Resolution

* Rebuilt scripts with cleaner formatting
* Improved validation and output structure

---

## Lessons Learned

* Real Linux environments often include restricted permissions
* Containers behave differently than traditional VMs
* Validation and error handling are critical in automation scripts
* Operational scripting requires iterative troubleshooting

