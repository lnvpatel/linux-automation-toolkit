# Common Linux Administration Commands

## Disk Monitoring

```bash
df -h
du -sh
lsblk
```

---

## Memory Monitoring

```bash
free -m
top
htop
```

---

## CPU Monitoring

```bash
uptime
top
ps -eo pid,cmd,%cpu --sort=-%cpu
```

---

## Networking

```bash
ip address
ip route
ss -tulnp
ping google.com
curl -I https://google.com
```

---

## File Management

```bash
cp
mv
rm
tar -czf
find
```

---

## User Management

```bash
useradd
usermod
passwd
id
```

---

## Log Management

```bash
journalctl
tail -f /var/log/syslog
```

