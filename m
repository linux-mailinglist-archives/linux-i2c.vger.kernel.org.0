Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C005A638
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 23:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfF1VX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 17:23:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50806 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfF1VX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 17:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oT08YEQUDLqVqzFxgcIkHyl/r2ihBR8REh3Hrnc8vGU=; b=OEOJj5EOPj7GGmZBMhuAWMeHW
        LMATdNuwRnzPP8MZI91r0pnW8M/WZAaJ68nzmmSX1j9uTFsQhaPSyeMGYeAxYtsf2nKXo1Tv7Ps2n
        fHdUXKH4hdF+IjzDccAyLJKlbNbKe8QXCc7YpSrSVlRSQg2yb1d8voSS7hJ6hpZBzB9DYaF1CPsNy
        ++DOQ7l4Zitjw4RekJJJwqaQhYgE9SKozhjYh0KYBK0AGLdIruTCGZsd58e2ans9uwoPDQ+QZew9n
        6b66ZZ62LlKV8CGmWlBFmsgrKbTu1iNHQYKRtzCVPH/FuONRb4kV9btAnqsxSE8h68Uh6rl9/69R8
        QdZmtIBsQ==;
Received: from [187.113.3.250] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgyL2-0001VD-K7; Fri, 28 Jun 2019 21:23:21 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hgyKz-0002dj-SB; Fri, 28 Jun 2019 18:23:17 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Darren Hart <dvhart@infradead.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-spi@vger.kernel.org, Seth Heasley <seth.heasley@intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jim Cromie <jim.cromie@gmail.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Rudolf Marek <r.marek@assembler.cz>,
        Andreas Werner <andreas.werner@men.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Rosin <peda@axentia.se>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>, linux-rtc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>, linux-hwmon@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-iio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        Michael Shych <michaelsh@mellanox.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 0/5] Convert misc-devices, i2c, w1, spi and some markdown files to ReST
Date:   Fri, 28 Jun 2019 18:23:11 -0300
Message-Id: <cover.1561756511.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are some files under Documentation/ that don't end with .txt but
as plain text files. If I did the math right, ~140 of such files make sense
to convert, IMO. 

This series convert most of them. After this series, there will be around
30-40 files without any extension to be converted.

The results of this conversion (applied after my big conversion series)
can be seen at:

	https://www.infradead.org/~mchehab/rst_conversion/

In order to make easier to merge, I'm placing one patch per subsystem,
plus a patch for the markdown->ReST conversion.

Mauro Carvalho Chehab (5):
  docs: convert markdown documents to ReST
  docs: misc-devices: convert files without extension to ReST
  docs: i2c: convert to ReST and add to driver-api bookset
  docs: w1: convert to ReST and add to the kAPI group of docs
  docs: spi: convert to ReST and add it to the kABI bookset

 Documentation/ABI/stable/sysfs-bus-w1         |   2 +-
 .../ABI/stable/sysfs-driver-w1_ds28e04        |   4 +-
 .../ABI/stable/sysfs-driver-w1_ds28ea00       |   2 +-
 Documentation/IPMB.txt                        |   2 +-
 .../devicetree/bindings/i2c/i2c-mux-gpmux.txt |   2 +-
 Documentation/devicetree/writing-schema.md    | 130 ------------
 Documentation/devicetree/writing-schema.rst   | 153 ++++++++++++++
 ...entication.md => ubifs-authentication.rst} |  70 ++++---
 Documentation/hwmon/adm1021.rst               |   2 +-
 Documentation/hwmon/adm1275.rst               |   2 +-
 Documentation/hwmon/hih6130.rst               |   2 +-
 Documentation/hwmon/ibm-cffps.rst             |   2 +-
 Documentation/hwmon/lm25066.rst               |   2 +-
 Documentation/hwmon/max16064.rst              |   2 +-
 Documentation/hwmon/max16065.rst              |   2 +-
 Documentation/hwmon/max20751.rst              |   2 +-
 Documentation/hwmon/max34440.rst              |   2 +-
 Documentation/hwmon/max6650.rst               |   2 +-
 Documentation/hwmon/max8688.rst               |   2 +-
 Documentation/hwmon/menf21bmc.rst             |   2 +-
 Documentation/hwmon/pcf8591.rst               |   2 +-
 Documentation/hwmon/sht3x.rst                 |   2 +-
 Documentation/hwmon/shtc1.rst                 |   2 +-
 Documentation/hwmon/tmp103.rst                |   2 +-
 Documentation/hwmon/tps40422.rst              |   2 +-
 Documentation/hwmon/ucd9000.rst               |   2 +-
 Documentation/hwmon/ucd9200.rst               |   2 +-
 Documentation/hwmon/via686a.rst               |   2 +-
 Documentation/hwmon/zl6100.rst                |   2 +-
 .../busses/{i2c-ali1535 => i2c-ali1535.rst}   |  13 +-
 .../busses/{i2c-ali1563 => i2c-ali1563.rst}   |   3 +
 .../busses/{i2c-ali15x3 => i2c-ali15x3.rst}   |  63 +++---
 Documentation/i2c/busses/i2c-amd-mp2          |  23 ---
 Documentation/i2c/busses/i2c-amd-mp2.rst      |  25 +++
 .../i2c/busses/{i2c-amd756 => i2c-amd756.rst} |   8 +-
 .../busses/{i2c-amd8111 => i2c-amd8111.rst}   |  14 +-
 .../{i2c-diolan-u2c => i2c-diolan-u2c.rst}    |   3 +
 .../i2c/busses/{i2c-i801 => i2c-i801.rst}     |  31 ++-
 .../i2c/busses/{i2c-ismt => i2c-ismt.rst}     |  20 +-
 .../busses/{i2c-mlxcpld => i2c-mlxcpld.rst}   |   6 +
 .../busses/{i2c-nforce2 => i2c-nforce2.rst}   |  23 ++-
 .../{i2c-nvidia-gpu => i2c-nvidia-gpu.rst}    |   6 +-
 .../i2c/busses/{i2c-ocores => i2c-ocores.rst} |  22 +-
 Documentation/i2c/busses/i2c-parport          | 178 ----------------
 ...2c-parport-light => i2c-parport-light.rst} |   2 +
 Documentation/i2c/busses/i2c-parport.rst      | 190 +++++++++++++++++
 .../busses/{i2c-pca-isa => i2c-pca-isa.rst}   |   9 +-
 .../i2c/busses/{i2c-piix4 => i2c-piix4.rst}   |  14 +-
 .../busses/{i2c-sis5595 => i2c-sis5595.rst}   |  18 +-
 Documentation/i2c/busses/i2c-sis630           |  58 ------
 Documentation/i2c/busses/i2c-sis630.rst       |  64 ++++++
 .../i2c/busses/{i2c-sis96x => i2c-sis96x.rst} |  28 ++-
 .../busses/{i2c-taos-evm => i2c-taos-evm.rst} |   8 +-
 .../i2c/busses/{i2c-via => i2c-via.rst}       |  20 +-
 .../i2c/busses/{i2c-viapro => i2c-viapro.rst} |  12 +-
 Documentation/i2c/busses/index.rst            |  33 +++
 .../i2c/busses/{scx200_acb => scx200_acb.rst} |   9 +-
 .../i2c/{dev-interface => dev-interface.rst}  |  94 +++++----
 ...-considerations => dma-considerations.rst} |   0
 .../i2c/{fault-codes => fault-codes.rst}      |   4 +
 .../i2c/{functionality => functionality.rst}  |  18 +-
 ...ult-injection => gpio-fault-injection.rst} |  12 +-
 .../i2c/{i2c-protocol => i2c-protocol.rst}    |  28 ++-
 Documentation/i2c/{i2c-stub => i2c-stub.rst}  |  19 +-
 .../i2c/{i2c-topology => i2c-topology.rst}    |  68 +++---
 Documentation/i2c/index.rst                   |  38 ++++
 ...ting-devices => instantiating-devices.rst} |  45 ++--
 .../muxes/{i2c-mux-gpio => i2c-mux-gpio.rst}  |  26 +--
 ...e-parameters => old-module-parameters.rst} |  27 ++-
 ...eprom-backend => slave-eeprom-backend.rst} |   3 +-
 .../{slave-interface => slave-interface.rst}  |  32 +--
 .../{smbus-protocol => smbus-protocol.rst}    |  74 ++++---
 Documentation/i2c/{summary => summary.rst}    |   4 +-
 ...en-bit-addresses => ten-bit-addresses.rst} |   5 +
 ...pgrading-clients => upgrading-clients.rst} | 194 +++++++++---------
 .../{writing-clients => writing-clients.rst}  |  94 +++++----
 Documentation/index.rst                       |   3 +
 .../misc-devices/{eeprom => eeprom.rst}       |  43 ++--
 .../{ics932s401 => ics932s401.rst}            |   7 +-
 Documentation/misc-devices/index.rst          |   5 +
 .../misc-devices/{isl29003 => isl29003.rst}   |  15 +-
 .../misc-devices/{lis3lv02d => lis3lv02d.rst} |  20 +-
 .../misc-devices/{max6875 => max6875.rst}     |  52 +++--
 .../spi/{butterfly => butterfly.rst}          |  44 ++--
 Documentation/spi/index.rst                   |  23 +++
 Documentation/spi/{pxa2xx => pxa2xx.rst}      |  94 +++++----
 .../spi/{spi-lm70llp => spi-lm70llp.rst}      |  17 +-
 .../spi/{spi-sc18is602 => spi-sc18is602.rst}  |   5 +-
 .../spi/{spi-summary => spi-summary.rst}      | 103 ++++++----
 Documentation/spi/{spidev => spidev.rst}      |  30 ++-
 Documentation/w1/index.rst                    |  22 ++
 .../w1/masters/{ds2482 => ds2482.rst}         |  17 +-
 .../w1/masters/{ds2490 => ds2490.rst}         |   6 +-
 Documentation/w1/masters/index.rst            |  14 ++
 Documentation/w1/masters/mxc-w1               |  12 --
 Documentation/w1/masters/mxc-w1.rst           |  17 ++
 .../w1/masters/{omap-hdq => omap-hdq.rst}     |  12 +-
 .../w1/masters/{w1-gpio => w1-gpio.rst}       |  21 +-
 Documentation/w1/slaves/index.rst             |  16 ++
 .../w1/slaves/{w1_ds2406 => w1_ds2406.rst}    |   2 +
 .../w1/slaves/{w1_ds2413 => w1_ds2413.rst}    |   9 +
 Documentation/w1/slaves/w1_ds2423             |  47 -----
 Documentation/w1/slaves/w1_ds2423.rst         |  54 +++++
 .../w1/slaves/{w1_ds2438 => w1_ds2438.rst}    |  10 +-
 .../w1/slaves/{w1_ds28e04 => w1_ds28e04.rst}  |   5 +
 .../w1/slaves/{w1_ds28e17 => w1_ds28e17.rst}  |  15 +-
 .../w1/slaves/{w1_therm => w1_therm.rst}      |  11 +-
 .../w1/{w1.generic => w1-generic.rst}         |  88 ++++----
 .../w1/{w1.netlink => w1-netlink.rst}         |  83 ++++----
 MAINTAINERS                                   |  52 ++---
 Next/merge.log                                |   6 +-
 drivers/hwmon/atxp1.c                         |   2 +-
 drivers/hwmon/smm665.c                        |   2 +-
 drivers/i2c/Kconfig                           |   4 +-
 drivers/i2c/busses/Kconfig                    |   2 +-
 drivers/i2c/busses/i2c-i801.c                 |   2 +-
 drivers/i2c/busses/i2c-taos-evm.c             |   2 +-
 drivers/i2c/i2c-core-base.c                   |   4 +-
 drivers/iio/dummy/iio_simple_dummy.c          |   4 +-
 drivers/misc/isl29003.c                       |   2 +-
 drivers/platform/x86/Kconfig                  |   2 +-
 drivers/rtc/rtc-ds1374.c                      |   2 +-
 drivers/spi/Kconfig                           |   2 +-
 drivers/spi/spi-butterfly.c                   |   2 +-
 drivers/spi/spi-lm70llp.c                     |   2 +-
 include/linux/i2c.h                           |   2 +-
 include/linux/platform_data/sc18is602.h       |   2 +-
 127 files changed, 1874 insertions(+), 1239 deletions(-)
 delete mode 100644 Documentation/devicetree/writing-schema.md
 create mode 100644 Documentation/devicetree/writing-schema.rst
 rename Documentation/filesystems/{ubifs-authentication.md => ubifs-authentication.rst} (95%)
 rename Documentation/i2c/busses/{i2c-ali1535 => i2c-ali1535.rst} (82%)
 rename Documentation/i2c/busses/{i2c-ali1563 => i2c-ali1563.rst} (93%)
 rename Documentation/i2c/busses/{i2c-ali15x3 => i2c-ali15x3.rst} (72%)
 delete mode 100644 Documentation/i2c/busses/i2c-amd-mp2
 create mode 100644 Documentation/i2c/busses/i2c-amd-mp2.rst
 rename Documentation/i2c/busses/{i2c-amd756 => i2c-amd756.rst} (79%)
 rename Documentation/i2c/busses/{i2c-amd8111 => i2c-amd8111.rst} (66%)
 rename Documentation/i2c/busses/{i2c-diolan-u2c => i2c-diolan-u2c.rst} (91%)
 rename Documentation/i2c/busses/{i2c-i801 => i2c-i801.rst} (89%)
 rename Documentation/i2c/busses/{i2c-ismt => i2c-ismt.rst} (81%)
 rename Documentation/i2c/busses/{i2c-mlxcpld => i2c-mlxcpld.rst} (88%)
 rename Documentation/i2c/busses/{i2c-nforce2 => i2c-nforce2.rst} (68%)
 rename Documentation/i2c/busses/{i2c-nvidia-gpu => i2c-nvidia-gpu.rst} (63%)
 rename Documentation/i2c/busses/{i2c-ocores => i2c-ocores.rst} (82%)
 delete mode 100644 Documentation/i2c/busses/i2c-parport
 rename Documentation/i2c/busses/{i2c-parport-light => i2c-parport-light.rst} (92%)
 create mode 100644 Documentation/i2c/busses/i2c-parport.rst
 rename Documentation/i2c/busses/{i2c-pca-isa => i2c-pca-isa.rst} (72%)
 rename Documentation/i2c/busses/{i2c-piix4 => i2c-piix4.rst} (92%)
 rename Documentation/i2c/busses/{i2c-sis5595 => i2c-sis5595.rst} (74%)
 delete mode 100644 Documentation/i2c/busses/i2c-sis630
 create mode 100644 Documentation/i2c/busses/i2c-sis630.rst
 rename Documentation/i2c/busses/{i2c-sis96x => i2c-sis96x.rst} (75%)
 rename Documentation/i2c/busses/{i2c-taos-evm => i2c-taos-evm.rst} (91%)
 rename Documentation/i2c/busses/{i2c-via => i2c-via.rst} (61%)
 rename Documentation/i2c/busses/{i2c-viapro => i2c-viapro.rst} (87%)
 create mode 100644 Documentation/i2c/busses/index.rst
 rename Documentation/i2c/busses/{scx200_acb => scx200_acb.rst} (86%)
 rename Documentation/i2c/{dev-interface => dev-interface.rst} (71%)
 rename Documentation/i2c/{DMA-considerations => dma-considerations.rst} (100%)
 rename Documentation/i2c/{fault-codes => fault-codes.rst} (98%)
 rename Documentation/i2c/{functionality => functionality.rst} (91%)
 rename Documentation/i2c/{gpio-fault-injection => gpio-fault-injection.rst} (97%)
 rename Documentation/i2c/{i2c-protocol => i2c-protocol.rst} (83%)
 rename Documentation/i2c/{i2c-stub => i2c-stub.rst} (93%)
 rename Documentation/i2c/{i2c-topology => i2c-topology.rst} (89%)
 create mode 100644 Documentation/i2c/index.rst
 rename Documentation/i2c/{instantiating-devices => instantiating-devices.rst} (93%)
 rename Documentation/i2c/muxes/{i2c-mux-gpio => i2c-mux-gpio.rst} (85%)
 rename Documentation/i2c/{old-module-parameters => old-module-parameters.rst} (75%)
 rename Documentation/i2c/{slave-eeprom-backend => slave-eeprom-backend.rst} (90%)
 rename Documentation/i2c/{slave-interface => slave-interface.rst} (94%)
 rename Documentation/i2c/{smbus-protocol => smbus-protocol.rst} (84%)
 rename Documentation/i2c/{summary => summary.rst} (96%)
 rename Documentation/i2c/{ten-bit-addresses => ten-bit-addresses.rst} (95%)
 rename Documentation/i2c/{upgrading-clients => upgrading-clients.rst} (56%)
 rename Documentation/i2c/{writing-clients => writing-clients.rst} (91%)
 rename Documentation/misc-devices/{eeprom => eeprom.rst} (76%)
 rename Documentation/misc-devices/{ics932s401 => ics932s401.rst} (94%)
 rename Documentation/misc-devices/{isl29003 => isl29003.rst} (77%)
 rename Documentation/misc-devices/{lis3lv02d => lis3lv02d.rst} (90%)
 rename Documentation/misc-devices/{max6875 => max6875.rst} (83%)
 rename Documentation/spi/{butterfly => butterfly.rst} (71%)
 create mode 100644 Documentation/spi/index.rst
 rename Documentation/spi/{pxa2xx => pxa2xx.rst} (83%)
 rename Documentation/spi/{spi-lm70llp => spi-lm70llp.rst} (88%)
 rename Documentation/spi/{spi-sc18is602 => spi-sc18is602.rst} (92%)
 rename Documentation/spi/{spi-summary => spi-summary.rst} (93%)
 rename Documentation/spi/{spidev => spidev.rst} (90%)
 create mode 100644 Documentation/w1/index.rst
 rename Documentation/w1/masters/{ds2482 => ds2482.rst} (71%)
 rename Documentation/w1/masters/{ds2490 => ds2490.rst} (98%)
 create mode 100644 Documentation/w1/masters/index.rst
 delete mode 100644 Documentation/w1/masters/mxc-w1
 create mode 100644 Documentation/w1/masters/mxc-w1.rst
 rename Documentation/w1/masters/{omap-hdq => omap-hdq.rst} (90%)
 rename Documentation/w1/masters/{w1-gpio => w1-gpio.rst} (75%)
 create mode 100644 Documentation/w1/slaves/index.rst
 rename Documentation/w1/slaves/{w1_ds2406 => w1_ds2406.rst} (97%)
 rename Documentation/w1/slaves/{w1_ds2413 => w1_ds2413.rst} (81%)
 delete mode 100644 Documentation/w1/slaves/w1_ds2423
 create mode 100644 Documentation/w1/slaves/w1_ds2423.rst
 rename Documentation/w1/slaves/{w1_ds2438 => w1_ds2438.rst} (93%)
 rename Documentation/w1/slaves/{w1_ds28e04 => w1_ds28e04.rst} (93%)
 rename Documentation/w1/slaves/{w1_ds28e17 => w1_ds28e17.rst} (88%)
 rename Documentation/w1/slaves/{w1_therm => w1_therm.rst} (95%)
 rename Documentation/w1/{w1.generic => w1-generic.rst} (59%)
 rename Documentation/w1/{w1.netlink => w1-netlink.rst} (79%)

-- 
2.21.0


