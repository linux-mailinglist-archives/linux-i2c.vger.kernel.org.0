Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E96D242FE9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 22:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgHLUNb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 16:13:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:40430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgHLUNb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Aug 2020 16:13:31 -0400
Received: from localhost (p54b33361.dip0.t-ipconnect.de [84.179.51.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF0D92076C;
        Wed, 12 Aug 2020 20:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597263210;
        bh=yYtwj2x5Z6Yb0oxsXcX6UBOsNlHYt6rQfa5Gz+XyrZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qu+2Q+dOHFxb/gFVvfRC0Z8J/bb3IACRhCTZSn05GfuaYZE+yjtRKMIIl1ZwQ1DDD
         hNiiJv5Sr6IoBQaZQboUB5hiHR0fRuzx6DolPmTEM8GopC/Ix8aVtDN7+9K0A1/yX+
         PcMO8AtiAdbdD2KvYelpStxmWZBfLI4Bn4P+RXkI=
Date:   Wed, 12 Aug 2020 22:13:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mv64xxx: Add bus error recovery
Message-ID: <20200812201327.GB2324@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200707211036.12896-1-mark.tomlinson@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <20200707211036.12896-1-mark.tomlinson@alliedtelesis.co.nz>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 09:10:36AM +1200, Mark Tomlinson wrote:
> This adds i2c bus recovery to the mv64xxx driver.
>=20
> Implement bus recovery to recover from SCL/SDA stuck low.
>=20
> This uses the generic recovery function, setting the clock/data lines as
> GPIO pins, and sending 9 clocks to try and recover the bus.
>=20
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>

This came in pretty much the same time we worked on handling this stuff
in the core. Can you rebase this work on top of i2c/for-next and
especially commit 75820314de26 ("i2c: core: add generic I2C GPIO
recovery")? Most of the stuff here should be already included there. I
will try to get your updated patch into 5.9 still.

> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 77 +++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
> index 829b8c98ae51..e58853ba3ef0 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -21,6 +21,7 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> @@ -147,6 +148,10 @@ struct mv64xxx_i2c_data {
>  	bool			irq_clear_inverted;
>  	/* Clk div is 2 to the power n, not 2 to the power n + 1 */
>  	bool			clk_n_base_0;
> +	struct pinctrl		*pinctrl;
> +	struct i2c_bus_recovery_info	rinfo;
> +	struct pinctrl_state	*pin_default_state;
> +	struct pinctrl_state	*pin_gpio_state;
>  };
> =20
>  static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx =3D {
> @@ -325,7 +330,8 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u3=
2 status)
>  			 drv_data->msg->flags);
>  		drv_data->action =3D MV64XXX_I2C_ACTION_SEND_STOP;
>  		mv64xxx_i2c_hw_init(drv_data);
> -		drv_data->rc =3D -EIO;
> +		i2c_recover_bus(&drv_data->adapter);
> +		drv_data->rc =3D -EAGAIN;
>  	}
>  }
> =20
> @@ -563,6 +569,7 @@ mv64xxx_i2c_wait_for_completion(struct mv64xxx_i2c_da=
ta *drv_data)
>  				"time_left: %d\n", drv_data->block,
>  				(int)time_left);
>  			mv64xxx_i2c_hw_init(drv_data);
> +			i2c_recover_bus(&drv_data->adapter);
>  		}
>  	} else
>  		spin_unlock_irqrestore(&drv_data->lock, flags);
> @@ -872,6 +879,69 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>  }
>  #endif /* CONFIG_OF */
> =20
> +/*
> + * Switch to bit bang mode to prepare for i2c generic recovery.
> + */
> +static void mv64xxx_i2c_prepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
> +
> +	pinctrl_select_state(drv_data->pinctrl, drv_data->pin_gpio_state);
> +}
> +
> +/*
> + * Return to normal i2c operation following recovery.
> + */
> +static void mv64xxx_i2c_unprepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
> +
> +	pinctrl_select_state(drv_data->pinctrl, drv_data->pin_default_state);
> +}
> +
> +static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_d=
ata,
> +					  struct platform_device *pd)
> +{
> +	struct i2c_bus_recovery_info *rinfo =3D &drv_data->rinfo;
> +	struct device *dev =3D &pd->dev;
> +
> +	drv_data->pinctrl =3D devm_pinctrl_get(dev);
> +	if (!drv_data->pinctrl || IS_ERR(drv_data->pinctrl)) {
> +		dev_err(dev, "can't get pinctrl, bus recovery not supported\n");
> +		return PTR_ERR(drv_data->pinctrl);
> +	}
> +
> +	drv_data->pin_default_state =3D pinctrl_lookup_state(drv_data->pinctrl,
> +			PINCTRL_STATE_DEFAULT);
> +	drv_data->pin_gpio_state =3D pinctrl_lookup_state(drv_data->pinctrl,
> +			"gpio");
> +	rinfo->scl_gpiod =3D devm_gpiod_get(dev, "scl",
> +					  GPIOD_OUT_HIGH_OPEN_DRAIN);
> +	rinfo->sda_gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
> +	if (PTR_ERR(rinfo->scl_gpiod) =3D=3D -EPROBE_DEFER ||
> +	    PTR_ERR(rinfo->sda_gpiod) =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	if (IS_ERR(rinfo->sda_gpiod) ||
> +	    IS_ERR(rinfo->scl_gpiod) ||
> +	    IS_ERR(drv_data->pin_default_state) ||
> +	    IS_ERR(drv_data->pin_gpio_state)) {
> +		dev_dbg(dev, "recovery information incomplete\n");
> +		return 0;
> +	}
> +
> +	dev_dbg(dev, "using scl-gpio %d and sda-gpio %d for recovery\n",
> +		rinfo->scl_gpiod ? desc_to_gpio(rinfo->scl_gpiod) : -1,
> +		rinfo->sda_gpiod ? desc_to_gpio(rinfo->sda_gpiod) : -1);
> +
> +	rinfo->prepare_recovery =3D mv64xxx_i2c_prepare_recovery;
> +	rinfo->unprepare_recovery =3D mv64xxx_i2c_unprepare_recovery;
> +	rinfo->recover_bus =3D i2c_generic_scl_recovery;
> +	drv_data->adapter.bus_recovery_info =3D rinfo;
> +
> +	return 0;
> +}
> +
>  static int
>  mv64xxx_i2c_probe(struct platform_device *pd)
>  {
> @@ -939,6 +1009,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
> =20
>  	mv64xxx_i2c_hw_init(drv_data);
> =20
> +	rc =3D mv64xxx_i2c_init_recovery_info(drv_data, pd);
> +	if (rc =3D=3D -EPROBE_DEFER)
> +		goto exit_reset;
> +
>  	rc =3D request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
>  			 MV64XXX_I2C_CTLR_NAME, drv_data);
>  	if (rc) {
> @@ -951,6 +1025,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  			"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
>  		goto exit_free_irq;
>  	}
> +	i2c_recover_bus(&drv_data->adapter);
> =20
>  	return 0;
> =20
> --=20
> 2.27.0
>=20

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl80TWcACgkQFA3kzBSg
KbagrA/+O6E874f+osJDBqfeGz3p1UB6nNT2VMqVj+kfa5isgpwsueEd+Z/lVLAX
BQz82mBj9CD3fa30/8OTRnOTafCsfxNSgC5Qym9fMz+r7unHMqU1T8LxrRO2iIfJ
LK9MQLx4MgVEFi2/Mo7Pqt5M4ZlOdeqdemy2U4lFnQvPZWpEhBkESKmevugEC0sq
dRJeCdFFrdqQ7Ss2qzQ2sET7QX63WF8BoFNyXC7LrdyEaxjjMModBXEO5iH/CZKW
lFIs6sxUPO5MOcx3mL3icyx3+BM4oqh0cKt85/DR52w5AM+2xuskxtTKDiIa+96S
Bwst+XV3x8JgeuMR/hTnQupkrhRJ3+SZ2buzCjDWaWxCGa8FNvJ3xotOSMDxpTtq
eQoxTj8xI5ahK0SIDmLpqz9ofSBowcjsBk03pIoR95Gg5DcTqFD4xzMWRaexlUV5
laKXrk3BFzljNzqvsRaXEdvkQ2Qtd2sqDRcA3Bv1E7ATPryMchJtrDlKWLl6e2rL
kyx5hryz4pF9ALhQHwfFFqLMDquvAKrAJ15qVuMLd+Vl3FUbeanUFYril8rDRMhW
Bg9izaQxqJix8AvcwPrIKl8ziYlnms3TrpCD3whssIq4cNtA4dOIvmCljT6dsQX4
TkK+cNSJWoWMGZSX7nYaJFfRvTaueEP0V40NmK9IGtd5JC5GdjE=
=p5B/
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
