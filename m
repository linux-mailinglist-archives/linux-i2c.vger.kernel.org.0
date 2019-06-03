Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2111D33A1B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 23:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfFCVsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 17:48:22 -0400
Received: from sauhun.de ([88.99.104.3]:40958 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfFCVsW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 17:48:22 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id DD4AA2CF690;
        Mon,  3 Jun 2019 23:08:44 +0200 (CEST)
Date:   Mon, 3 Jun 2019 23:08:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Khalil Blaiech <kblaiech@mellanox.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Woods <dwoods@mellanox.com>, linux-i2c@vger.kernel.org,
        arm-soc <arm@kernel.org>, Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>
Subject: Re: [PATCH v5 1/2] i2c: i2c-mlx: I2C SMBus driver for Mellanox
 BlueField SoC
Message-ID: <20190603210844.GA3795@kunai>
References: <cover.1553887255.git.kblaiech@mellanox.com>
 <a544f56367316bd13ba015b879a5efaf1f18d19f.1553887256.git.kblaiech@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <a544f56367316bd13ba015b879a5efaf1f18d19f.1553887256.git.kblaiech@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Khalil,

I am sorry for the long wait. An illness made a mess out of my schedule.

On Fri, Mar 29, 2019 at 03:40:28PM -0400, Khalil Blaiech wrote:
> Added BlueField I2C driver to offer master and slave support for
> Mellanox BlueField SoCs.  The driver implements an SMBus adapter
> and interfaces to multiple busses that can be probed using both
> ACPI and Device Tree infrastructures.
>=20
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>

Are you or one of the authors willing to maintain this driver? Then, a
MAINTAINERS entry would be great.

Please run 'checkpatch --strict' on this patch. I think the extra checks
make all sense here.

My code checkers say this, please check:

    CPPCHECK
drivers/i2c/busses/i2c-mlx.c:474:17: warning: 'io' is of type 'void *'. Whe=
n using void pointers in calculations, the behaviour is undefined. [arithOp=
erationsOnVoidPointer]
 writel(val, io + reg);
                ^
drivers/i2c/busses/i2c-mlx.c:479:18: warning: 'io' is of type 'void *'. Whe=
n using void pointers in calculations, the behaviour is undefined. [arithOp=
erationsOnVoidPointer]
 return readl(io + reg);
                 ^
drivers/i2c/busses/i2c-mlx.c:667:19: warning: Shifting signed 32-bit value =
by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
 command |=3D 0x1   << MASTER_LOCK_BIT_OFF;
                  ^
drivers/i2c/busses/i2c-mlx.c:1975:26: warning: Shifting signed 32-bit value=
 by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
 control32 |=3D 0          << SLAVE_LOCK_BIT_OFF;
                         ^

  CC      drivers/i2c/busses/i2c-mlx.o
drivers/i2c/busses/i2c-mlx.c: In function =E2=80=98mlx_slave_enable=E2=80=
=99:
drivers/i2c/busses/i2c-mlx.c:1582:7: warning: variable =E2=80=98exist=E2=80=
=99 set but not used [-Wunused-but-set-variable]

> ---
>  drivers/i2c/busses/Kconfig   |   13 +
>  drivers/i2c/busses/Makefile  |    1 +
>  drivers/i2c/busses/i2c-mlx.c | 2513 ++++++++++++++++++++++++++++++++++++=
++++++

This driver is huge and I am willing to assist with the I2C parts.
However, there are some generic Kernel coding issues which I'd like to
be sorted out first. I am adding two more people from Mellanox who are
active in the I2C world, maybe they can help out here. No offence, yet I
have to delegate such things to focus on I2C parts because my spare time
is very limited.

> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + *  Mellanox i2c bus driver
> + *
> + *  Copyright (C) 2019 Mellanox Technologies, Ltd.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License v2.0 as publish=
ed
> + *  by the Free Software Foundation.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.

You can skip this, you have a SPDX identifier already. It doesn't match
with the MODULE_LICENSE at the end, though!

> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/string.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/acpi.h>
> +#include <linux/mutex.h>
> +
> +#define MLX_I2C_DRIVER_NAME        "i2c-mlx"

This is unused.

> +#define MLX_I2C_DRIVER_VERSION     "1.0"

We don't use this anymore.

> +#define MLX_I2C_DRIVER_DESCRIPTION "Mellanox I2C bus driver"
> +
> +#define MLX_I2C_BLUEFIELD1_COMPAT   "mellanox,i2c-mlxbf1"
> +#define MLX_I2C_BLUEFIELD2_COMPAT   "mellanox,i2c-mlxbf2"
> +
> +#define MLX_I2C_BLUEFIELD1_ACPIHID  "MLNXBF03"
> +#define MLX_I2C_BLUEFIELD2_ACPIHID  "MLNXBF23"

I think those defines are not needed, see later.

> +
> +#define I2C_SMBUS_INVALID       0xff
> +#ifndef I2C_FUNC_SMBUS_HOST_NOTIFY

?? In what case is this not defined?

> +#define I2C_FUNC_SMBUS_HOST_NOTIFY      0x10000000
> +#endif
> +
> +#define I2C_SMBUS_MAX           3
> +
> +/* Defines what functionality is present */
> +#define MLX_I2C_FUNC_SMBUS_BLOCK \
> +	(I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL)
> +
> +#define MLX_I2C_FUNC_SMBUS_DEFAULT \
> +	(I2C_FUNC_SMBUS_BYTE      | I2C_FUNC_SMBUS_BYTE_DATA | \
> +	 I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_I2C_BLOCK | \
> +	 I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_HOST_NOTIFY)
> +
> +#define MLX_I2C_FUNC_ALL \
> +	(MLX_I2C_FUNC_SMBUS_DEFAULT | MLX_I2C_FUNC_SMBUS_BLOCK | \
> +	 I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SLAVE)
> +
> +/*
> + * TYU Shared resources in BlueField 1
> + */
> +
> +#define BLUEFIELD1_TYU_COALESCE_ADDR    0x02801300
> +#define BLUEFIELD1_TYU_COALESCE_SIZE    0x010
> +
> +#define BLUEFIELD1_TYU_GPIO_ADDR        0x02802000
> +#define BLUEFIELD1_TYU_GPIO_SIZE        0x100
> +
> +#define BLUEFIELD1_TYU_COREPLL_ADDR     0x02800358
> +#define BLUEFIELD1_TYU_COREPLL_SIZE     0x008
> +
> +/*
> + * TYU Shared resources in BlueField 2
> + */
> +
> +#define BLUEFIELD2_TYU_COALESCE_ADDR    0x02801680
> +#define BLUEFIELD2_TYU_COALESCE_SIZE    0x010
> +
> +#define BLUEFIELD2_TYU_GPIO_ADDR        0x02802000 /* FIXME */
> +#define BLUEFIELD2_TYU_GPIO_SIZE        0x100 /* FIXME */

So, what about this FIXME?

=2E.. (skipping a lot of lines)


> +static int mlx_i2c_of_probe(struct device *dev, struct mlx_i2c_priv *pri=
v)
> +{
> +	int bus_id =3D -1;
> +	int error;
> +
> +	if (dev->of_node) {
> +		error =3D device_property_read_string(dev, "compatible",
> +						    &priv->compat);
> +		if (error)
> +			return -EINVAL;
> +
> +		if (!strcmp(priv->compat, i2c_bf1_compat))
> +			priv->devtype =3D MLX_I2C_BLUEFIELD1;
> +		else if (!strcmp(priv->compat, i2c_bf2_compat))
> +			priv->devtype =3D MLX_I2C_BLUEFIELD2;

Why don't you populate the .data-member of the struct of_device_id and
use then of_device_get_match_data() to get the devtype or some config
data? I guess something similar could be done for ACPI. Then, you also
wouldn't need #defines for the compatible string.

> +
> +		bus_id =3D of_alias_get_id(dev->of_node, "i2c");
> +		if (bus_id >=3D 0)
> +			priv->bus =3D bus_id;
> +	}
> +
> +	if (WARN(bus_id < 0, "couldn't get bus id"))
> +		return bus_id;
> +
> +	return 0;
> +}
> +MODULE_LICENSE("GPL");

This doesn't match the SPDX identifier!

And from a glimpse, there are more generic things to be found in there.
It will also be helpful to check recent reviews of new drivers and check
if the issues found there are also relevant here.

So, my impression is that this driver is not bad, yet it needs a general
review first. With Mellanox being such a large contributor to the Kernel
(cool!), I hope we can find some assistance "internally".

Thanks and kind regards,

   Wolfram


--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1jFIACgkQFA3kzBSg
KbbzmA//VBXYFq2Vxm2ebgbTUV9LBkL1U3a33bZvCHTYNCWQl+ZaItUINhzC8iVI
SGpjN64MW99JLm0LrSCeEbaAoziHun26/XrXjBIXOngmQD4Wy7FpUUGe3NF891qZ
bxE1teKqml7PbqroQyf8RKEhqsxifVWG5ecGq6wo2ZxhWoGGAUT1nlfNr+SCV1hn
oXxMd06eA3DemajgL7NEcOSYoEZo3ECCVDpaRa0HAk0p2G7ruJCe/JBT5ljipK9B
7oA8GjwUDMxOCijAKJk2w0rYm5zeTzIcXdQVXyIkpiowTxFYHSbgnuNk+8CqHoJO
46FMTIgiRgLbep/s9JlVNQjp9sBuiMZ5GU32Rso4tfh/1D5satn79W5smOiMM2X8
+7M6j5D8pCmuex8qIY+l0q8Gbyan9OweH8PomZD8gkvuEV8U0p6LMDfKOlgTGh6b
ogNV+/blGjvAeGUwOlaO49Qj4IDhKpVQjfz4UF2To7rtteDwhVyL5MxXZ858Ucbp
RetugAilGjrVsjrhGW/J1BTbJLiAsbG5cdm477/YXx9/jINpHAHqcw8lQ7F8L8eR
LLzYRFrW7l7bET/9QwEk0MRzko1A2MgFy25EyTjapwdlttOSzYtNNrT/lOJ9ysV9
4zFy2P2qF9XDRJyoSOf7Yv7PfPYkdUVqTq2Jd4XoiuufzseqYPg=
=0/aR
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
