Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3081E37AE7
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 19:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfFFRVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 13:21:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59694 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfFFRVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 13:21:38 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1043A263B33;
        Thu,  6 Jun 2019 18:21:35 +0100 (BST)
Date:   Thu, 6 Jun 2019 19:21:31 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v2 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190606192131.355c9556@collabora.com>
In-Reply-To: <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
        <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  6 Jun 2019 17:12:04 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> spi and i2c mode.
> 
> The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c support to
> them.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   Add support for LSM6DSR
>   Set pm_ops to st_lsm6dsx_pm_ops
> 
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> index 002a423..8115936 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -2,11 +2,12 @@
>  
>  config IIO_ST_LSM6DSX
>  	tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
> -	depends on (I2C || SPI)
> +	depends on (I2C || SPI || I3C)
>  	select IIO_BUFFER
>  	select IIO_KFIFO_BUF
>  	select IIO_ST_LSM6DSX_I2C if (I2C)
>  	select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
> +	select IIO_ST_LSM6DSX_I3C if (I3C)
>  	help
>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> @@ -24,3 +25,8 @@ config IIO_ST_LSM6DSX_SPI
>  	tristate
>  	depends on IIO_ST_LSM6DSX
>  	select REGMAP_SPI
> +
> +config IIO_ST_LSM6DSX_I3C
> +	tristate
> +	depends on IIO_ST_LSM6DSX
> +	select REGMAP_I3C
> diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_lsm6dsx/Makefile
> index 28cc673..57cbcd6 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Makefile
> +++ b/drivers/iio/imu/st_lsm6dsx/Makefile
> @@ -5,3 +5,4 @@ st_lsm6dsx-y := st_lsm6dsx_core.o st_lsm6dsx_buffer.o \
>  obj-$(CONFIG_IIO_ST_LSM6DSX) += st_lsm6dsx.o
>  obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) += st_lsm6dsx_i2c.o
>  obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) += st_lsm6dsx_spi.o
> +obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) += st_lsm6dsx_i3c.o
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> new file mode 100644
> index 0000000..70b70d1
> --- /dev/null
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> + *
> + * Author: Vitor Soares <vitor.soares@synopsys.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include "st_lsm6dsx.h"
> +
> +#define NAME_SIZE	32
> +
> +struct st_lsm6dsx_i3c_data {
> +	const char name[NAME_SIZE];

I think I mentioned already that you can simply have

	const char *name;

> +	enum st_lsm6dsx_hw_id id;
> +};
> +
> +enum st_lsm6dsx_i3c_data_id {
> +	ST_LSM6DSO_I3C_DATA_ID,
> +	ST_LSM6DSR_I3C_DATA_ID,
> +};
> +
> +static const struct st_lsm6dsx_i3c_data hw_data[] = {
> +	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
> +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> +};
> +
> +static const struct regmap_config st_lsm6dsx_i3c_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	const struct i3c_device_id *id = i3c_get_device_id(i3cdev);
> +	const struct st_lsm6dsx_i3c_data *hw_data = id->data;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> +			(int)PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	return st_lsm6dsx_probe(&i3cdev->dev, 0, hw_data->id,
> +				hw_data->name, regmap);
> +}
> +
> +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
> +	I3C_DEVICE(0x0104, 0x006C, &hw_data[ST_LSM6DSO_I3C_DATA_ID]),
> +	I3C_DEVICE(0x0104, 0x006B, &hw_data[ST_LSM6DSR_I3C_DATA_ID]),

Still find that form counter-intuitive since you'd have to first go
look at what's the value of ST_LSM6DSO_I3C_DATA_ID, then go check the
entry in hw_data to find what's in there. Too many ways to get things
wrong IMHO.

The following form would make it much more obvious/easy to follow:

static const st_lsm6dsx_i3c_data st_lsm6dso_i3c_data = {
	ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID,
};

static const st_lsm6dsx_i3c_data st_lsm6dsr_i3c_data = {
	ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID,
};

static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
	I3C_DEVICE(0x0104, 0x006C, &st_lsm6dso_i3c_data),
	I3C_DEVICE(0x0104, 0x006B, &st_lsm6dsr_i3c_data),
};

Note that I don't see why we need to pass both the name and the ID to
st_lsm6dsx_probe(). I'd expect the name to be easily deducible from the
ID (using a name table whose index would match the ST_XXX_ID).

If you do this change you would actually get rid of the
st_lsm6dsx_i3c_data struct and instead have:

static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
};

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> +
> +static struct i3c_driver st_lsm6dsx_driver = {
> +	.driver = {
> +		.name = "st_lsm6dsx_i3c",
> +		.pm = &st_lsm6dsx_pm_ops,
> +	},
> +	.probe = st_lsm6dsx_i3c_probe,
> +	.id_table = st_lsm6dsx_i3c_ids,
> +};
> +module_i3c_driver(st_lsm6dsx_driver);
> +
> +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> +MODULE_LICENSE("GPL v2");

