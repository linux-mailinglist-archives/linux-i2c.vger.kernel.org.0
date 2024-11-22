Return-Path: <linux-i2c+bounces-8158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D79D63F6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 19:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E23F5B29824
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 18:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A201E411D;
	Fri, 22 Nov 2024 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZxgAXqn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2F1E3DCA;
	Fri, 22 Nov 2024 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732298739; cv=none; b=Y2BJrd5BGlVC8txqsVTnEatyVuYwj6tAyDuL4qZ2F9sefsKiA0B3nD8r1DcBXN0BGZKjcatZsdoQqdeWhICVDXl2DDowzuC90qbnBu18xwlzpn5G9s+6Ai14Tdh/H3yHHTuWZcAhFDQNz9pk9fJPM7Wjp2Fgl0iSNO+9Qiudbx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732298739; c=relaxed/simple;
	bh=SfJXTQziLY7a9QtdjnJrWk+h7t37B3e9l99AeaDQstw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT0cp8lg/ZGSMjbGXA5nI0JmEHVs8EEF+ymBF00LzsArZWNpRfR/GdWDfpqqJ85whqBXNqORe8L5d0jybWvzKXDbKQJ26koSR4Fys5PEpDx4lFTHM7BUzGyylO32ujFvWN4fRk4c0Txt/pA1rYij5Od0IubItcxjy6TGINWRSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZxgAXqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6B1C4CED3;
	Fri, 22 Nov 2024 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732298738;
	bh=SfJXTQziLY7a9QtdjnJrWk+h7t37B3e9l99AeaDQstw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZxgAXqnD9bSkXd6kFSytl8aJEGR8YcB5TQTUcP3E4wjnCupz165epeywTfMhk++o
	 zaAJ7LZC1/K96QFkBwEFBE8Dofcjf/HjHowm01Z1a5oD/jDFfoZf4V4Fx93bOudNej
	 rmuYmbOaA2T6pao99RhDE0N5DfXFW2NkFIqNOWuclHmRlQCf/Rv1NHilRNkmX+XUpK
	 6JdRSRo2ijsnBFhzuNupRE1zhd9bh0skJ4EEa9yoWbfvfmN4o+LdpiP2TzNvKCJo5F
	 wEQ/+Vtl1I0OCSlAbMyCjlnCLbKCD+/d2+xBfUYRY0X++fjJV4GifvB8w3o/WBmvVk
	 xNad4HPi6s3rQ==
Date: Fri, 22 Nov 2024 19:05:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de, 
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 8/9] pwm: Add Nuvoton NCT6694 PWM support
Message-ID: <imxfhjb5h5bneql6hadxanmzshxi2ev2tosprrncrerxrhvocl@lnoi32zupqct>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-9-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iddd2vffbehamsfe"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-9-tmyu0@nuvoton.com>


--iddd2vffbehamsfe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 8/9] pwm: Add Nuvoton NCT6694 PWM support
MIME-Version: 1.0

Hello,

On Thu, Oct 24, 2024 at 04:59:21PM +0800, Ming Yu wrote:
> This driver supports PWM functionality for NCT6694 MFD device
> based on USB interface.
>=20
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/pwm/Kconfig       |  10 ++
>  drivers/pwm/Makefile      |   1 +
>  drivers/pwm/pwm-nct6694.c | 245 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 257 insertions(+)
>  create mode 100644 drivers/pwm/pwm-nct6694.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c350eac187d..4d5a5eded3b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16444,6 +16444,7 @@ F:	drivers/iio/adc/nct6694_adc.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
>  F:	drivers/net/can/nct6694_canfd.c
> +F:	drivers/pwm/pwm-nct6694.c
>  F:	drivers/watchdog/nct6694_wdt.c
>  F:	include/linux/mfd/nct6694.h
> =20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 0915c1e7df16..00b5eb13f99d 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -471,6 +471,16 @@ config PWM_NTXEC
>  	  controller found in certain e-book readers designed by the original
>  	  design manufacturer Netronix.
> =20
> +config PWM_NCT6694
> +	tristate "Nuvoton NCT6694 PWM support"
> +	depends on MFD_NCT6694
> +	help
> +	If you say yes to this option, support will be included for Nuvoton
> +	NCT6694, a USB device to PWM controller.
> +
> +	This driver can also be built as a module. If so, the module
> +	will be called pwm-nct6694.
> +
>  config PWM_OMAP_DMTIMER
>  	tristate "OMAP Dual-Mode Timer PWM support"
>  	depends on OF
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 9081e0c0e9e0..5c5602b79402 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_PWM_MICROCHIP_CORE)	+=3D pwm-microchip-cor=
e.o
>  obj-$(CONFIG_PWM_MTK_DISP)	+=3D pwm-mtk-disp.o
>  obj-$(CONFIG_PWM_MXS)		+=3D pwm-mxs.o
>  obj-$(CONFIG_PWM_NTXEC)		+=3D pwm-ntxec.o
> +obj-$(CONFIG_PWM_NCT6694)	+=3D pwm-nct6694.o
>  obj-$(CONFIG_PWM_OMAP_DMTIMER)	+=3D pwm-omap-dmtimer.o
>  obj-$(CONFIG_PWM_PCA9685)	+=3D pwm-pca9685.o
>  obj-$(CONFIG_PWM_PXA)		+=3D pwm-pxa.o
> diff --git a/drivers/pwm/pwm-nct6694.c b/drivers/pwm/pwm-nct6694.c
> new file mode 100644
> index 000000000000..915a2ab50834
> --- /dev/null
> +++ b/drivers/pwm/pwm-nct6694.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 PWM driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pwm.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/nct6694.h>
> +
> +#define DRVNAME "nct6694-pwm"
> +
> +#define NR_PWM	10
> +#define MAX_PERIOD_NS	40000		/* PWM Maximum Frequency =3D 25kHz */

Please use a prefix for your defines, otherwise they make a more general
impression than justified.

> +#define PERIOD_NS_CONST	10200000	/* Period_ns to Freq_reg */

What is Freq_reg?

> +/* Host interface */
> +#define REQUEST_RPT_MOD			0xFF
> +#define REQUEST_HWMON_MOD		0x00
> +#define REQUEST_PWM_MOD			0x01
> +
> +/* Report Channel */
> +#define HWMON_PWM_IDX(x)		(0x70 + (x))
> +
> +/* Message Channel -HWMON */
> +/* Command 00h */
> +#define REQUEST_HWMON_CMD0_LEN		0x40
> +#define REQUEST_HWMON_CMD0_OFFSET	0x0000	/* OFFSET =3D SEL|CMD */
> +#define HWMON_PWM_EN(x)			(0x06 + (x))
> +#define HWMON_PWM_PP(x)			(0x08 + (x))
> +#define HWMON_PWM_FREQ_IDX(x)		(0x30 + (x))
> +
> +/* Message Channel -FAN */
> +/* Command 00h */
> +#define REQUEST_PWM_CMD0_LEN		0x08
> +#define REQUEST_PWM_CMD0_OFFSET		0x0000	/* OFFSET =3D SEL|CMD */
> +#define PWM_CH_EN(x)			(x ? 0x00 : 0x01)
> +/* Command 01h */
> +#define REQUEST_PWM_CMD1_LEN		0x20
> +#define REQUEST_PWM_CMD1_OFFSET		0x0001	/* OFFSET =3D SEL|CMD */
> +#define PWM_MAL_EN(x)			(x ? 0x00 : 0x01)
> +#define PWM_MAL_VAL(x)			(0x02 + (x))
> +
> +/*
> + *		Frequency <-> Period
> + * (10^9 * 255) / (25000 * Freq_reg) =3D Period_ns
> + *		10200000 / Freq_reg  =3D Period_ns
> + *
> + * | Freq_reg | Freq_Hz | Period_ns |
> + * |  1 (01h  |  98.039 |  10200000 |

missing )

> + * |  2 (02h) | 196.078 |   5100000 |
> + * |  3 (03h) | 294.117 |   3400000 |
> + * |		  ...		    |
> + * |		  ...		    |
> + * |		  ...		    |

Better use spaces for indention here.

> + * | 253 (FDh)| 24803.9 |  40316.20 |
> + * | 254 (FEh)| 24901.9 |  40157.48 |
> + * | 255 (FFh)|  25000  |    40000  |

Is this table useful?

I'd just write:

	The emitted period P depends on the value F configured in
	the freq register:

	P =3D 255 s / (25000 * F)
	  =3D 10200000 ns / F

I wonder what happens if F =3D=3D 0?

> + */
> +
> +struct nct6694_pwm_data {
> +	struct nct6694 *nct6694;
> +	unsigned char hwmon_cmd0_buf[REQUEST_HWMON_CMD0_LEN];
> +	unsigned char pwm_cmd0_buf[REQUEST_PWM_CMD0_LEN];
> +	unsigned char pwm_cmd1_buf[REQUEST_PWM_CMD1_LEN];

What are these arrays? register caches?

> +};
> +
> +static inline struct nct6694_pwm_data *to_nct6694_pwm_data(struct pwm_ch=
ip *chip)
> +{
> +	return pwmchip_get_drvdata(chip);
> +}
> +
> +static int nct6694_pwm_request(struct pwm_chip *chip, struct pwm_device =
*pwm)
> +{
> +	struct nct6694_pwm_data *data =3D to_nct6694_pwm_data(chip);
> +	unsigned char ch_enable =3D data->pwm_cmd0_buf[PWM_CH_EN(pwm->hwpwm / 8=
)];
> +	unsigned char mal_enable =3D data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm /=
 8)];
> +	bool ch_en =3D ch_enable & BIT(pwm->hwpwm % 8);
> +	bool mal_en =3D mal_enable & BIT(pwm->hwpwm % 8);

What is "mal"?

> +
> +	if (!(ch_en && mal_en)) {
> +		pr_err("%s: PWM(%d) is running in other mode!\n",
> +		       __func__, pwm->hwpwm);
> +		return -EINVAL;
> +	}

No error messages after .probe() please. dev_dbg() is fine however.

> +	return 0;
> +}
> +
> +static int nct6694_pwm_get_state(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 struct pwm_state *state)
> +{
> +	struct nct6694_pwm_data *data =3D to_nct6694_pwm_data(chip);
> +	unsigned char freq_reg, duty;
> +
> +	/* Get pwm device initial state */
> +	state->enabled =3D true;
> +
> +	freq_reg =3D data->hwmon_cmd0_buf[HWMON_PWM_FREQ_IDX(pwm->hwpwm)];
> +	state->period =3D PERIOD_NS_CONST / freq_reg;

I doubt you extensively tested your driver with PWM_DEBUG enabled. Hint:
You should probably use DIV_ROUND_UP here.

> +	duty =3D data->pwm_cmd1_buf[PWM_MAL_VAL(pwm->hwpwm)];
> +	state->duty_cycle =3D duty * state->period / 0xFF;
> +
> +	return 0;
> +}
> +
> +static int nct6694_pwm_apply(struct pwm_chip *chip,
> +			     struct pwm_device *pwm,
> +			     const struct pwm_state *state)
> +{
> +	struct nct6694_pwm_data *data =3D to_nct6694_pwm_data(chip);
> +	unsigned char freq_reg, duty;
> +	int ret;
> +
> +	if (state->period < MAX_PERIOD_NS)
> +		return -EINVAL;
> +
> +	/* (10^9 * 255) / (25000 * Freq_reg) =3D Period_ns */

This could be less irritating if the formula included units. See above.

> +	freq_reg =3D (unsigned char)(PERIOD_NS_CONST / state->period);

No need for the cast.

If state->period is bigger than PERIOD_NS_CONST, freq_reg ends up being
zero. That's related to the question above about F =3D=3D 0.

> +	data->hwmon_cmd0_buf[HWMON_PWM_FREQ_IDX(pwm->hwpwm)] =3D freq_reg;
> +	ret =3D nct6694_write_msg(data->nct6694, REQUEST_HWMON_MOD,
> +				REQUEST_HWMON_CMD0_OFFSET,
> +				REQUEST_HWMON_CMD0_LEN,
> +				data->hwmon_cmd0_buf);
> +	if (ret)
> +		return -EIO;

return ret;?

> +
> +	/* Duty =3D duty * 0xFF */

I don't understand that.

> +	duty =3D (unsigned char)(state->duty_cycle * 0xFF / state->period);

Please use the actual period implemented and not state->period.

> +	data->pwm_cmd1_buf[PWM_MAL_VAL(pwm->hwpwm)] =3D duty;
> +	if (state->enabled)
> +		data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm / 8)] |=3D BIT(pwm->hwpwm  % =
8);
> +	else
> +		data->pwm_cmd1_buf[PWM_MAL_EN(pwm->hwpwm / 8)] &=3D ~BIT(pwm->hwpwm  %=
 8);

s/  / /

> +	ret =3D nct6694_write_msg(data->nct6694, REQUEST_PWM_MOD,
> +				REQUEST_PWM_CMD1_OFFSET, REQUEST_PWM_CMD1_LEN,
> +				data->pwm_cmd1_buf);
> +	if (ret)
> +		return -EIO;

return ret;

> +	return 0;
> +}
> +
> +static const struct pwm_ops nct6694_pwm_ops =3D {
> +	.request =3D nct6694_pwm_request,
> +	.apply =3D nct6694_pwm_apply,
> +	.get_state =3D nct6694_pwm_get_state,
> +};
> +
> +static int nct6694_pwm_init(struct nct6694_pwm_data *data)
> +{
> +	struct nct6694 *nct6694 =3D data->nct6694;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(nct6694, REQUEST_HWMON_MOD,
> +			       REQUEST_HWMON_CMD0_OFFSET,
> +			       REQUEST_HWMON_CMD0_LEN, 0,
> +			       REQUEST_HWMON_CMD0_LEN,
> +			       data->hwmon_cmd0_buf);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D nct6694_read_msg(nct6694, REQUEST_PWM_MOD,
> +			       REQUEST_PWM_CMD0_OFFSET,
> +			       REQUEST_PWM_CMD0_LEN, 0,
> +			       REQUEST_PWM_CMD0_LEN,
> +			       data->pwm_cmd0_buf);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D nct6694_read_msg(nct6694, REQUEST_PWM_MOD,
> +			       REQUEST_PWM_CMD1_OFFSET,
> +			       REQUEST_PWM_CMD1_LEN, 0,
> +			       REQUEST_PWM_CMD1_LEN,
> +			       data->pwm_cmd1_buf);
> +	return ret;
> +}
> +
> +static int nct6694_pwm_probe(struct platform_device *pdev)
> +{
> +	struct pwm_chip *chip;
> +	struct nct6694_pwm_data *data;
> +	struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +	int ret;
> +
> +	chip =3D devm_pwmchip_alloc(&pdev->dev, NR_PWM, sizeof(*data));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	data =3D to_nct6694_pwm_data(chip);
> +
> +	data->nct6694 =3D nct6694;
> +	chip->ops =3D &nct6694_pwm_ops;
> +
> +	ret =3D nct6694_pwm_init(data);
> +	if (ret)
> +		return -EIO;

return dev_err_probe(dev, ret, "....\n");

> +	/* Register pwm device to PWM framework */
> +	ret =3D devm_pwmchip_add(&pdev->dev, chip);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register pwm device!\n");
> +		return ret;
> +	}

Please use dev_err_probe().

> +
> +	return 0;
> +}
> +
> +static struct platform_driver nct6694_pwm_driver =3D {
> +	.driver =3D {
> +		.name	=3D DRVNAME,

DRVNAME is only used once (and a too generic name). Please just put the
string here directly.

> +	},
> +	.probe		=3D nct6694_pwm_probe,
> +};

I don't like your aligning choices. Why do you intend the =3D for .probe
but not for .driver? My preferred style is a single space before the =3D.
While aligning the =3D is a subjective choice, a relevant downside is that
if later a longer member should get initialized you have to realign all
the otherwise unaffected lines to restore the alignment.

> +static int __init nct6694_init(void)
> +{
> +	int err;
> +
> +	err =3D platform_driver_register(&nct6694_pwm_driver);
> +	if (!err) {
> +		if (err)

Huh?

> +			platform_driver_unregister(&nct6694_pwm_driver);
> +	}
> +
> +	return err;
> +}
> +subsys_initcall(nct6694_init);

Do you really need this to be at subsys init time?

> +static void __exit nct6694_exit(void)
> +{
> +	platform_driver_unregister(&nct6694_pwm_driver);
> +}
> +module_exit(nct6694_exit);
> +
> +MODULE_DESCRIPTION("USB-PWM driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--iddd2vffbehamsfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdAx+oACgkQj4D7WH0S
/k5qOAf/T2+rcQXdOX8t9UuEfG+QnoXIYHB5QWVAgIb3ZtY3tWpx0e3DYmkILlHt
FFWbh4TeRluZCR6Pk4cFPCIyrWW4luAuUK493LTRoXwpBRr2XueNQRN2SIZ56Shl
ezJzGWe8lOTYjo19jfg78jKp3JPrTXk7XqdB3uAAwfyHVo1NsqmKfeQ/x9HrbN+1
1fe0FJCey2bVoTrOzZYPBxQNbt8yRr4cKxE/ctKyR0zHYpv2hWHXUYaWlv8bG6WY
iK7Oh3ZlkekX2hYiE3sqbkUQlXFCVR36+UIi3h2IPc4xv9Vlwp80BOM6FNX8EGj+
tOL+gRkzX2kxM5jyTzW5t0ewh1ZGtw==
=bA38
-----END PGP SIGNATURE-----

--iddd2vffbehamsfe--

