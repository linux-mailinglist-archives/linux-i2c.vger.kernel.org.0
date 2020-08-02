Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D23023595A
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 18:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgHBQyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 12:54:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:52994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgHBQyu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Aug 2020 12:54:50 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A765206F6;
        Sun,  2 Aug 2020 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596387289;
        bh=ZUzDGoWNs3GQ3QxEHtBMPDaY1kjL/vWe87Ye6wuRO+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ux3Oo1mGfed/QCSDKacE0vxIYWnQI7ex6oAFIdW15EXkrjxa1Yk02S004ctKPxnVW
         AqwDDN1CbKmIiyVDvM59b5y2o8BqvaRboMyJEOraz+onpDJcdX9TpqaTDTIb/IFPin
         wsIdxD3Mv9JOv+2BJpGovRV/u92qDE8CEtgabtGc=
Date:   Sun, 2 Aug 2020 18:54:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Message-ID: <20200802165446.GA10193@kunai>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-3-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20200619141904.910889-3-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 05:19:02PM +0300, Codrin Ciubotariu wrote:
> Multiple I2C bus drivers use similar bindings to obtain information needed
> for I2C recovery. For example, for platforms using device-tree, the
> properties look something like this:
>=20
> &i2c {
> 	...
> 	pinctrl-names =3D "default", "gpio";
> 	// or pinctrl-names =3D "default", "recovery";
> 	pinctrl-0 =3D <&pinctrl_i2c_default>;
> 	pinctrl-1 =3D <&pinctrl_i2c_gpio>;
> 	sda-gpios =3D <&pio 0 GPIO_ACTIVE_HIGH>;
> 	scl-gpios =3D <&pio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 	...
> }
>=20
> For this reason, we can add this common initialization in the core. This
> way, other I2C bus drivers will be able to support GPIO recovery just by
> providing a pointer to platform's pinctrl and calling i2c_recover_bus()
> when SDA is stuck low.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Thanks, it looks a lot like what I had in mind!

> ---
>  drivers/i2c/i2c-core-base.c | 119 ++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  11 ++++
>  2 files changed, 130 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index d1f278f73011..4ee29fec4e93 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -32,6 +32,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_wakeirq.h>
> @@ -179,6 +180,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>  	int i =3D 0, scl =3D 1, ret =3D 0;
> =20
> +	if (bri->pinctrl)
> +		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);

I think this should come after 'prepare_recovery'. It may be that
'prepare_recovery' already needs to select the pinctrl state to avoid a
glitch. In this version, there would be a glitch then. If we move it
down, the doubled 'pinctrl_select_state' would be a noop then.

>  	if (bri->prepare_recovery)
>  		bri->prepare_recovery(adap);
> =20
> @@ -236,6 +239,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
> =20
>  	if (bri->unprepare_recovery)
>  		bri->unprepare_recovery(adap);
> +	if (bri->pinctrl)
> +		pinctrl_select_state(bri->pinctrl, bri->pins_default);

Here it is OK and will still work with the PXA version which needs to
select the state on its own.

> =20
>  	return ret;
>  }
> @@ -251,6 +256,118 @@ int i2c_recover_bus(struct i2c_adapter *adap)
>  }
>  EXPORT_SYMBOL_GPL(i2c_recover_bus);
> =20
> +static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
> +{
> +	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
> +	struct device *dev =3D &adap->dev;
> +	struct pinctrl *p =3D bri->pinctrl;
> +
> +	/*
> +	 * we can't change states without pinctrl, so remove the states if
> +	 * available

s/available/populated/ ?

> +	 */
> +	if (!p) {
> +		bri->pins_default =3D NULL;
> +		bri->pins_gpio =3D NULL;
> +		return;
> +	}
> +
> +	if (!bri->pins_default) {
> +		bri->pins_default =3D pinctrl_lookup_state(p,
> +							 PINCTRL_STATE_DEFAULT);
> +		if (IS_ERR(bri->pins_default)) {
> +			dev_dbg(dev, PINCTRL_STATE_DEFAULT " state not found for GPIO recover=
y\n");
> +			bri->pins_default =3D NULL;
> +
> +			goto cleanup_pinctrl;

I'd leave out the goto here. It is OK to check both parameters, I think.

> +		}
> +	}
> +	if (!bri->pins_gpio) {
> +		bri->pins_gpio =3D pinctrl_lookup_state(p, "gpio");
> +		if (IS_ERR(bri->pins_gpio))
> +			bri->pins_gpio =3D pinctrl_lookup_state(p, "recovery");
> +
> +		if (IS_ERR(bri->pins_gpio)) {
> +			dev_dbg(dev, "no gpio or recovery state found for GPIO recovery\n");
> +			bri->pins_gpio =3D NULL;
> +
> +			goto cleanup_pinctrl;

This goto is not needed...

> +		}
> +	}
> +
> +cleanup_pinctrl:

=2E.. and this label can go then. Also nicer to read, I'd say.

> +	/* for pinctrl state changes, we need all the information */
> +	if (!bri->pins_default || !bri->pins_gpio) {
> +		bri->pinctrl =3D NULL;
> +		bri->pins_default =3D NULL;
> +		bri->pins_gpio =3D NULL;
> +	} else {
> +		dev_info(dev, "using pinctrl states for GPIO recovery");
> +	}
> +}
> +
> +static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
> +{
> +	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
> +	struct device *dev =3D &adap->dev;
> +	struct gpio_desc *gpiod;
> +	int ret =3D 0;
> +
> +	/* don't touch the recovery information if the driver is not using
> +	 * generic SCL recovery
> +	 */

Not kernel comment style.

> +	if (bri->recover_bus && bri->recover_bus !=3D i2c_generic_scl_recovery)
> +		return 0;

No need for the first condition. 'i2c_generic_scl_recovery' is
definately not NULL :)

> +
> +	/*
> +	 * pins might be taken as GPIO, so we might as well inform pinctrl about

s/might as well/should/

> +	 * this and move the state to GPIO
> +	 */
> +	if (bri->pinctrl)
> +		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
> +
> +	/*
> +	 * if there is incomplete or no recovery information, see if generic
> +	 * GPIO recovery is available
> +	 */
> +	if (!bri->scl_gpiod) {
> +		gpiod =3D devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
> +		if (PTR_ERR(gpiod) =3D=3D -EPROBE_DEFER) {
> +			ret  =3D -EPROBE_DEFER;
> +			goto cleanup_pinctrl_state;
> +		}
> +		if (!IS_ERR(gpiod)) {
> +			bri->scl_gpiod =3D gpiod;
> +			bri->recover_bus =3D i2c_generic_scl_recovery;
> +			dev_info(dev, "using generic GPIOs for recovery\n");
> +		}
> +	}

I think this extra code from the PXA driver makes sense in case SDA was
released while we were executing this code:

1383         /*
1384          * We have SCL. Pull SCL low and wait a bit so that SDA glitch=
es
1385          * have no effect.
1386          */
1387         gpiod_direction_output(bri->scl_gpiod, 0);
1388         udelay(10);
1389         bri->sda_gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_O=
PEN_DRAIN);
1390=20
1391         /* Wait a bit in case of a SDA glitch, and then release SCL. */
1392         udelay(10);
1393         gpiod_direction_output(bri->scl_gpiod, 1);

> +
> +	/* SDA GPIOD line is optional, so we care about DEFER only */
> +	if (!bri->sda_gpiod) {
> +		gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
> +		if (PTR_ERR(gpiod) =3D=3D -EPROBE_DEFER) {
> +			ret =3D -EPROBE_DEFER;
> +			goto cleanup_pinctrl_state;
> +		}
> +		if (!IS_ERR(gpiod))
> +			bri->sda_gpiod =3D gpiod;
> +	}
> +
> +cleanup_pinctrl_state:
> +	/* change the state of the pins back to their default state */
> +	if (bri->pinctrl)
> +		pinctrl_select_state(bri->pinctrl, bri->pins_default);
> +
> +	return ret;
> +}
> +

Rest looks good! If you have some time for this now, I will make sure to
get it into 5.9. With these minor things fixed, this is good to go, me
thinks.


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8m79IACgkQFA3kzBSg
Kba+ZQ//X5vCRvtYx07JmuofxpcNnyCJKRoHp/MrYT/3RMLa6ofIroAsqTUVQYcX
STI9inVLszdy6D+RRSawdX3A+0qiF0+2iCfraBEnmfynkOTIElv1WcUVW7iumC7G
dkWt4GZ5CtKxDuggdx+XWvzH1HsOf1mjgJtpBULydLYrWOgs/a8c+MEZuKarX/0Q
KB7W18YTMfokJfeVL067bexV0BJYCXjNRP3RmpGnR91nMcndg6qlntW9zyEYOw7R
edXspncK5s0Cl7UTvGTSPy3kZXFQfZSOVXt8xZnpD9KChOi/mcH1aKg7iLaSKx50
lubtzWCGp4h+dja638cMBxffvu8rx+OpZoSvTVpQRi4NjJOEnx00xW5HKLhpnDAT
IKqmUni7uzzQGPe9ibpdOKSh9gr6+rHElXckE00EhPi9h8UFF6w75fpakZVXoqlw
HVp3gLsRdOhM2wYfwBOsH/Dngr63Ae7t9EkgKxb5Ufuzpfdp/e1syStPs8Uu0kEy
IYgsPGY4jemPaQy6d0aZxHG0e7ReBtlKpuUK+MGqq7nKyMNlSgYynyrxKPMeFzw/
zmN21htjb7DktvS/engGf/FC1Pg5anw7a8obIAX9hQtrwu8P/hNaTCNiCyU0S1Sq
mY34Vi+CES2sjnUKEWtiUJLTi1P9BCW31sjakQTVGn4Xeq1Dl5M=
=xcJ8
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
