Return-Path: <linux-i2c+bounces-1110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF6824035
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 12:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C516B24622
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F02210ED;
	Thu,  4 Jan 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdCVG4B3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95C210E1;
	Thu,  4 Jan 2024 11:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF52C433C7;
	Thu,  4 Jan 2024 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704366296;
	bh=iYIXWFcyvfJ4RuPN+ihhCi5AWNrSC9flkhBX8xC/WZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdCVG4B32fTqPy/GblbVN4TJxup14rRCQw+QTcbO+paPAjEMmlPodY2duJsiT97C4
	 5X0Bn8bwccFskbNV8dBFmtfJJ9TZ0nhteO5313s4sXRzYUJYQMmXhRpwNqo+C9wYlY
	 7lcEcy9aeXaA9uVyhM9bfNls3WLDwI/yolnjR5Zzz86rstkD41MZgPdrsMAGLW/0zN
	 pbvWeLONeDbkqJHAukPSzsO/d12ysOcZxfUrcXEYuN6mVf8lilYbq/NKzw6KbdbsR6
	 Dd5jAwkfYMUTvzhWOgXNAtRYu8nmKRhSJeenXcQPBMyGgSN/BkeP0fHbLRSwAVkm32
	 5N5NvzlBICuqQ==
Date: Thu, 4 Jan 2024 12:04:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Elad Nachman <enachman@marvell.com>
Cc: gregory.clement@bootlin.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cyuval@marvell.com
Subject: Re: [PATCH v3 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Message-ID: <qki2w47cfu74j6tuwz363wgsleypbkgkejtzbk7zfktjxlbmqp@h3cejf2gnccb>
References: <20231213151312.1165115-1-enachman@marvell.com>
 <20231213151312.1165115-2-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213151312.1165115-2-enachman@marvell.com>

Hi Elad,

first of all it's very nice to see code so well documented :-)

Thanks for the effort you put in it.

...

> +	/*
> +	 * Start with arbitration lost soft reset enabled as to false.
> +	 * Try to locate the necessary items in the device tree to
> +	 * make this feature work.
> +	 * Only after we verify that the device tree contains all of
> +	 * the needed information and that it is sound and usable,
> +	 * then we enable this flag.
> +	 * This information should be defined, but the driver maintains
> +	 * backward compatibility with old dts files, so it will not fail
> +	 * the probe in case these are missing.
> +	 */
> +	drv_data->soft_reset = false;
> +	pc = pinctrl_get(&pd->dev);

I'm not against using devm_pinctrl_get(), in my previous comments
I was questioning whether it should be placed in the probe
function (as you did).

Placed there, iirc, it needed explicit release. Here, I don't
think it does if you use the managed version.

> +	if (!IS_ERR(pc)) {
> +		drv_data->pc = pc;
> +		drv_data->i2c_mpp_state =
> +			pinctrl_lookup_state(pc, "default");
> +		drv_data->i2c_gpio_state =
> +			pinctrl_lookup_state(pc, "gpio");
> +		drv_data->scl_gpio =
> +			of_get_named_gpio(pd->dev.of_node, "scl-gpios", 0);
> +		drv_data->sda_gpio =
> +			of_get_named_gpio(pd->dev.of_node, "sda-gpios", 0);

please use devm_gpio_get(...).

> +		if (!IS_ERR(drv_data->i2c_gpio_state) &&
> +		    !IS_ERR(drv_data->i2c_mpp_state) &&
> +		    gpio_is_valid(drv_data->scl_gpio) &&
> +		    gpio_is_valid(drv_data->sda_gpio)) {

...

> +	if (!IS_ERR(drv_data->pc))
> +		pinctrl_put(drv_data->pc);
> +	if (drv_data->soft_reset) {
> +		devm_gpiod_put(drv_data->adapter.dev.parent,
> +			       gpio_to_desc(drv_data->scl_gpio));
> +		devm_gpiod_put(drv_data->adapter.dev.parent,
> +			       gpio_to_desc(drv_data->sda_gpio));

if it's managed it doesn't need to be explicitely removed.

Thanks,
Andi

