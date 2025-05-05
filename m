Return-Path: <linux-i2c+bounces-10773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBEAA97EE
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 17:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523EF3B257F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40EF25DAF7;
	Mon,  5 May 2025 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZaLBubJ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2425CC62;
	Mon,  5 May 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460225; cv=none; b=JFt578GEKCJgT6/RsxGnP0wWy11pBbcCt7dZhWNZUlAjAI4UP+ZeevS2rZe2rh7iuX1ZUv8orOxCQaFmG+aop9RIFpTwlcQzoI94yLhfFWmOqQpfN9ZhSjH4wBDwQMQY+QDM+HWq71rRjlT+sWMlINSF5PWBHtcZGeHa7RsOnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460225; c=relaxed/simple;
	bh=Cbsoh4Uw0hD0/tALTmVoaHPEZyTMbw7GsjqgHc7xcpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ae3LtHG1uSZ0ABz8yBxApKQNVAQNrbqSFAKUJery84DYBP1okq1+foQMUwmMEPFOn2PqYo/qfqQ+e+rctu3s0y/aST9/XQZVyvyTec37Wjivcq/Uhot0YjF2jnydtOpGyM68pJ7PK4DPbqEzp+ykdRFRFklne7HZjUBdbwB5YAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZaLBubJ1; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BB0543B7B;
	Mon,  5 May 2025 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746460215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qBWcU+IHamVJ+m1U9T21TS2ncbZeyp+fhHcbvFdxgs=;
	b=ZaLBubJ1FtJ8ys2W21kEco2AjDCz9ymC2RIpBRL1XbhwsK7FOnMKuv1tyU8OntXiTPNoci
	gWyTLc36nug1NGexsZ5XogiIcPkOkQ5+q0ZNrz2xZhNW2lErKuBnd+JJJz4oe44c3wxfBO
	TQlLrMYU1Ml7fT9zJMvL+O5OtTYlXygL+svsefRY1eQnHvUN1HexnMZIlaK/+vPgRwoKPD
	ANIOFBFT52YGuibFYfhiB6diL2gmtwY6CEZw0MNCBw/XX67bKl7jMnQnOhFe8AHEtUV9tw
	G2WaZcurXfMVbvratiKXYtXIe8tCqg5PVarluuuYynjRgx63gKP24wAGCmInqg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 7/9] i2c: atr: add flags parameter to i2c_atr_new()
Date: Mon, 05 May 2025 17:50:14 +0200
Message-ID: <6198924.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <20250428102516.933571-8-demonsingur@gmail.com>
References:
 <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-8-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5053600.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeipdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5053600.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Mon, 05 May 2025 17:50:14 +0200
Message-ID: <6198924.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <20250428102516.933571-8-demonsingur@gmail.com>
MIME-Version: 1.0

On Monday, 28 April 2025 12:25:12 CEST Cosmin Tanislav wrote:
> In preparation for adding multiple flags that change the behavior,
> add a flags parameter to i2c_atr_new() and an i2c_atr_flags enum.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c         |  6 +++++-
>  drivers/media/i2c/ds90ub960.c |  2 +-
>  drivers/misc/ti_fpc202.c      |  2 +-
>  include/linux/i2c-atr.h       | 10 +++++++++-
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 7214a59ddf15..e2350fcf3d68 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -106,6 +106,7 @@ struct i2c_atr_chan {
>   * @lock:      Lock for the I2C bus segment (see &struct
> i2c_lock_operations) * @lock_key:  Lock key for @lock
>   * @max_adapters: Maximum number of adapters this I2C ATR can have
> + * @flags:     Flags for ATR
>   * @alias_pool: Optional common pool of available client aliases
>   * @i2c_nb:    Notifier for remote client add & del events
>   * @adapter:   Array of adapters
> @@ -122,6 +123,7 @@ struct i2c_atr {
>  	struct mutex lock;
>  	struct lock_class_key lock_key;
>  	int max_adapters;
> +	u32 flags;
> 
>  	struct i2c_atr_alias_pool *alias_pool;
> 
> @@ -703,7 +705,8 @@ static int i2c_atr_parse_alias_pool(struct i2c_atr *atr)
> }
> 
>  struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
> -			    const struct i2c_atr_ops *ops, int max_adapters)
> +			    const struct i2c_atr_ops *ops, int max_adapters,
> +			    u32 flags)
>  {
>  	struct i2c_atr *atr;
>  	int ret;
> @@ -725,6 +728,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent,
> struct device *dev, atr->dev = dev;
>  	atr->ops = ops;
>  	atr->max_adapters = max_adapters;
> +	atr->flags = flags;
> 
>  	if (parent->algo->master_xfer)
>  		atr->algo.master_xfer = i2c_atr_master_xfer;
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 869e32bd07e8..6f475bae94b3 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -1122,7 +1122,7 @@ static int ub960_init_atr(struct ub960_data *priv)
>  	struct i2c_adapter *parent_adap = priv->client->adapter;
> 
>  	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
> -				priv->hw_data->num_rxports);
> +				priv->hw_data->num_rxports, 0);
>  	if (IS_ERR(priv->atr))
>  		return PTR_ERR(priv->atr);
> 
> diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
> index b9c9ee4bfc4e..f7cde245ac95 100644
> --- a/drivers/misc/ti_fpc202.c
> +++ b/drivers/misc/ti_fpc202.c
> @@ -349,7 +349,7 @@ static int fpc202_probe(struct i2c_client *client)
>  		goto disable_gpio;
>  	}
> 
> -	priv->atr = i2c_atr_new(client->adapter, dev, &fpc202_atr_ops, 2);
> +	priv->atr = i2c_atr_new(client->adapter, dev, &fpc202_atr_ops, 2, 0);
>  	if (IS_ERR(priv->atr)) {
>  		ret = PTR_ERR(priv->atr);
>  		dev_err(dev, "failed to create i2c atr err %d\n", ret);
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 1c3a5bcd939f..5082f4dd0e23 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -18,6 +18,12 @@ struct device;
>  struct fwnode_handle;
>  struct i2c_atr;
> 
> +/**
> + * enum i2c_atr_flags - Flags for an I2C ATR driver
> + */
> +enum i2c_atr_flags {
> +};
> +
>  /**
>   * struct i2c_atr_ops - Callbacks from ATR to the device driver.
>   * @attach_addr: Notify the driver of a new device connected on a child
> @@ -65,6 +71,7 @@ struct i2c_atr_adap_desc {
>   * @dev:          The device acting as an ATR
>   * @ops:          Driver-specific callbacks
>   * @max_adapters: Maximum number of child adapters
> + * @flags:        Flags for ATR
>   *
>   * The new ATR helper is connected to the parent adapter but has no child
>   * adapters. Call i2c_atr_add_adapter() to add some.
> @@ -74,7 +81,8 @@ struct i2c_atr_adap_desc {
>   * Return: pointer to the new ATR helper object, or ERR_PTR
>   */
>  struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
> -			    const struct i2c_atr_ops *ops, int max_adapters);
> +			    const struct i2c_atr_ops *ops, int max_adapters,
> +			    u32 flags);
> 
>  /**
>   * i2c_atr_delete - Delete an I2C ATR helper.

Thanks!

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart5053600.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgY3jYACgkQ3R9U/FLj
2850Fw/8DOoiXYk742wC63pKljPFQiSFMRxSCr0gaBapcFju4emr9qoc9FJSntG4
b8NLMpGVMaO8nOm27+C97lx+iAcBVWhAQoJLSOFWgPOsBVP1qP1UfOePqt3LWr4r
qC4QmKF3U5BGuxiVN9W9FO1lJaUnmyIf+g5YOm/NwW5FtwOiQPrS5mXFg/GOVn2/
cMeyd4tiB1DWXNFpkZv0sg2asilTciWsAMi2j9ZoPIpr0bniHFzvfbl/kyV2eXsB
fTP9SrrihPiAM1tG8aRGss4bSjsvRWwS6SDsccVwmpmClsJiPXTkfgFa2CeMJmBT
OaeQHTYqRcO/o6gbyRbvinNuJxJ4YMGI1dysCQyNi8Ym3Xx+brZaNOzVorPUbELp
CYdwt6jmhishwV3h7h71xhPv9uOs24wXN6pb1QYs4Pq4qKzdHEBS+WF3MZs3IK6h
s2zdeJrZAzbOVcqjsuCsK/JYS10znYQ6cxQ5EeixKdnSTzGuQQYCO/d8TOeytha3
e+HJL1jUTpBKYxss0V/hvg/tYB3vXRZLi72VtKZilFxVECniV13NgH/B3ea5/hCt
idpq3gS8utfYFvVNqEc491+yz4xajvLNOO+bJpj+qJHY74n4r7vlS3TFCcu8DJ/D
rgxT00f8F1DV2t6owgUFUnEJFRUMznqEOxCg6nKxDImh8zxhe3k=
=5V8h
-----END PGP SIGNATURE-----

--nextPart5053600.31r3eYUQgx--




