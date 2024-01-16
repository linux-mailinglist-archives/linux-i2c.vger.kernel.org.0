Return-Path: <linux-i2c+bounces-1332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8F82F146
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 16:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2227C1C2361F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 15:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1B11C291;
	Tue, 16 Jan 2024 15:19:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193861BF5D
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD3-0000to-Uy; Tue, 16 Jan 2024 16:18:37 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD0-000Gxq-M0; Tue, 16 Jan 2024 16:18:34 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rPlD0-000D8R-1w;
	Tue, 16 Jan 2024 16:18:34 +0100
Message-ID: <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>,  Takashi
 Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
Date: Tue, 16 Jan 2024 16:18:34 +0100
In-Reply-To: <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
	 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
> From: Chris Packham <chris.packham@alliedtelesis.co.nz>
>=20
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20240108041913.7078-1-chris.packham@allie=
dtelesis.co.nz
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> If previous patches are fine, then this commit is independent and could
> be taken via I2C.
>=20
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Sean Anderson <sean.anderson@seco.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-=
mux-pca954x.c
> index 2219062104fb..1702e8d49b91 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>  #include <linux/pm.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/mux/mux.h>
> @@ -102,6 +103,9 @@ struct pca954x {
>  	unsigned int irq_mask;
>  	raw_spinlock_t lock;
>  	struct regulator *supply;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct reset_control *reset_cont;
>  };
> =20
>  /* Provide specs for the MAX735x, PCA954x and PCA984x types we know abou=
t */
> @@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *client, s=
truct pca954x *data)
>  	return ret;
>  }
> =20
> +static int pca954x_get_reset(struct device *dev, struct pca954x *data)
> +{
> +	data->reset_cont =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(data->reset_cont))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
> +				     "Failed to get reset\n");
> +	else if (data->reset_cont)
> +		return 0;
> +
> +	/*
> +	 * fallback to legacy reset-gpios
> +	 */

devm_reset_control_get_optional_shared() won't return NULL if the
"reset-gpios" property is found in the device tree, so the GPIO
fallback is dead code.

> +	data->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HI=
GH);
> +	if (IS_ERR(data->reset_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
> +				     "Failed to get reset gpio");
> +	}
> +
> +	return 0;
> +}
> +

regards
Philipp

