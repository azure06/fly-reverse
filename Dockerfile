# Start from the official ubuntu/squid image
FROM ubuntu/squid:5.2-22.04_beta

# Optional: Add your custom squid.conf to the right location
# Make sure you have a squid.conf file in the same directory as this Dockerfile
COPY squid.conf /etc/squid/squid.conf

# Optional: Expose Squid's default proxy port
EXPOSE 3128

# Default command (inherited from base image), but explicitly defining for clarity
CMD ["squid", "-NYCd", "1"]