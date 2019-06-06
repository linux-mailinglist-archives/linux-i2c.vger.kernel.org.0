Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCFE37A57
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 18:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfFFQ6v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 12:58:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfFFQ6u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 12:58:50 -0400
Received: from localhost.localdomain (nat-pool-mxp-t.redhat.com [149.6.153.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0155E20693;
        Thu,  6 Jun 2019 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559840329;
        bh=YfQPguzAqsesPyTNbKdNkGI/9IVehUonN3ApIuvgM/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BO9DcAvctY5CqhrOEHCKrQaw5dPq052snhzErz+eQQ3sarmxOJrJxPVSPJDGsTjoD
         Lvn4A0JWh9rX+Izwfj18tsW9Yk91iMgrOFiUiXyYqsa9kgqV9OSbDMra0sL7NKkItT
         MOd0UClPaAvU+xEuZqBTsYrA7cbqzyKPv2S5DIrI=
Date:   Thu, 6 Jun 2019 18:58:43 +0200
From:   Lorenzo Bianconi <lorenzo@kernel.org>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v2 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190606165841.GA10356@localhost.localdomain>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> spi and i2c mode.
>=20
> The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c support to
> them.
>=20
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---

Hi Vitor,

just a nit inline, but you can add my acked-by for st_lsm6dsx part in v3

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

> Changes in v2:
>   Add support for LSM6DSR
>   Set pm_ops to st_lsm6dsx_pm_ops
>=20
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++++=
++++++
>  3 files changed, 84 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
>=20
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6=
dsx/Kconfig
> index 002a423..8115936 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -2,11 +2,12 @@
> =20
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

[...]

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
> +	enum st_lsm6dsx_hw_id id;
> +};
> +
> +enum st_lsm6dsx_i3c_data_id {
> +	ST_LSM6DSO_I3C_DATA_ID,
> +	ST_LSM6DSR_I3C_DATA_ID,
> +};

do we really need them? maybe just use hw_data[n] adding a comment to indic=
ate
the related sensor defining st_lsm6dsx_i3c_ids[]

> +
> +static const struct st_lsm6dsx_i3c_data hw_data[] =3D {
> +	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
> +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> +};
> +
> +static const struct regmap_config st_lsm6dsx_i3c_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	const struct i3c_device_id *id =3D i3c_get_device_id(i3cdev);
> +	const struct st_lsm6dsx_i3c_data *hw_data =3D id->data;
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
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
> +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] =3D {
> +	I3C_DEVICE(0x0104, 0x006C, &hw_data[ST_LSM6DSO_I3C_DATA_ID]),
> +	I3C_DEVICE(0x0104, 0x006B, &hw_data[ST_LSM6DSR_I3C_DATA_ID]),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> +
> +static struct i3c_driver st_lsm6dsx_driver =3D {
> +	.driver =3D {
> +		.name =3D "st_lsm6dsx_i3c",
> +		.pm =3D &st_lsm6dsx_pm_ops,
> +	},
> +	.probe =3D st_lsm6dsx_i3c_probe,
> +	.id_table =3D st_lsm6dsx_i3c_ids,
> +};
> +module_i3c_driver(st_lsm6dsx_driver);
> +
> +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.7.4
>=20

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXPlGPwAKCRA6cBh0uS2t
rPqMAP44h3ZeX39OaxRtCeAjFaVA461EPlzIZOpxST1c3RRKvwD/S/enVcgJjWIc
SSwRn2zrrKVUs7mYZsyKAcRBo9+Pvgs=
=G/Yz
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
