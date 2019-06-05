FROM centos:7

LABEL project="LiberoSoC"
LABEL remarks ”This is a dockerfile for LiberoSoC”

# Update CentOS and install packages
RUN yum update -y && \
    yum install -y wget \
    firefox \
    atk-2.28.1-1.el7.i686 \ 
    cairo-1.15.12-3.el7.i686 \ 
    glibc-2.17-260.el7_6.5.i686 \ 
    fontconfig-2.13.0-4.3.el7.i686 \
    freetype-2.8-12.el7_6.1.i686 \
    ibgcc-4.8.5-36.el7_6.2.i686 \
    gdk-pixbuf2-2.36.12-3.el7.i686 \ 
    gtk2-2.24.31-1.el7.i686 \
    glib2-2.56.1-2.el7.i686 \
    libICE-1.0.9-9.el7.i686 \
    pango-1.42.4-2.el7_6.i686 \
    libpng12-1.2.50-10.el7.i686 \
    libSM-1.2.2-2.el7.i686 \
    libstdc++-4.8.5-36.el7_6.2.i686 \
    libX11-1.6.5-2.el7.i686 \
    libXau-1.0.8-2.1.el7.i686 \
    libXcursor-1.1.15-1.el7.i686 \
    libXdmcp-1.1.2-6.el7.i686 \
    libXext-1.3.3-3.el7.i686 \
    libXfixes-5.0.3-1.el7.i686 \
    libXinerama-1.1.3-2.1.el7.i686 \
    libXi-1.7.9-1.el7.i686 \
    libXmu-1.1.2-2.el7.i686 \
    libXp-1.0.2-2.1.el7.i686 \
    libXrandr-1.5.1-2.el7.i686 \
    libXrender-0.9.10-1.el7.i686 \
    libXt-1.1.5-3.el7.i686 \
    zlib-1.2.7-18.el7.i686 \
    glib2.i686 \
    ksh.x86_64 \
    xorg-x11-fonts-75dpi \
    xorg-x11-fonts-100dpi \
    xorg-x11-fonts-Type1 \
    libglib2.0-0 \ 
    libsm6 \ 
    libxi6 \
    libxrender1 \
    libxrandr2 \
    libfreetype6 \
    libfontconfig1

# Add overlay files to local fs (copied as context, but not mounted anywhere)
COPY fs_overlay /

# Install Libero 11.9 and apply SP3
RUN cd /tmp && wget "http://127.0.0.1:8765/Libero_SoC_v11.9_Linux.bin" && \
    chmod +x Libero_SoC_v11.9_Linux.bin && \
    TERM=xterm ./Libero_SoC_v11.9_Linux.bin -i silent && \
    rm Libero_SoC_v11.9_Linux.bin && \
    cd /usr/local/microsemi/Libero_SoC_v11.9/Libero && \
    wget "http://127.0.0.1:8765/Libero_SoC_v11_9_SP3_Lin.tar.gz" && \
    tar -xf Libero_SoC_v11_9_SP3_Lin.tar.gz && \
    rm Libero_SoC_v11_9_SP3_Lin.tar.gz && \
    ./wsupdate.sh

RUN chkconfig --add lmgrd-MICROSEMI
