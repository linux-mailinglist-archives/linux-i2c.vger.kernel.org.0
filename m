Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232F868029
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jul 2019 18:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfGNQXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jul 2019 12:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728125AbfGNQXo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jul 2019 12:23:44 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7560F205F4;
        Sun, 14 Jul 2019 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563121405;
        bh=800P1nK0BeXgYjXrTTYApGNzZbr8TUjvIJphaDNjsSw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eExrCi88G88rofNCPxzGeA+SK7MywKXlsRJ8T4QIn2txFvZuUkOdpS8LNZTrmnWlm
         1sraP+LpT+jytQQg96Dc1s282JcAT3gT7C9ilEachB98lh9gjYO0FyD8YY7MBLn7wi
         DDCHKPzVAQeY/pIie1mep9/S+0bMcetK3989Nn1g=
Date:   Sun, 14 Jul 2019 17:23:14 +0100
From:   Jonathan Cameron <jic23@kernel.org>
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
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs: i2c: convert to ReST and add to driver-api
 bookset
Message-ID: <20190714172314.30c52041@archlinux>
In-Reply-To: <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
References: <cover.1561756511.git.mchehab+samsung@kernel.org>
        <3997b54a2e73887b96ec665573f08ded78b71421.1561756511.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 28 Jun 2019 18:23:14 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Convert each file at I2C subsystem, renaming them to .rst and
> adding to the driver-api book.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
For the minimal touch on iio,
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Jonathan

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
>  .../busses/{i2c-ali1535 =3D> i2c-ali1535.rst}   |  13 +-
>  .../busses/{i2c-ali1563 =3D> i2c-ali1563.rst}   |   3 +
>  .../busses/{i2c-ali15x3 =3D> i2c-ali15x3.rst}   |  63 +++---
>  Documentation/i2c/busses/i2c-amd-mp2          |  23 ---
>  Documentation/i2c/busses/i2c-amd-mp2.rst      |  25 +++
>  .../i2c/busses/{i2c-amd756 =3D> i2c-amd756.rst} |   8 +-
>  .../busses/{i2c-amd8111 =3D> i2c-amd8111.rst}   |  14 +-
>  .../{i2c-diolan-u2c =3D> i2c-diolan-u2c.rst}    |   3 +
>  .../i2c/busses/{i2c-i801 =3D> i2c-i801.rst}     |  31 ++-
>  .../i2c/busses/{i2c-ismt =3D> i2c-ismt.rst}     |  20 +-
>  .../busses/{i2c-mlxcpld =3D> i2c-mlxcpld.rst}   |   6 +
>  .../busses/{i2c-nforce2 =3D> i2c-nforce2.rst}   |  23 ++-
>  .../{i2c-nvidia-gpu =3D> i2c-nvidia-gpu.rst}    |   6 +-
>  .../i2c/busses/{i2c-ocores =3D> i2c-ocores.rst} |  22 +-
>  Documentation/i2c/busses/i2c-parport          | 178 ----------------
>  ...2c-parport-light =3D> i2c-parport-light.rst} |   2 +
>  Documentation/i2c/busses/i2c-parport.rst      | 190 +++++++++++++++++
>  .../busses/{i2c-pca-isa =3D> i2c-pca-isa.rst}   |   9 +-
>  .../i2c/busses/{i2c-piix4 =3D> i2c-piix4.rst}   |  14 +-
>  .../busses/{i2c-sis5595 =3D> i2c-sis5595.rst}   |  18 +-
>  Documentation/i2c/busses/i2c-sis630           |  58 ------
>  Documentation/i2c/busses/i2c-sis630.rst       |  64 ++++++
>  .../i2c/busses/{i2c-sis96x =3D> i2c-sis96x.rst} |  28 ++-
>  .../busses/{i2c-taos-evm =3D> i2c-taos-evm.rst} |   8 +-
>  .../i2c/busses/{i2c-via =3D> i2c-via.rst}       |  20 +-
>  .../i2c/busses/{i2c-viapro =3D> i2c-viapro.rst} |  12 +-
>  Documentation/i2c/busses/index.rst            |  33 +++
>  .../i2c/busses/{scx200_acb =3D> scx200_acb.rst} |   9 +-
>  .../i2c/{dev-interface =3D> dev-interface.rst}  |  94 +++++----
>  ...-considerations =3D> dma-considerations.rst} |   0
>  .../i2c/{fault-codes =3D> fault-codes.rst}      |   4 +
>  .../i2c/{functionality =3D> functionality.rst}  |  18 +-
>  ...ult-injection =3D> gpio-fault-injection.rst} |  12 +-
>  .../i2c/{i2c-protocol =3D> i2c-protocol.rst}    |  28 ++-
>  Documentation/i2c/{i2c-stub =3D> i2c-stub.rst}  |  19 +-
>  .../i2c/{i2c-topology =3D> i2c-topology.rst}    |  68 +++---
>  Documentation/i2c/index.rst                   |  38 ++++
>  ...ting-devices =3D> instantiating-devices.rst} |  45 ++--
>  .../muxes/{i2c-mux-gpio =3D> i2c-mux-gpio.rst}  |  26 +--
>  ...e-parameters =3D> old-module-parameters.rst} |  27 ++-
>  ...eprom-backend =3D> slave-eeprom-backend.rst} |   3 +-
>  .../{slave-interface =3D> slave-interface.rst}  |  32 +--
>  .../{smbus-protocol =3D> smbus-protocol.rst}    |  74 ++++---
>  Documentation/i2c/{summary =3D> summary.rst}    |   4 +-
>  ...en-bit-addresses =3D> ten-bit-addresses.rst} |   5 +
>  ...pgrading-clients =3D> upgrading-clients.rst} | 194 +++++++++---------
>  .../{writing-clients =3D> writing-clients.rst}  |  94 +++++----
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
>  rename Documentation/i2c/busses/{i2c-ali1535 =3D> i2c-ali1535.rst} (82%)
>  rename Documentation/i2c/busses/{i2c-ali1563 =3D> i2c-ali1563.rst} (93%)
>  rename Documentation/i2c/busses/{i2c-ali15x3 =3D> i2c-ali15x3.rst} (72%)
>  delete mode 100644 Documentation/i2c/busses/i2c-amd-mp2
>  create mode 100644 Documentation/i2c/busses/i2c-amd-mp2.rst
>  rename Documentation/i2c/busses/{i2c-amd756 =3D> i2c-amd756.rst} (79%)
>  rename Documentation/i2c/busses/{i2c-amd8111 =3D> i2c-amd8111.rst} (66%)
>  rename Documentation/i2c/busses/{i2c-diolan-u2c =3D> i2c-diolan-u2c.rst}=
 (91%)
>  rename Documentation/i2c/busses/{i2c-i801 =3D> i2c-i801.rst} (89%)
>  rename Documentation/i2c/busses/{i2c-ismt =3D> i2c-ismt.rst} (81%)
>  rename Documentation/i2c/busses/{i2c-mlxcpld =3D> i2c-mlxcpld.rst} (88%)
>  rename Documentation/i2c/busses/{i2c-nforce2 =3D> i2c-nforce2.rst} (68%)
>  rename Documentation/i2c/busses/{i2c-nvidia-gpu =3D> i2c-nvidia-gpu.rst}=
 (63%)
>  rename Documentation/i2c/busses/{i2c-ocores =3D> i2c-ocores.rst} (82%)
>  delete mode 100644 Documentation/i2c/busses/i2c-parport
>  rename Documentation/i2c/busses/{i2c-parport-light =3D> i2c-parport-ligh=
t.rst} (92%)
>  create mode 100644 Documentation/i2c/busses/i2c-parport.rst
>  rename Documentation/i2c/busses/{i2c-pca-isa =3D> i2c-pca-isa.rst} (72%)
>  rename Documentation/i2c/busses/{i2c-piix4 =3D> i2c-piix4.rst} (92%)
>  rename Documentation/i2c/busses/{i2c-sis5595 =3D> i2c-sis5595.rst} (74%)
>  delete mode 100644 Documentation/i2c/busses/i2c-sis630
>  create mode 100644 Documentation/i2c/busses/i2c-sis630.rst
>  rename Documentation/i2c/busses/{i2c-sis96x =3D> i2c-sis96x.rst} (75%)
>  rename Documentation/i2c/busses/{i2c-taos-evm =3D> i2c-taos-evm.rst} (91=
%)
>  rename Documentation/i2c/busses/{i2c-via =3D> i2c-via.rst} (61%)
>  rename Documentation/i2c/busses/{i2c-viapro =3D> i2c-viapro.rst} (87%)
>  create mode 100644 Documentation/i2c/busses/index.rst
>  rename Documentation/i2c/busses/{scx200_acb =3D> scx200_acb.rst} (86%)
>  rename Documentation/i2c/{dev-interface =3D> dev-interface.rst} (71%)
>  rename Documentation/i2c/{DMA-considerations =3D> dma-considerations.rst=
} (100%)
>  rename Documentation/i2c/{fault-codes =3D> fault-codes.rst} (98%)
>  rename Documentation/i2c/{functionality =3D> functionality.rst} (91%)
>  rename Documentation/i2c/{gpio-fault-injection =3D> gpio-fault-injection=
.rst} (97%)
>  rename Documentation/i2c/{i2c-protocol =3D> i2c-protocol.rst} (83%)
>  rename Documentation/i2c/{i2c-stub =3D> i2c-stub.rst} (93%)
>  rename Documentation/i2c/{i2c-topology =3D> i2c-topology.rst} (89%)
>  create mode 100644 Documentation/i2c/index.rst
>  rename Documentation/i2c/{instantiating-devices =3D> instantiating-devic=
es.rst} (93%)
>  rename Documentation/i2c/muxes/{i2c-mux-gpio =3D> i2c-mux-gpio.rst} (85%)
>  rename Documentation/i2c/{old-module-parameters =3D> old-module-paramete=
rs.rst} (75%)
>  rename Documentation/i2c/{slave-eeprom-backend =3D> slave-eeprom-backend=
.rst} (90%)
>  rename Documentation/i2c/{slave-interface =3D> slave-interface.rst} (94%)
>  rename Documentation/i2c/{smbus-protocol =3D> smbus-protocol.rst} (84%)
>  rename Documentation/i2c/{summary =3D> summary.rst} (96%)
>  rename Documentation/i2c/{ten-bit-addresses =3D> ten-bit-addresses.rst} =
(95%)
>  rename Documentation/i2c/{upgrading-clients =3D> upgrading-clients.rst} =
(56%)
>  rename Documentation/i2c/{writing-clients =3D> writing-clients.rst} (91%)
>=20
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> index a6ed8b68bd0f..cd20c9764705 100644
> --- a/Documentation/IPMB.txt
> +++ b/Documentation/IPMB.txt
> @@ -82,7 +82,7 @@ Instantiate the device
>  ----------------------
> =20
>  After loading the driver, you can instantiate the device as
> -described in 'Documentation/i2c/instantiating-devices'.
> +described in 'Documentation/i2c/instantiating-devices.rst'.
>  If you have multiple BMCs, each connected to your Satellite MC via
>  a different I2C bus, you can instantiate a device for each of
>  those BMCs.
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Do=
cumentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> index 2907dab56298..8b444b94e92f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
> @@ -42,7 +42,7 @@ Optional properties:
>    This means that no unrelated I2C transactions are allowed on the paren=
t I2C
>    adapter for the complete multiplexed I2C transaction.
>    The properties of mux-locked and parent-locked multiplexers are discus=
sed
> -  in more detail in Documentation/i2c/i2c-topology.
> +  in more detail in Documentation/i2c/i2c-topology.rst.
> =20
>  For each i2c child node, an I2C child bus will be created. They will
>  be numbered based on their order in the device tree.
> diff --git a/Documentation/hwmon/adm1021.rst b/Documentation/hwmon/adm102=
1.rst
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
> =20
> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm127=
5.rst
> index 9a1913e5b4d9..49966ed70ec6 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
> @@ -75,7 +75,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
>  The ADM1075, unlike many other PMBus devices, does not support internal =
voltage
> diff --git a/Documentation/hwmon/hih6130.rst b/Documentation/hwmon/hih613=
0.rst
> index 649bd4be4fc2..e95d373eb693 100644
> --- a/Documentation/hwmon/hih6130.rst
> +++ b/Documentation/hwmon/hih6130.rst
> @@ -27,7 +27,7 @@ The devices communicate with the I2C protocol. All sens=
ors are set to the same
>  I2C address 0x27 by default, so an entry with I2C_BOARD_INFO("hih6130", =
0x27)
>  can be used in the board setup code.
> =20
> -Please see Documentation/i2c/instantiating-devices for details on how to
> +Please see Documentation/i2c/instantiating-devices.rst for details on ho=
w to
>  instantiate I2C devices.
> =20
>  sysfs-Interface
> diff --git a/Documentation/hwmon/ibm-cffps.rst b/Documentation/hwmon/ibm-=
cffps.rst
> index 52e74e39463a..ef8f3f806968 100644
> --- a/Documentation/hwmon/ibm-cffps.rst
> +++ b/Documentation/hwmon/ibm-cffps.rst
> @@ -17,7 +17,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
>  Sysfs entries
> diff --git a/Documentation/hwmon/lm25066.rst b/Documentation/hwmon/lm2506=
6.rst
> index da15e3094c8c..30e6e77fb3c8 100644
> --- a/Documentation/hwmon/lm25066.rst
> +++ b/Documentation/hwmon/lm25066.rst
> @@ -76,7 +76,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/max16064.rst b/Documentation/hwmon/max16=
064.rst
> index 6d5e9538991f..c06249292557 100644
> --- a/Documentation/hwmon/max16064.rst
> +++ b/Documentation/hwmon/max16064.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/max16065.rst b/Documentation/hwmon/max16=
065.rst
> index fa5c852a178c..45f69f334f25 100644
> --- a/Documentation/hwmon/max16065.rst
> +++ b/Documentation/hwmon/max16065.rst
> @@ -79,7 +79,7 @@ Usage Notes
> =20
>  This driver does not probe for devices, since there is no register which
>  can be safely used to identify the chip. You will have to instantiate
> -the devices explicitly. Please see Documentation/i2c/instantiating-devic=
es for
> +the devices explicitly. Please see Documentation/i2c/instantiating-devic=
es.rst for
>  details.
> =20
>  WARNING: Do not access chip registers using the i2cdump command, and do =
not use
> diff --git a/Documentation/hwmon/max20751.rst b/Documentation/hwmon/max20=
751.rst
> index aa4469be6674..fe701e07eaf5 100644
> --- a/Documentation/hwmon/max20751.rst
> +++ b/Documentation/hwmon/max20751.rst
> @@ -30,7 +30,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34=
440.rst
> index 939138e12b02..5744df100a5d 100644
> --- a/Documentation/hwmon/max34440.rst
> +++ b/Documentation/hwmon/max34440.rst
> @@ -83,7 +83,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
>  For MAX34446, the value of the currX_crit attribute determines if curren=
t or
> diff --git a/Documentation/hwmon/max6650.rst b/Documentation/hwmon/max665=
0.rst
> index 253482add082..7952b6ecaa2d 100644
> --- a/Documentation/hwmon/max6650.rst
> +++ b/Documentation/hwmon/max6650.rst
> @@ -55,7 +55,7 @@ Usage notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
>  Module parameters
> diff --git a/Documentation/hwmon/max8688.rst b/Documentation/hwmon/max868=
8.rst
> index 009487759c61..71e7f2cbe2e2 100644
> --- a/Documentation/hwmon/max8688.rst
> +++ b/Documentation/hwmon/max8688.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/menf21bmc.rst b/Documentation/hwmon/menf=
21bmc.rst
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
> =20
>  Sysfs entries
> diff --git a/Documentation/hwmon/pcf8591.rst b/Documentation/hwmon/pcf859=
1.rst
> index e98bd542a441..5c4e85f53177 100644
> --- a/Documentation/hwmon/pcf8591.rst
> +++ b/Documentation/hwmon/pcf8591.rst
> @@ -68,7 +68,7 @@ Accessing PCF8591 via /sys interface
>  The PCF8591 is plainly impossible to detect! Thus the driver won't even
>  try. You have to explicitly instantiate the device at the relevant
>  address (in the interval [0x48..0x4f]) either through platform data, or
> -using the sysfs interface. See Documentation/i2c/instantiating-devices
> +using the sysfs interface. See Documentation/i2c/instantiating-devices.r=
st
>  for details.
> =20
>  Directories are being created for each instantiated PCF8591:
> diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
> index 978a7117e4b2..95a850d5b2c1 100644
> --- a/Documentation/hwmon/sht3x.rst
> +++ b/Documentation/hwmon/sht3x.rst
> @@ -26,7 +26,7 @@ scaled by 1000, i.e. the value for 31.5 degrees celsius=
 is 31500.
> =20
>  The device communicates with the I2C protocol. Sensors can have the I2C
>  addresses 0x44 or 0x45, depending on the wiring. See
> -Documentation/i2c/instantiating-devices for methods to instantiate the d=
evice.
> +Documentation/i2c/instantiating-devices.rst for methods to instantiate t=
he device.
> =20
>  There are two options configurable by means of sht3x_platform_data:
> =20
> diff --git a/Documentation/hwmon/shtc1.rst b/Documentation/hwmon/shtc1.rst
> index aa116332ba26..70c1192bbd8c 100644
> --- a/Documentation/hwmon/shtc1.rst
> +++ b/Documentation/hwmon/shtc1.rst
> @@ -36,7 +36,7 @@ humidity is expressed as a percentage. Driver can be us=
ed as well for SHTW1
>  chip, which has the same electrical interface.
> =20
>  The device communicates with the I2C protocol. All sensors are set to I2C
> -address 0x70. See Documentation/i2c/instantiating-devices for methods to
> +address 0x70. See Documentation/i2c/instantiating-devices.rst for method=
s to
>  instantiate the device.
> =20
>  There are two options configurable by means of shtc1_platform_data:
> diff --git a/Documentation/hwmon/tmp103.rst b/Documentation/hwmon/tmp103.=
rst
> index 15d25806d585..205de6148fcb 100644
> --- a/Documentation/hwmon/tmp103.rst
> +++ b/Documentation/hwmon/tmp103.rst
> @@ -30,4 +30,4 @@ The driver provides the common sysfs-interface for temp=
eratures (see
>  Documentation/hwmon/sysfs-interface.rst under Temperatures).
> =20
>  Please refer how to instantiate this driver:
> -Documentation/i2c/instantiating-devices
> +Documentation/i2c/instantiating-devices.rst
> diff --git a/Documentation/hwmon/tps40422.rst b/Documentation/hwmon/tps40=
422.rst
> index b691e30479dd..8fe3e1c3572e 100644
> --- a/Documentation/hwmon/tps40422.rst
> +++ b/Documentation/hwmon/tps40422.rst
> @@ -28,7 +28,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/ucd9000.rst b/Documentation/hwmon/ucd900=
0.rst
> index ebc4f2b3bfea..746f21fcb48c 100644
> --- a/Documentation/hwmon/ucd9000.rst
> +++ b/Documentation/hwmon/ucd9000.rst
> @@ -64,7 +64,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/ucd9200.rst b/Documentation/hwmon/ucd920=
0.rst
> index b819dfd75f71..4f0e7c3ca6f4 100644
> --- a/Documentation/hwmon/ucd9200.rst
> +++ b/Documentation/hwmon/ucd9200.rst
> @@ -40,7 +40,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
> =20
> diff --git a/Documentation/hwmon/via686a.rst b/Documentation/hwmon/via686=
a.rst
> index a343c35df740..7ab9ddebcf79 100644
> --- a/Documentation/hwmon/via686a.rst
> +++ b/Documentation/hwmon/via686a.rst
> @@ -40,7 +40,7 @@ all as a 686A.
> =20
>  The Via 686a southbridge has integrated hardware monitor functionality.
>  It also has an I2C bus, but this driver only supports the hardware monit=
or.
> -For the I2C bus driver, see <file:Documentation/i2c/busses/i2c-viapro>
> +For the I2C bus driver, see <file:Documentation/i2c/busses/i2c-viapro.rs=
t>
> =20
>  The Via 686a implements three temperature sensors, two fan rotation speed
>  sensors, five voltage sensors and alarms.
> diff --git a/Documentation/hwmon/zl6100.rst b/Documentation/hwmon/zl6100.=
rst
> index 41513bb7fe51..968aff10ce0a 100644
> --- a/Documentation/hwmon/zl6100.rst
> +++ b/Documentation/hwmon/zl6100.rst
> @@ -121,7 +121,7 @@ Usage Notes
>  -----------
> =20
>  This driver does not auto-detect devices. You will have to instantiate t=
he
> -devices explicitly. Please see Documentation/i2c/instantiating-devices f=
or
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
>  details.
> =20
>  .. warning::
> diff --git a/Documentation/i2c/busses/i2c-ali1535 b/Documentation/i2c/bus=
ses/i2c-ali1535.rst
> similarity index 82%
> rename from Documentation/i2c/busses/i2c-ali1535
> rename to Documentation/i2c/busses/i2c-ali1535.rst
> index 5d46342e486a..6941064730dc 100644
> --- a/Documentation/i2c/busses/i2c-ali1535
> +++ b/Documentation/i2c/busses/i2c-ali1535.rst
> @@ -1,16 +1,19 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-ali1535
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1535 (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
> =20
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
> =20
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-ali1563 b/Documentation/i2c/bus=
ses/i2c-ali1563.rst
> similarity index 93%
> rename from Documentation/i2c/busses/i2c-ali1563
> rename to Documentation/i2c/busses/i2c-ali1563.rst
> index 41b1a077e4c7..eec32c3ba92a 100644
> --- a/Documentation/i2c/busses/i2c-ali1563
> +++ b/Documentation/i2c/busses/i2c-ali1563.rst
> @@ -1,7 +1,10 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-ali1563
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1563 (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
> =20
> diff --git a/Documentation/i2c/busses/i2c-ali15x3 b/Documentation/i2c/bus=
ses/i2c-ali15x3.rst
> similarity index 72%
> rename from Documentation/i2c/busses/i2c-ali15x3
> rename to Documentation/i2c/busses/i2c-ali15x3.rst
> index 42888d8ac124..c70f7c66db51 100644
> --- a/Documentation/i2c/busses/i2c-ali15x3
> +++ b/Documentation/i2c/busses/i2c-ali15x3.rst
> @@ -1,20 +1,23 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-ali15x3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
>    * Acer Labs, Inc. ALI 1533 and 1543C (south bridge)
> +
>      Datasheet: Now under NDA
>  	http://www.ali.com.tw/
> =20
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -	Philip Edelbrock <phil@netroedge.com>,
> -	Mark D. Studebaker <mdsxyz123@yahoo.com>
> +	- Frodo Looijaard <frodol@dds.nl>,
> +	- Philip Edelbrock <phil@netroedge.com>,
> +	- Mark D. Studebaker <mdsxyz123@yahoo.com>
> =20
>  Module Parameters
>  -----------------
> =20
>  * force_addr: int
> -  Initialize the base address of the i2c controller
> +    Initialize the base address of the i2c controller
> =20
> =20
>  Notes
> @@ -25,7 +28,9 @@ the BIOS. Does not do a PCI force; the device must stil=
l be present in
>  lspci. Don't use this unless the driver complains that the base address =
is
>  not set.
> =20
> -Example: 'modprobe i2c-ali15x3 force_addr=3D0xe800'
> +Example::
> +
> +    modprobe i2c-ali15x3 force_addr=3D0xe800
> =20
>  SMBus periodically hangs on ASUS P5A motherboards and can only be cleared
>  by a power cycle. Cause unknown (see Issues below).
> @@ -38,47 +43,53 @@ This is the driver for the SMB Host controller on Ace=
r Labs Inc. (ALI)
>  M1541 and M1543C South Bridges.
> =20
>  The M1543C is a South bridge for desktop systems.
> +
>  The M1541 is a South bridge for portable systems.
> +
>  They are part of the following ALI chipsets:
> =20
>   * "Aladdin Pro 2" includes the M1621 Slot 1 North bridge with AGP and
> - 		100MHz CPU Front Side bus
> +   100MHz CPU Front Side bus
>   * "Aladdin V" includes the M1541 Socket 7 North bridge with AGP and 100=
MHz
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
> =20
>    * "Aladdin IV" includes the M1541 Socket 7 North bridge
> -   		with host bus up to 83.3 MHz.
> +    with host bus up to 83.3 MHz.
> =20
>  For an overview of these chips see http://www.acerlabs.com. At this time=
 the
>  full data sheets on the web site are password protected, however if you
>  contact the ALI office in San Jose they may give you the password.
> =20
>  The M1533/M1543C devices appear as FOUR separate devices on the PCI bus.=
 An
> -output of lspci will show something similar to the following:
> +output of lspci will show something similar to the following::
> =20
>    00:02.0 USB Controller: Acer Laboratories Inc. M5237 (rev 03)
>    00:03.0 Bridge: Acer Laboratories Inc. M7101      <=3D THIS IS THE ONE=
 WE NEED
>    00:07.0 ISA bridge: Acer Laboratories Inc. M1533 (rev c3)
>    00:0f.0 IDE interface: Acer Laboratories Inc. M5229 (rev c1)
> =20
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
> =20
>  The SMB controller is part of the M7101 device, which is an ACPI-complia=
nt
>  Power Management Unit (PMU).
> diff --git a/Documentation/i2c/busses/i2c-amd-mp2 b/Documentation/i2c/bus=
ses/i2c-amd-mp2
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
> -The MP2 is an ARM processor programmed as an I2C controller and communic=
ating
> -with the x86 host through PCI.
> -
> -If you see something like this:
> -
> -03:00.7 MP2 I2C controller: Advanced Micro Devices, Inc. [AMD] Device 15=
e6
> -
> -in your 'lspci -v', then this driver is for your device.
> diff --git a/Documentation/i2c/busses/i2c-amd-mp2.rst b/Documentation/i2c=
/busses/i2c-amd-mp2.rst
> new file mode 100644
> index 000000000000..ebc2fa899325
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-amd-mp2.rst
> @@ -0,0 +1,25 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Kernel driver i2c-amd-mp2
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
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
> +The MP2 is an ARM processor programmed as an I2C controller and communic=
ating
> +with the x86 host through PCI.
> +
> +If you see something like this::
> +
> +  03:00.7 MP2 I2C controller: Advanced Micro Devices, Inc. [AMD] Device =
15e6
> +
> +in your ``lspci -v``, then this driver is for your device.
> diff --git a/Documentation/i2c/busses/i2c-amd756 b/Documentation/i2c/buss=
es/i2c-amd756.rst
> similarity index 79%
> rename from Documentation/i2c/busses/i2c-amd756
> rename to Documentation/i2c/busses/i2c-amd756.rst
> index 67f30874d0bf..bc93f392a4fc 100644
> --- a/Documentation/i2c/busses/i2c-amd756
> +++ b/Documentation/i2c/busses/i2c-amd756.rst
> @@ -1,18 +1,22 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-amd756
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * AMD 756
>    * AMD 766
>    * AMD 768
>    * AMD 8111
> +
>      Datasheets: Publicly available on AMD website
> =20
>    * nVidia nForce
> +
>      Datasheet: Unavailable
> =20
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -	Philip Edelbrock <phil@netroedge.com>=20
> +	- Frodo Looijaard <frodol@dds.nl>,
> +	- Philip Edelbrock <phil@netroedge.com>
> =20
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-amd8111 b/Documentation/i2c/bus=
ses/i2c-amd8111.rst
> similarity index 66%
> rename from Documentation/i2c/busses/i2c-amd8111
> rename to Documentation/i2c/busses/i2c-amd8111.rst
> index 460dd6635fd2..d08bf0a7f0ac 100644
> --- a/Documentation/i2c/busses/i2c-amd8111
> +++ b/Documentation/i2c/busses/i2c-amd8111.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-adm8111
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
>      * AMD-8111 SMBus 2.0 PCI interface
> @@ -13,14 +15,14 @@ Author: Vojtech Pavlik <vojtech@suse.cz>
>  Description
>  -----------
> =20
> -If you see something like this:
> +If you see something like this::
> =20
> -00:07.2 SMBus: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0 (rev 02)
> -        Subsystem: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0
> -        Flags: medium devsel, IRQ 19
> -        I/O ports at d400 [size=3D32]
> +  00:07.2 SMBus: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0 (rev 02)
> +          Subsystem: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0
> +          Flags: medium devsel, IRQ 19
> +          I/O ports at d400 [size=3D32]
> =20
> -in your 'lspci -v', then this driver is for your chipset.
> +in your ``lspci -v``, then this driver is for your chipset.
> =20
>  Process Call Support
>  --------------------
> diff --git a/Documentation/i2c/busses/i2c-diolan-u2c b/Documentation/i2c/=
busses/i2c-diolan-u2c.rst
> similarity index 91%
> rename from Documentation/i2c/busses/i2c-diolan-u2c
> rename to Documentation/i2c/busses/i2c-diolan-u2c.rst
> index 0d6018c316c7..c18cbdcdf73c 100644
> --- a/Documentation/i2c/busses/i2c-diolan-u2c
> +++ b/Documentation/i2c/busses/i2c-diolan-u2c.rst
> @@ -1,7 +1,10 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>  Kernel driver i2c-diolan-u2c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * Diolan U2C-12 I2C-USB adapter
> +
>      Documentation:
>  	http://www.diolan.com/i2c/u2c12.html
> =20
> diff --git a/Documentation/i2c/busses/i2c-i801 b/Documentation/i2c/busses=
/i2c-i801.rst
> similarity index 89%
> rename from Documentation/i2c/busses/i2c-i801
> rename to Documentation/i2c/busses/i2c-i801.rst
> index d247edcb0f99..976b42a15129 100644
> --- a/Documentation/i2c/busses/i2c-i801
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -1,4 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-i801
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> =20
>  Supported adapters:
>    * Intel 82801AA and 82801AB (ICH and ICH0 - part of the
> @@ -38,27 +41,32 @@ Supported adapters:
>    * Intel Ice Lake (PCH)
>    * Intel Comet Lake (PCH)
>    * Intel Elkhart Lake (PCH)
> +
>     Datasheets: Publicly available at the Intel website
> =20
>  On Intel Patsburg and later chipsets, both the normal host SMBus control=
ler
>  and the additional 'Integrated Device Function' controllers are supporte=
d.
> =20
>  Authors:=20
> -	Mark Studebaker <mdsxyz123@yahoo.com>
> -	Jean Delvare <jdelvare@suse.de>
> +	- Mark Studebaker <mdsxyz123@yahoo.com>
> +	- Jean Delvare <jdelvare@suse.de>
> =20
> =20
>  Module Parameters
>  -----------------
> =20
>  * disable_features (bit vector)
> +
>  Disable selected features normally supported by the device. This makes it
>  possible to work around possible driver or hardware bugs if the feature =
in
>  question doesn't work as intended for whatever reason. Bit values:
> +
> + =3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0x01  disable SMBus PEC
>   0x02  disable the block buffer
>   0x08  disable the I2C block read functionality
>   0x10  don't use interrupts
> + =3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
>  Description
> @@ -71,7 +79,7 @@ Pentium-based PCs, '815E' chipset, and others.
> =20
>  The ICH chips contain at least SEVEN separate PCI functions in TWO logic=
al
>  PCI devices. An output of lspci will show something similar to the
> -following:
> +following::
> =20
>    00:1e.0 PCI bridge: Intel Corporation: Unknown device 2418 (rev 01)
>    00:1f.0 ISA bridge: Intel Corporation: Unknown device 2410 (rev 01)
> @@ -138,14 +146,14 @@ and you think there's something interesting on the =
SMBus (e.g. a
>  hardware monitoring chip), you need to add your board to the list.
> =20
>  The motherboard is identified using the subvendor and subdevice IDs of t=
he
> -host bridge PCI device. Get yours with "lspci -n -v -s 00:00.0":
> +host bridge PCI device. Get yours with ``lspci -n -v -s 00:00.0``::
> =20
> -00:00.0 Class 0600: 8086:2570 (rev 02)
> -        Subsystem: 1043:80f2
> -        Flags: bus master, fast devsel, latency 0
> -        Memory at fc000000 (32-bit, prefetchable) [size=3D32M]
> -        Capabilities: [e4] #09 [2106]
> -        Capabilities: [a0] AGP version 3.0
> +  00:00.0 Class 0600: 8086:2570 (rev 02)
> +          Subsystem: 1043:80f2
> +          Flags: bus master, fast devsel, latency 0
> +          Memory at fc000000 (32-bit, prefetchable) [size=3D32M]
> +          Capabilities: [e4] #09 [2106]
> +          Capabilities: [a0] AGP version 3.0
> =20
>  Here the host bridge ID is 2570 (82865G/PE/P), the subvendor ID is 1043
>  (Asus) and the subdevice ID is 80f2 (P4P800-X). You can find the symbolic
> @@ -164,7 +172,8 @@ kernel. It's very convenient if you just want to chec=
k if there's
>  anything interesting on your hidden ICH SMBus.
> =20
> =20
> -**********************
> +------------------------------------------------------------------------=
----
> +
>  The lm_sensors project gratefully acknowledges the support of Texas
>  Instruments in the initial development of this driver.
> =20
> diff --git a/Documentation/i2c/busses/i2c-ismt b/Documentation/i2c/busses=
/i2c-ismt.rst
> similarity index 81%
> rename from Documentation/i2c/busses/i2c-ismt
> rename to Documentation/i2c/busses/i2c-ismt.rst
> index 737355822c0b..8e74919a3fdf 100644
> --- a/Documentation/i2c/busses/i2c-ismt
> +++ b/Documentation/i2c/busses/i2c-ismt.rst
> @@ -1,4 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-ismt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> =20
>  Supported adapters:
>    * Intel S12xx series SOCs
> @@ -11,16 +14,21 @@ Module Parameters
>  -----------------
> =20
>  * bus_speed (unsigned int)
> +
>  Allows changing of the bus speed.  Normally, the bus speed is set by the=
 BIOS
>  and never needs to be changed.  However, some SMBus analyzers are too sl=
ow for
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
> +  =3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  0      no change
> +  80     kHz
> +  100    kHz
> +  400    kHz
> +  1000   kHz
> +  =3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
>  Description
> @@ -30,7 +38,7 @@ The S12xx series of SOCs have a pair of integrated SMBu=
s 2.0 controllers
>  targeted primarily at the microserver and storage markets.
> =20
>  The S12xx series contain a pair of PCI functions.  An output of lspci wi=
ll show
> -something similar to the following:
> +something similar to the following::
> =20
>    00:13.0 System peripheral: Intel Corporation Centerton SMBus 2.0 Contr=
oller 0
>    00:13.1 System peripheral: Intel Corporation Centerton SMBus 2.0 Contr=
oller 1
> diff --git a/Documentation/i2c/busses/i2c-mlxcpld b/Documentation/i2c/bus=
ses/i2c-mlxcpld.rst
> similarity index 88%
> rename from Documentation/i2c/busses/i2c-mlxcpld
> rename to Documentation/i2c/busses/i2c-mlxcpld.rst
> index 925904aa9b57..9a0b2916aa71 100644
> --- a/Documentation/i2c/busses/i2c-mlxcpld
> +++ b/Documentation/i2c/busses/i2c-mlxcpld.rst
> @@ -1,9 +1,12 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Driver i2c-mlxcpld
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Author: Michael Shych <michaelsh@mellanox.com>
> =20
>  This is the Mellanox I2C controller logic, implemented in Lattice CPLD
>  device.
> +
>  Device supports:
>   - Master mode.
>   - One physical bus.
> @@ -20,6 +23,8 @@ The next transaction types are supported:
>   - Write Byte/Block.
> =20
>  Registers:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  CPBLTY		0x0 - capability reg.
>  			Bits [6:5] - transaction length. b01 - 72B is supported,
>  			36B in other case.
> @@ -49,3 +54,4 @@ DATAx		0xa - 0x54  - 68 bytes data buffer regs.
>  			For read transactions address is sent in a separate transaction and
>  			specified in the four first bytes (DATA0 - DATA3). Data is read
>  			starting from DATA0.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/i2c/busses/i2c-nforce2 b/Documentation/i2c/bus=
ses/i2c-nforce2.rst
> similarity index 68%
> rename from Documentation/i2c/busses/i2c-nforce2
> rename to Documentation/i2c/busses/i2c-nforce2.rst
> index 9698c396b830..f5c57ea31cd3 100644
> --- a/Documentation/i2c/busses/i2c-nforce2
> +++ b/Documentation/i2c/busses/i2c-nforce2.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-nforce2
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
>    * nForce2 MCP                10de:0064=20
> @@ -16,26 +18,27 @@ Supported adapters:
>    * nForce MCP78S              10de:0752
>    * nForce MCP79               10de:0AA2
> =20
> -Datasheet: not publicly available, but seems to be similar to the
> +Datasheet:
> +           not publicly available, but seems to be similar to the
>             AMD-8111 SMBus 2.0 adapter.
> =20
>  Authors:
> -	Hans-Frieder Vogt <hfvogt@gmx.net>,
> -	Thomas Leibold <thomas@plx.com>,=20
> -        Patrick Dreker <patrick@dreker.de>
> +	- Hans-Frieder Vogt <hfvogt@gmx.net>,
> +	- Thomas Leibold <thomas@plx.com>,
> +        - Patrick Dreker <patrick@dreker.de>
>  =09
>  Description
>  -----------
> =20
>  i2c-nforce2 is a driver for the SMBuses included in the nVidia nForce2 M=
CP.
> =20
> -If your 'lspci -v' listing shows something like the following,
> +If your ``lspci -v`` listing shows something like the following::
> =20
> -00:01.1 SMBus: nVidia Corporation: Unknown device 0064 (rev a2)
> -        Subsystem: Asustek Computer, Inc.: Unknown device 0c11
> -        Flags: 66Mhz, fast devsel, IRQ 5
> -        I/O ports at c000 [size=3D32]
> -        Capabilities: <available only to root>
> +  00:01.1 SMBus: nVidia Corporation: Unknown device 0064 (rev a2)
> +          Subsystem: Asustek Computer, Inc.: Unknown device 0c11
> +          Flags: 66Mhz, fast devsel, IRQ 5
> +          I/O ports at c000 [size=3D32]
> +          Capabilities: <available only to root>
> =20
>  then this driver should support the SMBuses of your motherboard.
> =20
> diff --git a/Documentation/i2c/busses/i2c-nvidia-gpu b/Documentation/i2c/=
busses/i2c-nvidia-gpu.rst
> similarity index 63%
> rename from Documentation/i2c/busses/i2c-nvidia-gpu
> rename to Documentation/i2c/busses/i2c-nvidia-gpu.rst
> index 31884d2b2eb5..38fb8a4c8756 100644
> --- a/Documentation/i2c/busses/i2c-nvidia-gpu
> +++ b/Documentation/i2c/busses/i2c-nvidia-gpu.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>  Kernel driver i2c-nvidia-gpu
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> =20
>  Datasheet: not publicly available.
> =20
> @@ -11,8 +13,8 @@ Description
>  i2c-nvidia-gpu is a driver for I2C controller included in NVIDIA Turing
>  and later GPUs and it is used to communicate with Type-C controller on G=
PUs.
> =20
> -If your 'lspci -v' listing shows something like the following,
> +If your ``lspci -v`` listing shows something like the following::
> =20
> -01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1ad9 (re=
v a1)
> +  01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1ad9 (=
rev a1)
> =20
>  then this driver should support the I2C controller of your GPU.
> diff --git a/Documentation/i2c/busses/i2c-ocores b/Documentation/i2c/buss=
es/i2c-ocores.rst
> similarity index 82%
> rename from Documentation/i2c/busses/i2c-ocores
> rename to Documentation/i2c/busses/i2c-ocores.rst
> index 9caaf7df1b2f..f5e175f2a2a6 100644
> --- a/Documentation/i2c/busses/i2c-ocores
> +++ b/Documentation/i2c/busses/i2c-ocores.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-ocores
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * OpenCores.org I2C controller by Richard Herveille (see datasheet lin=
k)
> @@ -23,9 +25,9 @@ distance between registers and the input clock speed.
>  There is also a possibility to attach a list of i2c_board_info which
>  the i2c-ocores driver will add to the bus upon creation.
> =20
> -E.G. something like:
> +E.G. something like::
> =20
> -static struct resource ocores_resources[] =3D {
> +  static struct resource ocores_resources[] =3D {
>  	[0] =3D {
>  		.start	=3D MYI2C_BASEADDR,
>  		.end	=3D MYI2C_BASEADDR + 8,
> @@ -36,10 +38,10 @@ static struct resource ocores_resources[] =3D {
>  		.end	=3D MYI2C_IRQ,
>  		.flags	=3D IORESOURCE_IRQ,
>  	},
> -};
> +  };
> =20
> -/* optional board info */
> -struct i2c_board_info ocores_i2c_board_info[] =3D {
> +  /* optional board info */
> +  struct i2c_board_info ocores_i2c_board_info[] =3D {
>  	{
>  		I2C_BOARD_INFO("tsc2003", 0x48),
>  		.platform_data =3D &tsc2003_platform_data,
> @@ -49,20 +51,20 @@ struct i2c_board_info ocores_i2c_board_info[] =3D {
>  		I2C_BOARD_INFO("adv7180", 0x42 >> 1),
>  		.irq =3D ADV_IRQ
>  	}
> -};
> +  };
> =20
> -static struct ocores_i2c_platform_data myi2c_data =3D {
> +  static struct ocores_i2c_platform_data myi2c_data =3D {
>  	.regstep	=3D 2,		/* two bytes between registers */
>  	.clock_khz	=3D 50000,	/* input clock of 50MHz */
>  	.devices	=3D ocores_i2c_board_info, /* optional table of devices */
>  	.num_devices	=3D ARRAY_SIZE(ocores_i2c_board_info), /* table size */
> -};
> +  };
> =20
> -static struct platform_device myi2c =3D {
> +  static struct platform_device myi2c =3D {
>  	.name			=3D "ocores-i2c",
>  	.dev =3D {
>  		.platform_data	=3D &myi2c_data,
>  	},
>  	.num_resources		=3D ARRAY_SIZE(ocores_resources),
>  	.resource		=3D ocores_resources,
> -};
> +  };
> diff --git a/Documentation/i2c/busses/i2c-parport b/Documentation/i2c/bus=
ses/i2c-parport
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
> - * (type=3D0) Philips adapter
> - * (type=3D1) home brew teletext adapter
> - * (type=3D2) Velleman K8000 adapter
> - * (type=3D3) ELV adapter
> - * (type=3D4) Analog Devices ADM1032 evaluation board
> - * (type=3D5) Analog Devices evaluation boards: ADM1025, ADM1030, ADM1031
> - * (type=3D6) Barco LPT->DVI (K5800236) adapter
> - * (type=3D7) One For All JP1 parallel port adapter
> - * (type=3D8) VCT-jig
> -
> -These devices use different pinout configurations, so you have to tell
> -the driver what you have, using the type module parameter. There is no
> -way to autodetect the devices. Support for different pinout configuratio=
ns
> -can be easily added when needed.
> -
> -Earlier kernels defaulted to type=3D0 (Philips).  But now, if the type
> -parameter is missing, the driver will simply fail to initialize.
> -
> -SMBus alert support is available on adapters which have this line proper=
ly
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
> -                                      |    |=20
> -                                     ###  ###
> -                                     GND  GND
> -       =20
> -Remarks:
> - - This is the exact pinout and electronics used on the Analog Devices
> -   evaluation boards.
> -                   /|
> - - All inverters -o |- must be 74HC05, they must be open collector outpu=
t.
> -                   \|
> - - All resitors are 10k.
> - - Pins 18-25 of the parallel port connected to GND.
> - - Pins 4-9 (D2-D7) could be used as VDD is the driver drives them high.
> -   The ADM1032 evaluation board uses D4-D7. Beware that the amount of
> -   current you can draw from the parallel port is limited. Also note that
> -   all connected lines MUST BE driven at the same state, else you'll sho=
rt
> -   circuit the output buffers! So plugging the I2C adapter after loading
> -   the i2c-parport module might be a good safety since data line state
> -   prior to init may be unknown.=20
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
> -                    |   |  |/         |=20
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
> -                                           |    |=20
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
> -package. The i2c-pport driver makes use of modern parallel port features=
 so
> -that you don't need additional electronics. It has other restrictions
> -however, and was not ported to Linux 2.6 (yet).
> -
> -This driver is also NOT the same as the i2c-pcf-epp driver found in the
> -lm_sensors package. The i2c-pcf-epp driver doesn't use the parallel port=
 as
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
> -  http://struyve.mine.nu:8080/index.php?block=3Dk8000
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
> diff --git a/Documentation/i2c/busses/i2c-parport-light b/Documentation/i=
2c/busses/i2c-parport-light.rst
> similarity index 92%
> rename from Documentation/i2c/busses/i2c-parport-light
> rename to Documentation/i2c/busses/i2c-parport-light.rst
> index 7071b8ba0af4..af85c8dfcd1a 100644
> --- a/Documentation/i2c/busses/i2c-parport-light
> +++ b/Documentation/i2c/busses/i2c-parport-light.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-parport-light
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =20
>  Author: Jean Delvare <jdelvare@suse.de>
> =20
> diff --git a/Documentation/i2c/busses/i2c-parport.rst b/Documentation/i2c=
/busses/i2c-parport.rst
> new file mode 100644
> index 000000000000..fae7c7ba9bd1
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-parport.rst
> @@ -0,0 +1,190 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Kernel driver i2c-parport
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
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
> + * (type=3D0) Philips adapter
> + * (type=3D1) home brew teletext adapter
> + * (type=3D2) Velleman K8000 adapter
> + * (type=3D3) ELV adapter
> + * (type=3D4) Analog Devices ADM1032 evaluation board
> + * (type=3D5) Analog Devices evaluation boards: ADM1025, ADM1030, ADM1031
> + * (type=3D6) Barco LPT->DVI (K5800236) adapter
> + * (type=3D7) One For All JP1 parallel port adapter
> + * (type=3D8) VCT-jig
> +
> +These devices use different pinout configurations, so you have to tell
> +the driver what you have, using the type module parameter. There is no
> +way to autodetect the devices. Support for different pinout configuratio=
ns
> +can be easily added when needed.
> +
> +Earlier kernels defaulted to type=3D0 (Philips).  But now, if the type
> +parameter is missing, the driver will simply fail to initialize.
> +
> +SMBus alert support is available on adapters which have this line proper=
ly
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
> +   all connected lines MUST BE driven at the same state, else you'll sho=
rt
> +   circuit the output buffers! So plugging the I2C adapter after loading
> +   the i2c-parport module might be a good safety since data line state
> +   prior to init may be unknown.=20
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
> +package. The i2c-pport driver makes use of modern parallel port features=
 so
> +that you don't need additional electronics. It has other restrictions
> +however, and was not ported to Linux 2.6 (yet).
> +
> +This driver is also NOT the same as the i2c-pcf-epp driver found in the
> +lm_sensors package. The i2c-pcf-epp driver doesn't use the parallel port=
 as
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
> +  - http://struyve.mine.nu:8080/index.php?block=3Dk8000
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
> diff --git a/Documentation/i2c/busses/i2c-pca-isa b/Documentation/i2c/bus=
ses/i2c-pca-isa.rst
> similarity index 72%
> rename from Documentation/i2c/busses/i2c-pca-isa
> rename to Documentation/i2c/busses/i2c-pca-isa.rst
> index b044e5265488..a254010c8055 100644
> --- a/Documentation/i2c/busses/i2c-pca-isa
> +++ b/Documentation/i2c/busses/i2c-pca-isa.rst
> @@ -1,6 +1,9 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-pca-isa
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Supported adapters:
> +
>  This driver supports ISA boards using the Philips PCA 9564
>  Parallel bus to I2C bus controller
> =20
> @@ -10,11 +13,11 @@ Module Parameters
>  -----------------
> =20
>  * base int
> - I/O base address
> +    I/O base address
>  * irq int
> - IRQ interrupt
> +    IRQ interrupt
>  * clock int
> - Clock rate as described in table 1 of PCA9564 datasheet
> +    Clock rate as described in table 1 of PCA9564 datasheet
> =20
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-piix4 b/Documentation/i2c/busse=
s/i2c-piix4.rst
> similarity index 92%
> rename from Documentation/i2c/busses/i2c-piix4
> rename to Documentation/i2c/busses/i2c-piix4.rst
> index 2703bc3acad0..5d4744842b41 100644
> --- a/Documentation/i2c/busses/i2c-piix4
> +++ b/Documentation/i2c/busses/i2c-piix4.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-piix4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * Intel 82371AB PIIX4 and PIIX4E
> @@ -21,8 +23,8 @@ Supported adapters:
>      Datasheet: Publicly available at the SMSC website http://www.smsc.com
> =20
>  Authors:=20
> -	Frodo Looijaard <frodol@dds.nl>
> -	Philip Edelbrock <phil@netroedge.com>
> +	- Frodo Looijaard <frodol@dds.nl>
> +	- Philip Edelbrock <phil@netroedge.com>
> =20
> =20
>  Module Parameters
> @@ -45,10 +47,10 @@ natively understands SMBus commands and you do not ha=
ve to worry about
>  timing problems. The bad news is that non-SMBus devices connected to it =
can
>  confuse it mightily. Yes, this is known to happen...
> =20
> -Do 'lspci -v' and see whether it contains an entry like this:
> +Do ``lspci -v`` and see whether it contains an entry like this::
> =20
> -0000:00:02.3 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 02)
> -	     Flags: medium devsel, IRQ 9
> +  0000:00:02.3 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 02)
> +	       Flags: medium devsel, IRQ 9
> =20
>  Bus and device numbers may differ, but the function number must be
>  identical (like many PCI devices, the PIIX4 incorporates a number of
> @@ -91,7 +93,7 @@ the SMI mode.
>     device is located at 00:0f.0.
>  2) Now you just need to change the value in 0xD2 register. Get it first =
with
>     command: lspci -xxx -s 00:0f.0
> -   If the value is 0x3 then you need to change it to 0x1
> +   If the value is 0x3 then you need to change it to 0x1:
>     setpci  -s 00:0f.0 d2.b=3D1
> =20
>  Please note that you don't need to do that in all cases, just when the S=
MBus is
> diff --git a/Documentation/i2c/busses/i2c-sis5595 b/Documentation/i2c/bus=
ses/i2c-sis5595.rst
> similarity index 74%
> rename from Documentation/i2c/busses/i2c-sis5595
> rename to Documentation/i2c/busses/i2c-sis5595.rst
> index ecd21fb49a8f..5614afe35e79 100644
> --- a/Documentation/i2c/busses/i2c-sis5595
> +++ b/Documentation/i2c/busses/i2c-sis5595.rst
> @@ -1,9 +1,11 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  Kernel driver i2c-sis5595
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  Authors:
> -	Frodo Looijaard <frodol@dds.nl>,
> -        Mark D. Studebaker <mdsxyz123@yahoo.com>,
> -	Philip Edelbrock <phil@netroedge.com>
> +	- Frodo Looijaard <frodol@dds.nl>,
> +        - Mark D. Studebaker <mdsxyz123@yahoo.com>,
> +	- Philip Edelbrock <phil@netroedge.com>
> =20
>  Supported adapters:
>    * Silicon Integrated Systems Corp. SiS5595 Southbridge
> @@ -11,14 +13,19 @@ Supported adapters:
> =20
>  Note: all have mfr. ID 0x1039.
> =20
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D            =3D=3D=3D=3D=3D=3D
>     SUPPORTED            PCI ID
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D            =3D=3D=3D=3D=3D=3D
>          5595            0008
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D            =3D=3D=3D=3D=3D=3D
> =20
>     Note: these chips contain a 0008 device which is incompatible with the
>           5595. We recognize these by the presence of the listed
>           "blacklist" PCI ID and refuse to load.
> =20
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        =3D=3D=3D=3D=3D=3D    =
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     NOT SUPPORTED        PCI ID          BLACKLIST PCI ID
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        =3D=3D=3D=3D=3D=3D    =
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>           540            0008            0540
>           550            0008            0550
>          5513            0008            5511
> @@ -36,15 +43,18 @@ Note: all have mfr. ID 0x1039.
>           735            0008            0735
>           745            0008            0745
>           746            0008            0746
> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        =3D=3D=3D=3D=3D=3D    =
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Module Parameters
>  -----------------
> =20
> -* force_addr=3D0xaddr	Set the I/O base address. Useful for boards
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +force_addr=3D0xaddr	Set the I/O base address. Useful for boards
>  			that don't set the address in the BIOS. Does not do a
>  			PCI force; the device must still be present in lspci.
>  			Don't use this unless the driver complains that the
>  			base address is not set.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Description
>  -----------
> diff --git a/Documentation/i2c/busses/i2c-sis630 b/Documentation/i2c/buss=
es/i2c-sis630
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
> -	Amaury Decr=C3=AAme <amaury.decreme@gmail.com> - SiS964 support
> -
> -Module Parameters
> ------------------
> -
> -* force =3D [1|0] Forcibly enable the SIS630. DANGEROUS!
> -		This can be interesting for chipsets not named
> -		above to check if it works for you chipset, but DANGEROUS!
> -
> -* high_clock =3D [1|0] Forcibly set Host Master Clock to 56KHz (default,
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
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS] 760/M760 Host (rev=
 02)
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS964 [MuTIOL Medi=
a IO]
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
> diff --git a/Documentation/i2c/busses/i2c-sis630.rst b/Documentation/i2c/=
busses/i2c-sis630.rst
> new file mode 100644
> index 000000000000..f37700e885f2
> --- /dev/null
> +++ b/Documentation/i2c/busses/i2c-sis630.rst
> @@ -0,0 +1,64 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Kernel driver i2c-sis630
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +	- Amaury Decr=C3=AAme <amaury.decreme@gmail.com> - SiS964 support
> +
> +Module Parameters
> +-----------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +force =3D [1|0]           Forcibly enable the SIS630. DANGEROUS!
> +                        This can be interesting for chipsets not named
> +                        above to check if it works for you chipset,
> +                        but DANGEROUS!
> +
> +high_clock =3D [1|0]      Forcibly set Host Master Clock to 56KHz (defau=
lt,
> +			what your BIOS use). DANGEROUS! This should be a bit
> +			faster, but freeze some systems (i.e. my Laptop).
> +			SIS630/730 chip only.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS] 760/M760 Host (r=
ev 02)
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS964 [MuTIOL Me=
dia IO]
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
> diff --git a/Documentation/i2c/busses/i2c-sis96x b/Documentation/i2c/buss=
es/i2c-sis96x.rst
> similarity index 75%
> rename from Documentation/i2c/busses/i2c-sis96x
> rename to Documentation/i2c/busses/i2c-sis96x.rst
> index 0b979f3252a4..b84581ade213 100644
> --- a/Documentation/i2c/busses/i2c-sis96x
> +++ b/Documentation/i2c/busses/i2c-sis96x.rst
> @@ -1,11 +1,16 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-sis96x
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Replaces 2.4.x i2c-sis645
> =20
>  Supported adapters:
> +
>    * Silicon Integrated Systems Corp (SiS)
> +
>      Any combination of these host bridges:
>  	645, 645DX (aka 646), 648, 650, 651, 655, 735, 745, 746
> +
>      and these south bridges:
>      	961, 962, 963(L)
> =20
> @@ -21,17 +26,17 @@ those of the SiS630, although they are located in a c=
ompletely different
>  place. Thanks to Alexander Malysh <amalysh@web.de> for providing the
>  SiS630 datasheet (and  driver).
> =20
> -The command "lspci" as root should produce something like these lines:
> +The command ``lspci`` as root should produce something like these lines::
> =20
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 06=
45
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> -00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device =
0645
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> +  00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> =20
> -or perhaps this...
> +or perhaps this::
> =20
> -00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device 06=
45
> -00:02.0 ISA bridge: Silicon Integrated Systems [SiS]: Unknown device 0961
> -00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> +  00:00.0 Host bridge: Silicon Integrated Systems [SiS]: Unknown device =
0645
> +  00:02.0 ISA bridge: Silicon Integrated Systems [SiS]: Unknown device 0=
961
> +  00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> =20
>  (kernel versions later than 2.4.18 may fill in the "Unknown"s)
> =20
> @@ -50,7 +55,7 @@ TO DOs
>  ------
> =20
>  * The driver does not support SMBus block reads/writes; I may add them i=
f a
> -scenario is found where they're needed.
> +  scenario is found where they're needed.
> =20
> =20
>  Thank You
> @@ -58,14 +63,19 @@ Thank You
> =20
>  Mark D. Studebaker <mdsxyz123@yahoo.com>
>   - design hints and bug fixes
> +
>  Alexander Maylsh <amalysh@web.de>
>   - ditto, plus an important datasheet... almost the one I really wanted
> +
>  Hans-G=C3=BCnter L=C3=BCtke Uphues <hg_lu@t-online.de>
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
> =20
> diff --git a/Documentation/i2c/busses/i2c-taos-evm b/Documentation/i2c/bu=
sses/i2c-taos-evm.rst
> similarity index 91%
> rename from Documentation/i2c/busses/i2c-taos-evm
> rename to Documentation/i2c/busses/i2c-taos-evm.rst
> index 60299555dcf0..f342e313ee3d 100644
> --- a/Documentation/i2c/busses/i2c-taos-evm
> +++ b/Documentation/i2c/busses/i2c-taos-evm.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Kernel driver i2c-taos-evm
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =20
>  Author: Jean Delvare <jdelvare@suse.de>
> =20
> @@ -23,10 +25,10 @@ Using this driver
>  In order to use this driver, you'll need the serport driver, and the
>  inputattach tool, which is part of the input-utils package. The following
>  commands will tell the kernel that you have a TAOS EVM on the first
> -serial port:
> +serial port::
> =20
> -# modprobe serport
> -# inputattach --taos-evm /dev/ttyS0
> +  # modprobe serport
> +  # inputattach --taos-evm /dev/ttyS0
> =20
> =20
>  Technical details
> diff --git a/Documentation/i2c/busses/i2c-via b/Documentation/i2c/busses/=
i2c-via.rst
> similarity index 61%
> rename from Documentation/i2c/busses/i2c-via
> rename to Documentation/i2c/busses/i2c-via.rst
> index 343870661ac3..df1df5adff7b 100644
> --- a/Documentation/i2c/busses/i2c-via
> +++ b/Documentation/i2c/busses/i2c-via.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-via
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * VIA Technologies, InC. VT82C586B
> @@ -15,20 +17,24 @@ The following VIA pci chipsets are supported:
>   - MVP3, VP3, VP2/97, VPX/97=20
>   - others with South bridge VT82C586B
> =20
> -Your lspci listing must show this :
> +Your ``lspci`` listing must show this ::
> =20
>   Bridge: VIA Technologies, Inc. VT82C586B ACPI (rev 10)
> =20
> -    Problems?
> +Problems?
> +---------
>  =20
> - Q: You have VT82C586B on the motherboard, but not in the listing.=20
> + Q:
> +    You have VT82C586B on the motherboard, but not in the listing.
>  =20
> - A: Go to your BIOS setup, section PCI devices or similar.
> + A:
> +    Go to your BIOS setup, section PCI devices or similar.
>      Turn USB support on, and try again.=20
> =20
> - Q: No error messages, but still i2c doesn't seem to work.
> + Q:
> +    No error messages, but still i2c doesn't seem to work.
> =20
> - A: This can happen. This driver uses the pins VIA recommends in their
> + A:
> +    This can happen. This driver uses the pins VIA recommends in their
>      datasheets, but there are several ways the motherboard manufacturer
>      can actually wire the lines.
> -
> diff --git a/Documentation/i2c/busses/i2c-viapro b/Documentation/i2c/buss=
es/i2c-viapro.rst
> similarity index 87%
> rename from Documentation/i2c/busses/i2c-viapro
> rename to Documentation/i2c/busses/i2c-viapro.rst
> index ab64ce21c254..1762f0cf93d0 100644
> --- a/Documentation/i2c/busses/i2c-viapro
> +++ b/Documentation/i2c/busses/i2c-viapro.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver i2c-viapro
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Supported adapters:
>    * VIA Technologies, Inc. VT82C596A/B
> @@ -26,9 +28,9 @@ Supported adapters:
>      Datasheet: available on http://linux.via.com.tw
> =20
>  Authors:
> -	Ky=C3=B6sti M=C3=A4lkki <kmalkki@cc.hut.fi>,
> -	Mark D. Studebaker <mdsxyz123@yahoo.com>,
> -	Jean Delvare <jdelvare@suse.de>
> +	- Ky=C3=B6sti M=C3=A4lkki <kmalkki@cc.hut.fi>,
> +	- Mark D. Studebaker <mdsxyz123@yahoo.com>,
> +	- Jean Delvare <jdelvare@suse.de>
> =20
>  Module Parameters
>  -----------------
> @@ -44,8 +46,9 @@ Description
>  i2c-viapro is a true SMBus host driver for motherboards with one of the
>  supported VIA south bridges.
> =20
> -Your lspci -n listing must show one of these :
> +Your ``lspci -n`` listing must show one of these :
> =20
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   device 1106:3050   (VT82C596A function 3)
>   device 1106:3051   (VT82C596B function 3)
>   device 1106:3057   (VT82C686 function 4)
> @@ -61,6 +64,7 @@ Your lspci -n listing must show one of these :
>   device 1106:8353   (VX800/VX820)
>   device 1106:8409   (VX855/VX875)
>   device 1106:8410   (VX900)
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  If none of these show up, you should look in the BIOS for settings like
>  enable ACPI / SMBus or even USB.
> diff --git a/Documentation/i2c/busses/index.rst b/Documentation/i2c/busse=
s/index.rst
> new file mode 100644
> index 000000000000..97ca4d510816
> --- /dev/null
> +++ b/Documentation/i2c/busses/index.rst
> @@ -0,0 +1,33 @@
> +. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C Bus Drivers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> diff --git a/Documentation/i2c/busses/scx200_acb b/Documentation/i2c/buss=
es/scx200_acb.rst
> similarity index 86%
> rename from Documentation/i2c/busses/scx200_acb
> rename to Documentation/i2c/busses/scx200_acb.rst
> index ce83c871fe95..8dc7c352508c 100644
> --- a/Documentation/i2c/busses/scx200_acb
> +++ b/Documentation/i2c/busses/scx200_acb.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver scx200_acb
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Author: Christer Weinigel <wingel@nano-system.com>
> =20
> @@ -25,8 +27,11 @@ Device-specific notes
> =20
>  The SC1100 WRAP boards are known to use base addresses 0x810 and 0x820.
>  If the scx200_acb driver is built into the kernel, add the following
> -parameter to your boot command line:
> +parameter to your boot command line::
> +
>    scx200_acb.base=3D0x810,0x820
> +
>  If the scx200_acb driver is built as a module, add the following line to
> -a configuration file in /etc/modprobe.d/ instead:
> +a configuration file in /etc/modprobe.d/ instead::
> +
>    options scx200_acb base=3D0x810,0x820
> diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-inte=
rface.rst
> similarity index 71%
> rename from Documentation/i2c/dev-interface
> rename to Documentation/i2c/dev-interface.rst
> index fbed645ccd75..69c23a3c2b1b 100644
> --- a/Documentation/i2c/dev-interface
> +++ b/Documentation/i2c/dev-interface.rst
> @@ -1,3 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C Device Interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  Usually, i2c devices are controlled by a kernel driver. But it is also
>  possible to access all devices on an adapter from userspace, through
>  the /dev interface. You need to load module i2c-dev for this.
> @@ -18,7 +22,7 @@ C example
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  So let's say you want to access an i2c adapter from a C program.
> -First, you need to include these two headers:
> +First, you need to include these two headers::
> =20
>    #include <linux/i2c-dev.h>
>    #include <i2c/smbus.h>
> @@ -28,7 +32,7 @@ inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to de=
cide this.
>  Adapter numbers are assigned somewhat dynamically, so you can not
>  assume much about them. They can even change from one boot to the next.
> =20
> -Next thing, open the device file, as follows:
> +Next thing, open the device file, as follows::
> =20
>    int file;
>    int adapter_nr =3D 2; /* probably dynamically determined */
> @@ -42,7 +46,7 @@ Next thing, open the device file, as follows:
>    }
> =20
>  When you have opened the device, you must specify with what device
> -address you want to communicate:
> +address you want to communicate::
> =20
>    int addr =3D 0x40; /* The I2C address */
> =20
> @@ -53,7 +57,7 @@ address you want to communicate:
> =20
>  Well, you are all set up now. You can now use SMBus commands or plain
>  I2C to communicate with your device. SMBus commands are preferred if
> -the device supports them. Both are illustrated below.
> +the device supports them. Both are illustrated below::
> =20
>    __u8 reg =3D 0x10; /* Device register to access */
>    __s32 res;
> @@ -100,35 +104,35 @@ Full interface description
> =20
>  The following IOCTLs are defined:
> =20
> -ioctl(file, I2C_SLAVE, long addr)
> +``ioctl(file, I2C_SLAVE, long addr)``
>    Change slave address. The address is passed in the 7 lower bits of the
>    argument (except for 10 bit addresses, passed in the 10 lower bits in =
this
>    case).
> =20
> -ioctl(file, I2C_TENBIT, long select)
> +``ioctl(file, I2C_TENBIT, long select)``
>    Selects ten bit addresses if select not equals 0, selects normal 7 bit
>    addresses if select equals 0. Default 0.  This request is only valid
>    if the adapter has I2C_FUNC_10BIT_ADDR.
> =20
> -ioctl(file, I2C_PEC, long select)
> +``ioctl(file, I2C_PEC, long select)``
>    Selects SMBus PEC (packet error checking) generation and verification
>    if select not equals 0, disables if select equals 0. Default 0.
>    Used only for SMBus transactions.  This request only has an effect if =
the
>    the adapter has I2C_FUNC_SMBUS_PEC; it is still safe if not, it just
>    doesn't have any effect.
> =20
> -ioctl(file, I2C_FUNCS, unsigned long *funcs)
> -  Gets the adapter functionality and puts it in *funcs.
> +``ioctl(file, I2C_FUNCS, unsigned long *funcs)``
> +  Gets the adapter functionality and puts it in ``*funcs``.
> =20
> -ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)
> +``ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)``
>    Do combined read/write transaction without stop in between.
>    Only valid if the adapter has I2C_FUNC_I2C.  The argument is
> -  a pointer to a
> +  a pointer to a::
> =20
> -  struct i2c_rdwr_ioctl_data {
> +    struct i2c_rdwr_ioctl_data {
>        struct i2c_msg *msgs;  /* ptr to array of simple messages */
>        int nmsgs;             /* number of messages to exchange */
> -  }
> +    }
> =20
>    The msgs[] themselves contain further pointers into data buffers.
>    The function will write or read data to or from that buffers depending
> @@ -136,8 +140,8 @@ ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msg=
set)
>    The slave address and whether to use ten bit address mode has to be
>    set in each message, overriding the values set with the above ioctl's.
> =20
> -ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)
> -  If possible, use the provided i2c_smbus_* methods described below inst=
ead
> +``ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)``
> +  If possible, use the provided ``i2c_smbus_*`` methods described below =
instead
>    of issuing direct ioctls.
> =20
>  You can do plain i2c transactions by using read(2) and write(2) calls.
> @@ -145,7 +149,8 @@ You do not need to pass the address byte; instead, se=
t it through
>  ioctl I2C_SLAVE before you try to access the device.
> =20
>  You can do SMBus level transactions (see documentation file smbus-protoc=
ol
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
> =20
> -1* Your program opens /dev/i2c-N and calls ioctl() on it, as described in
> -section "C example" above.
> +1) Your program opens /dev/i2c-N and calls ioctl() on it, as described in
> +   section "C example" above.
> =20
> -2* These open() and ioctl() calls are handled by the i2c-dev kernel
> -driver: see i2c-dev.c:i2cdev_open() and i2c-dev.c:i2cdev_ioctl(),
> -respectively. You can think of i2c-dev as a generic I2C chip driver
> -that can be programmed from user-space.
> +2) These open() and ioctl() calls are handled by the i2c-dev kernel
> +   driver: see i2c-dev.c:i2cdev_open() and i2c-dev.c:i2cdev_ioctl(),
> +   respectively. You can think of i2c-dev as a generic I2C chip driver
> +   that can be programmed from user-space.
> =20
> -3* Some ioctl() calls are for administrative tasks and are handled by
> -i2c-dev directly. Examples include I2C_SLAVE (set the address of the
> -device you want to access) and I2C_PEC (enable or disable SMBus error
> -checking on future transactions.)
> +3) Some ioctl() calls are for administrative tasks and are handled by
> +   i2c-dev directly. Examples include I2C_SLAVE (set the address of the
> +   device you want to access) and I2C_PEC (enable or disable SMBus error
> +   checking on future transactions.)
> =20
> -4* Other ioctl() calls are converted to in-kernel function calls by
> -i2c-dev. Examples include I2C_FUNCS, which queries the I2C adapter
> -functionality using i2c.h:i2c_get_functionality(), and I2C_SMBUS, which
> -performs an SMBus transaction using i2c-core-smbus.c:i2c_smbus_xfer().
> +4) Other ioctl() calls are converted to in-kernel function calls by
> +   i2c-dev. Examples include I2C_FUNCS, which queries the I2C adapter
> +   functionality using i2c.h:i2c_get_functionality(), and I2C_SMBUS, whi=
ch
> +   performs an SMBus transaction using i2c-core-smbus.c:i2c_smbus_xfer().
> =20
> -The i2c-dev driver is responsible for checking all the parameters that
> -come from user-space for validity. After this point, there is no
> -difference between these calls that came from user-space through i2c-dev
> -and calls that would have been performed by kernel I2C chip drivers
> -directly. This means that I2C bus drivers don't need to implement
> -anything special to support access from user-space.
> +   The i2c-dev driver is responsible for checking all the parameters that
> +   come from user-space for validity. After this point, there is no
> +   difference between these calls that came from user-space through i2c-=
dev
> +   and calls that would have been performed by kernel I2C chip drivers
> +   directly. This means that I2C bus drivers don't need to implement
> +   anything special to support access from user-space.
> =20
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
> =20
>  After your I2C bus driver has processed these requests, execution runs
>  up the call chain, with almost no processing done, except by i2c-dev to
> diff --git a/Documentation/i2c/DMA-considerations b/Documentation/i2c/dma=
-considerations.rst
> similarity index 100%
> rename from Documentation/i2c/DMA-considerations
> rename to Documentation/i2c/dma-considerations.rst
> diff --git a/Documentation/i2c/fault-codes b/Documentation/i2c/fault-code=
s.rst
> similarity index 98%
> rename from Documentation/i2c/fault-codes
> rename to Documentation/i2c/fault-codes.rst
> index 0cee0fc545b4..a09797588849 100644
> --- a/Documentation/i2c/fault-codes
> +++ b/Documentation/i2c/fault-codes.rst
> @@ -1,3 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C/SMBUS Fault Codes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  This is a summary of the most important conventions for use of fault
>  codes in the I2C/SMBus stack.
> =20
> diff --git a/Documentation/i2c/functionality b/Documentation/i2c/function=
ality.rst
> similarity index 91%
> rename from Documentation/i2c/functionality
> rename to Documentation/i2c/functionality.rst
> index 4aae8ed15873..7528c1ffd6ca 100644
> --- a/Documentation/i2c/functionality
> +++ b/Documentation/i2c/functionality.rst
> @@ -1,3 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C/SMBus Functionality
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  INTRODUCTION
>  ------------
> =20
> @@ -14,6 +18,7 @@ FUNCTIONALITY CONSTANTS
>  For the most up-to-date list of functionality constants, please check
>  <uapi/linux/i2c.h>!
> =20
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>    I2C_FUNC_I2C                    Plain i2c-level commands (Pure SMBus
>                                    adapters typically can not do these)
>    I2C_FUNC_10BIT_ADDR             Handles the 10-bit address extensions
> @@ -33,9 +38,11 @@ For the most up-to-date list of functionality constant=
s, please check
>    I2C_FUNC_SMBUS_WRITE_BLOCK_DATA Handles the SMBus write_block_data com=
mand
>    I2C_FUNC_SMBUS_READ_I2C_BLOCK   Handles the SMBus read_i2c_block_data =
command
>    I2C_FUNC_SMBUS_WRITE_I2C_BLOCK  Handles the SMBus write_i2c_block_data=
 command
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =20
>  A few combinations of the above flags are also defined for your convenie=
nce:
> =20
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    I2C_FUNC_SMBUS_BYTE             Handles the SMBus read_byte
>                                    and write_byte commands
>    I2C_FUNC_SMBUS_BYTE_DATA        Handles the SMBus read_byte_data
> @@ -49,6 +56,7 @@ A few combinations of the above flags are also defined =
for your convenience:
>    I2C_FUNC_SMBUS_EMUL             Handles all SMBus commands that can be
>                                    emulated by a real I2C adapter (using
>                                    the transparent emulation layer)
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  In kernel versions prior to 3.5 I2C_FUNC_NOSTART was implemented as
>  part of I2C_FUNC_PROTOCOL_MANGLING.
> @@ -58,11 +66,11 @@ ADAPTER IMPLEMENTATION
>  ----------------------
> =20
>  When you write a new adapter driver, you will have to implement a
> -function callback `functionality'. Typical implementations are given
> +function callback ``functionality``. Typical implementations are given
>  below.
> =20
>  A typical SMBus-only adapter would list all the SMBus transactions it
> -supports. This example comes from the i2c-piix4 driver:
> +supports. This example comes from the i2c-piix4 driver::
> =20
>    static u32 piix4_func(struct i2c_adapter *adapter)
>    {
> @@ -72,7 +80,7 @@ supports. This example comes from the i2c-piix4 driver:
>    }
> =20
>  A typical full-I2C adapter would use the following (from the i2c-pxa
> -driver):
> +driver)::
> =20
>    static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
>    {
> @@ -94,7 +102,7 @@ CLIENT CHECKING
>  Before a client tries to attach to an adapter, or even do tests to check
>  whether one of the devices it supports is present on an adapter, it shou=
ld
>  check whether the needed functionality is present. The typical way to do
> -this is (from the lm75 driver):
> +this is (from the lm75 driver)::
> =20
>    static int lm75_detect(...)
>    {
> @@ -129,7 +137,7 @@ If you try to access an adapter from a userspace prog=
ram, you will have
>  to use the /dev interface. You will still have to check whether the
>  functionality you need is supported, of course. This is done using
>  the I2C_FUNCS ioctl. An example, adapted from the i2cdetect program, is
> -below:
> +below::
> =20
>    int file;
>    if (file =3D open("/dev/i2c-0", O_RDWR) < 0) {
> diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/g=
pio-fault-injection.rst
> similarity index 97%
> rename from Documentation/i2c/gpio-fault-injection
> rename to Documentation/i2c/gpio-fault-injection.rst
> index c87f416d53dd..9dca6ec7d266 100644
> --- a/Documentation/i2c/gpio-fault-injection
> +++ b/Documentation/i2c/gpio-fault-injection.rst
> @@ -104,10 +104,10 @@ There doesn't need to be a device at this address b=
ecause arbitration lost
>  should be detected beforehand. Also note, that SCL going down is monitor=
ed
>  using interrupts, so the interrupt latency might cause the first bits to=
 be not
>  corrupted. A good starting point for using this fault injector on an oth=
erwise
> -idle bus is:
> +idle bus is::
> =20
> -# echo 200 > lose_arbitration &
> -# i2cget -y <bus_to_test> 0x3f
> +  # echo 200 > lose_arbitration &
> +  # i2cget -y <bus_to_test> 0x3f
> =20
>  Panic during transfer
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -127,10 +127,10 @@ The calling process will then sleep and wait for th=
e next bus clock. The
>  process is interruptible, though.
> =20
>  Start of a transfer is detected by waiting for SCL going down by the mas=
ter
> -under test.  A good starting point for using this fault injector is:
> +under test.  A good starting point for using this fault injector is::
> =20
> -# echo 0 > inject_panic &
> -# i2cget -y <bus_to_test> <some_address>
> +  # echo 0 > inject_panic &
> +  # i2cget -y <bus_to_test> <some_address>
> =20
>  Note that there doesn't need to be a device listening to the address you=
 are
>  using. Results may vary depending on that, though.
> diff --git a/Documentation/i2c/i2c-protocol b/Documentation/i2c/i2c-proto=
col.rst
> similarity index 83%
> rename from Documentation/i2c/i2c-protocol
> rename to Documentation/i2c/i2c-protocol.rst
> index ff6d6cee6c7e..2f8fcf671b2e 100644
> --- a/Documentation/i2c/i2c-protocol
> +++ b/Documentation/i2c/i2c-protocol.rst
> @@ -1,8 +1,13 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C Protocol
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  This document describes the i2c protocol. Or will, when it is finished :=
-)
> =20
>  Key to symbols
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  S     (1 bit) : Start bit
>  P     (1 bit) : Stop bit
>  Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
> @@ -15,33 +20,35 @@ Data  (8 bits): A plain data byte. Sometimes, I write=
 DataLow, DataHigh
>                  for 16 bit data.
>  Count (8 bits): A data byte containing the length of a block operation.
> =20
> -[..]: Data sent by I2C device, as opposed to data sent by the host adapt=
er.
> +[..]:           Data sent by I2C device, as opposed to data sent by the
> +                host adapter.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =20
> =20
>  Simple send transaction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -This corresponds to i2c_master_send.
> +This corresponds to i2c_master_send::
> =20
>    S Addr Wr [A] Data [A] Data [A] ... [A] Data [A] P
> =20
> =20
>  Simple receive transaction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =20
> -This corresponds to i2c_master_recv
> +This corresponds to i2c_master_recv::
> =20
>    S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
> =20
> =20
>  Combined transactions
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This corresponds to i2c_transfer
> =20
>  They are just like the above transactions, but instead of a stop bit P
>  a start bit S is sent and the transaction continues. An example of
> -a byte read, followed by a byte write:
> +a byte read, followed by a byte write::
> =20
>    S Addr Rd [A] [Data] NA S Addr Wr [A] Data [A] P
> =20
> @@ -65,8 +72,10 @@ I2C_M_NO_RD_ACK:
>  I2C_M_NOSTART:
>      In a combined transaction, no 'S Addr Wr/Rd [A]' is generated at some
>      point. For example, setting I2C_M_NOSTART on the second partial mess=
age
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
> =20
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
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +i2c-stub
> +=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -DESCRIPTION:
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This module is a very simple fake I2C/SMBus driver.  It implements six
>  types of SMBus commands: write quick, (r/w) byte, (r/w) byte data, (r/w)
> @@ -28,6 +31,7 @@ SMBus block operations. Writes can be partial. Block re=
ad commands always
>  return the number of bytes selected with the largest write so far.
> =20
>  The typical use-case is like this:
> +
>  	1. load this module
>  	2. use i2cset (from the i2c-tools project) to pre-load some data
>  	3. load the target chip driver module
> @@ -36,7 +40,8 @@ The typical use-case is like this:
>  There's a script named i2c-stub-from-dump in the i2c-tools package which
>  can load register values automatically from a chip dump.
> =20
> -PARAMETERS:
> +Parameters
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  int chip_addr[10]:
>  	The SMBus addresses to emulate chips at.
> @@ -47,14 +52,12 @@ unsigned long functionality:
>  	value 0x1f0000 would only enable the quick, byte and byte data
>  	commands.
> =20
> -u8 bank_reg[10]
> -u8 bank_mask[10]
> -u8 bank_start[10]
> -u8 bank_end[10]:
> +u8 bank_reg[10], u8 bank_mask[10], u8 bank_start[10], u8 bank_end[10]:
>  	Optional bank settings. They tell which bits in which register
>  	select the active bank, as well as the range of banked registers.
> =20
> -CAVEATS:
> +Caveats
> +=3D=3D=3D=3D=3D=3D=3D
> =20
>  If your target driver polls some byte or word waiting for it to change, =
the
>  stub could lock it up.  Use i2cset to unlock it.
> diff --git a/Documentation/i2c/i2c-topology b/Documentation/i2c/i2c-topol=
ogy.rst
> similarity index 89%
> rename from Documentation/i2c/i2c-topology
> rename to Documentation/i2c/i2c-topology.rst
> index f74d78b53d4d..0c1ae95f6a97 100644
> --- a/Documentation/i2c/i2c-topology
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  I2C topology
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -14,6 +15,7 @@ than a straight-forward i2c bus with one adapter and on=
e or more devices.
>     that has to be operated before the device can be accessed.
> =20
>  Etc
> +=3D=3D=3D
> =20
>  These constructs are represented as i2c adapter trees by Linux, where
>  each adapter has a parent adapter (except the root adapter) and zero or
> @@ -37,7 +39,9 @@ mux-locked or parent-locked muxes. As is evident from b=
elow, it can be
>  useful to know if a mux is mux-locked or if it is parent-locked. The
>  following list was correct at the time of writing:
> =20
> -In drivers/i2c/muxes/
> +In drivers/i2c/muxes/:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  i2c-arb-gpio-challenge    Parent-locked
>  i2c-mux-gpio              Normally parent-locked, mux-locked iff
>                            all involved gpio pins are controlled by the
> @@ -52,18 +56,25 @@ i2c-mux-pinctrl           Normally parent-locked, mux=
-locked iff
>                            all involved pinctrl devices are controlled
>                            by the same i2c root adapter that they mux.
>  i2c-mux-reg               Parent-locked
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -In drivers/iio/
> +In drivers/iio/:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  gyro/mpu3050              Mux-locked
>  imu/inv_mpu6050/          Mux-locked
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -In drivers/media/
> +In drivers/media/:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  dvb-frontends/lgdt3306a   Mux-locked
>  dvb-frontends/m88ds3103   Parent-locked
>  dvb-frontends/rtl2830     Parent-locked
>  dvb-frontends/rtl2832     Mux-locked
>  dvb-frontends/si2168      Mux-locked
>  usb/cx231xx/              Parent-locked
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
>  Mux-locked muxes
> @@ -78,6 +89,7 @@ full transaction, unrelated i2c transfers may interleav=
e the different
>  stages of the transaction. This has the benefit that the mux driver
>  may be easier and cleaner to implement, but it has some caveats.
> =20
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  ML1. If you build a topology with a mux-locked mux being the parent
>       of a parent-locked mux, this might break the expectation from the
>       parent-locked mux that the root adapter is locked during the
> @@ -105,11 +117,15 @@ ML4. If any non-i2c operation in the mux driver cha=
nges the i2c mux state,
>       Otherwise garbage may appear on the bus as seen from devices
>       behind the mux, when an unrelated i2c transfer is in flight during
>       the non-i2c mux-changing operation.
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
>  Mux-locked Example
>  ------------------
> =20
> +
> +::
> +
>                     .----------.     .--------.
>      .--------.     |   mux-   |-----| dev D1 |
>      |  root  |--+--|  locked  |     '--------'
> @@ -148,6 +164,7 @@ adapter during the transaction are unlocked i2c trans=
fers (using e.g.
>  __i2c_transfer), or a deadlock will follow. There are a couple of
>  caveats.
> =20
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  PL1. If you build a topology with a parent-locked mux being the child
>       of another mux, this might break a possible assumption from the
>       child mux that the root adapter is unused between its select op
> @@ -161,11 +178,14 @@ PL2. If select/deselect calls out to other subsyste=
ms such as gpio,
>       caused by these subsystems are unlocked. This can be convoluted to
>       accomplish, maybe even impossible if an acceptably clean solution
>       is sought.
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
>  Parent-locked Example
>  ---------------------
> =20
> +::
> +
>                     .----------.     .--------.
>      .--------.     |  parent- |-----| dev D1 |
>      |  root  |--+--|  locked  |     '--------'
> @@ -177,20 +197,20 @@ Parent-locked Example
> =20
>  When there is an access to D1, this happens:
> =20
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
> =20
> =20
>  This means that accesses to both D2 and D3 are locked out for the full
> @@ -203,7 +223,7 @@ Complex Examples
>  Parent-locked mux as parent of parent-locked mux
>  ------------------------------------------------
> =20
> -This is a useful topology, but it can be bad.
> +This is a useful topology, but it can be bad::
> =20
>                     .----------.     .----------.     .--------.
>      .--------.     |  parent- |-----|  parent- |-----| dev D1 |
> @@ -227,7 +247,7 @@ through and be seen by the M2 adapter, thus closing M=
2 prematurely.
>  Mux-locked mux as parent of mux-locked mux
>  ------------------------------------------
> =20
> -This is a good topology.
> +This is a good topology::
> =20
>                     .----------.     .----------.     .--------.
>      .--------.     |   mux-   |-----|   mux-   |-----| dev D1 |
> @@ -248,7 +268,7 @@ are still possibly interleaved.
>  Mux-locked mux as parent of parent-locked mux
>  ---------------------------------------------
> =20
> -This is probably a bad topology.
> +This is probably a bad topology::
> =20
>                     .----------.     .----------.     .--------.
>      .--------.     |   mux-   |-----|  parent- |-----| dev D1 |
> @@ -282,7 +302,7 @@ auto-closing, the topology is fine.
>  Parent-locked mux as parent of mux-locked mux
>  ---------------------------------------------
> =20
> -This is a good topology.
> +This is a good topology::
> =20
>                     .----------.     .----------.     .--------.
>      .--------.     |  parent- |-----|   mux-   |-----| dev D1 |
> @@ -306,7 +326,7 @@ adapter is locked directly.
>  Two mux-locked sibling muxes
>  ----------------------------
> =20
> -This is a good topology.
> +This is a good topology::
> =20
>                                      .--------.
>                     .----------.  .--| dev D1 |
> @@ -330,7 +350,7 @@ accesses to D5 may be interleaved at any time.
>  Two parent-locked sibling muxes
>  -------------------------------
> =20
> -This is a good topology.
> +This is a good topology::
> =20
>                                      .--------.
>                     .----------.  .--| dev D1 |
> @@ -354,7 +374,7 @@ out.
>  Mux-locked and parent-locked sibling muxes
>  ------------------------------------------
> =20
> -This is a good topology.
> +This is a good topology::
> =20
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
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C/SMBus Subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> +
> diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/=
instantiating-devices.rst
> similarity index 93%
> rename from Documentation/i2c/instantiating-devices
> rename to Documentation/i2c/instantiating-devices.rst
> index 345e9ea8281a..1238f1fa3382 100644
> --- a/Documentation/i2c/instantiating-devices
> +++ b/Documentation/i2c/instantiating-devices.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>  How to instantiate I2C devices
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =20
> @@ -17,9 +18,9 @@ which is known in advance. It is thus possible to pre-d=
eclare the I2C
>  devices which live on this bus. This is done with an array of struct
>  i2c_board_info which is registered by calling i2c_register_board_info().
> =20
> -Example (from omap2 h4):
> +Example (from omap2 h4)::
> =20
> -static struct i2c_board_info h4_i2c_board_info[] __initdata =3D {
> +  static struct i2c_board_info h4_i2c_board_info[] __initdata =3D {
>  	{
>  		I2C_BOARD_INFO("isp1301_omap", 0x2d),
>  		.irq		=3D OMAP_GPIO_IRQ(125),
> @@ -32,15 +33,15 @@ static struct i2c_board_info h4_i2c_board_info[] __in=
itdata =3D {
>  		I2C_BOARD_INFO("24c01", 0x57),
>  		.platform_data	=3D &m24c01,
>  	},
> -};
> +  };
> =20
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
> =20
>  The above code declares 3 devices on I2C bus 1, including their respecti=
ve
>  addresses and custom data needed by their drivers. When the I2C bus in
> @@ -57,7 +58,7 @@ Method 1b: Declare the I2C devices via devicetree
>  This method has the same implications as method 1a. The declaration of I=
2C
>  devices is here done via devicetree as subnodes of the master controller.
> =20
> -Example:
> +Example::
> =20
>  	i2c1: i2c@400a0000 {
>  		/* ... master properties skipped ... */
> @@ -99,20 +100,20 @@ bus in advance, so the method 1 described above can'=
t be used. Instead,
>  you can instantiate your I2C devices explicitly. This is done by filling
>  a struct i2c_board_info and calling i2c_new_device().
> =20
> -Example (from the sfe4001 network driver):
> +Example (from the sfe4001 network driver)::
> =20
> -static struct i2c_board_info sfe4001_hwmon_info =3D {
> +  static struct i2c_board_info sfe4001_hwmon_info =3D {
>  	I2C_BOARD_INFO("max6647", 0x4e),
> -};
> +  };
> =20
> -int sfe4001_init(struct efx_nic *efx)
> -{
> +  int sfe4001_init(struct efx_nic *efx)
> +  {
>  	(...)
>  	efx->board_info.hwmon_client =3D
>  		i2c_new_device(&efx->i2c_adap, &sfe4001_hwmon_info);
> =20
>  	(...)
> -}
> +  }
> =20
>  The above code instantiates 1 I2C device on the I2C bus which is on the
>  network adapter in question.
> @@ -124,12 +125,12 @@ it may have different addresses from one board to t=
he next (manufacturer
>  changing its design without notice). In this case, you can call
>  i2c_new_probed_device() instead of i2c_new_device().
> =20
> -Example (from the nxp OHCI driver):
> +Example (from the nxp OHCI driver)::
> =20
> -static const unsigned short normal_i2c[] =3D { 0x2c, 0x2d, I2C_CLIENT_EN=
D };
> +  static const unsigned short normal_i2c[] =3D { 0x2c, 0x2d, I2C_CLIENT_=
END };
> =20
> -static int usb_hcd_nxp_probe(struct platform_device *pdev)
> -{
> +  static int usb_hcd_nxp_probe(struct platform_device *pdev)
> +  {
>  	(...)
>  	struct i2c_adapter *i2c_adap;
>  	struct i2c_board_info i2c_info;
> @@ -142,7 +143,7 @@ static int usb_hcd_nxp_probe(struct platform_device *=
pdev)
>  						   normal_i2c, NULL);
>  	i2c_put_adapter(i2c_adap);
>  	(...)
> -}
> +  }
> =20
>  The above code instantiates up to 1 I2C device on the I2C bus which is on
>  the OHCI adapter in question. It first tries at address 0x2c, if nothing
> @@ -172,6 +173,7 @@ explicitly. Instead, i2c-core will probe for such dev=
ices as soon as their
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
>  * Probing is only one way to instantiate I2C devices now, while it was t=
he
>    only way back then. Where possible, methods 1 and 2 should be preferre=
d.
>    Method 3 should only be used when there is no other way, as it can have
> @@ -224,11 +227,13 @@ device. As no two devices can live at the same addr=
ess on a given I2C
>  segment, the address is sufficient to uniquely identify the device to be
>  deleted.
> =20
> -Example:
> -# echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
> +Example::
> +
> +  # echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
> =20
>  While this interface should only be used when in-kernel device declarati=
on
>  can't be done, there is a variety of cases where it can be helpful:
> +
>  * The I2C driver usually detects devices (method 3 above) but the bus
>    segment your device lives on doesn't have the proper class bit set and
>    thus detection doesn't trigger.
> diff --git a/Documentation/i2c/muxes/i2c-mux-gpio b/Documentation/i2c/mux=
es/i2c-mux-gpio.rst
> similarity index 85%
> rename from Documentation/i2c/muxes/i2c-mux-gpio
> rename to Documentation/i2c/muxes/i2c-mux-gpio.rst
> index 893ecdfe6e43..7d27444035c3 100644
> --- a/Documentation/i2c/muxes/i2c-mux-gpio
> +++ b/Documentation/i2c/muxes/i2c-mux-gpio.rst
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Kernel driver i2c-mux-gpio
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =20
>  Author: Peter Korsgaard <peter.korsgaard@barco.com>
> =20
> @@ -8,7 +10,7 @@ Description
>  i2c-mux-gpio is an i2c mux driver providing access to I2C bus segments
>  from a master I2C bus and a hardware MUX controlled through GPIO pins.
> =20
> -E.G.:
> +E.G.::
> =20
>    ----------              ----------  Bus segment 1   - - - - -
>   |          | SCL/SDA    |          |-------------- |           |
> @@ -33,20 +35,20 @@ bus, the number of bus segments to create and the GPI=
O pins used
>  to control it. See include/linux/platform_data/i2c-mux-gpio.h for detail=
s.
> =20
>  E.G. something like this for a MUX providing 4 bus segments
> -controlled through 3 GPIO pins:
> +controlled through 3 GPIO pins::
> =20
> -#include <linux/platform_data/i2c-mux-gpio.h>
> -#include <linux/platform_device.h>
> +  #include <linux/platform_data/i2c-mux-gpio.h>
> +  #include <linux/platform_device.h>
> =20
> -static const unsigned myboard_gpiomux_gpios[] =3D {
> +  static const unsigned myboard_gpiomux_gpios[] =3D {
>  	AT91_PIN_PC26, AT91_PIN_PC25, AT91_PIN_PC24
> -};
> +  };
> =20
> -static const unsigned myboard_gpiomux_values[] =3D {
> +  static const unsigned myboard_gpiomux_values[] =3D {
>  	0, 1, 2, 3
> -};
> +  };
> =20
> -static struct i2c_mux_gpio_platform_data myboard_i2cmux_data =3D {
> +  static struct i2c_mux_gpio_platform_data myboard_i2cmux_data =3D {
>  	.parent		=3D 1,
>  	.base_nr	=3D 2, /* optional */
>  	.values		=3D myboard_gpiomux_values,
> @@ -54,15 +56,15 @@ static struct i2c_mux_gpio_platform_data myboard_i2cm=
ux_data =3D {
>  	.gpios		=3D myboard_gpiomux_gpios,
>  	.n_gpios	=3D ARRAY_SIZE(myboard_gpiomux_gpios),
>  	.idle		=3D 4, /* optional */
> -};
> +  };
> =20
> -static struct platform_device myboard_i2cmux =3D {
> +  static struct platform_device myboard_i2cmux =3D {
>  	.name		=3D "i2c-mux-gpio",
>  	.id		=3D 0,
>  	.dev		=3D {
>  		.platform_data	=3D &myboard_i2cmux_data,
>  	},
> -};
> +  };
> =20
>  If you don't know the absolute GPIO pin numbers at registration time,
>  you can instead provide a chip name (.chip_name) and relative GPIO pin
> diff --git a/Documentation/i2c/old-module-parameters b/Documentation/i2c/=
old-module-parameters.rst
> similarity index 75%
> rename from Documentation/i2c/old-module-parameters
> rename to Documentation/i2c/old-module-parameters.rst
> index 8e2b629d533c..a1939512ad66 100644
> --- a/Documentation/i2c/old-module-parameters
> +++ b/Documentation/i2c/old-module-parameters.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  I2C device driver binding control from user-space
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -19,23 +20,27 @@ Below is a mapping from the old module parameters to =
the new interface.
>  Attaching a driver to an I2C device
>  -----------------------------------
> =20
> -Old method (module parameters):
> -# modprobe <driver> probe=3D1,0x2d
> -# modprobe <driver> force=3D1,0x2d
> -# modprobe <driver> force_<device>=3D1,0x2d
> +Old method (module parameters)::
> =20
> -New method (sysfs interface):
> -# echo <device> 0x2d > /sys/bus/i2c/devices/i2c-1/new_device
> +  # modprobe <driver> probe=3D1,0x2d
> +  # modprobe <driver> force=3D1,0x2d
> +  # modprobe <driver> force_<device>=3D1,0x2d
> +
> +New method (sysfs interface)::
> +
> +  # echo <device> 0x2d > /sys/bus/i2c/devices/i2c-1/new_device
> =20
>  Preventing a driver from attaching to an I2C device
>  ---------------------------------------------------
> =20
> -Old method (module parameters):
> -# modprobe <driver> ignore=3D1,0x2f
> +Old method (module parameters)::
> =20
> -New method (sysfs interface):
> -# echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
> -# modprobe <driver>
> +  # modprobe <driver> ignore=3D1,0x2f
> +
> +New method (sysfs interface)::
> +
> +  # echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
> +  # modprobe <driver>
> =20
>  Of course, it is important to instantiate the "dummy" device before load=
ing
>  the driver. The dummy device will be handled by i2c-core itself, prevent=
ing
> diff --git a/Documentation/i2c/slave-eeprom-backend b/Documentation/i2c/s=
lave-eeprom-backend.rst
> similarity index 90%
> rename from Documentation/i2c/slave-eeprom-backend
> rename to Documentation/i2c/slave-eeprom-backend.rst
> index 04f8d8a9b817..2018fa74c6f3 100644
> --- a/Documentation/i2c/slave-eeprom-backend
> +++ b/Documentation/i2c/slave-eeprom-backend.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>  Linux I2C slave eeprom backend
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =20
> @@ -5,7 +6,7 @@ by Wolfram Sang <wsa@sang-engineering.com> in 2014-15
> =20
>  This is a proof-of-concept backend which acts like an EEPROM on the conn=
ected
>  I2C bus. The memory contents can be modified from userspace via this file
> -located in sysfs:
> +located in sysfs::
> =20
>  	/sys/bus/i2c/devices/<device-directory>/slave-eeprom
> =20
> diff --git a/Documentation/i2c/slave-interface b/Documentation/i2c/slave-=
interface.rst
> similarity index 94%
> rename from Documentation/i2c/slave-interface
> rename to Documentation/i2c/slave-interface.rst
> index 7e2a228f21bc..9ac5f110a4ec 100644
> --- a/Documentation/i2c/slave-interface
> +++ b/Documentation/i2c/slave-interface.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Linux I2C slave interface description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -12,7 +13,7 @@ EEPROM, the Linux I2C slave can access the content via =
sysfs and handle data as
>  needed. The backend driver and the I2C bus driver communicate via events=
. Here
>  is a small graph visualizing the data flow and the means by which data is
>  transported. The dotted line marks only one example. The backend could a=
lso
> -use a character device, be in-kernel only, or something completely diffe=
rent:
> +use a character device, be in-kernel only, or something completely diffe=
rent::
> =20
> =20
>                e.g. sysfs        I2C slave events        I/O registers
> @@ -35,7 +36,7 @@ them as described in the document 'instantiating-device=
s'. The only difference
>  is that i2c slave backends have their own address space. So, you have to=
 add
>  0x1000 to the address you would originally request. An example for
>  instantiating the slave-eeprom driver from userspace at the 7 bit addres=
s 0x64
> -on bus 1:
> +on bus 1::
> =20
>    # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new_device
> =20
> @@ -54,7 +55,7 @@ drivers and writing backends will be given.
>  I2C slave events
>  ----------------
> =20
> -The bus driver sends an event to the backend using the following functio=
n:
> +The bus driver sends an event to the backend using the following functio=
n::
> =20
>  	ret =3D i2c_slave_event(client, event, &val)
> =20
> @@ -69,8 +70,9 @@ Event types:
> =20
>  * I2C_SLAVE_WRITE_REQUESTED (mandatory)
> =20
> -'val': unused
> -'ret': always 0
> +  'val': unused
> +
> +  'ret': always 0
> =20
>  Another I2C master wants to write data to us. This event should be sent =
once
>  our own address and the write bit was detected. The data did not arrive =
yet, so
> @@ -79,8 +81,9 @@ to be done, though.
> =20
>  * I2C_SLAVE_READ_REQUESTED (mandatory)
> =20
> -'val': backend returns first byte to be sent
> -'ret': always 0
> +  'val': backend returns first byte to be sent
> +
> +  'ret': always 0
> =20
>  Another I2C master wants to read data from us. This event should be sent=
 once
>  our own address and the read bit was detected. After returning, the bus =
driver
> @@ -88,8 +91,9 @@ should transmit the first byte.
> =20
>  * I2C_SLAVE_WRITE_RECEIVED (mandatory)
> =20
> -'val': bus driver delivers received byte
> -'ret': 0 if the byte should be acked, some errno if the byte should be n=
acked
> +  'val': bus driver delivers received byte
> +
> +  'ret': 0 if the byte should be acked, some errno if the byte should be=
 nacked
> =20
>  Another I2C master has sent a byte to us which needs to be set in 'val'.=
 If 'ret'
>  is zero, the bus driver should ack this byte. If 'ret' is an errno, then=
 the byte
> @@ -97,8 +101,9 @@ should be nacked.
> =20
>  * I2C_SLAVE_READ_PROCESSED (mandatory)
> =20
> -'val': backend returns next byte to be sent
> -'ret': always 0
> +  'val': backend returns next byte to be sent
> +
> +  'ret': always 0
> =20
>  The bus driver requests the next byte to be sent to another I2C master in
>  'val'. Important: This does not mean that the previous byte has been ack=
ed, it
> @@ -111,8 +116,9 @@ your backend, though.
> =20
>  * I2C_SLAVE_STOP (mandatory)
> =20
> -'val': unused
> -'ret': always 0
> +  'val': unused
> +
> +  'ret': always 0
> =20
>  A stop condition was received. This can happen anytime and the backend s=
hould
>  reset its state machine for I2C transfers to be able to receive new requ=
ests.
> diff --git a/Documentation/i2c/smbus-protocol b/Documentation/i2c/smbus-p=
rotocol.rst
> similarity index 84%
> rename from Documentation/i2c/smbus-protocol
> rename to Documentation/i2c/smbus-protocol.rst
> index 092d474f5843..c6f189bfe1c7 100644
> --- a/Documentation/i2c/smbus-protocol
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  SMBus Protocol Summary
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -27,12 +28,13 @@ Each transaction type corresponds to a functionality =
flag. Before calling a
>  transaction function, a device driver should always check (just once) for
>  the corresponding functionality flag to ensure that the underlying I2C
>  adapter supports the transaction in question. See
> -<file:Documentation/i2c/functionality> for the details.
> +<file:Documentation/i2c/functionality.rst> for the details.
> =20
> =20
>  Key to symbols
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  S     (1 bit) : Start bit
>  P     (1 bit) : Stop bit
>  Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
> @@ -45,15 +47,17 @@ Data  (8 bits): A plain data byte. Sometimes, I write=
 DataLow, DataHigh
>                  for 16 bit data.
>  Count (8 bits): A data byte containing the length of a block operation.
> =20
> -[..]: Data sent by I2C device, as opposed to data sent by the host adapt=
er.
> +[..]:           Data sent by I2C device, as opposed to data sent by the =
host
> +                adapter.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =20
> =20
>  SMBus Quick Command
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -This sends a single bit to the device, at the place of the Rd/Wr bit.
> +This sends a single bit to the device, at the place of the Rd/Wr bit::
> =20
> -A Addr Rd/Wr [A] P
> +  A Addr Rd/Wr [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_QUICK
> =20
> @@ -64,9 +68,9 @@ SMBus Receive Byte:  i2c_smbus_read_byte()
>  This reads a single byte from a device, without specifying a device
>  register. Some devices are so simple that this interface is enough; for
>  others, it is a shorthand if you want to read the same register as in
> -the previous SMBus command.
> +the previous SMBus command::
> =20
> -S Addr Rd [A] [Data] NA P
> +  S Addr Rd [A] [Data] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_READ_BYTE
> =20
> @@ -77,7 +81,9 @@ SMBus Send Byte:  i2c_smbus_write_byte()
>  This operation is the reverse of Receive Byte: it sends a single byte
>  to a device.  See Receive Byte for more information.
> =20
> -S Addr Wr [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Data [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BYTE
> =20
> @@ -86,9 +92,9 @@ SMBus Read Byte:  i2c_smbus_read_byte_data()
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This reads a single byte from a device, from a designated register.
> -The register is specified through the Comm byte.
> +The register is specified through the Comm byte::
> =20
> -S Addr Wr [A] Comm [A] S Addr Rd [A] [Data] NA P
> +  S Addr Wr [A] Comm [A] S Addr Rd [A] [Data] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_READ_BYTE_DATA
> =20
> @@ -98,9 +104,9 @@ SMBus Read Word:  i2c_smbus_read_word_data()
> =20
>  This operation is very like Read Byte; again, data is read from a
>  device, from a designated register that is specified through the Comm
> -byte. But this time, the data is a complete word (16 bits).
> +byte. But this time, the data is a complete word (16 bits)::
> =20
> -S Addr Wr [A] Comm [A] S Addr Rd [A] [DataLow] A [DataHigh] NA P
> +  S Addr Wr [A] Comm [A] S Addr Rd [A] [DataLow] A [DataHigh] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
> =20
> @@ -116,7 +122,9 @@ This writes a single byte to a device, to a designate=
d register. The
>  register is specified through the Comm byte. This is the opposite of
>  the Read Byte operation.
> =20
> -S Addr Wr [A] Comm [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Data [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BYTE_DATA
> =20
> @@ -126,9 +134,9 @@ SMBus Write Word:  i2c_smbus_write_word_data()
> =20
>  This is the opposite of the Read Word operation. 16 bits
>  of data is written to a device, to the designated register that is
> -specified through the Comm byte.=20
> +specified through the Comm byte.::
> =20
> -S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
> +  S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_WORD_DATA
> =20
> @@ -141,10 +149,10 @@ SMBus Process Call:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This command selects a device register (through the Comm byte), sends
> -16 bits of data to it, and reads 16 bits of data in return.
> +16 bits of data to it, and reads 16 bits of data in return::
> =20
> -S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A]=20
> -                             S Addr Rd [A] [DataLow] A [DataHigh] NA P
> +  S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A]
> +                               S Addr Rd [A] [DataLow] A [DataHigh] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_PROC_CALL
> =20
> @@ -156,8 +164,10 @@ This command reads a block of up to 32 bytes from a =
device, from a
>  designated register that is specified through the Comm byte. The amount
>  of data is specified by the device in the Count byte.
> =20
> -S Addr Wr [A] Comm [A]=20
> -           S Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
> +::
> +
> +  S Addr Wr [A] Comm [A]
> +             S Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_READ_BLOCK_DATA
> =20
> @@ -169,7 +179,9 @@ The opposite of the Block Read command, this writes u=
p to 32 bytes to
>  a device, to a designated register that is specified through the
>  Comm byte. The amount of data is specified in the Count byte.
> =20
> -S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_BLOCK_DATA
> =20
> @@ -181,10 +193,10 @@ SMBus Block Write - Block Read Process Call was int=
roduced in
>  Revision 2.0 of the specification.
> =20
>  This command selects a device register (through the Comm byte), sends
> -1 to 31 bytes of data to it, and reads 1 to 31 bytes of data in return.
> +1 to 31 bytes of data to it, and reads 1 to 31 bytes of data in return::
> =20
> -S Addr Wr [A] Comm [A] Count [A] Data [A] ...
> -                             S Addr Rd [A] [Count] A [Data] ... A P
> +  S Addr Wr [A] Comm [A] Count [A] Data [A] ...
> +                               S Addr Rd [A] [Count] A [Data] ... A P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_BLOCK_PROC_CALL
> =20
> @@ -197,9 +209,12 @@ SMBus host acting as a slave.
>  It is the same form as Write Word, with the command code replaced by the
>  alerting device's address.
> =20
> -[S] [HostAddr] [Wr] A [DevAddr] A [DataLow] A [DataHigh] A [P]
> +::
> +
> +  [S] [HostAddr] [Wr] A [DevAddr] A [DataLow] A [DataHigh] A [P]
> =20
>  This is implemented in the following way in the Linux kernel:
> +
>  * I2C bus drivers which support SMBus Host Notify should report
>    I2C_FUNC_SMBUS_HOST_NOTIFY.
>  * I2C bus drivers trigger SMBus Host Notify by a call to
> @@ -241,6 +256,7 @@ single interrupt pin on the SMBus master, while still=
 allowing the master
>  to know which slave triggered the interrupt.
> =20
>  This is implemented the following way in the Linux kernel:
> +
>  * I2C bus drivers which support SMBus alert should call
>    i2c_setup_smbus_alert() to setup SMBus alert support.
>  * I2C drivers for devices which can trigger SMBus alerts should implement
> @@ -262,10 +278,10 @@ I2C Block Read:  i2c_smbus_read_i2c_block_data()
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This command reads a block of bytes from a device, from a=20
> -designated register that is specified through the Comm byte.
> +designated register that is specified through the Comm byte::
> =20
> -S Addr Wr [A] Comm [A]=20
> -           S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
> +  S Addr Wr [A] Comm [A]
> +             S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_READ_I2C_BLOCK
> =20
> @@ -278,6 +294,8 @@ a device, to a designated register that is specified =
through the
>  Comm byte. Note that command lengths of 0, 2, or more bytes are
>  supported as they are indistinguishable from data.
> =20
> -S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P
> +::
> +
> +  S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P
> =20
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_I2C_BLOCK
> diff --git a/Documentation/i2c/summary b/Documentation/i2c/summary.rst
> similarity index 96%
> rename from Documentation/i2c/summary
> rename to Documentation/i2c/summary.rst
> index 809541ab352f..8c08fa727f4e 100644
> --- a/Documentation/i2c/summary
> +++ b/Documentation/i2c/summary.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  I2C and SMBus
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -24,7 +25,8 @@ implement all the common SMBus protocol semantics or me=
ssages.
>  Terminology
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -When we talk about I2C, we use the following terms:
> +When we talk about I2C, we use the following terms::
> +
>    Bus    -> Algorithm
>              Adapter
>    Device -> Driver
> diff --git a/Documentation/i2c/ten-bit-addresses b/Documentation/i2c/ten-=
bit-addresses.rst
> similarity index 95%
> rename from Documentation/i2c/ten-bit-addresses
> rename to Documentation/i2c/ten-bit-addresses.rst
> index 7b2d11e53a49..5c765aff16d5 100644
> --- a/Documentation/i2c/ten-bit-addresses
> +++ b/Documentation/i2c/ten-bit-addresses.rst
> @@ -1,3 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I2C Ten-bit Addresses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  The I2C protocol knows about two kinds of device addresses: normal 7 bit
>  addresses, and an extended set of 10 bit addresses. The sets of addresses
>  do not intersect: the 7 bit address 0x10 is not the same as the 10 bit
> @@ -12,6 +16,7 @@ See the I2C specification for the details.
> =20
>  The current 10 bit address support is minimal. It should work, however
>  you can expect some problems along the way:
> +
>  * Not all bus drivers support 10-bit addresses. Some don't because the
>    hardware doesn't support them (SMBus doesn't require 10-bit address
>    support for example), some don't because nobody bothered adding the
> diff --git a/Documentation/i2c/upgrading-clients b/Documentation/i2c/upgr=
ading-clients.rst
> similarity index 56%
> rename from Documentation/i2c/upgrading-clients
> rename to Documentation/i2c/upgrading-clients.rst
> index 96392cc5b5c7..4a575e607ff8 100644
> --- a/Documentation/i2c/upgrading-clients
> +++ b/Documentation/i2c/upgrading-clients.rst
> @@ -1,3 +1,4 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Upgrading I2C Drivers to the new 2.6 Driver Model
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -13,21 +14,22 @@ the old to the new new binding methods.
>  Example old-style driver
>  ------------------------
> =20
> +::
> =20
> -struct example_state {
> +  struct example_state {
>  	struct i2c_client	client;
>  	....
> -};
> +  };
> =20
> -static struct i2c_driver example_driver;
> +  static struct i2c_driver example_driver;
> =20
> -static unsigned short ignore[] =3D { I2C_CLIENT_END };
> -static unsigned short normal_addr[] =3D { OUR_ADDR, I2C_CLIENT_END };
> +  static unsigned short ignore[] =3D { I2C_CLIENT_END };
> +  static unsigned short normal_addr[] =3D { OUR_ADDR, I2C_CLIENT_END };
> =20
> -I2C_CLIENT_INSMOD;
> +  I2C_CLIENT_INSMOD;
> =20
> -static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> -{
> +  static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> +  {
>  	struct example_state *state;
>  	struct device *dev =3D &adap->dev;  /* to use for dev_ reports */
>  	int ret;
> @@ -59,23 +61,23 @@ static int example_attach(struct i2c_adapter *adap, i=
nt addr, int kind)
>  	dev_info(dev, "example client created\n");
> =20
>  	return 0;
> -}
> +  }
> =20
> -static int example_detach(struct i2c_client *client)
> -{
> +  static int example_detach(struct i2c_client *client)
> +  {
>  	struct example_state *state =3D i2c_get_clientdata(client);
> =20
>  	i2c_detach_client(client);
>  	kfree(state);
>  	return 0;
> -}
> +  }
> =20
> -static int example_attach_adapter(struct i2c_adapter *adap)
> -{
> +  static int example_attach_adapter(struct i2c_adapter *adap)
> +  {
>  	return i2c_probe(adap, &addr_data, example_attach);
> -}
> +  }
> =20
> -static struct i2c_driver example_driver =3D {
> +  static struct i2c_driver example_driver =3D {
>   	.driver		=3D {
>  		.owner		=3D THIS_MODULE,
>  		.name		=3D "example",
> @@ -83,7 +85,7 @@ static struct i2c_driver example_driver =3D {
>  	},
>  	.attach_adapter =3D example_attach_adapter,
>  	.detach_client	=3D example_detach,
> -};
> +  };
> =20
> =20
>  Updating the client
> @@ -93,38 +95,38 @@ The new style binding model will check against a list=
 of supported
>  devices and their associated address supplied by the code registering
>  the busses. This means that the driver .attach_adapter and
>  .detach_client methods can be removed, along with the addr_data,
> -as follows:
> +as follows::
> =20
> -- static struct i2c_driver example_driver;
> +  - static struct i2c_driver example_driver;
> =20
> -- static unsigned short ignore[] =3D { I2C_CLIENT_END };
> -- static unsigned short normal_addr[] =3D { OUR_ADDR, I2C_CLIENT_END };
> +  - static unsigned short ignore[] =3D { I2C_CLIENT_END };
> +  - static unsigned short normal_addr[] =3D { OUR_ADDR, I2C_CLIENT_END };
> =20
> -- I2C_CLIENT_INSMOD;
> +  - I2C_CLIENT_INSMOD;
> =20
> -- static int example_attach_adapter(struct i2c_adapter *adap)
> -- {
> -- 	return i2c_probe(adap, &addr_data, example_attach);
> -- }
> +  - static int example_attach_adapter(struct i2c_adapter *adap)
> +  - {
> +  - 	return i2c_probe(adap, &addr_data, example_attach);
> +  - }
> =20
> - static struct i2c_driver example_driver =3D {
> --	.attach_adapter =3D example_attach_adapter,
> --	.detach_client	=3D example_detach,
> - }
> +    static struct i2c_driver example_driver =3D {
> +  -	.attach_adapter =3D example_attach_adapter,
> +  -	.detach_client	=3D example_detach,
> +    }
> =20
> -Add the probe and remove methods to the i2c_driver, as so:
> +Add the probe and remove methods to the i2c_driver, as so::
> =20
> - static struct i2c_driver example_driver =3D {
> -+	.probe		=3D example_probe,
> -+	.remove		=3D example_remove,
> - }
> +   static struct i2c_driver example_driver =3D {
> +  +	.probe		=3D example_probe,
> +  +	.remove		=3D example_remove,
> +   }
> =20
>  Change the example_attach method to accept the new parameters
> -which include the i2c_client that it will be working with:
> +which include the i2c_client that it will be working with::
> =20
> -- static int example_attach(struct i2c_adapter *adap, int addr, int kind)
> -+ static int example_probe(struct i2c_client *client,
> -+			   const struct i2c_device_id *id)
> +  - static int example_attach(struct i2c_adapter *adap, int addr, int ki=
nd)
> +  + static int example_probe(struct i2c_client *client,
> +  +			   const struct i2c_device_id *id)
> =20
>  Change the name of example_attach to example_probe to align it with the
>  i2c_driver entry names. The rest of the probe routine will now need to be
> @@ -132,55 +134,57 @@ changed as the i2c_client has already been setup fo=
r use.
> =20
>  The necessary client fields have already been setup before
>  the probe function is called, so the following client setup
> -can be removed:
> +can be removed::
> =20
> --	example->client.addr    =3D addr;
> --	example->client.flags   =3D 0;
> --	example->client.adapter =3D adap;
> --
> --	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_client.=
name));
> +  -	example->client.addr    =3D addr;
> +  -	example->client.flags   =3D 0;
> +  -	example->client.adapter =3D adap;
> +  -
> +  -	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_clien=
t.name));
> =20
> -The i2c_set_clientdata is now:
> +The i2c_set_clientdata is now::
> =20
> --	i2c_set_clientdata(&state->client, state);
> -+	i2c_set_clientdata(client, state);
> +  -	i2c_set_clientdata(&state->client, state);
> +  +	i2c_set_clientdata(client, state);
> =20
>  The call to i2c_attach_client is no longer needed, if the probe
>  routine exits successfully, then the driver will be automatically
> -attached by the core. Change the probe routine as so:
> +attached by the core. Change the probe routine as so::
> =20
> --	ret =3D i2c_attach_client(&state->i2c_client);
> --	if (ret < 0) {
> --		dev_err(dev, "failed to attach client\n");
> --		kfree(state);
> --		return ret;
> --	}
> +  -	ret =3D i2c_attach_client(&state->i2c_client);
> +  -	if (ret < 0) {
> +  -		dev_err(dev, "failed to attach client\n");
> +  -		kfree(state);
> +  -		return ret;
> +  -	}
> =20
> =20
>  Remove the storage of 'struct i2c_client' from the 'struct example_state'
>  as we are provided with the i2c_client in our example_probe. Instead we
>  store a pointer to it for when it is needed.
> =20
> -struct example_state {
> --	struct i2c_client	client;
> -+	struct i2c_client	*client;
> +::
> =20
> -the new i2c client as so:
> +  struct example_state {
> +  -	struct i2c_client	client;
> +  +	struct i2c_client	*client;
> =20
> --	struct device *dev =3D &adap->dev;  /* to use for dev_ reports */
> -+ 	struct device *dev =3D &i2c_client->dev;  /* to use for dev_ reports =
*/
> +the new i2c client as so::
> +
> +  -	struct device *dev =3D &adap->dev;  /* to use for dev_ reports */
> +  + 	struct device *dev =3D &i2c_client->dev;  /* to use for dev_ report=
s */
> =20
>  And remove the change after our client is attached, as the driver no
> -longer needs to register a new client structure with the core:
> +longer needs to register a new client structure with the core::
> =20
> --	dev =3D &state->i2c_client.dev;
> +  -	dev =3D &state->i2c_client.dev;
> =20
>  In the probe routine, ensure that the new state has the client stored
> -in it:
> +in it::
> =20
> -static int example_probe(struct i2c_client *i2c_client,
> +  static int example_probe(struct i2c_client *i2c_client,
>  			 const struct i2c_device_id *id)
> -{
> +  {
>  	struct example_state *state;
>   	struct device *dev =3D &i2c_client->dev;
>  	int ret;
> @@ -191,48 +195,50 @@ static int example_probe(struct i2c_client *i2c_cli=
ent,
>  		return -ENOMEM;
>  	}
> =20
> -+	state->client =3D i2c_client;
> +  +	state->client =3D i2c_client;
> =20
>  Update the detach method, by changing the name to _remove and
>  to delete the i2c_detach_client call. It is possible that you
>  can also remove the ret variable as it is not needed for any
>  of the core functions.
> =20
> -- static int example_detach(struct i2c_client *client)
> -+ static int example_remove(struct i2c_client *client)
> -{
> +::
> +
> +  - static int example_detach(struct i2c_client *client)
> +  + static int example_remove(struct i2c_client *client)
> +  {
>  	struct example_state *state =3D i2c_get_clientdata(client);
> =20
> --	i2c_detach_client(client);
> +  -	i2c_detach_client(client);
> =20
>  And finally ensure that we have the correct ID table for the i2c-core
> -and other utilities:
> +and other utilities::
> =20
> -+ struct i2c_device_id example_idtable[] =3D {
> -+       { "example", 0 },
> -+       { }
> -+};
> -+
> -+MODULE_DEVICE_TABLE(i2c, example_idtable);
> +  + struct i2c_device_id example_idtable[] =3D {
> +  +       { "example", 0 },
> +  +       { }
> +  +};
> +  +
> +  +MODULE_DEVICE_TABLE(i2c, example_idtable);
> =20
> -static struct i2c_driver example_driver =3D {
> +  static struct i2c_driver example_driver =3D {
>   	.driver		=3D {
>  		.owner		=3D THIS_MODULE,
>  		.name		=3D "example",
>  	},
> -+	.id_table	=3D example_ids,
> +  +	.id_table	=3D example_ids,
> =20
> =20
> -Our driver should now look like this:
> +Our driver should now look like this::
> =20
> -struct example_state {
> +  struct example_state {
>  	struct i2c_client	*client;
>  	....
> -};
> +  };
> =20
> -static int example_probe(struct i2c_client *client,
> +  static int example_probe(struct i2c_client *client,
>  		     	 const struct i2c_device_id *id)
> -{
> +  {
>  	struct example_state *state;
>  	struct device *dev =3D &client->dev;
> =20
> @@ -250,24 +256,24 @@ static int example_probe(struct i2c_client *client,
>  	dev_info(dev, "example client created\n");
> =20
>  	return 0;
> -}
> +  }
> =20
> -static int example_remove(struct i2c_client *client)
> -{
> +  static int example_remove(struct i2c_client *client)
> +  {
>  	struct example_state *state =3D i2c_get_clientdata(client);
> =20
>  	kfree(state);
>  	return 0;
> -}
> +  }
> =20
> -static struct i2c_device_id example_idtable[] =3D {
> +  static struct i2c_device_id example_idtable[] =3D {
>  	{ "example", 0 },
>  	{ }
> -};
> +  };
> =20
> -MODULE_DEVICE_TABLE(i2c, example_idtable);
> +  MODULE_DEVICE_TABLE(i2c, example_idtable);
> =20
> -static struct i2c_driver example_driver =3D {
> +  static struct i2c_driver example_driver =3D {
>   	.driver		=3D {
>  		.owner		=3D THIS_MODULE,
>  		.name		=3D "example",
> @@ -276,4 +282,4 @@ static struct i2c_driver example_driver =3D {
>  	.id_table	=3D example_idtable,
>  	.probe		=3D example_probe,
>  	.remove		=3D example_remove,
> -};
> +  };
> diff --git a/Documentation/i2c/writing-clients b/Documentation/i2c/writin=
g-clients.rst
> similarity index 91%
> rename from Documentation/i2c/writing-clients
> rename to Documentation/i2c/writing-clients.rst
> index a755b141fa4a..dddf0a14ab7c 100644
> --- a/Documentation/i2c/writing-clients
> +++ b/Documentation/i2c/writing-clients.rst
> @@ -1,3 +1,7 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Writing I2C Clients
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  This is a small guide for those who want to write kernel drivers for I2C
>  or SMBus devices, using Linux as the protocol host/master (not slave).
> =20
> @@ -12,7 +16,7 @@ General remarks
>  Try to keep the kernel namespace as clean as possible. The best way to
>  do this is to use a unique prefix for all global symbols. This is
>  especially important for exported symbols, but it is a good idea to do
> -it for non-exported symbols too. We will use the prefix `foo_' in this
> +it for non-exported symbols too. We will use the prefix ``foo_`` in this
>  tutorial.
> =20
> =20
> @@ -25,15 +29,17 @@ routines, and should be zero-initialized except for f=
ields with data you
>  provide.  A client structure holds device-specific information like the
>  driver model device node, and its I2C address.
> =20
> -static struct i2c_device_id foo_idtable[] =3D {
> +::
> +
> +  static struct i2c_device_id foo_idtable[] =3D {
>  	{ "foo", my_id_for_foo },
>  	{ "bar", my_id_for_bar },
>  	{ }
> -};
> +  };
> =20
> -MODULE_DEVICE_TABLE(i2c, foo_idtable);
> +  MODULE_DEVICE_TABLE(i2c, foo_idtable);
> =20
> -static struct i2c_driver foo_driver =3D {
> +  static struct i2c_driver foo_driver =3D {
>  	.driver =3D {
>  		.name	=3D "foo",
>  		.pm	=3D &foo_pm_ops,	/* optional */
> @@ -49,7 +55,7 @@ static struct i2c_driver foo_driver =3D {
> =20
>  	.shutdown	=3D foo_shutdown,	/* optional */
>  	.command	=3D foo_command,	/* optional, deprecated */
> -}
> +  }
> =20
>  The name field is the driver name, and must not contain spaces.  It
>  should match the module name (if the driver can be compiled as a module),
> @@ -64,16 +70,18 @@ below.
>  Extra client data
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Each client structure has a special `data' field that can point to any
> +Each client structure has a special ``data`` field that can point to any
>  structure at all.  You should use this to keep device-specific data.
> =20
> +::
> +
>  	/* store the value */
>  	void i2c_set_clientdata(struct i2c_client *client, void *data);
> =20
>  	/* retrieve the value */
>  	void *i2c_get_clientdata(const struct i2c_client *client);
> =20
> -Note that starting with kernel 2.6.34, you don't have to set the `data' =
field
> +Note that starting with kernel 2.6.34, you don't have to set the ``data`=
` field
>  to NULL in remove() or if probe() failed anymore. The i2c-core does this
>  automatically on these occasions. Those are also the only times the core=
 will
>  touch this field.
> @@ -92,25 +100,25 @@ but many chips have some kind of register-value idea=
 that can easily
>  be encapsulated.
> =20
>  The below functions are simple examples, and should not be copied
> -literally.
> +literally::
> =20
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
> =20
> -int foo_write_value(struct i2c_client *client, u8 reg, u16 value)
> -{
> +  int foo_write_value(struct i2c_client *client, u8 reg, u16 value)
> +  {
>  	if (reg =3D=3D 0x10)	/* Impossible to write - driver error! */
>  		return -EINVAL;
>  	else if (reg < 0x10)	/* byte-sized register */
>  		return i2c_smbus_write_byte_data(client, reg, value);
>  	else			/* word-sized register */
>  		return i2c_smbus_write_word_data(client, reg, value);
> -}
> +  }
> =20
> =20
>  Probing and attaching
> @@ -145,6 +153,8 @@ I2C device drivers using this binding model work just=
 like any other
>  kind of driver in Linux:  they provide a probe() method to bind to
>  those devices, and a remove() method to unbind.
> =20
> +::
> +
>  	static int foo_probe(struct i2c_client *client,
>  			     const struct i2c_device_id *id);
>  	static int foo_remove(struct i2c_client *client);
> @@ -240,37 +250,41 @@ When the kernel is booted, or when your foo driver =
module is inserted,
>  you have to do some initializing. Fortunately, just registering the
>  driver module is usually enough.
> =20
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
> =20
> -static void __exit foo_cleanup(void)
> -{
> +  static void __exit foo_cleanup(void)
> +  {
>  	i2c_del_driver(&foo_driver);
> -}
> -module_exit(foo_cleanup);
> +  }
> +  module_exit(foo_cleanup);
> =20
> -The module_i2c_driver() macro can be used to reduce above code.
> +  The module_i2c_driver() macro can be used to reduce above code.
> =20
> -module_i2c_driver(foo_driver);
> +  module_i2c_driver(foo_driver);
> =20
> -Note that some functions are marked by `__init'.  These functions can
> +Note that some functions are marked by ``__init``.  These functions can
>  be removed after kernel booting (or module loading) is completed.
> -Likewise, functions marked by `__exit' are dropped by the compiler when
> +Likewise, functions marked by ``__exit`` are dropped by the compiler when
>  the code is built into the kernel, as they would never be called.
> =20
> =20
>  Driver Information
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -/* Substitute your own name and email address */
> -MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>"
> -MODULE_DESCRIPTION("Driver for Barf Inc. Foo I2C devices");
> +::
> =20
> -/* a few non-GPL license types are also allowed */
> -MODULE_LICENSE("GPL");
> +  /* Substitute your own name and email address */
> +  MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>"
> +  MODULE_DESCRIPTION("Driver for Barf Inc. Foo I2C devices");
> +
> +  /* a few non-GPL license types are also allowed */
> +  MODULE_LICENSE("GPL");
> =20
> =20
>  Power Management
> @@ -323,6 +337,8 @@ commands, but only some of them understand plain I2C!
>  Plain I2C communication
>  -----------------------
> =20
> +::
> +
>  	int i2c_master_send(struct i2c_client *client, const char *buf,
>  			    int count);
>  	int i2c_master_recv(struct i2c_client *client, char *buf, int count);
> @@ -334,6 +350,8 @@ to read/write (must be less than the length of the bu=
ffer, also should be
>  less than 64k since msg.len is u16.) Returned is the actual number of by=
tes
>  read/written.
> =20
> +::
> +
>  	int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msg,
>  			 int num);
> =20
> @@ -343,13 +361,15 @@ stop bit is sent between transaction. The i2c_msg s=
tructure contains
>  for each message the client address, the number of bytes of the message
>  and the message data itself.
> =20
> -You can read the file `i2c-protocol' for more information about the
> +You can read the file ``i2c-protocol`` for more information about the
>  actual I2C protocol.
> =20
> =20
>  SMBus communication
>  -------------------
> =20
> +::
> +
>  	s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  			   unsigned short flags, char read_write, u8 command,
>  			   int size, union i2c_smbus_data *data);
> @@ -357,6 +377,8 @@ SMBus communication
>  This is the generic SMBus function. All functions below are implemented
>  in terms of it. Never use this function directly!
> =20
> +::
> +
>  	s32 i2c_smbus_read_byte(struct i2c_client *client);
>  	s32 i2c_smbus_write_byte(struct i2c_client *client, u8 value);
>  	s32 i2c_smbus_read_byte_data(struct i2c_client *client, u8 command);
> @@ -376,7 +398,7 @@ in terms of it. Never use this function directly!
>  					   const u8 *values);
> =20
>  These ones were removed from i2c-core because they had no users, but cou=
ld
> -be added back later if needed:
> +be added back later if needed::
> =20
>  	s32 i2c_smbus_write_quick(struct i2c_client *client, u8 value);
>  	s32 i2c_smbus_process_call(struct i2c_client *client,
> @@ -389,7 +411,7 @@ transactions return 0 on success; the 'read' transact=
ions return the read
>  value, except for block transactions, which return the number of values
>  read. The block buffers need not be longer than 32 bytes.
> =20
> -You can read the file `smbus-protocol' for more information about the
> +You can read the file ``smbus-protocol`` for more information about the
>  actual SMBus protocol.
> =20
> =20
> @@ -397,7 +419,7 @@ General purpose routines
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Below all general purpose routines are listed, that were not mentioned
> -before.
> +before::
> =20
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
> diff --git a/Documentation/spi/spi-sc18is602 b/Documentation/spi/spi-sc18=
is602
> index a45702865a38..0feffd5af411 100644
> --- a/Documentation/spi/spi-sc18is602
> +++ b/Documentation/spi/spi-sc18is602
> @@ -17,7 +17,7 @@ kernel's SPI core subsystem.
> =20
>  The driver does not probe for supported chips, since the SI18IS602/603 d=
oes not
>  support Chip ID registers. You will have to instantiate the devices expl=
icitly.
> -Please see Documentation/i2c/instantiating-devices for details.
> +Please see Documentation/i2c/instantiating-devices.rst for details.
> =20
> =20
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
> =20
>  ALLEGRO DVT VIDEO IP CORE DRIVER
> @@ -6657,7 +6657,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Supported
>  F:	drivers/i2c/muxes/i2c-mux-gpio.c
>  F:	include/linux/platform_data/i2c-mux-gpio.h
> -F:	Documentation/i2c/muxes/i2c-mux-gpio
> +F:	Documentation/i2c/muxes/i2c-mux-gpio.rst
> =20
>  GENERIC HDLC (WAN) DRIVERS
>  M:	Krzysztof Halasa <khc@pm.waw.pl>
> @@ -7393,14 +7393,14 @@ I2C CONTROLLER DRIVER FOR NVIDIA GPU
>  M:	Ajay Gupta <ajayg@nvidia.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-nvidia-gpu
> +F:	Documentation/i2c/busses/i2c-nvidia-gpu.rst
>  F:	drivers/i2c/busses/i2c-nvidia-gpu.c
> =20
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
> =20
> @@ -7455,7 +7455,7 @@ I2C-TAOS-EVM DRIVER
>  M:	Jean Delvare <jdelvare@suse.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/i2c/busses/i2c-taos-evm
> +F:	Documentation/i2c/busses/i2c-taos-evm.rst
>  F:	drivers/i2c/busses/i2c-taos-evm.c
> =20
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
> =20
>  I2C/SMBUS STUB DRIVER
>  M:	Jean Delvare <jdelvare@suse.com>
> @@ -10236,7 +10236,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Supported
>  F:	drivers/i2c/busses/i2c-mlxcpld.c
>  F:	drivers/i2c/muxes/i2c-mux-mlxcpld.c
> -F:	Documentation/i2c/busses/i2c-mlxcpld
> +F:	Documentation/i2c/busses/i2c-mlxcpld.rst
> =20
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
> =20
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
>   Documentation/ide/{ide-tape.txt =3D> ide-tape.rst}   |   23 +-
>   Documentation/ide/{ide.txt =3D> ide.rst}             |  147 +-
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
> =20
>  #include <linux/kernel.h>
> diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
> index d8c91c2cb8cf..9ae0dc28b9cf 100644
> --- a/drivers/hwmon/smm665.c
> +++ b/drivers/hwmon/smm665.c
> @@ -197,7 +197,7 @@ static int smm665_read_adc(struct smm665_data *data, =
int adc)
>  	if (rv !=3D -ENXIO) {
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
> =20
>  	  This support is also available as a module.  If so, the module=20
>  	  will be called i2c-dev.
> @@ -107,7 +107,7 @@ config I2C_STUB
>  	  especially for certain kinds of sensor chips.
> =20
>  	  If you do build this module, be sure to read the notes and warnings
> -	  in <file:Documentation/i2c/i2c-stub>.
> +	  in <file:Documentation/i2c/i2c-stub.rst>.
> =20
>  	  If you don't know what to do here, definitely say N.
> =20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 68b677be1fa4..e4be46644e8b 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1205,7 +1205,7 @@ config I2C_PARPORT
>  	  and makes it easier to add support for new devices.
> =20
>  	  An adapter type parameter is now mandatory.  Please read the file
> -	  Documentation/i2c/busses/i2c-parport for details.
> +	  Documentation/i2c/busses/i2c-parport.rst for details.
> =20
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
> =20
>  #include <linux/interrupt.h>
> diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-t=
aos-evm.c
> index c82e78f57386..37347c93e8e0 100644
> --- a/drivers/i2c/busses/i2c-taos-evm.c
> +++ b/drivers/i2c/busses/i2c-taos-evm.c
> @@ -125,7 +125,7 @@ static int taos_smbus_xfer(struct i2c_adapter *adapte=
r, u16 addr,
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
> @@ -2205,7 +2205,7 @@ static int i2c_detect_address(struct i2c_client *te=
mp_client,
>  			dev_warn(&adapter->dev,
>  				"This adapter will soon drop class based instantiation of devices. "
>  				"Please make sure client 0x%02x gets instantiated by other means. "
> -				"Check 'Documentation/i2c/instantiating-devices' for details.\n",
> +				"Check 'Documentation/i2c/instantiating-devices.rst' for details.\n",
>  				info.addr);
> =20
>  		dev_dbg(&adapter->dev, "Creating %s at 0x%02x\n",
> @@ -2235,7 +2235,7 @@ static int i2c_detect(struct i2c_adapter *adapter, =
struct i2c_driver *driver)
>  	if (adapter->class =3D=3D I2C_CLASS_DEPRECATED) {
>  		dev_dbg(&adapter->dev,
>  			"This adapter dropped support for I2C classes and won't auto-detect %=
s devices anymore. "
> -			"If you need it, check 'Documentation/i2c/instantiating-devices' for =
alternatives.\n",
> +			"If you need it, check 'Documentation/i2c/instantiating-devices.rst' =
for alternatives.\n",
>  			driver->driver.name);
>  		return 0;
>  	}
> diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio=
_simple_dummy.c
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
>   * It would be more efficient to use i2c msgs/i2c_transfer directly but,=
 as
> - * recommened in .../Documentation/i2c/writing-clients section
> + * recommened in .../Documentation/i2c/writing-clients.rst section
>   * "Sending and receiving", using SMBus level communication is preferred.
>   */
> =20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fa5552c2307b..c0a78c069117 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -521,7 +521,7 @@ i2c_register_board_info(int busnum, struct i2c_board_=
info const *info,
>   *
>   * The return codes from the @master_xfer{_atomic} fields should indicat=
e the
>   * type of error code that occurred during the transfer, as documented i=
n the
> - * Kernel Documentation file Documentation/i2c/fault-codes.
> + * Kernel Documentation file Documentation/i2c/fault-codes.rst.
>   */
>  struct i2c_algorithm {
>  	/*

