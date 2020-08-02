Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88874235968
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 19:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgHBRFD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 13:05:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgHBRFD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Aug 2020 13:05:03 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1F21206E7;
        Sun,  2 Aug 2020 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596387902;
        bh=PWc3oVwKiB8qe+vnMnQ+QE/YaMVP0mT9tkx9mSi2wx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aw2ObVgJPVd2ENEl3i8ljrsW/KpxSbTBK3iV/ILQ3qCEdWZlP+pvXOcTYKyX4ehfg
         8Z8S7ve7SJAJjneWZea2OjnCaZAlfNKmVwFLU6peywrd/9xyBa3aGw3LR5Uubki3yR
         W2t8Vqau6YV2w+2mI5HBEF16k+R0KynqC5ZmNOTk=
Date:   Sun, 2 Aug 2020 19:05:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring
 SCL/SDA GPIOs
Message-ID: <20200802170500.GB10193@kunai>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20200619141904.910889-4-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 05:19:03PM +0300, Codrin Ciubotariu wrote:
> Even if I2C bus GPIO recovery is optional, devm_gpiod_get() can return
> -EPROBE_DEFER, so we should at least treat that. This ends up with
> i2c_register_adapter() to be able to return -EPROBE_DEFER.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 4ee29fec4e93..f8d9f2048ca8 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -368,15 +368,16 @@ static int i2c_gpio_init_recovery(struct i2c_adapte=
r *adap)
>  	return i2c_gpio_init_generic_recovery(adap);
>  }
> =20
> -static void i2c_init_recovery(struct i2c_adapter *adap)
> +static int i2c_init_recovery(struct i2c_adapter *adap)
>  {
>  	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>  	char *err_str;
> =20
>  	if (!bri)
> -		return;
> +		return 0;
> =20
> -	i2c_gpio_init_recovery(adap);
> +	if (i2c_gpio_init_recovery(adap) =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> =20
>  	if (!bri->recover_bus) {
>  		err_str =3D "no recover_bus() found";
> @@ -392,7 +393,7 @@ static void i2c_init_recovery(struct i2c_adapter *ada=
p)
>  			if (gpiod_get_direction(bri->sda_gpiod) =3D=3D 0)
>  				bri->set_sda =3D set_sda_gpio_value;
>  		}
> -		return;
> +		return 0;

This is correct but I think the code flow is/was confusing. Can you drop
this 'return' and use 'else if' for the next code block? I think this is
more readable.

>  	}
> =20
>  	if (bri->recover_bus =3D=3D i2c_generic_scl_recovery) {
> @@ -407,10 +408,12 @@ static void i2c_init_recovery(struct i2c_adapter *a=
dap)
>  		}
>  	}
> =20
> -	return;
> +	return 0;
>   err:
>  	dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
>  	adap->bus_recovery_info =3D NULL;
> +
> +	return 0;

'return -EINVAL;' I'd suggest.

>  }
> =20
>  static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> @@ -1476,7 +1479,9 @@ static int i2c_register_adapter(struct i2c_adapter =
*adap)
>  			 "Failed to create compatibility class link\n");
>  #endif
> =20
> -	i2c_init_recovery(adap);
> +	res =3D i2c_init_recovery(adap);
> +	if (res =3D=3D -EPROBE_DEFER)
> +		goto out_link;

Please move 'i2c_init_recovery' above the class-link creation. It
shouldn't make a difference but we can skip the extra label and the
ifdeffery.

> =20
>  	/* create pre-declared device nodes */
>  	of_i2c_register_devices(adap);
> @@ -1493,6 +1498,11 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
> =20
>  	return 0;
> =20
> +out_link:
> +#ifdef CONFIG_I2C_COMPAT
> +	class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
> +				 adap->dev.parent);
> +#endif
>  out_reg:
>  	init_completion(&adap->dev_released);
>  	device_unregister(&adap->dev);
> --=20
> 2.25.1
>=20

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8m8jsACgkQFA3kzBSg
KbZWIg/9FIRUejaKiCa0YCPjG1nVCLh+KzDrWUxpOJLWbPjuwlAh8I9AXTt39j91
7J5owEg+XW+A34bepy9rFJnfguYbiR1NKfhXTxou2dv/Jqb9QX7S0WGUxF621z8H
lPX0HOomwn2s7gDwQ7273h0hORvKHLorgzxStLhxQBq0UYoJmo73Ezo2WtejIkJ7
zQ3Czs9RPrEZ1sZs7jNg78TR7nlvyVvnNssP3BcHccD7x9ZDfgvBt2VpP/ToUJCi
ENngj3cPnDBqQ0wKzbDKBu6fw6PgIkK6qSXYWKSc8mQNEwf85l1JI019ea3iy9/2
/5TAtsX9Eu5fA45VxUF/NyNcCEimEsO0HIys3l0alXMGY3q+GmmO9I5zF/LYT7iq
4FACxonEcU7YwWwuT0d+UOy5X+7OCoJYFpowSi0lShj/ap+JhlI+kMQeu+JmI9rA
XulmXbSveSWjovoAKV94zzHb1hLAZhx5rtPbhU+V2nwUZCHu5CQbLUSkAQWXWFQ/
xLfjSRxbW05YmxMN1THYfVcZSpAQ6vh+VLG41bpkRFNci7Wbx9FxSC24oDKP67as
30iPMIFVuafJCO79hgDyWdaod+ghURBn8k+dcUDqrW6IZSOg8PdZVoBV0awqLSNf
C07MYTcUZRrKOqpiOQK9AxyYdasr+lHqL5a81jFlNjpTh2YjS6g=
=kUfd
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
