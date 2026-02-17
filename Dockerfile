# Start from the official ubuntu/squid image
FROM ubuntu/squid:5.2-22.04_beta

# Optional: Add your custom squid.conf to the right location
# Make sure you have a squid.conf file in the same directory as this Dockerfile
COPY squid.conf /etc/squid/squid.conf

# Optional: Expose Squid's default proxy port
EXPOSE 3128

# Fix permissions for the proxy user
# Note: /run/squid is created here but gets recreated at runtime as tmpfs,
# so the actual PID file location is configured in squid.conf to use /var/spool/squid
RUN mkdir -p /run/squid && \
    chown -R proxy:proxy /var/spool/squid /var/log/squid /run/squid

# Switch to the proxy user
USER proxy

# Start Squid
CMD ["squid", "-NYCd", "1"]