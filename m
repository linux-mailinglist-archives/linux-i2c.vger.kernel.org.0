Return-Path: <linux-i2c+bounces-11748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97361AF0241
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 19:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C984472CB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 17:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F38281370;
	Tue,  1 Jul 2025 17:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HriBBdwv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479A28031D;
	Tue,  1 Jul 2025 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392551; cv=none; b=e3Pj48VFaSrQnd8NXOY5gVo1l7w1h0wPfaoHaRwJ/CtrQ2EhqHy3Yow5Ixqc2lUlPtQbmScuglJ4zHeu7kHk4Snsvq05wQobF2iX3K2D0xG/BpiUzgBPoANDVqw5NG1J6riiqD3jpL+H/FOnuCbrQTaRT+2LiF8ja9PAZ734cpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392551; c=relaxed/simple;
	bh=wNjXDKjq0I6/9yhbTcfL1kL2qUBF2TKpXGL7HuWci6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4+2EjQRHt6lphTGGXoLHlt8iiiJWUFncRfErh2A1VjTMj/rCZODSBYjLMXqZgvYlBY2MRWByVJE9JTC1U5yAP6z7l0RpfG3Sh7G8liatF/nCZKy4wrvm84Ewd5AJepuZ1aAWRGojGvGTP2mgoIJRk0Fqew4oT32pnJbrawwiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HriBBdwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A38C4CEEB;
	Tue,  1 Jul 2025 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751392550;
	bh=wNjXDKjq0I6/9yhbTcfL1kL2qUBF2TKpXGL7HuWci6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HriBBdwvDpiR3MqtXKwPsYZ1oyhJc4LuNhlhGwLR9DueVpFhqgxh0iifGRF8evW5b
	 JkSKN6s2pXENJuY4L7jw9EN0o02oGOqxbejPJl98m6f7SgO53gilTl2QYWbDazLHJG
	 GMk+QoES7HtD/8pJ/jE4gIULQYzcfilklDsIvNLqEXk8jjIvhTDISALb6F1T5xkyuV
	 2ceg8TIweRtzrpnnwxZfvr4CfQb7JsO9KTeLrZbTN2IdbDo0841Ct19ICweXdr48Es
	 os2K+GpqIeRuS8b0lEvHCyatYjQShJnNz4T08zfYD8j5YgIEEztxJptyVRDDkHG/JJ
	 xDnujlxhZfnhA==
Date: Tue, 1 Jul 2025 18:55:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>, William Breathitt
 Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker
 <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>,
 Crt Mori <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen
 <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown
 <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
 <bvanassche@acm.org>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Souradeep Chowdhury
 <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, kernel@axis.com,
 linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 imx@lists.linux.dev, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <20250701185519.1410e831@jic23-huawei>
In-Reply-To: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
References: <pnd7c0s6ji2.fsf@axis.com>
	<ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jul 2025 19:44:17 +0200
Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> wrote:

> Hello,
>=20
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> >  drivers/pwm/pwm-meson.c                          | 3 +-- =20
>=20
> Looking at this driver I tried the following:
>=20

Hi Uqe,

I'm not sure what we actually want here.

My thought when suggesting removing instances of this
particular combination wasn't saving on code size, but rather just
general removal of pointless code that was getting cut and
paste into new drivers and wasting a tiny bit of review bandwidth.
I'd consider it bad practice to have patterns like

void *something =3D kmalloc();
if  (!something)
	return dev_err_probe(dev, -ENOMEM, ..);

and my assumption was people would take a similar view with
devm_add_action_or_reset().

It is a bit nuanced to have some cases where we think prints
are reasonable and others where they aren't so I get your
point about consistency.

The code size reduction is nice so I'd not be against it as an extra
if the reduction across a kernel builds is significant and enough
people want to keep these non printing prints.

Jonathan


> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3809baed42f3..58a2ab74f14c 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5062,7 +5062,7 @@ static void __dev_probe_failed(const struct device =
*dev, int err, bool fatal,
>   *
>   * Returns @err.
>   */
> -int dev_err_probe(const struct device *dev, int err, const char *fmt, ..=
.)
> +int _dev_err_probe(const struct device *dev, int err, const char *fmt, .=
..)
>  {
>  	va_list vargs;
> =20
> @@ -5075,7 +5075,7 @@ int dev_err_probe(const struct device *dev, int err=
, const char *fmt, ...)
> =20
>  	return err;
>  }
> -EXPORT_SYMBOL_GPL(dev_err_probe);
> +EXPORT_SYMBOL_GPL(_dev_err_probe);
> =20
>  /**
>   * dev_warn_probe - probe error check and log helper
> diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
> index eb2094e43050..23ef250727f1 100644
> --- a/include/linux/dev_printk.h
> +++ b/include/linux/dev_printk.h
> @@ -275,7 +275,13 @@ do {									\
>  	WARN_ONCE(condition, "%s %s: " format, \
>  			dev_driver_string(dev), dev_name(dev), ## arg)
> =20
> -__printf(3, 4) int dev_err_probe(const struct device *dev, int err, cons=
t char *fmt, ...);
> +__printf(3, 4) int _dev_err_probe(const struct device *dev, int err, con=
st char *fmt, ...);
> +
> +#define dev_err_probe(dev, err, ...) (								\
> +	(__builtin_constant_p(err) && err =3D=3D -ENOMEM) ? err : _dev_err_prob=
e(dev, err, __VA_ARGS__)	\
> +)
> +
> +
>  __printf(3, 4) int dev_warn_probe(const struct device *dev, int err, con=
st char *fmt, ...);
> =20
>  /* Simple helper for dev_err_probe() when ERR_PTR() is to be returned. */
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index ae696d10faff..abfa5152b5a7 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -157,8 +157,11 @@ static inline int __devm_add_action_or_reset(struct =
device *dev, void (*action)(
>  	int ret;
> =20
>  	ret =3D __devm_add_action(dev, action, data, name);
> -	if (ret)
> +	if (ret) {
> +		if (ret !=3D -ENOMEM)
> +			__builtin_unreachable();
>  		action(data);
> +	}
> =20
>  	return ret;
>  }
>=20
> With that
>=20
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to add clk_put action\n");
>=20
> from drivers/pwm/pwm-meson.c is optimized to
>=20
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return ret;
>=20
> .
>=20
> I would prefer this approach, because a) there is no need to drop all
> dev_err_probe()s after devm_add_action_or_reset() and b) the
> dev_err_probe()s could stay for consistency in the error paths of a
> driver.
>=20
> Best regards
> Uwe


