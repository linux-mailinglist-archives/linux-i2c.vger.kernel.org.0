Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BC75AA7E
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfF2LiD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:38:03 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:46147 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfF2LiD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jun 2019 07:38:03 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id ABCB2200006;
        Sat, 29 Jun 2019 11:37:19 +0000 (UTC)
Date:   Sat, 29 Jun 2019 13:37:19 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Werner <andreas.werner@men.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Jim Cromie <jim.cromie@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: i2c: convert to ReST and add to driver-api
 bookset
Message-ID: <20190629113719.GW3692@piout.net>
References: <cover.1561756511.git.mchehab+samsung@kernel.org>
 <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/06/2019 18:23:14-0300, Mauro Carvalho Chehab wrote:
> Convert each file at I2C subsystem, renaming them to .rst and
> adding to the driver-api book.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/IPMB.txt                        |   2 +-
>  .../devicetree/bindings/i2c/i2c-mux-gpmux.txt |   2 +-
>  Documentation/hwmon/adm1021.rst               |   2 +-
>  Documentation/hwmon/adm1275.rst               |   2 +-
>  Documentation/hwmon/hih6130.rst               |   2 +-
>  Documentation/hwmon/ibm-cffps.rst             |   2 +-
>  Documentation/hwmon/lm25066.rst               |   2 +-
>  Documentation/hwmon/max16064.rst              |   2 +-
>  Documentation/hwmon/max16065.rst              |   2 +-
>  Documentation/hwmon/max20751.rst              |   2 +-
>  Documentation/hwmon/max34440.rst              |   2 +-
>  Documentation/hwmon/max6650.rst               |   2 +-
>  Documentation/hwmon/max8688.rst               |   2 +-
>  Documentation/hwmon/menf21bmc.rst             |   2 +-
>  Documentation/hwmon/pcf8591.rst               |   2 +-
>  Documentation/hwmon/sht3x.rst                 |   2 +-
>  Documentation/hwmon/shtc1.rst                 |   2 +-
>  Documentation/hwmon/tmp103.rst                |   2 +-
>  Documentation/hwmon/tps40422.rst              |   2 +-
>  Documentation/hwmon/ucd9000.rst               |   2 +-
>  Documentation/hwmon/ucd9200.rst               |   2 +-
>  Documentation/hwmon/via686a.rst               |   2 +-
>  Documentation/hwmon/zl6100.rst                |   2 +-
>  .../busses/{i2c-ali1535 => i2c-ali1535.rst}   |  13 +-
>  .../busses/{i2c-ali1563 => i2c-ali1563.rst}   |   3 +
>  .../busses/{i2c-ali15x3 => i2c-ali15x3.rst}   |  63 +++---
>  Documentation/i2c/busses/i2c-amd-mp2          |  23 ---
>  Documentation/i2c/busses/i2c-amd-mp2.rst      |  25 +++
>  .../i2c/busses/{i2c-amd756 => i2c-amd756.rst} |   8 +-
>  .../busses/{i2c-amd8111 => i2c-amd8111.rst}   |  14 +-
>  .../{i2c-diolan-u2c => i2c-diolan-u2c.rst}    |   3 +
>  .../i2c/busses/{i2c-i801 => i2c-i801.rst}     |  31 ++-
>  .../i2c/busses/{i2c-ismt => i2c-ismt.rst}     |  20 +-
>  .../busses/{i2c-mlxcpld => i2c-mlxcpld.rst}   |   6 +
>  .../busses/{i2c-nforce2 => i2c-nforce2.rst}   |  23 ++-
>  .../{i2c-nvidia-gpu => i2c-nvidia-gpu.rst}    |   6 +-
>  .../i2c/busses/{i2c-ocores => i2c-ocores.rst} |  22 +-
>  Documentation/i2c/busses/i2c-parport          | 178 ----------------
>  ...2c-parport-light => i2c-parport-light.rst} |   2 +
>  Documentation/i2c/busses/i2c-parport.rst      | 190 +++++++++++++++++
>  .../busses/{i2c-pca-isa => i2c-pca-isa.rst}   |   9 +-
>  .../i2c/busses/{i2c-piix4 => i2c-piix4.rst}   |  14 +-
>  .../busses/{i2c-sis5595 => i2c-sis5595.rst}   |  18 +-
>  Documentation/i2c/busses/i2c-sis630           |  58 ------
>  Documentation/i2c/busses/i2c-sis630.rst       |  64 ++++++
>  .../i2c/busses/{i2c-sis96x => i2c-sis96x.rst} |  28 ++-
>  .../busses/{i2c-taos-evm => i2c-taos-evm.rst} |   8 +-
>  .../i2c/busses/{i2c-via => i2c-via.rst}       |  20 +-
>  .../i2c/busses/{i2c-viapro => i2c-viapro.rst} |  12 +-
>  Documentation/i2c/busses/index.rst            |  33 +++
>  .../i2c/busses/{scx200_acb => scx200_acb.rst} |   9 +-
>  .../i2c/{dev-interface => dev-interface.rst}  |  94 +++++----
>  ...-considerations => dma-considerations.rst} |   0
>  .../i2c/{fault-codes => fault-codes.rst}      |   4 +
>  .../i2c/{functionality => functionality.rst}  |  18 +-
>  ...ult-injection => gpio-fault-injection.rst} |  12 +-
>  .../i2c/{i2c-protocol => i2c-protocol.rst}    |  28 ++-
>  Documentation/i2c/{i2c-stub => i2c-stub.rst}  |  19 +-
>  .../i2c/{i2c-topology => i2c-topology.rst}    |  68 +++---
>  Documentation/i2c/index.rst                   |  38 ++++
>  ...ting-devices => instantiating-devices.rst} |  45 ++--
>  .../muxes/{i2c-mux-gpio => i2c-mux-gpio.rst}  |  26 +--
>  ...e-parameters => old-module-parameters.rst} |  27 ++-
>  ...eprom-backend => slave-eeprom-backend.rst} |   3 +-
>  .../{slave-interface => slave-interface.rst}  |  32 +--
>  .../{smbus-protocol => smbus-protocol.rst}    |  74 ++++---
>  Documentation/i2c/{summary => summary.rst}    |   4 +-
>  ...en-bit-addresses => ten-bit-addresses.rst} |   5 +
>  ...pgrading-clients => upgrading-clients.rst} | 194 +++++++++---------
>  .../{writing-clients => writing-clients.rst}  |  94 +++++----
>  Documentation/index.rst                       |   1 +
>  Documentation/spi/spi-sc18is602               |   2 +-
>  MAINTAINERS                                   |  48 ++---
>  Next/merge.log                                |   6 +-
>  drivers/hwmon/atxp1.c                         |   2 +-
>  drivers/hwmon/smm665.c                        |   2 +-
>  drivers/i2c/Kconfig                           |   4 +-
>  drivers/i2c/busses/Kconfig                    |   2 +-
>  drivers/i2c/busses/i2c-i801.c                 |   2 +-
>  drivers/i2c/busses/i2c-taos-evm.c             |   2 +-
>  drivers/i2c/i2c-core-base.c                   |   4 +-
>  drivers/iio/dummy/iio_simple_dummy.c          |   2 +-
>  drivers/rtc/rtc-ds1374.c                      |   2 +-
>  include/linux/i2c.h                           |   2 +-
>  84 files changed, 1065 insertions(+), 750 deletions(-)
>  rename Documentation/i2c/busses/{i2c-ali1535 => i2c-ali1535.rst} (82%)
>  rename Documentation/i2c/busses/{i2c-ali1563 => i2c-ali1563.rst} (93%)
>  rename Documentation/i2c/busses/{i2c-ali15x3 => i2c-ali15x3.rst} (72%)
>  delete mode 100644 Documentation/i2c/busses/i2c-amd-mp2
>  create mode 100644 Documentation/i2c/busses/i2c-amd-mp2.rst
>  rename Documentation/i2c/busses/{i2c-amd756 => i2c-amd756.rst} (79%)
>  rename Documentation/i2c/busses/{i2c-amd8111 => i2c-amd8111.rst} (66%)
>  rename Documentation/i2c/busses/{i2c-diolan-u2c => i2c-diolan-u2c.rst} (91%)
>  rename Documentation/i2c/busses/{i2c-i801 => i2c-i801.rst} (89%)
>  rename Documentation/i2c/busses/{i2c-ismt => i2c-ismt.rst} (81%)
>  rename Documentation/i2c/busses/{i2c-mlxcpld => i2c-mlxcpld.rst} (88%)
>  rename Documentation/i2c/busses/{i2c-nforce2 => i2c-nforce2.rst} (68%)
>  rename Documentation/i2c/busses/{i2c-nvidia-gpu => i2c-nvidia-gpu.rst} (63%)
>  rename Documentation/i2c/busses/{i2c-ocores => i2c-ocores.rst} (82%)
>  delete mode 100644 Documentation/i2c/busses/i2c-parport
>  rename Documentation/i2c/busses/{i2c-parport-light => i2c-parport-light.rst} (92%)
>  create mode 100644 Documentation/i2c/busses/i2c-parport.rst
>  rename Documentation/i2c/busses/{i2c-pca-isa => i2c-pca-isa.rst} (72%)
>  rename Documentation/i2c/busses/{i2c-piix4 => i2c-piix4.rst} (92%)
>  rename Documentation/i2c/busses/{i2c-sis5595 => i2c-sis5595.rst} (74%)
>  delete mode 100644 Documentation/i2c/busses/i2c-sis630
>  create mode 100644 Documentation/i2c/busses/i2c-sis630.rst
>  rename Documentation/i2c/busses/{i2c-sis96x => i2c-sis96x.rst} (75%)
>  rename Documentation/i2c/busses/{i2c-taos-evm => i2c-taos-evm.rst} (91%)
>  rename Documentation/i2c/busses/{i2c-via => i2c-via.rst} (61%)
>  rename Documentation/i2c/busses/{i2c-viapro => i2c-viapro.rst} (87%)
>  create mode 100644 Documentation/i2c/busses/index.rst
>  rename Documentation/i2c/busses/{scx200_acb => scx200_acb.rst} (86%)
>  rename Documentation/i2c/{dev-interface => dev-interface.rst} (71%)
>  rename Documentation/i2c/{DMA-considerations => dma-considerations.rst} (100%)
>  rename Documentation/i2c/{fault-codes => fault-codes.rst} (98%)
>  rename Documentation/i2c/{functionality => functionality.rst} (91%)
>  rename Documentation/i2c/{gpio-fault-injection => gpio-fault-injection.rst} (97%)
>  rename Documentation/i2c/{i2c-protocol => i2c-protocol.rst} (83%)
>  rename Documentation/i2c/{i2c-stub => i2c-stub.rst} (93%)
>  rename Documentation/i2c/{i2c-topology => i2c-topology.rst} (89%)
>  create mode 100644 Documentation/i2c/index.rst
>  rename Documentation/i2c/{instantiating-devices => instantiating-devices.rst} (93%)
>  rename Documentation/i2c/muxes/{i2c-mux-gpio => i2c-mux-gpio.rst} (85%)
>  rename Documentation/i2c/{old-module-parameters => old-module-parameters.rst} (75%)
>  rename Documentation/i2c/{slave-eeprom-backend => slave-eeprom-backend.rst} (90%)
>  rename Documentation/i2c/{slave-interface => slave-interface.rst} (94%)
>  rename Documentation/i2c/{smbus-protocol => smbus-protocol.rst} (84%)
>  rename Documentation/i2c/{summary => summary.rst} (96%)
>  rename Documentation/i2c/{ten-bit-addresses => ten-bit-addresses.rst} (95%)
>  rename Documentation/i2c/{upgrading-clients => upgrading-clients.rst} (56%)
>  rename Documentation/i2c/{writing-clients => writing-clients.rst} (91%)
> 
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> index a6ed8b68bd0f..cd20c9764705 100644
> --- a/Documentation/IPMB.txt
> +++ b/Documentation/IPMB.txt
> @@ -82,7 +82,7 @@ Instantiate the device
>  ----------------------
>  
>  After loading the driver, you can instantiate the device as
> -described in 'Documentation/i2c/instantiating-devices'.
> +described in 'Documentation/i2c/instantiating-devices.rst'.
>  If you have multiple BMCs, each connected to your Satellite MC via
>  a different I2C bus, you can instantiate a device for each of
>  those BMCs.
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> index 2907dab56298..8b444b94e92f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> @@ -42,7 +42,7 @@ Optional properties:
>    This means that no unrelated I2C transactions are allowed on the parent I2C
>    adapter for the complete multiplexed I2C transaction.
>    The properties of mux-locked and parent-locked multiplexers are discussed
> -  in more detail in Documentation/i2c/i2c-topology.
> +  in more detail in Documentation/i2c/i2c-topology.rst.
>  
>  For each i2c child node, an I2C child bus will be created. They will
>  be numbered based on their order in the device tree.
> diff --git a/Documentation/hwmon/adm1021.rst b/Documentation/hwmon/adm1021.rst
> index 6cbb0f75fe00..116fb2019956 100644
> --- a/Documentation/hwmon/adm1021.rst
> +++ b/Documentation/hwmon/adm1021.rst
> @@ -142,7 +142,7 @@ loading the adm1021 module, then things are good.
>  If nothing happens when loading the adm1021 module, and you are certain
>  that your specific Xeon processor model includes compatible sensors, you
>  will have to explicitly instantiate the sensor chips from user-space. See
> -method 4 in Documentation/i2c/instantiating-devices. Possible slave
> +method 4 in Documentation/i2c/instantiating-devices.rst. Possible slave
>  addresses are 0x18, 0x1a, 0x29, 0x2b, 0x4c, or 0x4e. It is likely that
>  only temp2 will be correct and temp1 will have to be ignored.
>  
> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
> index 9a1913e5b4d9..49966ed70ec6 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
> @@ -75,7 +75,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  The ADM1075, unlike many other PMBus devices, does not support internal voltage
> diff --git a/Documentation/hwmon/hih6130.rst b/Documentation/hwmon/hih6130.rst
> index 649bd4be4fc2..e95d373eb693 100644
> --- a/Documentation/hwmon/hih6130.rst
> +++ b/Documentation/hwmon/hih6130.rst
> @@ -27,7 +27,7 @@ The devices communicate with the I2C protocol. All sensors are set to the same
>  I2C address 0x27 by default, so an entry with I2C_BOARD_INFO("hih6130", 0x27)
>  can be used in the board setup code.
>  
> -Please see Documentation/i2c/instantiating-devices for details on how to
> +Please see Documentation/i2c/instantiating-devices.rst for details on how to
>  instantiate I2C devices.
>  
>  sysfs-Interface
> diff --git a/Documentation/hwmon/ibm-cffps.rst b/Documentation/hwmon/ibm-cffps.rst
> index 52e74e39463a..ef8f3f806968 100644
> --- a/Documentation/hwmon/ibm-cffps.rst
> +++ b/Documentation/hwmon/ibm-cffps.rst
> @@ -17,7 +17,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  Sysfs entries
> diff --git a/Documentation/hwmon/lm25066.rst b/Documentation/hwmon/lm25066.rst
> index da15e3094c8c..30e6e77fb3c8 100644
> --- a/Documentation/hwmon/lm25066.rst
> +++ b/Documentation/hwmon/lm25066.rst
> @@ -76,7 +76,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/max16064.rst b/Documentation/hwmon/max16064.rst
> index 6d5e9538991f..c06249292557 100644
> --- a/Documentation/hwmon/max16064.rst
> +++ b/Documentation/hwmon/max16064.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/max16065.rst b/Documentation/hwmon/max16065.rst
> index fa5c852a178c..45f69f334f25 100644
> --- a/Documentation/hwmon/max16065.rst
> +++ b/Documentation/hwmon/max16065.rst
> @@ -79,7 +79,7 @@ Usage Notes
>  
>  This driver does not probe for devices, since there is no register which
>  can be safely used to identify the chip. You will have to instantiate
> -the devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +the devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  WARNING: Do not access chip registers using the i2cdump command, and do not use
> diff --git a/Documentation/hwmon/max20751.rst b/Documentation/hwmon/max20751.rst
> index aa4469be6674..fe701e07eaf5 100644
> --- a/Documentation/hwmon/max20751.rst
> +++ b/Documentation/hwmon/max20751.rst
> @@ -30,7 +30,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
> index 939138e12b02..5744df100a5d 100644
> --- a/Documentation/hwmon/max34440.rst
> +++ b/Documentation/hwmon/max34440.rst
> @@ -83,7 +83,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  For MAX34446, the value of the currX_crit attribute determines if current or
> diff --git a/Documentation/hwmon/max6650.rst b/Documentation/hwmon/max6650.rst
> index 253482add082..7952b6ecaa2d 100644
> --- a/Documentation/hwmon/max6650.rst
> +++ b/Documentation/hwmon/max6650.rst
> @@ -55,7 +55,7 @@ Usage notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  Module parameters
> diff --git a/Documentation/hwmon/max8688.rst b/Documentation/hwmon/max8688.rst
> index 009487759c61..71e7f2cbe2e2 100644
> --- a/Documentation/hwmon/max8688.rst
> +++ b/Documentation/hwmon/max8688.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/menf21bmc.rst b/Documentation/hwmon/menf21bmc.rst
> index 1f0c6b2235ab..978691d5956d 100644
> --- a/Documentation/hwmon/menf21bmc.rst
> +++ b/Documentation/hwmon/menf21bmc.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  This driver is part of the MFD driver named "menf21bmc" and does
>  not auto-detect devices.
>  You will have to instantiate the MFD driver explicitly.
> -Please see Documentation/i2c/instantiating-devices for
> +Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  Sysfs entries
> diff --git a/Documentation/hwmon/pcf8591.rst b/Documentation/hwmon/pcf8591.rst
> index e98bd542a441..5c4e85f53177 100644
> --- a/Documentation/hwmon/pcf8591.rst
> +++ b/Documentation/hwmon/pcf8591.rst
> @@ -68,7 +68,7 @@ Accessing PCF8591 via /sys interface
>  The PCF8591 is plainly impossible to detect! Thus the driver won't even
>  try. You have to explicitly instantiate the device at the relevant
>  address (in the interval [0x48..0x4f]) either through platform data, or
> -using the sysfs interface. See Documentation/i2c/instantiating-devices
> +using the sysfs interface. See Documentation/i2c/instantiating-devices.rst
>  for details.
>  
>  Directories are being created for each instantiated PCF8591:
> diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
> index 978a7117e4b2..95a850d5b2c1 100644
> --- a/Documentation/hwmon/sht3x.rst
> +++ b/Documentation/hwmon/sht3x.rst
> @@ -26,7 +26,7 @@ scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
>  
>  The device communicates with the I2C protocol. Sensors can have the I2C
>  addresses 0x44 or 0x45, depending on the wiring. See
> -Documentation/i2c/instantiating-devices for methods to instantiate the device.
> +Documentation/i2c/instantiating-devices.rst for methods to instantiate the device.
>  
>  There are two options configurable by means of sht3x_platform_data:
>  
> diff --git a/Documentation/hwmon/shtc1.rst b/Documentation/hwmon/shtc1.rst
> index aa116332ba26..70c1192bbd8c 100644
> --- a/Documentation/hwmon/shtc1.rst
> +++ b/Documentation/hwmon/shtc1.rst
> @@ -36,7 +36,7 @@ humidity is expressed as a percentage. Driver can be used as well for SHTW1
>  chip, which has the same electrical interface.
>  
>  The device communicates with the I2C protocol. All sensors are set to I2C
> -address 0x70. See Documentation/i2c/instantiating-devices for methods to
> +address 0x70. See Documentation/i2c/instantiating-devices.rst for methods to
>  instantiate the device.
>  
>  There are two options configurable by means of shtc1_platform_data:
> diff --git a/Documentation/hwmon/tmp103.rst b/Documentation/hwmon/tmp103.rst
> index 15d25806d585..205de6148fcb 100644
> --- a/Documentation/hwmon/tmp103.rst
> +++ b/Documentation/hwmon/tmp103.rst
> @@ -30,4 +30,4 @@ The driver provides the common sysfs-interface for temperatures (see
>  Documentation/hwmon/sysfs-interface.rst under Temperatures).
>  
>  Please refer how to instantiate this driver:
> -Documentation/i2c/instantiating-devices
> +Documentation/i2c/instantiating-devices.rst
> diff --git a/Documentation/hwmon/tps40422.rst b/Documentation/hwmon/tps40422.rst
> index b691e30479dd..8fe3e1c3572e 100644
> --- a/Documentation/hwmon/tps40422.rst
> +++ b/Documentation/hwmon/tps40422.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/ucd9000.rst b/Documentation/hwmon/ucd9000.rst
> index ebc4f2b3bfea..746f21fcb48c 100644
> --- a/Documentation/hwmon/ucd9000.rst
> +++ b/Documentation/hwmon/ucd9000.rst
> @@ -64,7 +64,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/ucd9200.rst b/Documentation/hwmon/ucd9200.rst
> index b819dfd75f71..4f0e7c3ca6f4 100644
> --- a/Documentation/hwmon/ucd9200.rst
> +++ b/Documentation/hwmon/ucd9200.rst
> @@ -40,7 +40,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  
> diff --git a/Documentation/hwmon/via686a.rst b/Documentation/hwmon/via686a.rst
> index a343c35df740..7ab9ddebcf79 100644
> --- a/Documentation/hwmon/via686a.rst
> +++ b/Documentation/hwmon/via686a.rst
> @@ -40,7 +40,7 @@ all as a 686A.
>  
>  The Via 686a southbridge has integrated hardware monitor functionality.
>  It also has an I2C bus, but this driver only supports the hardware monitor.
> -For the I2C bus driver, see <file:Documentation/i2c/busses/i2c-viapro>
> +For the I2C bus driver, see <file:Documentation/i2c/busses/i2c-viapro.rst>
>  
>  The Via 686a implements three temperature sensors, two fan rotation speed
>  sensors, five voltage sensors and alarms.
> diff --git a/Documentation/hwmon/zl6100.rst b/Documentation/hwmon/zl6100.rst
> index 41513bb7fe51..968aff10ce0a 100644
> --- a/Documentation/hwmon/zl6100.rst
> +++ b/Documentation/hwmon/zl6100.rst
> @@ -121,7 +121,7 @@ Usage Notes
>  -----------
>  
>  This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>  details.
>  
>  .. warning::
> diff --git a/Documentation/i2c/busses/i2c-ali1535 b/Documentation/i2c/busses/i2c-ali1535.rst
> similarity index 82%
> rename from Documentation/i2c/busses/i2c-ali1535
> rename to Documentation/i2c/busses/i2c-ali1535.rst
> index 5d46342e486a..6941064730dc 100644
> --- a/Documentation/i2c/busses/i2c-ali1535
> +++ b/Documentation/i2c/busses/i2c-ali1535.rst
> @@ -1,16 +1,19 @@
> +=========================
>  Kernel driver i2c-ali1535
> +=========================
>  
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1535 (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
>  
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -	Philip Edelbrock <phil@netroedge.com>,
> -	Mark D. Studebaker <mdsxyz123@yahoo.com>,
> -	Dan Eaton <dan.eaton@rocketlogix.com>,
> -	Stephen Rousset<stephen.rousset@rocketlogix.com>
> +	- Frodo Looijaard <frodol@dds.nl>,
> +	- Philip Edelbrock <phil@netroedge.com>,
> +	- Mark D. Studebaker <mdsxyz123@yahoo.com>,
> +	- Dan Eaton <dan.eaton@rocketlogix.com>,
> +	- Stephen Rousset<stephen.rousset@rocketlogix.com>
>  
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-ali1563 b/Documentation/i2c/busses/i2c-ali1563.rst
> similarity index 93%
> rename from Documentation/i2c/busses/i2c-ali1563
> rename to Documentation/i2c/busses/i2c-ali1563.rst
> index 41b1a077e4c7..eec32c3ba92a 100644
> --- a/Documentation/i2c/busses/i2c-ali1563
> +++ b/Documentation/i2c/busses/i2c-ali1563.rst
> @@ -1,7 +1,10 @@
> +=========================
>  Kernel driver i2c-ali1563
> +=========================
>  
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1563 (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
>  
> diff --git a/Documentation/i2c/busses/i2c-ali15x3 b/Documentation/i2c/busses/i2c-ali15x3.rst
> similarity index 72%
> rename from Documentation/i2c/busses/i2c-ali15x3
> rename to Documentation/i2c/busses/i2c-ali15x3.rst
> index 42888d8ac124..c70f7c66db51 100644
> --- a/Documentation/i2c/busses/i2c-ali15x3
> +++ b/Documentation/i2c/busses/i2c-ali15x3.rst
> @@ -1,20 +1,23 @@
> +=========================
>  Kernel driver i2c-ali15x3
> +=========================
>  
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1533 and 1543C (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
>  
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -	Philip Edelbrock <phil@netroedge.com>,
> -	Mark D. Studebaker <mdsxyz123@yahoo.com>
> +	- Frodo Looijaard <frodol@dds.nl>,
> +	- Philip Edelbrock <phil@netroedge.com>,
> +	- Mark D. Studebaker <mdsxyz123@yahoo.com>
>  
>  Module Parameters
>  -----------------
>  
>  * force_addr: int
> -  Initialize the base address of the i2c controller
> +    Initialize the base address of the i2c controller
>  
>  
>  Notes
> @@ -25,7 +28,9 @@ the BIOS. Does not do a PCI force; the device must still be present in
>  lspci. Don't use this unless the driver complains that the base address is
>  not set.
>  
> -Example: 'modprobe i2c-ali15x3 force_addr=0xe800'
> +Example::
> +
> +    modprobe i2c-ali15x3 force_addr=0xe800
>  
>  SMBus periodically hangs on ASUS P5A motherboards and can only be cleared
>  by a power cycle. Cause unknown (see Issues below).
> @@ -38,47 +43,53 @@ This is the driver for the SMB Host controller on Acer Labs Inc. (ALI)
>  M1541 and M1543C South Bridges.
>  
>  The M1543C is a South bridge for desktop systems.
> +
>  The M1541 is a South bridge for portable systems.
> +
>  They are part of the following ALI chipsets:
>  
>   * "Aladdin Pro 2" includes the M1621 Slot 1 North bridge with AGP and
> - 		100MHz CPU Front Side bus
> +   100MHz CPU Front Side bus
>   * "Aladdin V" includes the M1541 Socket 7 North bridge with AGP and 100MHz
> - 		CPU Front Side bus
> +   CPU Front Side bus
> +
>     Some Aladdin V motherboards:
> -	Asus P5A
> -	Atrend ATC-5220
> -	BCM/GVC VP1541
> -	Biostar M5ALA
> -	Gigabyte GA-5AX (** Generally doesn't work because the BIOS doesn't
> -                            enable the 7101 device! **)
> -	Iwill XA100 Plus
> -	Micronics C200
> -	Microstar (MSI) MS-5169
> +	- Asus P5A
> +	- Atrend ATC-5220
> +	- BCM/GVC VP1541
> +	- Biostar M5ALA
> +	- Gigabyte GA-5AX (Generally doesn't work because the BIOS doesn't
> +	  enable the 7101 device!)
> +	- Iwill XA100 Plus
> +	- Micronics C200
> +	- Microstar (MSI) MS-5169
>  
>    * "Aladdin IV" includes the M1541 Socket 7 North bridge
> -   		with host bus up to 83.3 MHz.
> +    with host bus up to 83.3 MHz.
>  
>  For an overview of these chips see http://www.acerlabs.com. At this time the
>  full data sheets on the web site are password protected, however if you
>  contact the ALI office in San Jose they may give you the password.
>  
>  The M1533/M1543C devices appear as FOUR separate devices on the PCI bus. An
> -output of lspci will show something similar to the following:
> +output of lspci will show something similar to the following::
>  
>    00:02.0 USB Controller: Acer Laboratories Inc. M5237 (rev 03)
>    00:03.0 Bridge: Acer Laboratories Inc. M7101      <= THIS IS THE ONE WE NEED
>    00:07.0 ISA bridge: Acer Laboratories Inc. M1533 (rev c3)
>    00:0f.0 IDE interface: Acer Laboratories Inc. M5229 (rev c1)
>  
> -** IMPORTANT **
> -** If you have a M1533 or M1543C on the board and you get
> -** "ali15x3: Error: Can't detect ali15x3!"
> -** then run lspci.
> -** If you see the 1533 and 5229 devices but NOT the 7101 device,
> -** then you must enable ACPI, the PMU, SMB, or something similar
> -** in the BIOS.
> -** The driver won't work if it can't find the M7101 device.
> +.. important::
> +
> +   If you have a M1533 or M1543C on the board and you get
> +   "ali15x3: Error: Can't detect ali15x3!"
> +   then run lspci.
> +
> +   If you see the 1533 and 5229 devices but NOT the 7101 device,
> +   then you must enable ACPI, the PMU, SMB, or something similar
> +   in the BIOS.
> +
> +   The driver won't work if it can't find the M7101 device.
>  
>  The SMB controller is part of the M7101 device, which is an ACPI-compliant
>  Power Management Unit (PMU).
> diff --git a/Documentation/i2c/busses/i2c-amd-mp2 b/Documentation/i2c/busses/i2c-amd-mp2
> deleted file mode 100644
> index 6571487171f4..000000000000
> --- a/Documentation/i2c/busses/i2c-amd-mp2
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Kernel driver i2c-amd-mp2
> -
> -Supported adapters:
> -  * AMD MP2 PCIe interface
> -
> -Datasheet: not publicly available.
> -
> -Authors:
> -	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> -	Nehal Shah <nehal-bakulchandra.shah@amd.com>
> -	Elie Morisse <syniurge@gmail.com>
> -
> -Description
> ------------
> -
> -The MP2 is an ARM processor programmed as an I2C controller and communicating
> -with the x86 host through PCI.
> -
> -If you see something like this:
> -
> -03:00.7 MP2 I2C controller: Advanced Micro Devices, Inc. [AMD] Device 15e6
> -
> -in your 'lspci -v', then this driver is for your device.
> diff --git a/Documentation/i2c/busses/i2c-amd-mp2.rst b/Documentation/i2c/busses/i2c-amd-mp2.rst
> new file mode 100644
> index 000000000000..ebc2fa899325
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-amd-mp2.rst
> @@ -0,0 +1,25 @@
> +=========================
> +Kernel driver i2c-amd-mp2
> +=========================
> +
> +Supported adapters:
> +  * AMD MP2 PCIe interface
> +
> +Datasheet: not publicly available.
> +
> +Authors:
> +	- Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +	- Nehal Shah <nehal-bakulchandra.shah@amd.com>
> +	- Elie Morisse <syniurge@gmail.com>
> +
> +Description
> +-----------
> +
> +The MP2 is an ARM processor programmed as an I2C controller and communicating
> +with the x86 host through PCI.
> +
> +If you see something like this::
> +
> +  03:00.7 MP2 I2C controller: Advanced Micro Devices, Inc. [AMD] Device 15e6
> +
> +in your ``lspci -v``, then this driver is for your device.
> diff --git a/Documentation/i2c/busses/i2c-amd756 b/Documentation/i2c/busses/i2c-amd756.rst
> similarity index 79%
> rename from Documentation/i2c/busses/i2c-amd756
> rename to Documentation/i2c/busses/i2c-amd756.rst
> index 67f30874d0bf..bc93f392a4fc 100644
> --- a/Documentation/i2c/busses/i2c-amd756
> +++ b/Documentation/i2c/busses/i2c-amd756.rst
> @@ -1,18 +1,22 @@
> +========================
>  Kernel driver i2c-amd756
> +========================
>  
>  Supported adapters:
>    * AMD 756
>    * AMD 766
>    * AMD 768
>    * AMD 8111
> +
>      Datasheets: Publicly available on AMD website
>  
>    * nVidia nForce
> +
>      Datasheet: Unavailable
>  
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -	Philip Edelbrock <phil@netroedge.com> 
> +	- Frodo Looijaard <frodol@dds.nl>,
> +	- Philip Edelbrock <phil@netroedge.com>
>  
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-amd8111 b/Documentation/i2c/busses/i2c-amd8111.rst
> similarity index 66%
> rename from Documentation/i2c/busses/i2c-amd8111
> rename to Documentation/i2c/busses/i2c-amd8111.rst
> index 460dd6635fd2..d08bf0a7f0ac 100644
> --- a/Documentation/i2c/busses/i2c-amd8111
> +++ b/Documentation/i2c/busses/i2c-amd8111.rst
> @@ -1,4 +1,6 @@
> +=========================
>  Kernel driver i2c-adm8111
> +=========================
>  
>  Supported adapters:
>      * AMD-8111 SMBus 2.0 PCI interface
> @@ -13,14 +15,14 @@ Author: Vojtech Pavlik <vojtech@suse.cz>
>  Description
>  -----------
>  
> -If you see something like this:
> +If you see something like this::
>  
> -00:07.2 SMBus: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0 (rev 02)
> -        Subsystem: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0
> -        Flags: medium devsel, IRQ 19
> -        I/O ports at d400 [size=32]
> +  00:07.2 SMBus: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0 (rev 02)
> +          Subsystem: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0
> +          Flags: medium devsel, IRQ 19
> +          I/O ports at d400 [size=32]
>  
> -in your 'lspci -v', then this driver is for your chipset.
> +in your ``lspci -v``, then this driver is for your chipset.
>  
>  Process Call Support
>  --------------------
> diff --git a/Documentation/i2c/busses/i2c-diolan-u2c b/Documentation/i2c/busses/i2c-diolan-u2c.rst
> similarity index 91%
> rename from Documentation/i2c/busses/i2c-diolan-u2c
> rename to Documentation/i2c/busses/i2c-diolan-u2c.rst
> index 0d6018c316c7..c18cbdcdf73c 100644
> --- a/Documentation/i2c/busses/i2c-diolan-u2c
> +++ b/Documentation/i2c/busses/i2c-diolan-u2c.rst
> @@ -1,7 +1,10 @@
> +============================
>  Kernel driver i2c-diolan-u2c
> +============================
>  
>  Supported adapters:
>    * Diolan U2C-12 I2C-USB adapter
> +
>      Documentation:
>  	http://www.diolan.com/i2c/u2c12.html
>  
> diff --git a/Documentation/i2c/busses/i2c-i801 b/Documentation/i2c/busses/i2c-i801.rst
> similarity index 89%
> rename from Documentation/i2c/busses/i2c-i801
> rename to Documentation/i2c/busses/i2c-i801.rst
> index d247edcb0f99..976b42a15129 100644
> --- a/Documentation/i2c/busses/i2c-i801
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -1,4 +1,7 @@
> +======================
>  Kernel driver i2c-i801
> +======================
> +
>  
>  Supported adapters:
>    * Intel 82801AA and 82801AB (ICH and ICH0 - part of the
> @@ -38,27 +41,32 @@ Supported adapters:
>    * Intel Ice Lake (PCH)
>    * Intel Comet Lake (PCH)
>    * Intel Elkhart Lake (PCH)
> +
>     Datasheets: Publicly available at the Intel website
>  
>  On Intel Patsburg and later chipsets, both the normal host SMBus controller
>  and the additional 'Integrated Device Function' controllers are supported.
>  
>  Authors: 
> -	Mark Studebaker <mdsxyz123@yahoo.com>
> -	Jean Delvare <jdelvare@suse.de>
> +	- Mark Studebaker <mdsxyz123@yahoo.com>
> +	- Jean Delvare <jdelvare@suse.de>
>  
>  
>  Module Parameters
>  -----------------
>  
>  * disable_features (bit vector)
> +
>  Disable selected features normally supported by the device. This makes it
>  possible to work around possible driver or hardware bugs if the feature in
>  question doesn't work as intended for whatever reason. Bit values:
> +
> + ====  =========================================
>   0x01  disable SMBus PEC
>   0x02  disable the block buffer
>   0x08  disable the I2C block read functionality
>   0x10  don't use interrupts
> + ====  =========================================
>  
>  
>  Description
> @@ -71,7 +79,7 @@ Pentium-based PCs, '815E' chipset, and others.
>  
>  The ICH chips contain at least SEVEN separate PCI functions in TWO logical
>  PCI devices. An output of lspci will show something similar to the
> -following:
> +following::
>  
>    00:1e.0 PCI bridge: Intel Corporation: Unknown device 2418 (rev 01)
>    00:1f.0 ISA bridge: Intel Corporation: Unknown device 2410 (rev 01)
> @@ -138,14 +146,14 @@ and you think there's something interesting on the SMBus (e.g. a
>  hardware monitoring chip), you need to add your board to the list.
>  
>  The motherboard is identified using the subvendor and subdevice IDs of the
> -host bridge PCI device. Get yours with "lspci -n -v -s 00:00.0":
> +host bridge PCI device. Get yours with ``lspci -n -v -s 00:00.0``::
>  
> -00:00.0 Class 0600: 8086:2570 (rev 02)
> -        Subsystem: 1043:80f2
> -        Flags: bus master, fast devsel, latency 0
> -        Memory at fc000000 (32-bit, prefetchable) [size=32M]
> -        Capabilities: [e4] #09 [2106]
> -        Capabilities: [a0] AGP version 3.0
> +  00:00.0 Class 0600: 8086:2570 (rev 02)
> +          Subsystem: 1043:80f2
> +          Flags: bus master, fast devsel, latency 0
> +          Memory at fc000000 (32-bit, prefetchable) [size=32M]
> +          Capabilities: [e4] #09 [2106]
> +          Capabilities: [a0] AGP version 3.0
>  
>  Here the host bridge ID is 2570 (82865G/PE/P), the subvendor ID is 1043
>  (Asus) and the subdevice ID is 80f2 (P4P800-X). You can find the symbolic
> @@ -164,7 +172,8 @@ kernel. It's very convenient if you just want to check if there's
>  anything interesting on your hidden ICH SMBus.
>  
>  
> -**********************
> +----------------------------------------------------------------------------
> +
>  The lm_sensors project gratefully acknowledges the support of Texas
>  Instruments in the initial development of this driver.
>  
> diff --git a/Documentation/i2c/busses/i2c-ismt b/Documentation/i2c/busses/i2c-ismt.rst
> similarity index 81%
> rename from Documentation/i2c/busses/i2c-ismt
> rename to Documentation/i2c/busses/i2c-ismt.rst
> index 737355822c0b..8e74919a3fdf 100644
> --- a/Documentation/i2c/busses/i2c-ismt
> +++ b/Documentation/i2c/busses/i2c-ismt.rst
> @@ -1,4 +1,7 @@
> +======================
>  Kernel driver i2c-ismt
> +======================
> +
>  
>  Supported adapters:
>    * Intel S12xx series SOCs
> @@ -11,16 +14,21 @@ Module Parameters
>  -----------------
>  
>  * bus_speed (unsigned int)
> +
>  Allows changing of the bus speed.  Normally, the bus speed is set by the BIOS
>  and never needs to be changed.  However, some SMBus analyzers are too slow for
>  monitoring the bus during debug, thus the need for this module parameter.
>  Specify the bus speed in kHz.
> +
>  Available bus frequency settings:
> -  0  no change
> -  80 kHz
> -  100 kHz
> -  400 kHz
> -  1000 kHz
> +
> +  ====   =========
> +  0      no change
> +  80     kHz
> +  100    kHz
> +  400    kHz
> +  1000   kHz
> +  ====   =========
>  
>  
>  Description
> @@ -30,7 +38,7 @@ The S12xx series of SOCs have a pair of integrated SMBus 2.0 controllers
>  targeted primarily at the microserver and storage markets.
>  
>  The S12xx series contain a pair of PCI functions.  An output of lspci will show
> -something similar to the following:
> +something similar to the following::
>  
>    00:13.0 System peripheral: Intel Corporation Centerton SMBus 2.0 Controller 0
>    00:13.1 System peripheral: Intel Corporation Centerton SMBus 2.0 Controller 1
> diff --git a/Documentation/i2c/busses/i2c-mlxcpld b/Documentation/i2c/busses/i2c-mlxcpld.rst
> similarity index 88%
> rename from Documentation/i2c/busses/i2c-mlxcpld
> rename to Documentation/i2c/busses/i2c-mlxcpld.rst
> index 925904aa9b57..9a0b2916aa71 100644
> --- a/Documentation/i2c/busses/i2c-mlxcpld
> +++ b/Documentation/i2c/busses/i2c-mlxcpld.rst
> @@ -1,9 +1,12 @@
> +==================
>  Driver i2c-mlxcpld
> +==================
>  
>  Author: Michael Shych <michaelsh@mellanox.com>
>  
>  This is the Mellanox I2C controller logic, implemented in Lattice CPLD
>  device.
> +
>  Device supports:
>   - Master mode.
>   - One physical bus.
> @@ -20,6 +23,8 @@ The next transaction types are supported:
>   - Write Byte/Block.
>  
>  Registers:
> +
> +=============== === =======================================================================
>  CPBLTY		0x0 - capability reg.
>  			Bits [6:5] - transaction length. b01 - 72B is supported,
>  			36B in other case.
> @@ -49,3 +54,4 @@ DATAx		0xa - 0x54  - 68 bytes data buffer regs.
>  			For read transactions address is sent in a separate transaction and
>  			specified in the four first bytes (DATA0 - DATA3). Data is read
>  			starting from DATA0.
> +=============== === =======================================================================
> diff --git a/Documentation/i2c/busses/i2c-nforce2 b/Documentation/i2c/busses/i2c-nforce2.rst
> similarity index 68%
> rename from Documentation/i2c/busses/i2c-nforce2
> rename to Documentation/i2c/busses/i2c-nforce2.rst
> index 9698c396b830..f5c57ea31cd3 100644
> --- a/Documentation/i2c/busses/i2c-nforce2
> +++ b/Documentation/i2c/busses/i2c-nforce2.rst
> @@ -1,4 +1,6 @@
> +=========================
>  Kernel driver i2c-nforce2
> +=========================
>  
>  Supported adapters:
>    * nForce2 MCP                10de:0064 
> @@ -16,26 +18,27 @@ Supported adapters:
>    * nForce MCP78S              10de:0752
>    * nForce MCP79               10de:0AA2
>  
> -Datasheet: not publicly available, but seems to be similar to the
> +Datasheet:
> +           not publicly available, but seems to be similar to the
>             AMD-8111 SMBus 2.0 adapter.
>  
>  Authors:
> -	Hans-Frieder Vogt <hfvogt@gmx.net>,
> -	Thomas Leibold <thomas@plx.com>, 
> -        Patrick Dreker <patrick@dreker.de>
> +	- Hans-Frieder Vogt <hfvogt@gmx.net>,
> +	- Thomas Leibold <thomas@plx.com>,
> +        - Patrick Dreker <patrick@dreker.de>
>  	
>  Description
>  -----------
>  
>  i2c-nforce2 is a driver for the SMBuses included in the nVidia nForce2 MCP.
>  
> -If your 'lspci -v' listing shows something like the following,
> +If your ``lspci -v`` listing shows something like the following::
>  
> -00:01.1 SMBus: nVidia Corporation: Unknown device 0064 (rev a2)
> -        Subsystem: Asustek Computer, Inc.: Unknown device 0c11
> -        Flags: 66Mhz, fast devsel, IRQ 5
> -        I/O ports at c000 [size=32]
> -        Capabilities: <available only to root>
> +  00:01.1 SMBus: nVidia Corporation: Unknown device 0064 (rev a2)
> +          Subsystem: Asustek Computer, Inc.: Unknown device 0c11
> +          Flags: 66Mhz, fast devsel, IRQ 5
> +          I/O ports at c000 [size=32]
> +          Capabilities: <available only to root>
>  
>  then this driver should support the SMBuses of your motherboard.
>  
> diff --git a/Documentation/i2c/busses/i2c-nvidia-gpu b/Documentation/i2c/busses/i2c-nvidia-gpu.rst
> similarity index 63%
> rename from Documentation/i2c/busses/i2c-nvidia-gpu
> rename to Documentation/i2c/busses/i2c-nvidia-gpu.rst
> index 31884d2b2eb5..38fb8a4c8756 100644
> --- a/Documentation/i2c/busses/i2c-nvidia-gpu
> +++ b/Documentation/i2c/busses/i2c-nvidia-gpu.rst
> @@ -1,4 +1,6 @@
> +============================
>  Kernel driver i2c-nvidia-gpu
> +============================
>  
>  Datasheet: not publicly available.
>  
> @@ -11,8 +13,8 @@ Description
>  i2c-nvidia-gpu is a driver for I2C controller included in NVIDIA Turing
>  and later GPUs and it is used to communicate with Type-C controller on GPUs.
>  
> -If your 'lspci -v' listing shows something like the following,
> +If your ``lspci -v`` listing shows something like the following::
>  
> -01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1ad9 (rev a1)
> +  01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1ad9 (rev a1)
>  
>  then this driver should support the I2C controller of your GPU.
> diff --git a/Documentation/i2c/busses/i2c-ocores b/Documentation/i2c/busses/i2c-ocores.rst
> similarity index 82%
> rename from Documentation/i2c/busses/i2c-ocores
> rename to Documentation/i2c/busses/i2c-ocores.rst
> index 9caaf7df1b2f..f5e175f2a2a6 100644
> --- a/Documentation/i2c/busses/i2c-ocores
> +++ b/Documentation/i2c/busses/i2c-ocores.rst
> @@ -1,4 +1,6 @@
> +========================
>  Kernel driver i2c-ocores
> +========================
>  
>  Supported adapters:
>    * OpenCores.org I2C controller by Richard Herveille (see datasheet link)
> @@ -23,9 +25,9 @@ distance between registers and the input clock speed.
>  There is also a possibility to attach a list of i2c_board_info which
>  the i2c-ocores driver will add to the bus upon creation.
>  
> -E.G. something like:
> +E.G. something like::
>  
> -static struct resource ocores_resources[] = {
> +  static struct resource ocores_resources[] = {
>  	[0] = {
>  		.start	= MYI2C_BASEADDR,
>  		.end	= MYI2C_BASEADDR + 8,
> @@ -36,10 +38,10 @@ static struct resource ocores_resources[] = {
>  		.end	= MYI2C_IRQ,
>  		.flags	= IORESOURCE_IRQ,
>  	},
> -};
> +  };
>  
> -/* optional board info */
> -struct i2c_board_info ocores_i2c_board_info[] = {
> +  /* optional board info */
> +  struct i2c_board_info ocores_i2c_board_info[] = {
>  	{
>  		I2C_BOARD_INFO("tsc2003", 0x48),
>  		.platform_data = &tsc2003_platform_data,
> @@ -49,20 +51,20 @@ struct i2c_board_info ocores_i2c_board_info[] = {
>  		I2C_BOARD_INFO("adv7180", 0x42 >> 1),
>  		.irq = ADV_IRQ
>  	}
> -};
> +  };
>  
> -static struct ocores_i2c_platform_data myi2c_data = {
> +  static struct ocores_i2c_platform_data myi2c_data = {
>  	.regstep	= 2,		/* two bytes between registers */
>  	.clock_khz	= 50000,	/* input clock of 50MHz */
>  	.devices	= ocores_i2c_board_info, /* optional table of devices */
>  	.num_devices	= ARRAY_SIZE(ocores_i2c_board_info), /* table size */
> -};
> +  };
>  
> -static struct platform_device myi2c = {
> +  static struct platform_device myi2c = {
>  	.name			= "ocores-i2c",
>  	.dev = {
>  		.platform_data	= &myi2c_data,
>  	},
>  	.num_resources		= ARRAY_SIZE(ocores_resources),
>  	.resource		= ocores_resources,
> -};
> +  };
> diff --git a/Documentation/i2c/busses/i2c-parport b/Documentation/i2c/busses/i2c-parport
> deleted file mode 100644
> index c3dbb3bfd814..000000000000
> --- a/Documentation/i2c/busses/i2c-parport
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -Kernel driver i2c-parport
> -
> -Author: Jean Delvare <jdelvare@suse.de>
> -
> -This is a unified driver for several i2c-over-parallel-port adapters,
> -such as the ones made by Philips, Velleman or ELV. This driver is
> -meant as a replacement for the older, individual drivers:
> - * i2c-philips-par
> - * i2c-elv
> - * i2c-velleman
> - * video/i2c-parport (NOT the same as this one, dedicated to home brew
> -                      teletext adapters)
> -
> -It currently supports the following devices:
> - * (type=0) Philips adapter
> - * (type=1) home brew teletext adapter
> - * (type=2) Velleman K8000 adapter
> - * (type=3) ELV adapter
> - * (type=4) Analog Devices ADM1032 evaluation board
> - * (type=5) Analog Devices evaluation boards: ADM1025, ADM1030, ADM1031
> - * (type=6) Barco LPT->DVI (K5800236) adapter
> - * (type=7) One For All JP1 parallel port adapter
> - * (type=8) VCT-jig
> -
> -These devices use different pinout configurations, so you have to tell
> -the driver what you have, using the type module parameter. There is no
> -way to autodetect the devices. Support for different pinout configurations
> -can be easily added when needed.
> -
> -Earlier kernels defaulted to type=0 (Philips).  But now, if the type
> -parameter is missing, the driver will simply fail to initialize.
> -
> -SMBus alert support is available on adapters which have this line properly
> -connected to the parallel port's interrupt pin.
> -
> -
> -Building your own adapter
> --------------------------
> -
> -If you want to build you own i2c-over-parallel-port adapter, here is
> -a sample electronics schema (credits go to Sylvain Munaut):
> -
> -Device                                                      PC
> -Side          ___________________Vdd (+)                    Side
> -               |    |         |
> -              ---  ---       ---
> -              | |  | |       | |
> -              |R|  |R|       |R|
> -              | |  | |       | |
> -              ---  ---       ---
> -               |    |         |
> -               |    |    /|   |
> -SCL  ----------x--------o |-----------x-------------------  pin 2
> -                    |    \|   |       |
> -                    |         |       |
> -                    |   |\    |       |
> -SDA  ----------x----x---| o---x---------------------------  pin 13
> -               |        |/            |
> -               |                      |
> -               |         /|           |
> -               ---------o |----------------x--------------  pin 3
> -                         \|           |    |
> -                                      |    |
> -                                     ---  ---
> -                                     | |  | |
> -                                     |R|  |R|
> -                                     | |  | |
> -                                     ---  ---
> -                                      |    | 
> -                                     ###  ###
> -                                     GND  GND
> -        
> -Remarks:
> - - This is the exact pinout and electronics used on the Analog Devices
> -   evaluation boards.
> -                   /|
> - - All inverters -o |- must be 74HC05, they must be open collector output.
> -                   \|
> - - All resitors are 10k.
> - - Pins 18-25 of the parallel port connected to GND.
> - - Pins 4-9 (D2-D7) could be used as VDD is the driver drives them high.
> -   The ADM1032 evaluation board uses D4-D7. Beware that the amount of
> -   current you can draw from the parallel port is limited. Also note that
> -   all connected lines MUST BE driven at the same state, else you'll short
> -   circuit the output buffers! So plugging the I2C adapter after loading
> -   the i2c-parport module might be a good safety since data line state
> -   prior to init may be unknown. 
> - - This is 5V!
> - - Obviously you cannot read SCL (so it's not really standard-compliant).
> -   Pretty easy to add, just copy the SDA part and use another input pin.
> -   That would give (ELV compatible pinout):
> -
> -
> -Device                                                      PC
> -Side          ______________________________Vdd (+)         Side
> -               |    |            |    |
> -              ---  ---          ---  ---
> -              | |  | |          | |  | |
> -              |R|  |R|          |R|  |R|
> -              | |  | |          | |  | |
> -              ---  ---          ---  ---
> -               |    |            |    |
> -               |    |      |\    |    |
> -SCL  ----------x--------x--| o---x------------------------  pin 15
> -                    |   |  |/         | 
> -                    |   |             |
> -                    |   |   /|        |
> -                    |   ---o |-------------x--------------  pin 2
> -                    |       \|        |    |
> -                    |                 |    |
> -                    |                 |    |
> -                    |      |\         |    |
> -SDA  ---------------x---x--| o--------x-------------------  pin 10
> -                        |  |/              |
> -                        |                  |
> -                        |   /|             |
> -                        ---o |------------------x---------  pin 3
> -                            \|             |    |
> -                                           |    |
> -                                          ---  ---
> -                                          | |  | |
> -                                          |R|  |R|
> -                                          | |  | |
> -                                          ---  ---
> -                                           |    | 
> -                                          ###  ###
> -                                          GND  GND
> -
> -
> -If possible, you should use the same pinout configuration as existing
> -adapters do, so you won't even have to change the code.
> -
> -
> -Similar (but different) drivers
> --------------------------------
> -
> -This driver is NOT the same as the i2c-pport driver found in the i2c
> -package. The i2c-pport driver makes use of modern parallel port features so
> -that you don't need additional electronics. It has other restrictions
> -however, and was not ported to Linux 2.6 (yet).
> -
> -This driver is also NOT the same as the i2c-pcf-epp driver found in the
> -lm_sensors package. The i2c-pcf-epp driver doesn't use the parallel port as
> -an I2C bus directly. Instead, it uses it to control an external I2C bus
> -master. That driver was not ported to Linux 2.6 (yet) either.
> -
> -
> -Legacy documentation for Velleman adapter
> ------------------------------------------
> -
> -Useful links:
> -Velleman                http://www.velleman.be/
> -Velleman K8000 Howto    http://howto.htlw16.ac.at/k8000-howto.html
> -
> -The project has lead to new libs for the Velleman K8000 and K8005:
> -  LIBK8000 v1.99.1 and LIBK8005 v0.21
> -With these libs, you can control the K8000 interface card and the K8005
> -stepper motor card with the simple commands which are in the original
> -Velleman software, like SetIOchannel, ReadADchannel, SendStepCCWFull and
> -many more, using /dev/velleman.
> -  http://home.wanadoo.nl/hihihi/libk8000.htm
> -  http://home.wanadoo.nl/hihihi/libk8005.htm
> -  http://struyve.mine.nu:8080/index.php?block=k8000
> -  http://sourceforge.net/projects/libk8005/
> -
> -
> -One For All JP1 parallel port adapter
> --------------------------------------
> -
> -The JP1 project revolves around a set of remote controls which expose
> -the I2C bus their internal configuration EEPROM lives on via a 6 pin
> -jumper in the battery compartment. More details can be found at:
> -
> -http://www.hifi-remote.com/jp1/
> -
> -Details of the simple parallel port hardware can be found at:
> -
> -http://www.hifi-remote.com/jp1/hardware.shtml
> diff --git a/Documentation/i2c/busses/i2c-parport-light b/Documentation/i2c/busses/i2c-parport-light.rst
> similarity index 92%
> rename from Documentation/i2c/busses/i2c-parport-light
> rename to Documentation/i2c/busses/i2c-parport-light.rst
> index 7071b8ba0af4..af85c8dfcd1a 100644
> --- a/Documentation/i2c/busses/i2c-parport-light
> +++ b/Documentation/i2c/busses/i2c-parport-light.rst
> @@ -1,4 +1,6 @@
> +===============================
>  Kernel driver i2c-parport-light
> +===============================
>  
>  Author: Jean Delvare <jdelvare@suse.de>
>  
> diff --git a/Documentation/i2c/busses/i2c-parport.rst b/Documentation/i2c/busses/i2c-parport.rst
> new file mode 100644
> index 000000000000..fae7c7ba9bd1
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-parport.rst
> @@ -0,0 +1,190 @@
> +=========================
> +Kernel driver i2c-parport
> +=========================
> +
> +Author: Jean Delvare <jdelvare@suse.de>
> +
> +This is a unified driver for several i2c-over-parallel-port adapters,
> +such as the ones made by Philips, Velleman or ELV. This driver is
> +meant as a replacement for the older, individual drivers:
> +
> + * i2c-philips-par
> + * i2c-elv
> + * i2c-velleman
> + * video/i2c-parport
> +   (NOT the same as this one, dedicated to home brew teletext adapters)
> +
> +It currently supports the following devices:
> +
> + * (type=0) Philips adapter
> + * (type=1) home brew teletext adapter
> + * (type=2) Velleman K8000 adapter
> + * (type=3) ELV adapter
> + * (type=4) Analog Devices ADM1032 evaluation board
> + * (type=5) Analog Devices evaluation boards: ADM1025, ADM1030, ADM1031
> + * (type=6) Barco LPT->DVI (K5800236) adapter
> + * (type=7) One For All JP1 parallel port adapter
> + * (type=8) VCT-jig
> +
> +These devices use different pinout configurations, so you have to tell
> +the driver what you have, using the type module parameter. There is no
> +way to autodetect the devices. Support for different pinout configurations
> +can be easily added when needed.
> +
> +Earlier kernels defaulted to type=0 (Philips).  But now, if the type
> +parameter is missing, the driver will simply fail to initialize.
> +
> +SMBus alert support is available on adapters which have this line properly
> +connected to the parallel port's interrupt pin.
> +
> +
> +Building your own adapter
> +-------------------------
> +
> +If you want to build you own i2c-over-parallel-port adapter, here is
> +a sample electronics schema (credits go to Sylvain Munaut)::
> +
> +  Device                                                      PC
> +  Side          ___________________Vdd (+)                    Side
> +                 |    |         |
> +                ---  ---       ---
> +                | |  | |       | |
> +                |R|  |R|       |R|
> +                | |  | |       | |
> +                ---  ---       ---
> +                 |    |         |
> +                 |    |    /|   |
> +  SCL  ----------x--------o |-----------x-------------------  pin 2
> +                      |    \|   |       |
> +                      |         |       |
> +                      |   |\    |       |
> +  SDA  ----------x----x---| o---x---------------------------  pin 13
> +                 |        |/            |
> +                 |                      |
> +                 |         /|           |
> +                 ---------o |----------------x--------------  pin 3
> +                           \|           |    |
> +                                        |    |
> +                                       ---  ---
> +                                       | |  | |
> +                                       |R|  |R|
> +                                       | |  | |
> +                                       ---  ---
> +                                        |    |
> +                                       ###  ###
> +                                       GND  GND
> +
> +Remarks:
> + - This is the exact pinout and electronics used on the Analog Devices
> +   evaluation boards.
> + - All inverters::
> +
> +                   /|
> +                 -o |-
> +                   \|
> +
> +   must be 74HC05, they must be open collector output.
> + - All resitors are 10k.
> + - Pins 18-25 of the parallel port connected to GND.
> + - Pins 4-9 (D2-D7) could be used as VDD is the driver drives them high.
> +   The ADM1032 evaluation board uses D4-D7. Beware that the amount of
> +   current you can draw from the parallel port is limited. Also note that
> +   all connected lines MUST BE driven at the same state, else you'll short
> +   circuit the output buffers! So plugging the I2C adapter after loading
> +   the i2c-parport module might be a good safety since data line state
> +   prior to init may be unknown. 
> + - This is 5V!
> + - Obviously you cannot read SCL (so it's not really standard-compliant).
> +   Pretty easy to add, just copy the SDA part and use another input pin.
> +   That would give (ELV compatible pinout)::
> +
> +
> +      Device                                                      PC
> +      Side          ______________________________Vdd (+)         Side
> +                     |    |            |    |
> +                    ---  ---          ---  ---
> +                    | |  | |          | |  | |
> +                    |R|  |R|          |R|  |R|
> +                    | |  | |          | |  | |
> +                    ---  ---          ---  ---
> +                     |    |            |    |
> +                     |    |      |\    |    |
> +      SCL  ----------x--------x--| o---x------------------------  pin 15
> +                          |   |  |/         |
> +                          |   |             |
> +                          |   |   /|        |
> +                          |   ---o |-------------x--------------  pin 2
> +                          |       \|        |    |
> +                          |                 |    |
> +                          |                 |    |
> +                          |      |\         |    |
> +      SDA  ---------------x---x--| o--------x-------------------  pin 10
> +                              |  |/              |
> +                              |                  |
> +                              |   /|             |
> +                              ---o |------------------x---------  pin 3
> +                                  \|             |    |
> +                                                 |    |
> +                                                ---  ---
> +                                                | |  | |
> +                                                |R|  |R|
> +                                                | |  | |
> +                                                ---  ---
> +                                                 |    |
> +                                                ###  ###
> +                                                GND  GND
> +
> +
> +If possible, you should use the same pinout configuration as existing
> +adapters do, so you won't even have to change the code.
> +
> +
> +Similar (but different) drivers
> +-------------------------------
> +
> +This driver is NOT the same as the i2c-pport driver found in the i2c
> +package. The i2c-pport driver makes use of modern parallel port features so
> +that you don't need additional electronics. It has other restrictions
> +however, and was not ported to Linux 2.6 (yet).
> +
> +This driver is also NOT the same as the i2c-pcf-epp driver found in the
> +lm_sensors package. The i2c-pcf-epp driver doesn't use the parallel port as
> +an I2C bus directly. Instead, it uses it to control an external I2C bus
> +master. That driver was not ported to Linux 2.6 (yet) either.
> +
> +
> +Legacy documentation for Velleman adapter
> +-----------------------------------------
> +
> +Useful links:
> +
> +- Velleman                http://www.velleman.be/
> +- Velleman K8000 Howto    http://howto.htlw16.ac.at/k8000-howto.html
> +
> +The project has lead to new libs for the Velleman K8000 and K8005:
> +
> +  LIBK8000 v1.99.1 and LIBK8005 v0.21
> +
> +With these libs, you can control the K8000 interface card and the K8005
> +stepper motor card with the simple commands which are in the original
> +Velleman software, like SetIOchannel, ReadADchannel, SendStepCCWFull and
> +many more, using /dev/velleman.
> +
> +  - http://home.wanadoo.nl/hihihi/libk8000.htm
> +  - http://home.wanadoo.nl/hihihi/libk8005.htm
> +  - http://struyve.mine.nu:8080/index.php?block=k8000
> +  - http://sourceforge.net/projects/libk8005/
> +
> +
> +One For All JP1 parallel port adapter
> +-------------------------------------
> +
> +The JP1 project revolves around a set of remote controls which expose
> +the I2C bus their internal configuration EEPROM lives on via a 6 pin
> +jumper in the battery compartment. More details can be found at:
> +
> +http://www.hifi-remote.com/jp1/
> +
> +Details of the simple parallel port hardware can be found at:
> +
> +http://www.hifi-remote.com/jp1/hardware.shtml
> diff --git a/Documentation/i2c/busses/i2c-pca-isa b/Documentation/i2c/busses/i2c-pca-isa.rst
> similarity index 72%
> rename from Documentation/i2c/busses/i2c-pca-isa
> rename to Documentation/i2c/busses/i2c-pca-isa.rst
> index b044e5265488..a254010c8055 100644
> --- a/Documentation/i2c/busses/i2c-pca-isa
> +++ b/Documentation/i2c/busses/i2c-pca-isa.rst
> @@ -1,6 +1,9 @@
> +=========================
>  Kernel driver i2c-pca-isa
> +=========================
>  
>  Supported adapters:
> +
>  This driver supports ISA boards using the Philips PCA 9564
>  Parallel bus to I2C bus controller
>  
> @@ -10,11 +13,11 @@ Module Parameters
>  -----------------
>  
>  * base int
> - I/O base address
> +    I/O base address
>  * irq int
> - IRQ interrupt
> +    IRQ interrupt
>  * clock int
> - Clock rate as described in table 1 of PCA9564 datasheet
> +    Clock rate as described in table 1 of PCA9564 datasheet
>  
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-piix4 b/Documentation/i2c/busses/i2c-piix4.rst
> similarity index 92%
> rename from Documentation/i2c/busses/i2c-piix4
> rename to Documentation/i2c/busses/i2c-piix4.rst
> index 2703bc3acad0..5d4744842b41 100644
> --- a/Documentation/i2c/busses/i2c-piix4
> +++ b/Documentation/i2c/busses/i2c-piix4.rst
> @@ -1,4 +1,6 @@
> +=======================
>  Kernel driver i2c-piix4
> +=======================
>  
>  Supported adapters:
>    * Intel 82371AB PIIX4 and PIIX4E
> @@ -21,8 +23,8 @@ Supported adapters:
>      Datasheet: Publicly available at the SMSC website http://www.smsc.com
>  
>  Authors: 
> -	Frodo Looijaard <frodol@dds.nl>
> -	Philip Edelbrock <phil@netroedge.com>
> +	- Frodo Looijaard <frodol@dds.nl>
> +	- Philip Edelbrock <phil@netroedge.com>
>  
>  
>  Module Parameters
> @@ -45,10 +47,10 @@ natively understands SMBus commands and you do not have to worry about
>  timing problems. The bad news is that non-SMBus devices connected to it can
>  confuse it mightily. Yes, this is known to happen...
>  
> -Do 'lspci -v' and see whether it contains an entry like this:
> +Do ``lspci -v`` and see whether it contains an entry like this::
>  
> -0000:00:02.3 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 02)
> -	     Flags: medium devsel, IRQ 9
> +  0000:00:02.3 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 02)
> +	       Flags: medium devsel, IRQ 9
>  
>  Bus and device numbers may differ, but the function number must be
>  identical (like many PCI devices, the PIIX4 incorporates a number of
> @@ -91,7 +93,7 @@ the SMI mode.
>     device is located at 00:0f.0.
>  2) Now you just need to change the value in 0xD2 register. Get it first with
>     command: lspci -xxx -s 00:0f.0
> -   If the value is 0x3 then you need to change it to 0x1
> +   If the value is 0x3 then you need to change it to 0x1:
>     setpci  -s 00:0f.0 d2.b=1
>  
>  Please note that you don't need to do that in all cases, just when the SMBus is
> diff --git a/Documentation/i2c/busses/i2c-sis5595 b/Documentation/i2c/busses/i2c-sis5595.rst
> similarity index 74%
> rename from Documentation/i2c/busses/i2c-sis5595
> rename to Documentation/i2c/busses/i2c-sis5595.rst
> index ecd21fb49a8f..5614afe35e79 100644
> --- a/Documentation/i2c/busses/i2c-sis5595
> +++ b/Documentation/i2c/busses/i2c-sis5595.rst
> @@ -1,9 +1,11 @@
> +=========================
>  Kernel driver i2c-sis5595
> +=========================
>  
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -        Mark D. Studebaker <mdsxyz123@yahoo.com>,
> -	Philip Edelbrock <phil@netroedge.com>
> +	- Frodo Looijaard <frodol@dds.nl>,
> +        - Mark D. Studebaker <mdsxyz123@yahoo.com>,
> +	- Philip Edelbrock <phil@netroedge.com>
>  
>  Supported adapters:
>    * Silicon Integrated Systems Corp. SiS5595 Southbridge
> @@ -11,14 +13,19 @@ Supported adapters:
>  
>  Note: all have mfr. ID 0x1039.
>  
> +   =========            ======
>     SUPPORTED            PCI ID
> +   =========            ======
>          5595            0008
> +   =========            ======
>  
>     Note: these chips contain a 0008 device which is incompatible with the
>           5595. We recognize these by the presence of the listed
>           "blacklist" PCI ID and refuse to load.
>  
> +   =============        ======          ================
>     NOT SUPPORTED        PCI ID          BLACKLIST PCI ID
> +   =============        ======          ================
>           540            0008            0540
>           550            0008            0550
>          5513            0008            5511
> @@ -36,15 +43,18 @@ Note: all have mfr. ID 0x1039.
>           735            0008            0735
>           745            0008            0745
>           746            0008            0746
> +   =============        ======          ================
>  
>  Module Parameters
>  -----------------
>  
> -* force_addr=0xaddr	Set the I/O base address. Useful for boards
> +==================	=====================================================
> +force_addr=0xaddr	Set the I/O base address. Useful for boards
>  			that don't set the address in the BIOS. Does not do a
>  			PCI force; the device must still be present in lspci.
>  			Don't use this unless the driver complains that the
>  			base address is not set.
> +==================	=====================================================
>  
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-sis630 b/Documentation/i2c/busses/i2c-sis630
> deleted file mode 100644
> index ee7943631074..000000000000
> --- a/Documentation/i2c/busses/i2c-sis630
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Kernel driver i2c-sis630
> -
> -Supported adapters:
> -  * Silicon Integrated Systems Corp (SiS)
> -	630 chipset (Datasheet: available at http://www.sfr-fresh.com/linux)
> -	730 chipset
> -	964 chipset
> -  * Possible other SiS chipsets ?
> -
> -Author: Alexander Malysh <amalysh@web.de>
> -	Amaury Decrême <amaury.decreme@gmail.com> - SiS964 support
> -
> -Module Parameters
> ------------------
> -
> -* force = [1|0] Forcibly enable the SIS630. DANGEROUS!
> -		This can be interesting for chipsets not named
> -		above to check if it works for you chipset, but DANGEROUS!
> -
> -* high_clock = [1|0] Forcibly set Host Master Clock to 56KHz (default,
> -			what your BIOS use). DANGEROUS! This should be a bit
> -			faster, but freeze some systems (i.e. my Laptop).
> -			SIS630/730 chip only.
> -
> -
> -Description
> ------------
> -
> -This SMBus only driver is known to work on motherboards with the above
> -named chipsets.
> -
> -If you see something like this:
> -
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS] 630 Host (rev 31)
> -00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> -
> -or like this:
> -
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS] 730 Host (rev 02)
> -00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> -
> -or like this:
> -
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS] 760/M760 Host (rev 02)
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS964 [MuTIOL Media IO]
> -							LPC Controller (rev 36)
> -
> -in your 'lspci' output , then this driver is for your chipset.
> -
> -Thank You
> ----------
> -Philip Edelbrock <phil@netroedge.com>
> -- testing SiS730 support
> -Mark M. Hoffman <mhoffman@lightlink.com>
> -- bug fixes
> -
> -To anyone else which I forgot here ;), thanks!
> -
> diff --git a/Documentation/i2c/busses/i2c-sis630.rst b/Documentation/i2c/busses/i2c-sis630.rst
> new file mode 100644
> index 000000000000..f37700e885f2
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-sis630.rst
> @@ -0,0 +1,64 @@
> +========================
> +Kernel driver i2c-sis630
> +========================
> +
> +Supported adapters:
> +  * Silicon Integrated Systems Corp (SiS)
> +	630 chipset (Datasheet: available at http://www.sfr-fresh.com/linux)
> +	730 chipset
> +	964 chipset
> +  * Possible other SiS chipsets ?
> +
> +Author:
> +        - Alexander Malysh <amalysh@web.de>
> +	- Amaury Decrême <amaury.decreme@gmail.com> - SiS964 support
> +
> +Module Parameters
> +-----------------
> +
> +==================      =====================================================
> +force = [1|0]           Forcibly enable the SIS630. DANGEROUS!
> +                        This can be interesting for chipsets not named
> +                        above to check if it works for you chipset,
> +                        but DANGEROUS!
> +
> +high_clock = [1|0]      Forcibly set Host Master Clock to 56KHz (default,
> +			what your BIOS use). DANGEROUS! This should be a bit
> +			faster, but freeze some systems (i.e. my Laptop).
> +			SIS630/730 chip only.
> +==================      =====================================================
> +
> +
> +Description
> +-----------
> +
> +This SMBus only driver is known to work on motherboards with the above
> +named chipsets.
> +
> +If you see something like this::
> +
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS] 630 Host (rev 31)
> +  00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> +
> +or like this::
> +
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS] 730 Host (rev 02)
> +  00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> +
> +or like this::
> +
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS] 760/M760 Host (rev 02)
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS964 [MuTIOL Media IO]
> +							LPC Controller (rev 36)
> +
> +in your ``lspci`` output , then this driver is for your chipset.
> +
> +Thank You
> +---------
> +Philip Edelbrock <phil@netroedge.com>
> +- testing SiS730 support
> +Mark M. Hoffman <mhoffman@lightlink.com>
> +- bug fixes
> +
> +To anyone else which I forgot here ;), thanks!
> +
> diff --git a/Documentation/i2c/busses/i2c-sis96x b/Documentation/i2c/busses/i2c-sis96x.rst
> similarity index 75%
> rename from Documentation/i2c/busses/i2c-sis96x
> rename to Documentation/i2c/busses/i2c-sis96x.rst
> index 0b979f3252a4..b84581ade213 100644
> --- a/Documentation/i2c/busses/i2c-sis96x
> +++ b/Documentation/i2c/busses/i2c-sis96x.rst
> @@ -1,11 +1,16 @@
> +========================
>  Kernel driver i2c-sis96x
> +========================
>  
>  Replaces 2.4.x i2c-sis645
>  
>  Supported adapters:
> +
>    * Silicon Integrated Systems Corp (SiS)
> +
>      Any combination of these host bridges:
>  	645, 645DX (aka 646), 648, 650, 651, 655, 735, 745, 746
> +
>      and these south bridges:
>      	961, 962, 963(L)
>  
> @@ -21,17 +26,17 @@ those of the SiS630, although they are located in a completely different
>  place. Thanks to Alexander Malysh <amalysh@web.de> for providing the
>  SiS630 datasheet (and  driver).
>  
> -The command "lspci" as root should produce something like these lines:
> +The command ``lspci`` as root should produce something like these lines::
>  
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 0645
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> -00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 0645
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> +  00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
>  
> -or perhaps this...
> +or perhaps this::
>  
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 0645
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS]: Unknown device 0961
> -00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 0645
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS]: Unknown device 0961
> +  00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
>  
>  (kernel versions later than 2.4.18 may fill in the "Unknown"s)
>  
> @@ -50,7 +55,7 @@ TO DOs
>  ------
>  
>  * The driver does not support SMBus block reads/writes; I may add them if a
> -scenario is found where they're needed.
> +  scenario is found where they're needed.
>  
>  
>  Thank You
> @@ -58,14 +63,19 @@ Thank You
>  
>  Mark D. Studebaker <mdsxyz123@yahoo.com>
>   - design hints and bug fixes
> +
>  Alexander Maylsh <amalysh@web.de>
>   - ditto, plus an important datasheet... almost the one I really wanted
> +
>  Hans-Günter Lütke Uphues <hg_lu@t-online.de>
>   - patch for SiS735
> +
>  Robert Zwerus <arzie@dds.nl>
>   - testing for SiS645DX
> +
>  Kianusch Sayah Karadji <kianusch@sk-tech.net>
>   - patch for SiS645DX/962
> +
>  Ken Healy
>   - patch for SiS655
>  
> diff --git a/Documentation/i2c/busses/i2c-taos-evm b/Documentation/i2c/busses/i2c-taos-evm.rst
> similarity index 91%
> rename from Documentation/i2c/busses/i2c-taos-evm
> rename to Documentation/i2c/busses/i2c-taos-evm.rst
> index 60299555dcf0..f342e313ee3d 100644
> --- a/Documentation/i2c/busses/i2c-taos-evm
> +++ b/Documentation/i2c/busses/i2c-taos-evm.rst
> @@ -1,4 +1,6 @@
> +==========================
>  Kernel driver i2c-taos-evm
> +==========================
>  
>  Author: Jean Delvare <jdelvare@suse.de>
>  
> @@ -23,10 +25,10 @@ Using this driver
>  In order to use this driver, you'll need the serport driver, and the
>  inputattach tool, which is part of the input-utils package. The following
>  commands will tell the kernel that you have a TAOS EVM on the first
> -serial port:
> +serial port::
>  
> -# modprobe serport
> -# inputattach --taos-evm /dev/ttyS0
> +  # modprobe serport
> +  # inputattach --taos-evm /dev/ttyS0
>  
>  
>  Technical details
> diff --git a/Documentation/i2c/busses/i2c-via b/Documentation/i2c/busses/i2c-via.rst
> similarity index 61%
> rename from Documentation/i2c/busses/i2c-via
> rename to Documentation/i2c/busses/i2c-via.rst
> index 343870661ac3..df1df5adff7b 100644
> --- a/Documentation/i2c/busses/i2c-via
> +++ b/Documentation/i2c/busses/i2c-via.rst
> @@ -1,4 +1,6 @@
> +=====================
>  Kernel driver i2c-via
> +=====================
>  
>  Supported adapters:
>    * VIA Technologies, InC. VT82C586B
> @@ -15,20 +17,24 @@ The following VIA pci chipsets are supported:
>   - MVP3, VP3, VP2/97, VPX/97 
>   - others with South bridge VT82C586B
>  
> -Your lspci listing must show this :
> +Your ``lspci`` listing must show this ::
>  
>   Bridge: VIA Technologies, Inc. VT82C586B ACPI (rev 10)
>  
> -    Problems?
> +Problems?
> +---------
>   
> - Q: You have VT82C586B on the motherboard, but not in the listing. 
> + Q:
> +    You have VT82C586B on the motherboard, but not in the listing.
>   
> - A: Go to your BIOS setup, section PCI devices or similar.
> + A:
> +    Go to your BIOS setup, section PCI devices or similar.
>      Turn USB support on, and try again. 
>  
> - Q: No error messages, but still i2c doesn't seem to work.
> + Q:
> +    No error messages, but still i2c doesn't seem to work.
>  
> - A: This can happen. This driver uses the pins VIA recommends in their
> + A:
> +    This can happen. This driver uses the pins VIA recommends in their
>      datasheets, but there are several ways the motherboard manufacturer
>      can actually wire the lines.
> -
> diff --git a/Documentation/i2c/busses/i2c-viapro b/Documentation/i2c/busses/i2c-viapro.rst
> similarity index 87%
> rename from Documentation/i2c/busses/i2c-viapro
> rename to Documentation/i2c/busses/i2c-viapro.rst
> index ab64ce21c254..1762f0cf93d0 100644
> --- a/Documentation/i2c/busses/i2c-viapro
> +++ b/Documentation/i2c/busses/i2c-viapro.rst
> @@ -1,4 +1,6 @@
> +========================
>  Kernel driver i2c-viapro
> +========================
>  
>  Supported adapters:
>    * VIA Technologies, Inc. VT82C596A/B
> @@ -26,9 +28,9 @@ Supported adapters:
>      Datasheet: available on http://linux.via.com.tw
>  
>  Authors:
> -	Kyösti Mälkki <kmalkki@cc.hut.fi>,
> -	Mark D. Studebaker <mdsxyz123@yahoo.com>,
> -	Jean Delvare <jdelvare@suse.de>
> +	- Kyösti Mälkki <kmalkki@cc.hut.fi>,
> +	- Mark D. Studebaker <mdsxyz123@yahoo.com>,
> +	- Jean Delvare <jdelvare@suse.de>
>  
>  Module Parameters
>  -----------------
> @@ -44,8 +46,9 @@ Description
>  i2c-viapro is a true SMBus host driver for motherboards with one of the
>  supported VIA south bridges.
>  
> -Your lspci -n listing must show one of these :
> +Your ``lspci -n`` listing must show one of these :
>  
> + ================   ======================
>   device 1106:3050   (VT82C596A function 3)
>   device 1106:3051   (VT82C596B function 3)
>   device 1106:3057   (VT82C686 function 4)
> @@ -61,6 +64,7 @@ Your lspci -n listing must show one of these :
>   device 1106:8353   (VX800/VX820)
>   device 1106:8409   (VX855/VX875)
>   device 1106:8410   (VX900)
> + ================   ======================
>  
>  If none of these show up, you should look in the BIOS for settings like
>  enable ACPI / SMBus or even USB.
> diff --git a/Documentation/i2c/busses/index.rst b/Documentation/i2c/busses/index.rst
> new file mode 100644
> index 000000000000..97ca4d510816
> --- /dev/null
> +++ b/Documentation/i2c/busses/index.rst
> @@ -0,0 +1,33 @@
> +. SPDX-License-Identifier: GPL-2.0
> +
> +===============
> +I2C Bus Drivers
> +===============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   i2c-ali1535
> +   i2c-ali1563
> +   i2c-ali15x3
> +   i2c-amd756
> +   i2c-amd8111
> +   i2c-amd-mp2
> +   i2c-diolan-u2c
> +   i2c-i801
> +   i2c-ismt
> +   i2c-mlxcpld
> +   i2c-nforce2
> +   i2c-nvidia-gpu
> +   i2c-ocores
> +   i2c-parport-light
> +   i2c-parport
> +   i2c-pca-isa
> +   i2c-piix4
> +   i2c-sis5595
> +   i2c-sis630
> +   i2c-sis96x
> +   i2c-taos-evm
> +   i2c-viapro
> +   i2c-via
> +   scx200_acb
> diff --git a/Documentation/i2c/busses/scx200_acb b/Documentation/i2c/busses/scx200_acb.rst
> similarity index 86%
> rename from Documentation/i2c/busses/scx200_acb
> rename to Documentation/i2c/busses/scx200_acb.rst
> index ce83c871fe95..8dc7c352508c 100644
> --- a/Documentation/i2c/busses/scx200_acb
> +++ b/Documentation/i2c/busses/scx200_acb.rst
> @@ -1,4 +1,6 @@
> +========================
>  Kernel driver scx200_acb
> +========================
>  
>  Author: Christer Weinigel <wingel@nano-system.com>
>  
> @@ -25,8 +27,11 @@ Device-specific notes
>  
>  The SC1100 WRAP boards are known to use base addresses 0x810 and 0x820.
>  If the scx200_acb driver is built into the kernel, add the following
> -parameter to your boot command line:
> +parameter to your boot command line::
> +
>    scx200_acb.base=0x810,0x820
> +
>  If the scx200_acb driver is built as a module, add the following line to
> -a configuration file in /etc/modprobe.d/ instead:
> +a configuration file in /etc/modprobe.d/ instead::
> +
>    options scx200_acb base=0x810,0x820
> diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface.rst
> similarity index 71%
> rename from Documentation/i2c/dev-interface
> rename to Documentation/i2c/dev-interface.rst
> index fbed645ccd75..69c23a3c2b1b 100644
> --- a/Documentation/i2c/dev-interface
> +++ b/Documentation/i2c/dev-interface.rst
> @@ -1,3 +1,7 @@
> +====================
> +I2C Device Interface
> +====================
> +
>  Usually, i2c devices are controlled by a kernel driver. But it is also
>  possible to access all devices on an adapter from userspace, through
>  the /dev interface. You need to load module i2c-dev for this.
> @@ -18,7 +22,7 @@ C example
>  =========
>  
>  So let's say you want to access an i2c adapter from a C program.
> -First, you need to include these two headers:
> +First, you need to include these two headers::
>  
>    #include <linux/i2c-dev.h>
>    #include <i2c/smbus.h>
> @@ -28,7 +32,7 @@ inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
>  Adapter numbers are assigned somewhat dynamically, so you can not
>  assume much about them. They can even change from one boot to the next.
>  
> -Next thing, open the device file, as follows:
> +Next thing, open the device file, as follows::
>  
>    int file;
>    int adapter_nr = 2; /* probably dynamically determined */
> @@ -42,7 +46,7 @@ Next thing, open the device file, as follows:
>    }
>  
>  When you have opened the device, you must specify with what device
> -address you want to communicate:
> +address you want to communicate::
>  
>    int addr = 0x40; /* The I2C address */
>  
> @@ -53,7 +57,7 @@ address you want to communicate:
>  
>  Well, you are all set up now. You can now use SMBus commands or plain
>  I2C to communicate with your device. SMBus commands are preferred if
> -the device supports them. Both are illustrated below.
> +the device supports them. Both are illustrated below::
>  
>    __u8 reg = 0x10; /* Device register to access */
>    __s32 res;
> @@ -100,35 +104,35 @@ Full interface description
>  
>  The following IOCTLs are defined:
>  
> -ioctl(file, I2C_SLAVE, long addr)
> +``ioctl(file, I2C_SLAVE, long addr)``
>    Change slave address. The address is passed in the 7 lower bits of the
>    argument (except for 10 bit addresses, passed in the 10 lower bits in this
>    case).
>  
> -ioctl(file, I2C_TENBIT, long select)
> +``ioctl(file, I2C_TENBIT, long select)``
>    Selects ten bit addresses if select not equals 0, selects normal 7 bit
>    addresses if select equals 0. Default 0.  This request is only valid
>    if the adapter has I2C_FUNC_10BIT_ADDR.
>  
> -ioctl(file, I2C_PEC, long select)
> +``ioctl(file, I2C_PEC, long select)``
>    Selects SMBus PEC (packet error checking) generation and verification
>    if select not equals 0, disables if select equals 0. Default 0.
>    Used only for SMBus transactions.  This request only has an effect if the
>    the adapter has I2C_FUNC_SMBUS_PEC; it is still safe if not, it just
>    doesn't have any effect.
>  
> -ioctl(file, I2C_FUNCS, unsigned long *funcs)
> -  Gets the adapter functionality and puts it in *funcs.
> +``ioctl(file, I2C_FUNCS, unsigned long *funcs)``
> +  Gets the adapter functionality and puts it in ``*funcs``.
>  
> -ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)
> +``ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)``
>    Do combined read/write transaction without stop in between.
>    Only valid if the adapter has I2C_FUNC_I2C.  The argument is
> -  a pointer to a
> +  a pointer to a::
>  
> -  struct i2c_rdwr_ioctl_data {
> +    struct i2c_rdwr_ioctl_data {
>        struct i2c_msg *msgs;  /* ptr to array of simple messages */
>        int nmsgs;             /* number of messages to exchange */
> -  }
> +    }
>  
>    The msgs[] themselves contain further pointers into data buffers.
>    The function will write or read data to or from that buffers depending
> @@ -136,8 +140,8 @@ ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)
>    The slave address and whether to use ten bit address mode has to be
>    set in each message, overriding the values set with the above ioctl's.
>  
> -ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)
> -  If possible, use the provided i2c_smbus_* methods described below instead
> +``ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)``
> +  If possible, use the provided ``i2c_smbus_*`` methods described below instead
>    of issuing direct ioctls.
>  
>  You can do plain i2c transactions by using read(2) and write(2) calls.
> @@ -145,7 +149,8 @@ You do not need to pass the address byte; instead, set it through
>  ioctl I2C_SLAVE before you try to access the device.
>  
>  You can do SMBus level transactions (see documentation file smbus-protocol
> -for details) through the following functions:
> +for details) through the following functions::
> +
>    __s32 i2c_smbus_write_quick(int file, __u8 value);
>    __s32 i2c_smbus_read_byte(int file);
>    __s32 i2c_smbus_write_byte(int file, __u8 value);
> @@ -157,6 +162,7 @@ for details) through the following functions:
>    __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 *values);
>    __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
>                                     __u8 *values);
> +
>  All these transactions return -1 on failure; you can read errno to see
>  what happened. The 'write' transactions return 0 on success; the
>  'read' transactions return the read value, except for read_block, which
> @@ -174,39 +180,39 @@ Implementation details
>  For the interested, here's the code flow which happens inside the kernel
>  when you use the /dev interface to I2C:
>  
> -1* Your program opens /dev/i2c-N and calls ioctl() on it, as described in
> -section "C example" above.
> +1) Your program opens /dev/i2c-N and calls ioctl() on it, as described in
> +   section "C example" above.
>  
> -2* These open() and ioctl() calls are handled by the i2c-dev kernel
> -driver: see i2c-dev.c:i2cdev_open() and i2c-dev.c:i2cdev_ioctl(),
> -respectively. You can think of i2c-dev as a generic I2C chip driver
> -that can be programmed from user-space.
> +2) These open() and ioctl() calls are handled by the i2c-dev kernel
> +   driver: see i2c-dev.c:i2cdev_open() and i2c-dev.c:i2cdev_ioctl(),
> +   respectively. You can think of i2c-dev as a generic I2C chip driver
> +   that can be programmed from user-space.
>  
> -3* Some ioctl() calls are for administrative tasks and are handled by
> -i2c-dev directly. Examples include I2C_SLAVE (set the address of the
> -device you want to access) and I2C_PEC (enable or disable SMBus error
> -checking on future transactions.)
> +3) Some ioctl() calls are for administrative tasks and are handled by
> +   i2c-dev directly. Examples include I2C_SLAVE (set the address of the
> +   device you want to access) and I2C_PEC (enable or disable SMBus error
> +   checking on future transactions.)
>  
> -4* Other ioctl() calls are converted to in-kernel function calls by
> -i2c-dev. Examples include I2C_FUNCS, which queries the I2C adapter
> -functionality using i2c.h:i2c_get_functionality(), and I2C_SMBUS, which
> -performs an SMBus transaction using i2c-core-smbus.c:i2c_smbus_xfer().
> +4) Other ioctl() calls are converted to in-kernel function calls by
> +   i2c-dev. Examples include I2C_FUNCS, which queries the I2C adapter
> +   functionality using i2c.h:i2c_get_functionality(), and I2C_SMBUS, which
> +   performs an SMBus transaction using i2c-core-smbus.c:i2c_smbus_xfer().
>  
> -The i2c-dev driver is responsible for checking all the parameters that
> -come from user-space for validity. After this point, there is no
> -difference between these calls that came from user-space through i2c-dev
> -and calls that would have been performed by kernel I2C chip drivers
> -directly. This means that I2C bus drivers don't need to implement
> -anything special to support access from user-space.
> +   The i2c-dev driver is responsible for checking all the parameters that
> +   come from user-space for validity. After this point, there is no
> +   difference between these calls that came from user-space through i2c-dev
> +   and calls that would have been performed by kernel I2C chip drivers
> +   directly. This means that I2C bus drivers don't need to implement
> +   anything special to support access from user-space.
>  
> -5* These i2c.h functions are wrappers to the actual implementation of
> -your I2C bus driver. Each adapter must declare callback functions
> -implementing these standard calls. i2c.h:i2c_get_functionality() calls
> -i2c_adapter.algo->functionality(), while
> -i2c-core-smbus.c:i2c_smbus_xfer() calls either
> -adapter.algo->smbus_xfer() if it is implemented, or if not,
> -i2c-core-smbus.c:i2c_smbus_xfer_emulated() which in turn calls
> -i2c_adapter.algo->master_xfer().
> +5) These i2c.h functions are wrappers to the actual implementation of
> +   your I2C bus driver. Each adapter must declare callback functions
> +   implementing these standard calls. i2c.h:i2c_get_functionality() calls
> +   i2c_adapter.algo->functionality(), while
> +   i2c-core-smbus.c:i2c_smbus_xfer() calls either
> +   adapter.algo->smbus_xfer() if it is implemented, or if not,
> +   i2c-core-smbus.c:i2c_smbus_xfer_emulated() which in turn calls
> +   i2c_adapter.algo->master_xfer().
>  
>  After your I2C bus driver has processed these requests, execution runs
>  up the call chain, with almost no processing done, except by i2c-dev to
> diff --git a/Documentation/i2c/DMA-considerations b/Documentation/i2c/dma-considerations.rst
> similarity index 100%
> rename from Documentation/i2c/DMA-considerations
> rename to Documentation/i2c/dma-considerations.rst
> diff --git a/Documentation/i2c/fault-codes b/Documentation/i2c/fault-codes.rst
> similarity index 98%
> rename from Documentation/i2c/fault-codes
> rename to Documentation/i2c/fault-codes.rst
> index 0cee0fc545b4..a09797588849 100644
> --- a/Documentation/i2c/fault-codes
> +++ b/Documentation/i2c/fault-codes.rst
> @@ -1,3 +1,7 @@
> +=====================
> +I2C/SMBUS Fault Codes
> +=====================
> +
>  This is a summary of the most important conventions for use of fault
>  codes in the I2C/SMBus stack.
>  
> diff --git a/Documentation/i2c/functionality b/Documentation/i2c/functionality.rst
> similarity index 91%
> rename from Documentation/i2c/functionality
> rename to Documentation/i2c/functionality.rst
> index 4aae8ed15873..7528c1ffd6ca 100644
> --- a/Documentation/i2c/functionality
> +++ b/Documentation/i2c/functionality.rst
> @@ -1,3 +1,7 @@
> +=======================
> +I2C/SMBus Functionality
> +=======================
> +
>  INTRODUCTION
>  ------------
>  
> @@ -14,6 +18,7 @@ FUNCTIONALITY CONSTANTS
>  For the most up-to-date list of functionality constants, please check
>  <uapi/linux/i2c.h>!
>  
> +  =============================== ==============================================
>    I2C_FUNC_I2C                    Plain i2c-level commands (Pure SMBus
>                                    adapters typically can not do these)
>    I2C_FUNC_10BIT_ADDR             Handles the 10-bit address extensions
> @@ -33,9 +38,11 @@ For the most up-to-date list of functionality constants, please check
>    I2C_FUNC_SMBUS_WRITE_BLOCK_DATA Handles the SMBus write_block_data command
>    I2C_FUNC_SMBUS_READ_I2C_BLOCK   Handles the SMBus read_i2c_block_data command
>    I2C_FUNC_SMBUS_WRITE_I2C_BLOCK  Handles the SMBus write_i2c_block_data command
> +  =============================== ==============================================
>  
>  A few combinations of the above flags are also defined for your convenience:
>  
> +  =========================       ======================================
>    I2C_FUNC_SMBUS_BYTE             Handles the SMBus read_byte
>                                    and write_byte commands
>    I2C_FUNC_SMBUS_BYTE_DATA        Handles the SMBus read_byte_data
> @@ -49,6 +56,7 @@ A few combinations of the above flags are also defined for your convenience:
>    I2C_FUNC_SMBUS_EMUL             Handles all SMBus commands that can be
>                                    emulated by a real I2C adapter (using
>                                    the transparent emulation layer)
> +  =========================       ======================================
>  
>  In kernel versions prior to 3.5 I2C_FUNC_NOSTART was implemented as
>  part of I2C_FUNC_PROTOCOL_MANGLING.
> @@ -58,11 +66,11 @@ ADAPTER IMPLEMENTATION
>  ----------------------
>  
>  When you write a new adapter driver, you will have to implement a
> -function callback `functionality'. Typical implementations are given
> +function callback ``functionality``. Typical implementations are given
>  below.
>  
>  A typical SMBus-only adapter would list all the SMBus transactions it
> -supports. This example comes from the i2c-piix4 driver:
> +supports. This example comes from the i2c-piix4 driver::
>  
>    static u32 piix4_func(struct i2c_adapter *adapter)
>    {
> @@ -72,7 +80,7 @@ supports. This example comes from the i2c-piix4 driver:
>    }
>  
>  A typical full-I2C adapter would use the following (from the i2c-pxa
> -driver):
> +driver)::
>  
>    static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
>    {
> @@ -94,7 +102,7 @@ CLIENT CHECKING
>  Before a client tries to attach to an adapter, or even do tests to check
>  whether one of the devices it supports is present on an adapter, it should
>  check whether the needed functionality is present. The typical way to do
> -this is (from the lm75 driver):
> +this is (from the lm75 driver)::
>  
>    static int lm75_detect(...)
>    {
> @@ -129,7 +137,7 @@ If you try to access an adapter from a userspace program, you will have
>  to use the /dev interface. You will still have to check whether the
>  functionality you need is supported, of course. This is done using
>  the I2C_FUNCS ioctl. An example, adapted from the i2cdetect program, is
> -below:
> +below::
>  
>    int file;
>    if (file = open("/dev/i2c-0", O_RDWR) < 0) {
> diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection.rst
> similarity index 97%
> rename from Documentation/i2c/gpio-fault-injection
> rename to Documentation/i2c/gpio-fault-injection.rst
> index c87f416d53dd..9dca6ec7d266 100644
> --- a/Documentation/i2c/gpio-fault-injection
> +++ b/Documentation/i2c/gpio-fault-injection.rst
> @@ -104,10 +104,10 @@ There doesn't need to be a device at this address because arbitration lost
>  should be detected beforehand. Also note, that SCL going down is monitored
>  using interrupts, so the interrupt latency might cause the first bits to be not
>  corrupted. A good starting point for using this fault injector on an otherwise
> -idle bus is:
> +idle bus is::
>  
> -# echo 200 > lose_arbitration &
> -# i2cget -y <bus_to_test> 0x3f
> +  # echo 200 > lose_arbitration &
> +  # i2cget -y <bus_to_test> 0x3f
>  
>  Panic during transfer
>  =====================
> @@ -127,10 +127,10 @@ The calling process will then sleep and wait for the next bus clock. The
>  process is interruptible, though.
>  
>  Start of a transfer is detected by waiting for SCL going down by the master
> -under test.  A good starting point for using this fault injector is:
> +under test.  A good starting point for using this fault injector is::
>  
> -# echo 0 > inject_panic &
> -# i2cget -y <bus_to_test> <some_address>
> +  # echo 0 > inject_panic &
> +  # i2cget -y <bus_to_test> <some_address>
>  
>  Note that there doesn't need to be a device listening to the address you are
>  using. Results may vary depending on that, though.
> diff --git a/Documentation/i2c/i2c-protocol b/Documentation/i2c/i2c-protocol.rst
> similarity index 83%
> rename from Documentation/i2c/i2c-protocol
> rename to Documentation/i2c/i2c-protocol.rst
> index ff6d6cee6c7e..2f8fcf671b2e 100644
> --- a/Documentation/i2c/i2c-protocol
> +++ b/Documentation/i2c/i2c-protocol.rst
> @@ -1,8 +1,13 @@
> +============
> +I2C Protocol
> +============
> +
>  This document describes the i2c protocol. Or will, when it is finished :-)
>  
>  Key to symbols
>  ==============
>  
> +=============== =============================================================
>  S     (1 bit) : Start bit
>  P     (1 bit) : Stop bit
>  Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
> @@ -15,33 +20,35 @@ Data  (8 bits): A plain data byte. Sometimes, I write DataLow, DataHigh
>                  for 16 bit data.
>  Count (8 bits): A data byte containing the length of a block operation.
>  
> -[..]: Data sent by I2C device, as opposed to data sent by the host adapter.
> +[..]:           Data sent by I2C device, as opposed to data sent by the
> +                host adapter.
> +=============== =============================================================
>  
>  
>  Simple send transaction
> -======================
> +=======================
>  
> -This corresponds to i2c_master_send.
> +This corresponds to i2c_master_send::
>  
>    S Addr Wr [A] Data [A] Data [A] ... [A] Data [A] P
>  
>  
>  Simple receive transaction
> -===========================
> +==========================
>  
> -This corresponds to i2c_master_recv
> +This corresponds to i2c_master_recv::
>  
>    S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
>  
>  
>  Combined transactions
> -====================
> +=====================
>  
>  This corresponds to i2c_transfer
>  
>  They are just like the above transactions, but instead of a stop bit P
>  a start bit S is sent and the transaction continues. An example of
> -a byte read, followed by a byte write:
> +a byte read, followed by a byte write::
>  
>    S Addr Rd [A] [Data] NA S Addr Wr [A] Data [A] P
>  
> @@ -65,8 +72,10 @@ I2C_M_NO_RD_ACK:
>  I2C_M_NOSTART:
>      In a combined transaction, no 'S Addr Wr/Rd [A]' is generated at some
>      point. For example, setting I2C_M_NOSTART on the second partial message
> -    generates something like:
> +    generates something like::
> +
>        S Addr Rd [A] [Data] NA Data [A] P
> +
>      If you set the I2C_M_NOSTART variable for the first partial message,
>      we do not generate Addr, but we do generate the startbit S. This will
>      probably confuse all other clients on your bus, so don't try this.
> @@ -79,7 +88,8 @@ I2C_M_NOSTART:
>  I2C_M_REV_DIR_ADDR:
>      This toggles the Rd/Wr flag. That is, if you want to do a write, but
>      need to emit an Rd instead of a Wr, or vice versa, you set this
> -    flag. For example:
> +    flag. For example::
> +
>        S Addr Rd [A] Data [A] Data [A] ... [A] Data [A] P
>  
>  I2C_M_STOP:
> diff --git a/Documentation/i2c/i2c-stub b/Documentation/i2c/i2c-stub.rst
> similarity index 93%
> rename from Documentation/i2c/i2c-stub
> rename to Documentation/i2c/i2c-stub.rst
> index a16924fbd289..f8f194dfd379 100644
> --- a/Documentation/i2c/i2c-stub
> +++ b/Documentation/i2c/i2c-stub.rst
> @@ -1,6 +1,9 @@
> -MODULE: i2c-stub
> +========
> +i2c-stub
> +========
>  
> -DESCRIPTION:
> +Description
> +===========
>  
>  This module is a very simple fake I2C/SMBus driver.  It implements six
>  types of SMBus commands: write quick, (r/w) byte, (r/w) byte data, (r/w)
> @@ -28,6 +31,7 @@ SMBus block operations. Writes can be partial. Block read commands always
>  return the number of bytes selected with the largest write so far.
>  
>  The typical use-case is like this:
> +
>  	1. load this module
>  	2. use i2cset (from the i2c-tools project) to pre-load some data
>  	3. load the target chip driver module
> @@ -36,7 +40,8 @@ The typical use-case is like this:
>  There's a script named i2c-stub-from-dump in the i2c-tools package which
>  can load register values automatically from a chip dump.
>  
> -PARAMETERS:
> +Parameters
> +==========
>  
>  int chip_addr[10]:
>  	The SMBus addresses to emulate chips at.
> @@ -47,14 +52,12 @@ unsigned long functionality:
>  	value 0x1f0000 would only enable the quick, byte and byte data
>  	commands.
>  
> -u8 bank_reg[10]
> -u8 bank_mask[10]
> -u8 bank_start[10]
> -u8 bank_end[10]:
> +u8 bank_reg[10], u8 bank_mask[10], u8 bank_start[10], u8 bank_end[10]:
>  	Optional bank settings. They tell which bits in which register
>  	select the active bank, as well as the range of banked registers.
>  
> -CAVEATS:
> +Caveats
> +=======
>  
>  If your target driver polls some byte or word waiting for it to change, the
>  stub could lock it up.  Use i2cset to unlock it.
> diff --git a/Documentation/i2c/i2c-topology b/Documentation/i2c/i2c-topology.rst
> similarity index 89%
> rename from Documentation/i2c/i2c-topology
> rename to Documentation/i2c/i2c-topology.rst
> index f74d78b53d4d..0c1ae95f6a97 100644
> --- a/Documentation/i2c/i2c-topology
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -1,3 +1,4 @@
> +============
>  I2C topology
>  ============
>  
> @@ -14,6 +15,7 @@ than a straight-forward i2c bus with one adapter and one or more devices.
>     that has to be operated before the device can be accessed.
>  
>  Etc
> +===
>  
>  These constructs are represented as i2c adapter trees by Linux, where
>  each adapter has a parent adapter (except the root adapter) and zero or
> @@ -37,7 +39,9 @@ mux-locked or parent-locked muxes. As is evident from below, it can be
>  useful to know if a mux is mux-locked or if it is parent-locked. The
>  following list was correct at the time of writing:
>  
> -In drivers/i2c/muxes/
> +In drivers/i2c/muxes/:
> +
> +======================    =============================================
>  i2c-arb-gpio-challenge    Parent-locked
>  i2c-mux-gpio              Normally parent-locked, mux-locked iff
>                            all involved gpio pins are controlled by the
> @@ -52,18 +56,25 @@ i2c-mux-pinctrl           Normally parent-locked, mux-locked iff
>                            all involved pinctrl devices are controlled
>                            by the same i2c root adapter that they mux.
>  i2c-mux-reg               Parent-locked
> +======================    =============================================
>  
> -In drivers/iio/
> +In drivers/iio/:
> +
> +======================    =============================================
>  gyro/mpu3050              Mux-locked
>  imu/inv_mpu6050/          Mux-locked
> +======================    =============================================
>  
> -In drivers/media/
> +In drivers/media/:
> +
> +=======================   =============================================
>  dvb-frontends/lgdt3306a   Mux-locked
>  dvb-frontends/m88ds3103   Parent-locked
>  dvb-frontends/rtl2830     Parent-locked
>  dvb-frontends/rtl2832     Mux-locked
>  dvb-frontends/si2168      Mux-locked
>  usb/cx231xx/              Parent-locked
> +=======================   =============================================
>  
>  
>  Mux-locked muxes
> @@ -78,6 +89,7 @@ full transaction, unrelated i2c transfers may interleave the different
>  stages of the transaction. This has the benefit that the mux driver
>  may be easier and cleaner to implement, but it has some caveats.
>  
> +==== =====================================================================
>  ML1. If you build a topology with a mux-locked mux being the parent
>       of a parent-locked mux, this might break the expectation from the
>       parent-locked mux that the root adapter is locked during the
> @@ -105,11 +117,15 @@ ML4. If any non-i2c operation in the mux driver changes the i2c mux state,
>       Otherwise garbage may appear on the bus as seen from devices
>       behind the mux, when an unrelated i2c transfer is in flight during
>       the non-i2c mux-changing operation.
> +==== =====================================================================
>  
>  
>  Mux-locked Example
>  ------------------
>  
> +
> +::
> +
>                     .----------.     .--------.
>      .--------.     |   mux-   |-----| dev D1 |
>      |  root  |--+--|  locked  |     '--------'
> @@ -148,6 +164,7 @@ adapter during the transaction are unlocked i2c transfers (using e.g.
>  __i2c_transfer), or a deadlock will follow. There are a couple of
>  caveats.
>  
> +==== ====================================================================
>  PL1. If you build a topology with a parent-locked mux being the child
>       of another mux, this might break a possible assumption from the
>       child mux that the root adapter is unused between its select op
> @@ -161,11 +178,14 @@ PL2. If select/deselect calls out to other subsystems such as gpio,
>       caused by these subsystems are unlocked. This can be convoluted to
>       accomplish, maybe even impossible if an acceptably clean solution
>       is sought.
> +==== ====================================================================
>  
>  
>  Parent-locked Example
>  ---------------------
>  
> +::
> +
>                     .----------.     .--------.
>      .--------.     |  parent- |-----| dev D1 |
>      |  root  |--+--|  locked  |     '--------'
> @@ -177,20 +197,20 @@ Parent-locked Example
>  
>  When there is an access to D1, this happens:
>  
> - 1. Someone issues an i2c-transfer to D1.
> - 2. M1 locks muxes on its parent (the root adapter in this case).
> - 3. M1 locks its parent adapter.
> - 4. M1 calls ->select to ready the mux.
> - 5. If M1 does any i2c-transfers (on this root adapter) as part of
> -    its select, those transfers must be unlocked i2c-transfers so
> -    that they do not deadlock the root adapter.
> - 6. M1 feeds the i2c-transfer from step 1 to the root adapter as an
> -    unlocked i2c-transfer, so that it does not deadlock the parent
> -    adapter.
> - 7. M1 calls ->deselect, if it has one.
> - 8. Same rules as in step 5, but for ->deselect.
> - 9. M1 unlocks its parent adapter.
> -10. M1 unlocks muxes on its parent.
> + 1.  Someone issues an i2c-transfer to D1.
> + 2.  M1 locks muxes on its parent (the root adapter in this case).
> + 3.  M1 locks its parent adapter.
> + 4.  M1 calls ->select to ready the mux.
> + 5.  If M1 does any i2c-transfers (on this root adapter) as part of
> +     its select, those transfers must be unlocked i2c-transfers so
> +     that they do not deadlock the root adapter.
> + 6.  M1 feeds the i2c-transfer from step 1 to the root adapter as an
> +     unlocked i2c-transfer, so that it does not deadlock the parent
> +     adapter.
> + 7.  M1 calls ->deselect, if it has one.
> + 8.  Same rules as in step 5, but for ->deselect.
> + 9.  M1 unlocks its parent adapter.
> + 10. M1 unlocks muxes on its parent.
>  
>  
>  This means that accesses to both D2 and D3 are locked out for the full
> @@ -203,7 +223,7 @@ Complex Examples
>  Parent-locked mux as parent of parent-locked mux
>  ------------------------------------------------
>  
> -This is a useful topology, but it can be bad.
> +This is a useful topology, but it can be bad::
>  
>                     .----------.     .----------.     .--------.
>      .--------.     |  parent- |-----|  parent- |-----| dev D1 |
> @@ -227,7 +247,7 @@ through and be seen by the M2 adapter, thus closing M2 prematurely.
>  Mux-locked mux as parent of mux-locked mux
>  ------------------------------------------
>  
> -This is a good topology.
> +This is a good topology::
>  
>                     .----------.     .----------.     .--------.
>      .--------.     |   mux-   |-----|   mux-   |-----| dev D1 |
> @@ -248,7 +268,7 @@ are still possibly interleaved.
>  Mux-locked mux as parent of parent-locked mux
>  ---------------------------------------------
>  
> -This is probably a bad topology.
> +This is probably a bad topology::
>  
>                     .----------.     .----------.     .--------.
>      .--------.     |   mux-   |-----|  parent- |-----| dev D1 |
> @@ -282,7 +302,7 @@ auto-closing, the topology is fine.
>  Parent-locked mux as parent of mux-locked mux
>  ---------------------------------------------
>  
> -This is a good topology.
> +This is a good topology::
>  
>                     .----------.     .----------.     .--------.
>      .--------.     |  parent- |-----|   mux-   |-----| dev D1 |
> @@ -306,7 +326,7 @@ adapter is locked directly.
>  Two mux-locked sibling muxes
>  ----------------------------
>  
> -This is a good topology.
> +This is a good topology::
>  
>                                      .--------.
>                     .----------.  .--| dev D1 |
> @@ -330,7 +350,7 @@ accesses to D5 may be interleaved at any time.
>  Two parent-locked sibling muxes
>  -------------------------------
>  
> -This is a good topology.
> +This is a good topology::
>  
>                                      .--------.
>                     .----------.  .--| dev D1 |
> @@ -354,7 +374,7 @@ out.
>  Mux-locked and parent-locked sibling muxes
>  ------------------------------------------
>  
> -This is a good topology.
> +This is a good topology::
>  
>                                      .--------.
>                     .----------.  .--| dev D1 |
> diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
> new file mode 100644
> index 000000000000..d4ba671d0b55
> --- /dev/null
> +++ b/Documentation/i2c/index.rst
> @@ -0,0 +1,38 @@
> +. SPDX-License-Identifier: GPL-2.0
> +
> +===================
> +I2C/SMBus Subsystem
> +===================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   dev-interface
> +   dma-considerations
> +   fault-codes
> +   functionality
> +   gpio-fault-injection
> +   i2c-protocol
> +   i2c-stub
> +   i2c-topology
> +   instantiating-devices
> +   old-module-parameters
> +   slave-eeprom-backend
> +   slave-interface
> +   smbus-protocol
> +   summary
> +   ten-bit-addresses
> +   upgrading-clients
> +   writing-clients
> +
> +   muxes/i2c-mux-gpio
> +
> +   busses/index
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> +
> diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/instantiating-devices.rst
> similarity index 93%
> rename from Documentation/i2c/instantiating-devices
> rename to Documentation/i2c/instantiating-devices.rst
> index 345e9ea8281a..1238f1fa3382 100644
> --- a/Documentation/i2c/instantiating-devices
> +++ b/Documentation/i2c/instantiating-devices.rst
> @@ -1,3 +1,4 @@
> +==============================
>  How to instantiate I2C devices
>  ==============================
>  
> @@ -17,9 +18,9 @@ which is known in advance. It is thus possible to pre-declare the I2C
>  devices which live on this bus. This is done with an array of struct
>  i2c_board_info which is registered by calling i2c_register_board_info().
>  
> -Example (from omap2 h4):
> +Example (from omap2 h4)::
>  
> -static struct i2c_board_info h4_i2c_board_info[] __initdata = {
> +  static struct i2c_board_info h4_i2c_board_info[] __initdata = {
>  	{
>  		I2C_BOARD_INFO("isp1301_omap", 0x2d),
>  		.irq		= OMAP_GPIO_IRQ(125),
> @@ -32,15 +33,15 @@ static struct i2c_board_info h4_i2c_board_info[] __initdata = {
>  		I2C_BOARD_INFO("24c01", 0x57),
>  		.platform_data	= &m24c01,
>  	},
> -};
> +  };
>  
> -static void __init omap_h4_init(void)
> -{
> +  static void __init omap_h4_init(void)
> +  {
>  	(...)
>  	i2c_register_board_info(1, h4_i2c_board_info,
>  			ARRAY_SIZE(h4_i2c_board_info));
>  	(...)
> -}
> +  }
>  
>  The above code declares 3 devices on I2C bus 1, including their respective
>  addresses and custom data needed by their drivers. When the I2C bus in
> @@ -57,7 +58,7 @@ Method 1b: Declare the I2C devices via devicetree
>  This method has the same implications as method 1a. The declaration of I2C
>  devices is here done via devicetree as subnodes of the master controller.
>  
> -Example:
> +Example::
>  
>  	i2c1: i2c@400a0000 {
>  		/* ... master properties skipped ... */
> @@ -99,20 +100,20 @@ bus in advance, so the method 1 described above can't be used. Instead,
>  you can instantiate your I2C devices explicitly. This is done by filling
>  a struct i2c_board_info and calling i2c_new_device().
>  
> -Example (from the sfe4001 network driver):
> +Example (from the sfe4001 network driver)::
>  
> -static struct i2c_board_info sfe4001_hwmon_info = {
> +  static struct i2c_board_info sfe4001_hwmon_info = {
>  	I2C_BOARD_INFO("max6647", 0x4e),
> -};
> +  };
>  
> -int sfe4001_init(struct efx_nic *efx)
> -{
> +  int sfe4001_init(struct efx_nic *efx)
> +  {
>  	(...)
>  	efx->board_info.hwmon_client =
>  		i2c_new_device(&efx->i2c_adap, &sfe4001_hwmon_info);
>  
>  	(...)
> -}
> +  }
>  
>  The above code instantiates 1 I2C device on the I2C bus which is on the
>  network adapter in question.
> @@ -124,12 +125,12 @@ it may have different addresses from one board to the next (manufacturer
>  changing its design without notice). In this case, you can call
>  i2c_new_probed_device() instead of i2c_new_device().
>  
> -Example (from the nxp OHCI driver):
> +Example (from the nxp OHCI driver)::
>  
> -static const unsigned short normal_i2c[] = { 0x2c, 0x2d, I2C_CLIENT_END };
> +  static const unsigned short normal_i2c[] = { 0x2c, 0x2d, I2C_CLIENT_END };
>  
> -static int usb_hcd_nxp_probe(struct platform_device *pdev)
> -{
> +  static int usb_hcd_nxp_probe(struct platform_device *pdev)
> +  {
>  	(...)
>  	struct i2c_adapter *i2c_adap;
>  	struct i2c_board_info i2c_info;
> @@ -142,7 +143,7 @@ static int usb_hcd_nxp_probe(struct platform_device *pdev)
>  						   normal_i2c, NULL);
>  	i2c_put_adapter(i2c_adap);
>  	(...)
> -}
> +  }
>  
>  The above code instantiates up to 1 I2C device on the I2C bus which is on
>  the OHCI adapter in question. It first tries at address 0x2c, if nothing
> @@ -172,6 +173,7 @@ explicitly. Instead, i2c-core will probe for such devices as soon as their
>  drivers are loaded, and if any is found, an I2C device will be
>  instantiated automatically. In order to prevent any misbehavior of this
>  mechanism, the following restrictions apply:
> +
>  * The I2C device driver must implement the detect() method, which
>    identifies a supported device by reading from arbitrary registers.
>  * Only buses which are likely to have a supported device and agree to be
> @@ -189,6 +191,7 @@ first.
>  Those of you familiar with the i2c subsystem of 2.4 kernels and early 2.6
>  kernels will find out that this method 3 is essentially similar to what
>  was done there. Two significant differences are:
> +
>  * Probing is only one way to instantiate I2C devices now, while it was the
>    only way back then. Where possible, methods 1 and 2 should be preferred.
>    Method 3 should only be used when there is no other way, as it can have
> @@ -224,11 +227,13 @@ device. As no two devices can live at the same address on a given I2C
>  segment, the address is sufficient to uniquely identify the device to be
>  deleted.
>  
> -Example:
> -# echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
> +Example::
> +
> +  # echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
>  
>  While this interface should only be used when in-kernel device declaration
>  can't be done, there is a variety of cases where it can be helpful:
> +
>  * The I2C driver usually detects devices (method 3 above) but the bus
>    segment your device lives on doesn't have the proper class bit set and
>    thus detection doesn't trigger.
> diff --git a/Documentation/i2c/muxes/i2c-mux-gpio b/Documentation/i2c/muxes/i2c-mux-gpio.rst
> similarity index 85%
> rename from Documentation/i2c/muxes/i2c-mux-gpio
> rename to Documentation/i2c/muxes/i2c-mux-gpio.rst
> index 893ecdfe6e43..7d27444035c3 100644
> --- a/Documentation/i2c/muxes/i2c-mux-gpio
> +++ b/Documentation/i2c/muxes/i2c-mux-gpio.rst
> @@ -1,4 +1,6 @@
> +==========================
>  Kernel driver i2c-mux-gpio
> +==========================
>  
>  Author: Peter Korsgaard <peter.korsgaard@barco.com>
>  
> @@ -8,7 +10,7 @@ Description
>  i2c-mux-gpio is an i2c mux driver providing access to I2C bus segments
>  from a master I2C bus and a hardware MUX controlled through GPIO pins.
>  
> -E.G.:
> +E.G.::
>  
>    ----------              ----------  Bus segment 1   - - - - -
>   |          | SCL/SDA    |          |-------------- |           |
> @@ -33,20 +35,20 @@ bus, the number of bus segments to create and the GPIO pins used
>  to control it. See include/linux/platform_data/i2c-mux-gpio.h for details.
>  
>  E.G. something like this for a MUX providing 4 bus segments
> -controlled through 3 GPIO pins:
> +controlled through 3 GPIO pins::
>  
> -#include <linux/platform_data/i2c-mux-gpio.h>
> -#include <linux/platform_device.h>
> +  #include <linux/platform_data/i2c-mux-gpio.h>
> +  #include <linux/platform_device.h>
>  
> -static const unsigned myboard_gpiomux_gpios[] = {
> +  static const unsigned myboard_gpiomux_gpios[] = {
>  	AT91_PIN_PC26, AT91_PIN_PC25, AT91_PIN_PC24
> -};
> +  };
>  
> -static const unsigned myboard_gpiomux_values[] = {
> +  static const unsigned myboard_gpiomux_values[] = {
>  	0, 1, 2, 3
> -};
> +  };
>  
> -static struct i2c_mux_gpio_platform_data myboard_i2cmux_data = {
> +  static struct i2c_mux_gpio_platform_data myboard_i2cmux_data = {
>  	.parent		= 1,
>  	.base_nr	= 2, /* optional */
>  	.values		= myboard_gpiomux_values,
> @@ -54,15 +56,15 @@ static struct i2c_mux_gpio_platform_data myboard_i2cmux_data = {
>  	.gpios		= myboard_gpiomux_gpios,
>  	.n_gpios	= ARRAY_SIZE(myboard_gpiomux_gpios),
>  	.idle		= 4, /* optional */
> -};
> +  };
>  
> -static struct platform_device myboard_i2cmux = {
> +  static struct platform_device myboard_i2cmux = {
>  	.name		= "i2c-mux-gpio",
>  	.id		= 0,
>  	.dev		= {
>  		.platform_data	= &myboard_i2cmux_data,
>  	},
> -};
> +  };
>  
>  If you don't know the absolute GPIO pin numbers at registration time,
>  you can instead provide a chip name (.chip_name) and relative GPIO pin
> diff --git a/Documentation/i2c/old-module-parameters b/Documentation/i2c/old-module-parameters.rst
> similarity index 75%
> rename from Documentation/i2c/old-module-parameters
> rename to Documentation/i2c/old-module-parameters.rst
> index 8e2b629d533c..a1939512ad66 100644
> --- a/Documentation/i2c/old-module-parameters
> +++ b/Documentation/i2c/old-module-parameters.rst
> @@ -1,3 +1,4 @@
> +=================================================
>  I2C device driver binding control from user-space
>  =================================================
>  
> @@ -19,23 +20,27 @@ Below is a mapping from the old module parameters to the new interface.
>  Attaching a driver to an I2C device
>  -----------------------------------
>  
> -Old method (module parameters):
> -# modprobe <driver> probe=1,0x2d
> -# modprobe <driver> force=1,0x2d
> -# modprobe <driver> force_<device>=1,0x2d
> +Old method (module parameters)::
>  
> -New method (sysfs interface):
> -# echo <device> 0x2d > /sys/bus/i2c/devices/i2c-1/new_device
> +  # modprobe <driver> probe=1,0x2d
> +  # modprobe <driver> force=1,0x2d
> +  # modprobe <driver> force_<device>=1,0x2d
> +
> +New method (sysfs interface)::
> +
> +  # echo <device> 0x2d > /sys/bus/i2c/devices/i2c-1/new_device
>  
>  Preventing a driver from attaching to an I2C device
>  ---------------------------------------------------
>  
> -Old method (module parameters):
> -# modprobe <driver> ignore=1,0x2f
> +Old method (module parameters)::
>  
> -New method (sysfs interface):
> -# echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
> -# modprobe <driver>
> +  # modprobe <driver> ignore=1,0x2f
> +
> +New method (sysfs interface)::
> +
> +  # echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
> +  # modprobe <driver>
>  
>  Of course, it is important to instantiate the "dummy" device before loading
>  the driver. The dummy device will be handled by i2c-core itself, preventing
> diff --git a/Documentation/i2c/slave-eeprom-backend b/Documentation/i2c/slave-eeprom-backend.rst
> similarity index 90%
> rename from Documentation/i2c/slave-eeprom-backend
> rename to Documentation/i2c/slave-eeprom-backend.rst
> index 04f8d8a9b817..2018fa74c6f3 100644
> --- a/Documentation/i2c/slave-eeprom-backend
> +++ b/Documentation/i2c/slave-eeprom-backend.rst
> @@ -1,3 +1,4 @@
> +==============================
>  Linux I2C slave eeprom backend
>  ==============================
>  
> @@ -5,7 +6,7 @@ by Wolfram Sang <wsa@sang-engineering.com> in 2014-15
>  
>  This is a proof-of-concept backend which acts like an EEPROM on the connected
>  I2C bus. The memory contents can be modified from userspace via this file
> -located in sysfs:
> +located in sysfs::
>  
>  	/sys/bus/i2c/devices/<device-directory>/slave-eeprom
>  
> diff --git a/Documentation/i2c/slave-interface b/Documentation/i2c/slave-interface.rst
> similarity index 94%
> rename from Documentation/i2c/slave-interface
> rename to Documentation/i2c/slave-interface.rst
> index 7e2a228f21bc..9ac5f110a4ec 100644
> --- a/Documentation/i2c/slave-interface
> +++ b/Documentation/i2c/slave-interface.rst
> @@ -1,3 +1,4 @@
> +=====================================
>  Linux I2C slave interface description
>  =====================================
>  
> @@ -12,7 +13,7 @@ EEPROM, the Linux I2C slave can access the content via sysfs and handle data as
>  needed. The backend driver and the I2C bus driver communicate via events. Here
>  is a small graph visualizing the data flow and the means by which data is
>  transported. The dotted line marks only one example. The backend could also
> -use a character device, be in-kernel only, or something completely different:
> +use a character device, be in-kernel only, or something completely different::
>  
>  
>                e.g. sysfs        I2C slave events        I/O registers
> @@ -35,7 +36,7 @@ them as described in the document 'instantiating-devices'. The only difference
>  is that i2c slave backends have their own address space. So, you have to add
>  0x1000 to the address you would originally request. An example for
>  instantiating the slave-eeprom driver from userspace at the 7 bit address 0x64
> -on bus 1:
> +on bus 1::
>  
>    # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new_device
>  
> @@ -54,7 +55,7 @@ drivers and writing backends will be given.
>  I2C slave events
>  ----------------
>  
> -The bus driver sends an event to the backend using the following function:
> +The bus driver sends an event to the backend using the following function::
>  
>  	ret = i2c_slave_event(client, event, &val)
>  
> @@ -69,8 +70,9 @@ Event types:
>  
>  * I2C_SLAVE_WRITE_REQUESTED (mandatory)
>  
> -'val': unused
> -'ret': always 0
> +  'val': unused
> +
> +  'ret': always 0
>  
>  Another I2C master wants to write data to us. This event should be sent once
>  our own address and the write bit was detected. The data did not arrive yet, so
> @@ -79,8 +81,9 @@ to be done, though.
>  
>  * I2C_SLAVE_READ_REQUESTED (mandatory)
>  
> -'val': backend returns first byte to be sent
> -'ret': always 0
> +  'val': backend returns first byte to be sent
> +
> +  'ret': always 0
>  
>  Another I2C master wants to read data from us. This event should be sent once
>  our own address and the read bit was detected. After returning, the bus driver
> @@ -88,8 +91,9 @@ should transmit the first byte.
>  
>  * I2C_SLAVE_WRITE_RECEIVED (mandatory)
>  
> -'val': bus driver delivers received byte
> -'ret': 0 if the byte should be acked, some errno if the byte should be nacked
> +  'val': bus driver delivers received byte
> +
> +  'ret': 0 if the byte should be acked, some errno if the byte should be nacked
>  
>  Another I2C master has sent a byte to us which needs to be set in 'val'. If 'ret'
>  is zero, the bus driver should ack this byte. If 'ret' is an errno, then the byte
> @@ -97,8 +101,9 @@ should be nacked.
>  
>  * I2C_SLAVE_READ_PROCESSED (mandatory)
>  
> -'val': backend returns next byte to be sent
> -'ret': always 0
> +  'val': backend returns next byte to be sent
> +
> +  'ret': always 0
>  
>  The bus driver requests the next byte to be sent to another I2C master in
>  'val'. Important: This does not mean that the previous byte has been acked, it
> @@ -111,8 +116,9 @@ your backend, though.
>  
>  * I2C_SLAVE_STOP (mandatory)
>  
> -'val': unused
> -'ret': always 0
> +  'val': unused
> +
> +  'ret': always 0
>  
>  A stop condition was received. This can happen anytime and the backend should
>  reset its state machine for I2C transfers to be able to receive new requests.
> diff --git a/Documentation/i2c/smbus-protocol b/Documentation/i2c/smbus-protocol.rst
> similarity index 84%
> rename from Documentation/i2c/smbus-protocol
> rename to Documentation/i2c/smbus-protocol.rst
> index 092d474f5843..c6f189bfe1c7 100644
> --- a/Documentation/i2c/smbus-protocol
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -1,3 +1,4 @@
> +======================
>  SMBus Protocol Summary
>  ======================
>  
> @@ -27,12 +28,13 @@ Each transaction type corresponds to a functionality flag. Before calling a
>  transaction function, a device driver should always check (just once) for
>  the corresponding functionality flag to ensure that the underlying I2C
>  adapter supports the transaction in question. See
> -<file:Documentation/i2c/functionality> for the details.
> +<file:Documentation/i2c/functionality.rst> for the details.
>  
>  
>  Key to symbols
>  ==============
>  
> +=============== =============================================================
>  S     (1 bit) : Start bit
>  P     (1 bit) : Stop bit
>  Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
> @@ -45,15 +47,17 @@ Data  (8 bits): A plain data byte. Sometimes, I write DataLow, DataHigh
>                  for 16 bit data.
>  Count (8 bits): A data byte containing the length of a block operation.
>  
> -[..]: Data sent by I2C device, as opposed to data sent by the host adapter.
> +[..]:           Data sent by I2C device, as opposed to data sent by the host
> +                adapter.
> +=============== =============================================================
>  
>  
>  SMBus Quick Command
>  ===================
>  
> -This sends a single bit to the device, at the place of the Rd/Wr bit.
> +This sends a single bit to the device, at the place of the Rd/Wr bit::
>  
> -A Addr Rd/Wr [A] P
> +  A Addr Rd/Wr [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_QUICK
>  
> @@ -64,9 +68,9 @@ SMBus Receive Byte:  i2c_smbus_read_byte()
>  This reads a single byte from a device, without specifying a device
>  register. Some devices are so simple that this interface is enough; for
>  others, it is a shorthand if you want to read the same register as in
> -the previous SMBus command.
> +the previous SMBus command::
>  
> -S Addr Rd [A] [Data] NA P
> +  S Addr Rd [A] [Data] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_BYTE
>  
> @@ -77,7 +81,9 @@ SMBus Send Byte:  i2c_smbus_write_byte()
>  This operation is the reverse of Receive Byte: it sends a single byte
>  to a device.  See Receive Byte for more information.
>  
> -S Addr Wr [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Data [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BYTE
>  
> @@ -86,9 +92,9 @@ SMBus Read Byte:  i2c_smbus_read_byte_data()
>  ============================================
>  
>  This reads a single byte from a device, from a designated register.
> -The register is specified through the Comm byte.
> +The register is specified through the Comm byte::
>  
> -S Addr Wr [A] Comm [A] S Addr Rd [A] [Data] NA P
> +  S Addr Wr [A] Comm [A] S Addr Rd [A] [Data] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_BYTE_DATA
>  
> @@ -98,9 +104,9 @@ SMBus Read Word:  i2c_smbus_read_word_data()
>  
>  This operation is very like Read Byte; again, data is read from a
>  device, from a designated register that is specified through the Comm
> -byte. But this time, the data is a complete word (16 bits).
> +byte. But this time, the data is a complete word (16 bits)::
>  
> -S Addr Wr [A] Comm [A] S Addr Rd [A] [DataLow] A [DataHigh] NA P
> +  S Addr Wr [A] Comm [A] S Addr Rd [A] [DataLow] A [DataHigh] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
>  
> @@ -116,7 +122,9 @@ This writes a single byte to a device, to a designated register. The
>  register is specified through the Comm byte. This is the opposite of
>  the Read Byte operation.
>  
> -S Addr Wr [A] Comm [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Data [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BYTE_DATA
>  
> @@ -126,9 +134,9 @@ SMBus Write Word:  i2c_smbus_write_word_data()
>  
>  This is the opposite of the Read Word operation. 16 bits
>  of data is written to a device, to the designated register that is
> -specified through the Comm byte. 
> +specified through the Comm byte.::
>  
> -S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
> +  S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_WORD_DATA
>  
> @@ -141,10 +149,10 @@ SMBus Process Call:
>  ===================
>  
>  This command selects a device register (through the Comm byte), sends
> -16 bits of data to it, and reads 16 bits of data in return.
> +16 bits of data to it, and reads 16 bits of data in return::
>  
> -S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] 
> -                             S Addr Rd [A] [DataLow] A [DataHigh] NA P
> +  S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A]
> +                               S Addr Rd [A] [DataLow] A [DataHigh] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_PROC_CALL
>  
> @@ -156,8 +164,10 @@ This command reads a block of up to 32 bytes from a device, from a
>  designated register that is specified through the Comm byte. The amount
>  of data is specified by the device in the Count byte.
>  
> -S Addr Wr [A] Comm [A] 
> -           S Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
> +::
> +
> +  S Addr Wr [A] Comm [A]
> +             S Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_BLOCK_DATA
>  
> @@ -169,7 +179,9 @@ The opposite of the Block Read command, this writes up to 32 bytes to
>  a device, to a designated register that is specified through the
>  Comm byte. The amount of data is specified in the Count byte.
>  
> -S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BLOCK_DATA
>  
> @@ -181,10 +193,10 @@ SMBus Block Write - Block Read Process Call was introduced in
>  Revision 2.0 of the specification.
>  
>  This command selects a device register (through the Comm byte), sends
> -1 to 31 bytes of data to it, and reads 1 to 31 bytes of data in return.
> +1 to 31 bytes of data to it, and reads 1 to 31 bytes of data in return::
>  
> -S Addr Wr [A] Comm [A] Count [A] Data [A] ...
> -                             S Addr Rd [A] [Count] A [Data] ... A P
> +  S Addr Wr [A] Comm [A] Count [A] Data [A] ...
> +                               S Addr Rd [A] [Count] A [Data] ... A P
>  
>  Functionality flag: I2C_FUNC_SMBUS_BLOCK_PROC_CALL
>  
> @@ -197,9 +209,12 @@ SMBus host acting as a slave.
>  It is the same form as Write Word, with the command code replaced by the
>  alerting device's address.
>  
> -[S] [HostAddr] [Wr] A [DevAddr] A [DataLow] A [DataHigh] A [P]
> +::
> +
> +  [S] [HostAddr] [Wr] A [DevAddr] A [DataLow] A [DataHigh] A [P]
>  
>  This is implemented in the following way in the Linux kernel:
> +
>  * I2C bus drivers which support SMBus Host Notify should report
>    I2C_FUNC_SMBUS_HOST_NOTIFY.
>  * I2C bus drivers trigger SMBus Host Notify by a call to
> @@ -241,6 +256,7 @@ single interrupt pin on the SMBus master, while still allowing the master
>  to know which slave triggered the interrupt.
>  
>  This is implemented the following way in the Linux kernel:
> +
>  * I2C bus drivers which support SMBus alert should call
>    i2c_setup_smbus_alert() to setup SMBus alert support.
>  * I2C drivers for devices which can trigger SMBus alerts should implement
> @@ -262,10 +278,10 @@ I2C Block Read:  i2c_smbus_read_i2c_block_data()
>  ================================================
>  
>  This command reads a block of bytes from a device, from a 
> -designated register that is specified through the Comm byte.
> +designated register that is specified through the Comm byte::
>  
> -S Addr Wr [A] Comm [A] 
> -           S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
> +  S Addr Wr [A] Comm [A]
> +             S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_I2C_BLOCK
>  
> @@ -278,6 +294,8 @@ a device, to a designated register that is specified through the
>  Comm byte. Note that command lengths of 0, 2, or more bytes are
>  supported as they are indistinguishable from data.
>  
> -S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_I2C_BLOCK
> diff --git a/Documentation/i2c/summary b/Documentation/i2c/summary.rst
> similarity index 96%
> rename from Documentation/i2c/summary
> rename to Documentation/i2c/summary.rst
> index 809541ab352f..8c08fa727f4e 100644
> --- a/Documentation/i2c/summary
> +++ b/Documentation/i2c/summary.rst
> @@ -1,3 +1,4 @@
> +=============
>  I2C and SMBus
>  =============
>  
> @@ -24,7 +25,8 @@ implement all the common SMBus protocol semantics or messages.
>  Terminology
>  ===========
>  
> -When we talk about I2C, we use the following terms:
> +When we talk about I2C, we use the following terms::
> +
>    Bus    -> Algorithm
>              Adapter
>    Device -> Driver
> diff --git a/Documentation/i2c/ten-bit-addresses b/Documentation/i2c/ten-bit-addresses.rst
> similarity index 95%
> rename from Documentation/i2c/ten-bit-addresses
> rename to Documentation/i2c/ten-bit-addresses.rst
> index 7b2d11e53a49..5c765aff16d5 100644
> --- a/Documentation/i2c/ten-bit-addresses
> +++ b/Documentation/i2c/ten-bit-addresses.rst
> @@ -1,3 +1,7 @@
> +=====================
> +I2C Ten-bit Addresses
> +=====================
> +
>  The I2C protocol knows about two kinds of device addresses: normal 7 bit
>  addresses, and an extended set of 10 bit addresses. The sets of addresses
>  do not intersect: the 7 bit address 0x10 is not the same as the 10 bit
> @@ -12,6 +16,7 @@ See the I2C specification for the details.
>  
>  The current 10 bit address support is minimal. It should work, however
>  you can expect some problems along the way:
> +
>  * Not all bus drivers support 10-bit addresses. Some don't because the
>    hardware doesn't support them (SMBus doesn't require 10-bit address
>    support for example), some don't because nobody bothered adding the
> diff --git a/Documentation/i2c/upgrading-clients b/Documentation/i2c/upgrading-clients.rst
> similarity index 56%
> rename from Documentation/i2c/upgrading-clients
> rename to Documentation/i2c/upgrading-clients.rst
> index 96392cc5b5c7..4a575e607ff8 100644
> --- a/Documentation/i2c/upgrading-clients
> +++ b/Documentation/i2c/upgrading-clients.rst
> @@ -1,3 +1,4 @@
> +=================================================
>  Upgrading I2C Drivers to the new 2.6 Driver Model
>  =================================================
>  
> @@ -13,21 +14,22 @@ the old to the new new binding methods.
>  Example old-style driver
>  ------------------------
>  
> +::
>  
> -struct example_state {
> +  struct example_state {
>  	struct i2c_client	client;
>  	....
> -};
> +  };
>  
> -static struct i2c_driver example_driver;
> +  static struct i2c_driver example_driver;
>  
> -static unsigned short ignore[] = { I2C_CLIENT_END };
> -static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
> +  static unsigned short ignore[] = { I2C_CLIENT_END };
> +  static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
>  
> -I2C_CLIENT_INSMOD;
> +  I2C_CLIENT_INSMOD;
>  
> -static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> -{
> +  static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> +  {
>  	struct example_state *state;
>  	struct device *dev = &adap->dev;  /* to use for dev_ reports */
>  	int ret;
> @@ -59,23 +61,23 @@ static int example_attach(struct i2c_adapter *adap, int addr, int kind)
>  	dev_info(dev, "example client created\n");
>  
>  	return 0;
> -}
> +  }
>  
> -static int example_detach(struct i2c_client *client)
> -{
> +  static int example_detach(struct i2c_client *client)
> +  {
>  	struct example_state *state = i2c_get_clientdata(client);
>  
>  	i2c_detach_client(client);
>  	kfree(state);
>  	return 0;
> -}
> +  }
>  
> -static int example_attach_adapter(struct i2c_adapter *adap)
> -{
> +  static int example_attach_adapter(struct i2c_adapter *adap)
> +  {
>  	return i2c_probe(adap, &addr_data, example_attach);
> -}
> +  }
>  
> -static struct i2c_driver example_driver = {
> +  static struct i2c_driver example_driver = {
>   	.driver		= {
>  		.owner		= THIS_MODULE,
>  		.name		= "example",
> @@ -83,7 +85,7 @@ static struct i2c_driver example_driver = {
>  	},
>  	.attach_adapter = example_attach_adapter,
>  	.detach_client	= example_detach,
> -};
> +  };
>  
>  
>  Updating the client
> @@ -93,38 +95,38 @@ The new style binding model will check against a list of supported
>  devices and their associated address supplied by the code registering
>  the busses. This means that the driver .attach_adapter and
>  .detach_client methods can be removed, along with the addr_data,
> -as follows:
> +as follows::
>  
> -- static struct i2c_driver example_driver;
> +  - static struct i2c_driver example_driver;
>  
> -- static unsigned short ignore[] = { I2C_CLIENT_END };
> -- static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
> +  - static unsigned short ignore[] = { I2C_CLIENT_END };
> +  - static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
>  
> -- I2C_CLIENT_INSMOD;
> +  - I2C_CLIENT_INSMOD;
>  
> -- static int example_attach_adapter(struct i2c_adapter *adap)
> -- {
> -- 	return i2c_probe(adap, &addr_data, example_attach);
> -- }
> +  - static int example_attach_adapter(struct i2c_adapter *adap)
> +  - {
> +  - 	return i2c_probe(adap, &addr_data, example_attach);
> +  - }
>  
> - static struct i2c_driver example_driver = {
> --	.attach_adapter = example_attach_adapter,
> --	.detach_client	= example_detach,
> - }
> +    static struct i2c_driver example_driver = {
> +  -	.attach_adapter = example_attach_adapter,
> +  -	.detach_client	= example_detach,
> +    }
>  
> -Add the probe and remove methods to the i2c_driver, as so:
> +Add the probe and remove methods to the i2c_driver, as so::
>  
> - static struct i2c_driver example_driver = {
> -+	.probe		= example_probe,
> -+	.remove		= example_remove,
> - }
> +   static struct i2c_driver example_driver = {
> +  +	.probe		= example_probe,
> +  +	.remove		= example_remove,
> +   }
>  
>  Change the example_attach method to accept the new parameters
> -which include the i2c_client that it will be working with:
> +which include the i2c_client that it will be working with::
>  
> -- static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> -+ static int example_probe(struct i2c_client *client,
> -+			   const struct i2c_device_id *id)
> +  - static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> +  + static int example_probe(struct i2c_client *client,
> +  +			   const struct i2c_device_id *id)
>  
>  Change the name of example_attach to example_probe to align it with the
>  i2c_driver entry names. The rest of the probe routine will now need to be
> @@ -132,55 +134,57 @@ changed as the i2c_client has already been setup for use.
>  
>  The necessary client fields have already been setup before
>  the probe function is called, so the following client setup
> -can be removed:
> +can be removed::
>  
> --	example->client.addr    = addr;
> --	example->client.flags   = 0;
> --	example->client.adapter = adap;
> --
> --	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_client.name));
> +  -	example->client.addr    = addr;
> +  -	example->client.flags   = 0;
> +  -	example->client.adapter = adap;
> +  -
> +  -	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_client.name));
>  
> -The i2c_set_clientdata is now:
> +The i2c_set_clientdata is now::
>  
> --	i2c_set_clientdata(&state->client, state);
> -+	i2c_set_clientdata(client, state);
> +  -	i2c_set_clientdata(&state->client, state);
> +  +	i2c_set_clientdata(client, state);
>  
>  The call to i2c_attach_client is no longer needed, if the probe
>  routine exits successfully, then the driver will be automatically
> -attached by the core. Change the probe routine as so:
> +attached by the core. Change the probe routine as so::
>  
> --	ret = i2c_attach_client(&state->i2c_client);
> --	if (ret < 0) {
> --		dev_err(dev, "failed to attach client\n");
> --		kfree(state);
> --		return ret;
> --	}
> +  -	ret = i2c_attach_client(&state->i2c_client);
> +  -	if (ret < 0) {
> +  -		dev_err(dev, "failed to attach client\n");
> +  -		kfree(state);
> +  -		return ret;
> +  -	}
>  
>  
>  Remove the storage of 'struct i2c_client' from the 'struct example_state'
>  as we are provided with the i2c_client in our example_probe. Instead we
>  store a pointer to it for when it is needed.
>  
> -struct example_state {
> --	struct i2c_client	client;
> -+	struct i2c_client	*client;
> +::
>  
> -the new i2c client as so:
> +  struct example_state {
> +  -	struct i2c_client	client;
> +  +	struct i2c_client	*client;
>  
> --	struct device *dev = &adap->dev;  /* to use for dev_ reports */
> -+ 	struct device *dev = &i2c_client->dev;  /* to use for dev_ reports */
> +the new i2c client as so::
> +
> +  -	struct device *dev = &adap->dev;  /* to use for dev_ reports */
> +  + 	struct device *dev = &i2c_client->dev;  /* to use for dev_ reports */
>  
>  And remove the change after our client is attached, as the driver no
> -longer needs to register a new client structure with the core:
> +longer needs to register a new client structure with the core::
>  
> --	dev = &state->i2c_client.dev;
> +  -	dev = &state->i2c_client.dev;
>  
>  In the probe routine, ensure that the new state has the client stored
> -in it:
> +in it::
>  
> -static int example_probe(struct i2c_client *i2c_client,
> +  static int example_probe(struct i2c_client *i2c_client,
>  			 const struct i2c_device_id *id)
> -{
> +  {
>  	struct example_state *state;
>   	struct device *dev = &i2c_client->dev;
>  	int ret;
> @@ -191,48 +195,50 @@ static int example_probe(struct i2c_client *i2c_client,
>  		return -ENOMEM;
>  	}
>  
> -+	state->client = i2c_client;
> +  +	state->client = i2c_client;
>  
>  Update the detach method, by changing the name to _remove and
>  to delete the i2c_detach_client call. It is possible that you
>  can also remove the ret variable as it is not needed for any
>  of the core functions.
>  
> -- static int example_detach(struct i2c_client *client)
> -+ static int example_remove(struct i2c_client *client)
> -{
> +::
> +
> +  - static int example_detach(struct i2c_client *client)
> +  + static int example_remove(struct i2c_client *client)
> +  {
>  	struct example_state *state = i2c_get_clientdata(client);
>  
> --	i2c_detach_client(client);
> +  -	i2c_detach_client(client);
>  
>  And finally ensure that we have the correct ID table for the i2c-core
> -and other utilities:
> +and other utilities::
>  
> -+ struct i2c_device_id example_idtable[] = {
> -+       { "example", 0 },
> -+       { }
> -+};
> -+
> -+MODULE_DEVICE_TABLE(i2c, example_idtable);
> +  + struct i2c_device_id example_idtable[] = {
> +  +       { "example", 0 },
> +  +       { }
> +  +};
> +  +
> +  +MODULE_DEVICE_TABLE(i2c, example_idtable);
>  
> -static struct i2c_driver example_driver = {
> +  static struct i2c_driver example_driver = {
>   	.driver		= {
>  		.owner		= THIS_MODULE,
>  		.name		= "example",
>  	},
> -+	.id_table	= example_ids,
> +  +	.id_table	= example_ids,
>  
>  
> -Our driver should now look like this:
> +Our driver should now look like this::
>  
> -struct example_state {
> +  struct example_state {
>  	struct i2c_client	*client;
>  	....
> -};
> +  };
>  
> -static int example_probe(struct i2c_client *client,
> +  static int example_probe(struct i2c_client *client,
>  		     	 const struct i2c_device_id *id)
> -{
> +  {
>  	struct example_state *state;
>  	struct device *dev = &client->dev;
>  
> @@ -250,24 +256,24 @@ static int example_probe(struct i2c_client *client,
>  	dev_info(dev, "example client created\n");
>  
>  	return 0;
> -}
> +  }
>  
> -static int example_remove(struct i2c_client *client)
> -{
> +  static int example_remove(struct i2c_client *client)
> +  {
>  	struct example_state *state = i2c_get_clientdata(client);
>  
>  	kfree(state);
>  	return 0;
> -}
> +  }
>  
> -static struct i2c_device_id example_idtable[] = {
> +  static struct i2c_device_id example_idtable[] = {
>  	{ "example", 0 },
>  	{ }
> -};
> +  };
>  
> -MODULE_DEVICE_TABLE(i2c, example_idtable);
> +  MODULE_DEVICE_TABLE(i2c, example_idtable);
>  
> -static struct i2c_driver example_driver = {
> +  static struct i2c_driver example_driver = {
>   	.driver		= {
>  		.owner		= THIS_MODULE,
>  		.name		= "example",
> @@ -276,4 +282,4 @@ static struct i2c_driver example_driver = {
>  	.id_table	= example_idtable,
>  	.probe		= example_probe,
>  	.remove		= example_remove,
> -};
> +  };
> diff --git a/Documentation/i2c/writing-clients b/Documentation/i2c/writing-clients.rst
> similarity index 91%
> rename from Documentation/i2c/writing-clients
> rename to Documentation/i2c/writing-clients.rst
> index a755b141fa4a..dddf0a14ab7c 100644
> --- a/Documentation/i2c/writing-clients
> +++ b/Documentation/i2c/writing-clients.rst
> @@ -1,3 +1,7 @@
> +===================
> +Writing I2C Clients
> +===================
> +
>  This is a small guide for those who want to write kernel drivers for I2C
>  or SMBus devices, using Linux as the protocol host/master (not slave).
>  
> @@ -12,7 +16,7 @@ General remarks
>  Try to keep the kernel namespace as clean as possible. The best way to
>  do this is to use a unique prefix for all global symbols. This is
>  especially important for exported symbols, but it is a good idea to do
> -it for non-exported symbols too. We will use the prefix `foo_' in this
> +it for non-exported symbols too. We will use the prefix ``foo_`` in this
>  tutorial.
>  
>  
> @@ -25,15 +29,17 @@ routines, and should be zero-initialized except for fields with data you
>  provide.  A client structure holds device-specific information like the
>  driver model device node, and its I2C address.
>  
> -static struct i2c_device_id foo_idtable[] = {
> +::
> +
> +  static struct i2c_device_id foo_idtable[] = {
>  	{ "foo", my_id_for_foo },
>  	{ "bar", my_id_for_bar },
>  	{ }
> -};
> +  };
>  
> -MODULE_DEVICE_TABLE(i2c, foo_idtable);
> +  MODULE_DEVICE_TABLE(i2c, foo_idtable);
>  
> -static struct i2c_driver foo_driver = {
> +  static struct i2c_driver foo_driver = {
>  	.driver = {
>  		.name	= "foo",
>  		.pm	= &foo_pm_ops,	/* optional */
> @@ -49,7 +55,7 @@ static struct i2c_driver foo_driver = {
>  
>  	.shutdown	= foo_shutdown,	/* optional */
>  	.command	= foo_command,	/* optional, deprecated */
> -}
> +  }
>  
>  The name field is the driver name, and must not contain spaces.  It
>  should match the module name (if the driver can be compiled as a module),
> @@ -64,16 +70,18 @@ below.
>  Extra client data
>  =================
>  
> -Each client structure has a special `data' field that can point to any
> +Each client structure has a special ``data`` field that can point to any
>  structure at all.  You should use this to keep device-specific data.
>  
> +::
> +
>  	/* store the value */
>  	void i2c_set_clientdata(struct i2c_client *client, void *data);
>  
>  	/* retrieve the value */
>  	void *i2c_get_clientdata(const struct i2c_client *client);
>  
> -Note that starting with kernel 2.6.34, you don't have to set the `data' field
> +Note that starting with kernel 2.6.34, you don't have to set the ``data`` field
>  to NULL in remove() or if probe() failed anymore. The i2c-core does this
>  automatically on these occasions. Those are also the only times the core will
>  touch this field.
> @@ -92,25 +100,25 @@ but many chips have some kind of register-value idea that can easily
>  be encapsulated.
>  
>  The below functions are simple examples, and should not be copied
> -literally.
> +literally::
>  
> -int foo_read_value(struct i2c_client *client, u8 reg)
> -{
> +  int foo_read_value(struct i2c_client *client, u8 reg)
> +  {
>  	if (reg < 0x10)	/* byte-sized register */
>  		return i2c_smbus_read_byte_data(client, reg);
>  	else		/* word-sized register */
>  		return i2c_smbus_read_word_data(client, reg);
> -}
> +  }
>  
> -int foo_write_value(struct i2c_client *client, u8 reg, u16 value)
> -{
> +  int foo_write_value(struct i2c_client *client, u8 reg, u16 value)
> +  {
>  	if (reg == 0x10)	/* Impossible to write - driver error! */
>  		return -EINVAL;
>  	else if (reg < 0x10)	/* byte-sized register */
>  		return i2c_smbus_write_byte_data(client, reg, value);
>  	else			/* word-sized register */
>  		return i2c_smbus_write_word_data(client, reg, value);
> -}
> +  }
>  
>  
>  Probing and attaching
> @@ -145,6 +153,8 @@ I2C device drivers using this binding model work just like any other
>  kind of driver in Linux:  they provide a probe() method to bind to
>  those devices, and a remove() method to unbind.
>  
> +::
> +
>  	static int foo_probe(struct i2c_client *client,
>  			     const struct i2c_device_id *id);
>  	static int foo_remove(struct i2c_client *client);
> @@ -240,37 +250,41 @@ When the kernel is booted, or when your foo driver module is inserted,
>  you have to do some initializing. Fortunately, just registering the
>  driver module is usually enough.
>  
> -static int __init foo_init(void)
> -{
> +::
> +
> +  static int __init foo_init(void)
> +  {
>  	return i2c_add_driver(&foo_driver);
> -}
> -module_init(foo_init);
> +  }
> +  module_init(foo_init);
>  
> -static void __exit foo_cleanup(void)
> -{
> +  static void __exit foo_cleanup(void)
> +  {
>  	i2c_del_driver(&foo_driver);
> -}
> -module_exit(foo_cleanup);
> +  }
> +  module_exit(foo_cleanup);
>  
> -The module_i2c_driver() macro can be used to reduce above code.
> +  The module_i2c_driver() macro can be used to reduce above code.
>  
> -module_i2c_driver(foo_driver);
> +  module_i2c_driver(foo_driver);
>  
> -Note that some functions are marked by `__init'.  These functions can
> +Note that some functions are marked by ``__init``.  These functions can
>  be removed after kernel booting (or module loading) is completed.
> -Likewise, functions marked by `__exit' are dropped by the compiler when
> +Likewise, functions marked by ``__exit`` are dropped by the compiler when
>  the code is built into the kernel, as they would never be called.
>  
>  
>  Driver Information
>  ==================
>  
> -/* Substitute your own name and email address */
> -MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>"
> -MODULE_DESCRIPTION("Driver for Barf Inc. Foo I2C devices");
> +::
>  
> -/* a few non-GPL license types are also allowed */
> -MODULE_LICENSE("GPL");
> +  /* Substitute your own name and email address */
> +  MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>"
> +  MODULE_DESCRIPTION("Driver for Barf Inc. Foo I2C devices");
> +
> +  /* a few non-GPL license types are also allowed */
> +  MODULE_LICENSE("GPL");
>  
>  
>  Power Management
> @@ -323,6 +337,8 @@ commands, but only some of them understand plain I2C!
>  Plain I2C communication
>  -----------------------
>  
> +::
> +
>  	int i2c_master_send(struct i2c_client *client, const char *buf,
>  			    int count);
>  	int i2c_master_recv(struct i2c_client *client, char *buf, int count);
> @@ -334,6 +350,8 @@ to read/write (must be less than the length of the buffer, also should be
>  less than 64k since msg.len is u16.) Returned is the actual number of bytes
>  read/written.
>  
> +::
> +
>  	int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msg,
>  			 int num);
>  
> @@ -343,13 +361,15 @@ stop bit is sent between transaction. The i2c_msg structure contains
>  for each message the client address, the number of bytes of the message
>  and the message data itself.
>  
> -You can read the file `i2c-protocol' for more information about the
> +You can read the file ``i2c-protocol`` for more information about the
>  actual I2C protocol.
>  
>  
>  SMBus communication
>  -------------------
>  
> +::
> +
>  	s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  			   unsigned short flags, char read_write, u8 command,
>  			   int size, union i2c_smbus_data *data);
> @@ -357,6 +377,8 @@ SMBus communication
>  This is the generic SMBus function. All functions below are implemented
>  in terms of it. Never use this function directly!
>  
> +::
> +
>  	s32 i2c_smbus_read_byte(struct i2c_client *client);
>  	s32 i2c_smbus_write_byte(struct i2c_client *client, u8 value);
>  	s32 i2c_smbus_read_byte_data(struct i2c_client *client, u8 command);
> @@ -376,7 +398,7 @@ in terms of it. Never use this function directly!
>  					   const u8 *values);
>  
>  These ones were removed from i2c-core because they had no users, but could
> -be added back later if needed:
> +be added back later if needed::
>  
>  	s32 i2c_smbus_write_quick(struct i2c_client *client, u8 value);
>  	s32 i2c_smbus_process_call(struct i2c_client *client,
> @@ -389,7 +411,7 @@ transactions return 0 on success; the 'read' transactions return the read
>  value, except for block transactions, which return the number of values
>  read. The block buffers need not be longer than 32 bytes.
>  
> -You can read the file `smbus-protocol' for more information about the
> +You can read the file ``smbus-protocol`` for more information about the
>  actual SMBus protocol.
>  
>  
> @@ -397,7 +419,7 @@ General purpose routines
>  ========================
>  
>  Below all general purpose routines are listed, that were not mentioned
> -before.
> +before::
>  
>  	/* Return the adapter number for a specific adapter */
>  	int i2c_adapter_id(struct i2c_adapter *adap);
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 13c3188f6a68..ded1081e8d5f 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -104,6 +104,7 @@ needed).
>     fb/index
>     fpga/index
>     hid/index
> +   i2c/index
>     iio/index
>     infiniband/index
>     leds/index
> diff --git a/Documentation/spi/spi-sc18is602 b/Documentation/spi/spi-sc18is602
> index a45702865a38..0feffd5af411 100644
> --- a/Documentation/spi/spi-sc18is602
> +++ b/Documentation/spi/spi-sc18is602
> @@ -17,7 +17,7 @@ kernel's SPI core subsystem.
>  
>  The driver does not probe for supported chips, since the SI18IS602/603 does not
>  support Chip ID registers. You will have to instantiate the devices explicitly.
> -Please see Documentation/i2c/instantiating-devices for details.
> +Please see Documentation/i2c/instantiating-devices.rst for details.
>  
>  
>  Usage Notes
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d4da1035a03..ce925b6e3bcc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -666,7 +666,7 @@ ALI1563 I2C DRIVER
>  M:	Rudolf Marek <r.marek@assembler.cz>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-ali1563
> +F:	Documentation/i2c/busses/i2c-ali1563.rst
>  F:	drivers/i2c/busses/i2c-ali1563.c
>  
>  ALLEGRO DVT VIDEO IP CORE DRIVER
> @@ -6657,7 +6657,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Supported
>  F:	drivers/i2c/muxes/i2c-mux-gpio.c
>  F:	include/linux/platform_data/i2c-mux-gpio.h
> -F:	Documentation/i2c/muxes/i2c-mux-gpio
> +F:	Documentation/i2c/muxes/i2c-mux-gpio.rst
>  
>  GENERIC HDLC (WAN) DRIVERS
>  M:	Krzysztof Halasa <khc@pm.waw.pl>
> @@ -7393,14 +7393,14 @@ I2C CONTROLLER DRIVER FOR NVIDIA GPU
>  M:	Ajay Gupta <ajayg@nvidia.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-nvidia-gpu
> +F:	Documentation/i2c/busses/i2c-nvidia-gpu.rst
>  F:	drivers/i2c/busses/i2c-nvidia-gpu.c
>  
>  I2C MUXES
>  M:	Peter Rosin <peda@axentia.se>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/i2c-topology
> +F:	Documentation/i2c/i2c-topology.rst
>  F:	Documentation/i2c/muxes/
>  F:	Documentation/devicetree/bindings/i2c/i2c-mux*
>  F:	Documentation/devicetree/bindings/i2c/i2c-arb*
> @@ -7420,8 +7420,8 @@ I2C OVER PARALLEL PORT
>  M:	Jean Delvare <jdelvare@suse.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-parport
> -F:	Documentation/i2c/busses/i2c-parport-light
> +F:	Documentation/i2c/busses/i2c-parport.rst
> +F:	Documentation/i2c/busses/i2c-parport-light.rst
>  F:	drivers/i2c/busses/i2c-parport.c
>  F:	drivers/i2c/busses/i2c-parport-light.c
>  
> @@ -7455,7 +7455,7 @@ I2C-TAOS-EVM DRIVER
>  M:	Jean Delvare <jdelvare@suse.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-taos-evm
> +F:	Documentation/i2c/busses/i2c-taos-evm.rst
>  F:	drivers/i2c/busses/i2c-taos-evm.c
>  
>  I2C-TINY-USB DRIVER
> @@ -7469,19 +7469,19 @@ I2C/SMBUS CONTROLLER DRIVERS FOR PC
>  M:	Jean Delvare <jdelvare@suse.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-ali1535
> -F:	Documentation/i2c/busses/i2c-ali1563
> -F:	Documentation/i2c/busses/i2c-ali15x3
> -F:	Documentation/i2c/busses/i2c-amd756
> -F:	Documentation/i2c/busses/i2c-amd8111
> -F:	Documentation/i2c/busses/i2c-i801
> -F:	Documentation/i2c/busses/i2c-nforce2
> -F:	Documentation/i2c/busses/i2c-piix4
> -F:	Documentation/i2c/busses/i2c-sis5595
> -F:	Documentation/i2c/busses/i2c-sis630
> -F:	Documentation/i2c/busses/i2c-sis96x
> -F:	Documentation/i2c/busses/i2c-via
> -F:	Documentation/i2c/busses/i2c-viapro
> +F:	Documentation/i2c/busses/i2c-ali1535.rst
> +F:	Documentation/i2c/busses/i2c-ali1563.rst
> +F:	Documentation/i2c/busses/i2c-ali15x3.rst
> +F:	Documentation/i2c/busses/i2c-amd756.rst
> +F:	Documentation/i2c/busses/i2c-amd8111.rst
> +F:	Documentation/i2c/busses/i2c-i801.rst
> +F:	Documentation/i2c/busses/i2c-nforce2.rst
> +F:	Documentation/i2c/busses/i2c-piix4.rst
> +F:	Documentation/i2c/busses/i2c-sis5595.rst
> +F:	Documentation/i2c/busses/i2c-sis630.rst
> +F:	Documentation/i2c/busses/i2c-sis96x.rst
> +F:	Documentation/i2c/busses/i2c-via.rst
> +F:	Documentation/i2c/busses/i2c-viapro.rst
>  F:	drivers/i2c/busses/i2c-ali1535.c
>  F:	drivers/i2c/busses/i2c-ali1563.c
>  F:	drivers/i2c/busses/i2c-ali15x3.c
> @@ -7510,7 +7510,7 @@ M:	Seth Heasley <seth.heasley@intel.com>
>  M:	Neil Horman <nhorman@tuxdriver.com>
>  L:	linux-i2c@vger.kernel.org
>  F:	drivers/i2c/busses/i2c-ismt.c
> -F:	Documentation/i2c/busses/i2c-ismt
> +F:	Documentation/i2c/busses/i2c-ismt.rst
>  
>  I2C/SMBUS STUB DRIVER
>  M:	Jean Delvare <jdelvare@suse.com>
> @@ -10236,7 +10236,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Supported
>  F:	drivers/i2c/busses/i2c-mlxcpld.c
>  F:	drivers/i2c/muxes/i2c-mux-mlxcpld.c
> -F:	Documentation/i2c/busses/i2c-mlxcpld
> +F:	Documentation/i2c/busses/i2c-mlxcpld.rst
>  
>  MELLANOX MLXCPLD LED DRIVER
>  M:	Vadim Pasternak <vadimp@mellanox.com>
> @@ -11857,7 +11857,7 @@ M:	Andrew Lunn <andrew@lunn.ch>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> -F:	Documentation/i2c/busses/i2c-ocores
> +F:	Documentation/i2c/busses/i2c-ocores.rst
>  F:	drivers/i2c/busses/i2c-ocores.c
>  F:	include/linux/platform_data/i2c-ocores.h
>  
> @@ -14141,7 +14141,7 @@ F:	net/sctp/
>  SCx200 CPU SUPPORT
>  M:	Jim Cromie <jim.cromie@gmail.com>
>  S:	Odd Fixes
> -F:	Documentation/i2c/busses/scx200_acb
> +F:	Documentation/i2c/busses/scx200_acb.rst
>  F:	arch/x86/platform/scx200/
>  F:	drivers/watchdog/scx200_wdt.c
>  F:	drivers/i2c/busses/scx200*
> diff --git a/Next/merge.log b/Next/merge.log
> index e9f5123f59ca..b45b3201b1d6 100644
> --- a/Next/merge.log
> +++ b/Next/merge.log
> @@ -2954,7 +2954,7 @@ $ git diff -M --stat --summary HEAD^..
>   Documentation/devicetree/bindings/i2c/i2c-omap.txt |   1 +
>   .../devicetree/bindings/i2c/i2c-sun6i-p2wi.txt     |  41 ---
>   .../bindings/i2c/marvell,mv64xxx-i2c.yaml          | 124 +++++++
> - Documentation/i2c/busses/i2c-i801                  |   3 +-
> + Documentation/i2c/busses/i2c-i801.rst                  |   3 +-
>   MAINTAINERS                                        |   7 +
>   arch/arm/include/asm/hardware/iop3xx.h             |   2 +
>   arch/arm/mach-iop32x/em7210.c                      |   3 +
> @@ -3251,8 +3251,8 @@ $ git diff -M --stat --summary HEAD^..
>   Documentation/fpga/index.rst                       |   17 +
>   Documentation/gpu/msm-crash-dump.rst               |    2 +
>   Documentation/hid/hid-transport.txt                |    6 +-
> - Documentation/i2c/instantiating-devices            |    4 +-
> - Documentation/i2c/upgrading-clients                |    4 +-
> + Documentation/i2c/instantiating-devices.rst            |    4 +-
> + Documentation/i2c/upgrading-clients.rst                |    4 +-
>   Documentation/ide/changelogs.rst                   |   17 +
>   Documentation/ide/{ide-tape.txt => ide-tape.rst}   |   23 +-
>   Documentation/ide/{ide.txt => ide.rst}             |  147 +-
> diff --git a/drivers/hwmon/atxp1.c b/drivers/hwmon/atxp1.c
> index e232fa948833..79b8df258371 100644
> --- a/drivers/hwmon/atxp1.c
> +++ b/drivers/hwmon/atxp1.c
> @@ -5,7 +5,7 @@
>   *
>   * The ATXP1 can reside on I2C addresses 0x37 or 0x4e. The chip is
>   * not auto-detected by the driver and must be instantiated explicitly.
> - * See Documentation/i2c/instantiating-devices for more information.
> + * See Documentation/i2c/instantiating-devices.rst for more information.
>   */
>  
>  #include <linux/kernel.h>
> diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
> index d8c91c2cb8cf..9ae0dc28b9cf 100644
> --- a/drivers/hwmon/smm665.c
> +++ b/drivers/hwmon/smm665.c
> @@ -197,7 +197,7 @@ static int smm665_read_adc(struct smm665_data *data, int adc)
>  	if (rv != -ENXIO) {
>  		/*
>  		 * We expect ENXIO to reflect NACK
> -		 * (per Documentation/i2c/fault-codes).
> +		 * (per Documentation/i2c/fault-codes.rst).
>  		 * Everything else is an error.
>  		 */
>  		dev_dbg(&client->dev,
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index abedd55a1264..1474e57ecafc 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -54,7 +54,7 @@ config I2C_CHARDEV
>  	  Say Y here to use i2c-* device files, usually found in the /dev
>  	  directory on your system.  They make it possible to have user-space
>  	  programs use the I2C bus.  Information on how to do this is
> -	  contained in the file <file:Documentation/i2c/dev-interface>.
> +	  contained in the file <file:Documentation/i2c/dev-interface.rst>.
>  
>  	  This support is also available as a module.  If so, the module 
>  	  will be called i2c-dev.
> @@ -107,7 +107,7 @@ config I2C_STUB
>  	  especially for certain kinds of sensor chips.
>  
>  	  If you do build this module, be sure to read the notes and warnings
> -	  in <file:Documentation/i2c/i2c-stub>.
> +	  in <file:Documentation/i2c/i2c-stub.rst>.
>  
>  	  If you don't know what to do here, definitely say N.
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 68b677be1fa4..e4be46644e8b 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1205,7 +1205,7 @@ config I2C_PARPORT
>  	  and makes it easier to add support for new devices.
>  
>  	  An adapter type parameter is now mandatory.  Please read the file
> -	  Documentation/i2c/busses/i2c-parport for details.
> +	  Documentation/i2c/busses/i2c-parport.rst for details.
>  
>  	  Another driver exists, named i2c-parport-light, which doesn't depend
>  	  on the parport driver.  This is meant for embedded systems. Don't say
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 1e7f6ae62b4c..a215b336bf5c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -76,7 +76,7 @@
>   * SMBus Host Notify			yes
>   * Interrupt processing			yes
>   *
> - * See the file Documentation/i2c/busses/i2c-i801 for details.
> + * See the file Documentation/i2c/busses/i2c-i801.rst for details.
>   */
>  
>  #include <linux/interrupt.h>
> diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
> index c82e78f57386..37347c93e8e0 100644
> --- a/drivers/i2c/busses/i2c-taos-evm.c
> +++ b/drivers/i2c/busses/i2c-taos-evm.c
> @@ -125,7 +125,7 @@ static int taos_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  			/*
>  			 * Voluntarily dropping error code of kstrtou8 since all
>  			 * error code that it could return are invalid according
> -			 * to Documentation/i2c/fault-codes.
> +			 * to Documentation/i2c/fault-codes.rst.
>  			 */
>  			if (kstrtou8(p + 1, 16, &data->byte))
>  				return -EPROTO;
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index e77bab2fb467..56b42558575e 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2205,7 +2205,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
>  			dev_warn(&adapter->dev,
>  				"This adapter will soon drop class based instantiation of devices. "
>  				"Please make sure client 0x%02x gets instantiated by other means. "
> -				"Check 'Documentation/i2c/instantiating-devices' for details.\n",
> +				"Check 'Documentation/i2c/instantiating-devices.rst' for details.\n",
>  				info.addr);
>  
>  		dev_dbg(&adapter->dev, "Creating %s at 0x%02x\n",
> @@ -2235,7 +2235,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>  	if (adapter->class == I2C_CLASS_DEPRECATED) {
>  		dev_dbg(&adapter->dev,
>  			"This adapter dropped support for I2C classes and won't auto-detect %s devices anymore. "
> -			"If you need it, check 'Documentation/i2c/instantiating-devices' for alternatives.\n",
> +			"If you need it, check 'Documentation/i2c/instantiating-devices.rst' for alternatives.\n",
>  			driver->driver.name);
>  		return 0;
>  	}
> diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
> index 8f99c005458a..d28974ad9e0e 100644
> --- a/drivers/iio/dummy/iio_simple_dummy.c
> +++ b/drivers/iio/dummy/iio_simple_dummy.c
> @@ -693,7 +693,7 @@ static int iio_dummy_remove(struct iio_sw_device *swd)
>   * Varies depending on bus type of the device. As there is no device
>   * here, call probe directly. For information on device registration
>   * i2c:
> - * Documentation/i2c/writing-clients
> + * Documentation/i2c/writing-clients.rst
>   * spi:
>   * Documentation/spi/spi-summary
>   */
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 225a8df1d4e9..1803f3cab39f 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -14,7 +14,7 @@
>   */
>  /*
>   * It would be more efficient to use i2c msgs/i2c_transfer directly but, as
> - * recommened in .../Documentation/i2c/writing-clients section
> + * recommened in .../Documentation/i2c/writing-clients.rst section
>   * "Sending and receiving", using SMBus level communication is preferred.
>   */
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fa5552c2307b..c0a78c069117 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -521,7 +521,7 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
>   *
>   * The return codes from the @master_xfer{_atomic} fields should indicate the
>   * type of error code that occurred during the transfer, as documented in the
> - * Kernel Documentation file Documentation/i2c/fault-codes.
> + * Kernel Documentation file Documentation/i2c/fault-codes.rst.
>   */
>  struct i2c_algorithm {
>  	/*
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
