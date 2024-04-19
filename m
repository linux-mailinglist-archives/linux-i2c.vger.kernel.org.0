Return-Path: <linux-i2c+bounces-3024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94D8AB455
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 19:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B05B1F221F1
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 17:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BE213B780;
	Fri, 19 Apr 2024 17:24:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0D13AD1E;
	Fri, 19 Apr 2024 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547469; cv=none; b=F5ODLpFzV9fA9g1uVskDcZktbh6N08GL76Ihvg9zwnKx96LgcVAXsej0VKCp8LQyDW1Qg86WsGuW5mdmcN245zVwP3KW1V7grtnuXQ636bvt/pRRQkgTOmTV3kQ48gJYc2KJhIILTM9K4o2HrTWFM6xgqz4WAjYuR2vi98j4In4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547469; c=relaxed/simple;
	bh=TATDmTElaYBpAYch8soSPQH6hF0nZrDGpo42zohaAmw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aqjA0VdqX8dLwHE+FO/DlGQrZWL+fGnx81wMeYAXxy6BrmGcM5iC51rXnpSQfY23oxDhiHkRb492gZqDO0YpfXu8XZ81RdsUV6ZqNieFKEbI1mxCDBJSqjZT3fO0zm5sgUBffiHiMalYQo4e01rfPBdiyeo+EIJxhvwgAeNYOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VLhKM6xwXz67gJd;
	Sat, 20 Apr 2024 01:22:15 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C9B7140AB8;
	Sat, 20 Apr 2024 01:24:22 +0800 (CST)
Received: from localhost (10.48.152.95) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 19 Apr
 2024 18:24:20 +0100
Date: Fri, 19 Apr 2024 18:24:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang
	<wsa@kernel.org>, Peter Rosin <peda@axentia.se>, Peter Korsgaard
	<peter.korsgaard@barco.com>, Michael Hennerich
	<michael.hennerich@analog.com>, Vadim Pasternak <vadimp@nvidia.com>, Michael
 Shych <michaelsh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, Linus
 Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, "Mauro Carvalho Chehab"
	<mchehab@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, "Rob
 Herring" <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, "open
 list:AMD KFD" <dri-devel@lists.freedesktop.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <20240419182419.00001fcc@Huawei.com>
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 18 Apr 2024 22:55:39 +0200
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
> 
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

For iio

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/gpu/drm/bridge/sii902x.c           |  2 +-
>  drivers/i2c/i2c-mux.c                      | 24 +---------------------
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  2 +-
>  drivers/i2c/muxes/i2c-mux-gpio.c           |  2 +-
>  drivers/i2c/muxes/i2c-mux-gpmux.c          |  2 +-
>  drivers/i2c/muxes/i2c-mux-ltc4306.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pca9541.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pca954x.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pinctrl.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-reg.c            |  2 +-
>  drivers/iio/gyro/mpu3050-i2c.c             |  2 +-
>  drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c  |  2 +-
>  drivers/media/dvb-frontends/af9013.c       |  2 +-
>  drivers/media/dvb-frontends/lgdt3306a.c    |  2 +-
>  drivers/media/dvb-frontends/m88ds3103.c    |  2 +-
>  drivers/media/dvb-frontends/rtl2830.c      |  2 +-
>  drivers/media/dvb-frontends/rtl2832.c      |  2 +-
>  drivers/media/dvb-frontends/si2168.c       |  2 +-
>  drivers/media/i2c/max9286.c                |  2 +-
>  drivers/media/usb/cx231xx/cx231xx-i2c.c    |  5 +----
>  drivers/of/unittest.c                      |  2 +-
>  include/linux/i2c-mux.h                    |  3 +--
>  23 files changed, 23 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 8f84e9824..2fbeda902 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1092,7 +1092,7 @@ static int sii902x_init(struct sii902x *sii902x)
>  	}
>  
>  	sii902x->i2cmux->priv = sii902x;
> -	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0);
>  	if (ret)
>  		goto err_unreg_audio;
>  
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 57ff09f18..fda72e8be 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -127,19 +127,6 @@ static u32 i2c_mux_functionality(struct i2c_adapter *adap)
>  	return parent->algo->functionality(parent);
>  }
>  
> -/* Return all parent classes, merged */
> -static unsigned int i2c_mux_parent_classes(struct i2c_adapter *parent)
> -{
> -	unsigned int class = 0;
> -
> -	do {
> -		class |= parent->class;
> -		parent = i2c_parent_is_i2c_adapter(parent);
> -	} while (parent);
> -
> -	return class;
> -}
> -
>  static void i2c_mux_lock_bus(struct i2c_adapter *adapter, unsigned int flags)
>  {
>  	struct i2c_mux_priv *priv = adapter->algo_data;
> @@ -281,8 +268,7 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
>  };
>  
>  int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
> -			u32 force_nr, u32 chan_id,
> -			unsigned int class)
> +			u32 force_nr, u32 chan_id)
>  {
>  	struct i2c_adapter *parent = muxc->parent;
>  	struct i2c_mux_priv *priv;
> @@ -340,14 +326,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  	else
>  		priv->adap.lock_ops = &i2c_parent_lock_ops;
>  
> -	/* Sanity check on class */
> -	if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
> -		dev_err(&parent->dev,
> -			"Segment %d behind mux can't share classes with ancestors\n",
> -			chan_id);
> -	else
> -		priv->adap.class = class;
> -
>  	/*
>  	 * Try to populate the mux adapter's of_node, expands to
>  	 * nothing if !CONFIG_OF.
> diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> index 24168e9f7..7aa6e795d 100644
> --- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> +++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> @@ -167,7 +167,7 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Actually add the mux adapter */
> -	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(muxc, 0, 0);
>  	if (ret)
>  		i2c_put_adapter(muxc->parent);
>  
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 0fbb33a3d..d6bbb8b68 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -207,7 +207,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  	for (i = 0; i < mux->data.n_values; i++) {
>  		u32 nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
>  
> -		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
> +		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
>  		if (ret)
>  			goto add_adapter_failed;
>  	}
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index 8305661e1..10d63307b 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -124,7 +124,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
>  			goto err_children;
>  		}
>  
> -		ret = i2c_mux_add_adapter(muxc, 0, chan, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, chan);
>  		if (ret)
>  			goto err_children;
>  	}
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 23766d853..19a7c3709 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -279,7 +279,7 @@ static int ltc4306_probe(struct i2c_client *client)
>  
>  	/* Now create an adapter for each channel */
>  	for (num = 0; num < chip->nchans; num++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, num);
>  		if (ret) {
>  			i2c_mux_del_adapters(muxc);
>  			return ret;
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 4c6ed1d58..3f06aa333 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -154,7 +154,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  
>  	/* Create an adapter for each channel. */
>  	for (num = 0; num < pdata->num_adaps; num++) {
> -		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
> +		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num]);
>  		if (err)
>  			goto virt_reg_failed;
>  	}
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index ce0fb6924..e28694d99 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -314,7 +314,7 @@ static int pca9541_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, muxc);
>  
> -	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(muxc, 0, 0);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index c3f4ff08a..6f8401825 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -644,7 +644,7 @@ static int pca954x_probe(struct i2c_client *client)
>  
>  	/* Now create an adapter for each channel */
>  	for (num = 0; num < data->chip->nchans; num++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, num);
>  		if (ret)
>  			goto fail_cleanup;
>  	}
> diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> index 6ebca7bfd..02aaf0781 100644
> --- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> @@ -151,7 +151,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
>  
>  	/* Do not add any adapter for the idle state (if it's there at all). */
>  	for (i = 0; i < num_names - !!muxc->deselect; i++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, i, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, i);
>  		if (ret)
>  			goto err_del_adapter;
>  	}
> diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
> index 8489971ba..ef765fcd3 100644
> --- a/drivers/i2c/muxes/i2c-mux-reg.c
> +++ b/drivers/i2c/muxes/i2c-mux-reg.c
> @@ -213,7 +213,7 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
>  	for (i = 0; i < mux->data.n_values; i++) {
>  		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
>  
> -		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
> +		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
>  		if (ret)
>  			goto err_del_mux_adapters;
>  	}
> diff --git a/drivers/iio/gyro/mpu3050-i2c.c b/drivers/iio/gyro/mpu3050-i2c.c
> index 52b6feed2..29ecfa6fd 100644
> --- a/drivers/iio/gyro/mpu3050-i2c.c
> +++ b/drivers/iio/gyro/mpu3050-i2c.c
> @@ -72,7 +72,7 @@ static int mpu3050_i2c_probe(struct i2c_client *client)
>  	else {
>  		mpu3050->i2cmux->priv = mpu3050;
>  		/* Ignore failure, not critical */
> -		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0, 0);
> +		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0);
>  	}
>  
>  	return 0;
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> index 410ea39fd..0e03137fb 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> @@ -142,7 +142,7 @@ static int inv_mpu_probe(struct i2c_client *client)
>  		if (!st->muxc)
>  			return -ENOMEM;
>  		st->muxc->priv = dev_get_drvdata(&client->dev);
> -		result = i2c_mux_add_adapter(st->muxc, 0, 0, 0);
> +		result = i2c_mux_add_adapter(st->muxc, 0, 0);
>  		if (result)
>  			return result;
>  		result = inv_mpu_acpi_create_mux_client(client);
> diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
> index a829c8979..5afdbe244 100644
> --- a/drivers/media/dvb-frontends/af9013.c
> +++ b/drivers/media/dvb-frontends/af9013.c
> @@ -1480,7 +1480,7 @@ static int af9013_probe(struct i2c_client *client)
>  		goto err_regmap_exit;
>  	}
>  	state->muxc->priv = state;
> -	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
>  	if (ret)
>  		goto err_regmap_exit;
>  
> diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
> index 263887592..91c71b24c 100644
> --- a/drivers/media/dvb-frontends/lgdt3306a.c
> +++ b/drivers/media/dvb-frontends/lgdt3306a.c
> @@ -2203,7 +2203,7 @@ static int lgdt3306a_probe(struct i2c_client *client)
>  		goto err_kfree;
>  	}
>  	state->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
>  	if (ret)
>  		goto err_kfree;
>  
> diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
> index e0272054f..6c69bcc7a 100644
> --- a/drivers/media/dvb-frontends/m88ds3103.c
> +++ b/drivers/media/dvb-frontends/m88ds3103.c
> @@ -1866,7 +1866,7 @@ static int m88ds3103_probe(struct i2c_client *client)
>  		goto err_kfree;
>  	}
>  	dev->muxc->priv = dev;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>  	if (ret)
>  		goto err_kfree;
>  
> diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
> index 35c969fd2..30d10fe4b 100644
> --- a/drivers/media/dvb-frontends/rtl2830.c
> +++ b/drivers/media/dvb-frontends/rtl2830.c
> @@ -838,7 +838,7 @@ static int rtl2830_probe(struct i2c_client *client)
>  		goto err_regmap_exit;
>  	}
>  	dev->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>  	if (ret)
>  		goto err_regmap_exit;
>  
> diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
> index 601cf45c3..5142820b1 100644
> --- a/drivers/media/dvb-frontends/rtl2832.c
> +++ b/drivers/media/dvb-frontends/rtl2832.c
> @@ -1082,7 +1082,7 @@ static int rtl2832_probe(struct i2c_client *client)
>  		goto err_regmap_exit;
>  	}
>  	dev->muxc->priv = dev;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>  	if (ret)
>  		goto err_regmap_exit;
>  
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> index dae1f2153..26828fd41 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -744,7 +744,7 @@ static int si2168_probe(struct i2c_client *client)
>  		goto err_kfree;
>  	}
>  	dev->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>  	if (ret)
>  		goto err_kfree;
>  
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d685d445c..dfcb3fc03 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -383,7 +383,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
>  	for_each_source(priv, source) {
>  		unsigned int index = to_index(priv, source);
>  
> -		ret = i2c_mux_add_adapter(priv->mux, 0, index, 0);
> +		ret = i2c_mux_add_adapter(priv->mux, 0, index);
>  		if (ret < 0)
>  			goto error;
>  	}
> diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
> index c6659253c..6da8e7943 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
> @@ -567,10 +567,7 @@ int cx231xx_i2c_mux_create(struct cx231xx *dev)
>  
>  int cx231xx_i2c_mux_register(struct cx231xx *dev, int mux_no)
>  {
> -	return i2c_mux_add_adapter(dev->muxc,
> -				   0,
> -				   mux_no /* chan_id */,
> -				   0 /* class */);
> +	return i2c_mux_add_adapter(dev->muxc, 0, mux_no);
>  }
>  
>  void cx231xx_i2c_mux_unregister(struct cx231xx *dev)
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 6b5c36b6a..c8ee866d7 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2815,7 +2815,7 @@ static int unittest_i2c_mux_probe(struct i2c_client *client)
>  	if (!muxc)
>  		return -ENOMEM;
>  	for (i = 0; i < nchans; i++) {
> -		if (i2c_mux_add_adapter(muxc, 0, i, 0)) {
> +		if (i2c_mux_add_adapter(muxc, 0, i)) {
>  			dev_err(dev, "Failed to register mux #%d\n", i);
>  			i2c_mux_del_adapters(muxc);
>  			return -ENODEV;
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 98ef73b7c..1784ac7af 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -56,8 +56,7 @@ struct i2c_adapter *i2c_root_adapter(struct device *dev);
>   * callback functions to perform hardware-specific mux control.
>   */
>  int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
> -			u32 force_nr, u32 chan_id,
> -			unsigned int class);
> +			u32 force_nr, u32 chan_id);
>  
>  void i2c_mux_del_adapters(struct i2c_mux_core *muxc);
>  


