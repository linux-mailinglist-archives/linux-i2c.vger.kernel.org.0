Return-Path: <linux-i2c+bounces-1514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB419841605
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F2252868B9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 22:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A38051C36;
	Mon, 29 Jan 2024 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pK0cD4MA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0D50A60;
	Mon, 29 Jan 2024 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706568850; cv=none; b=HKLoqNunnRFGByOh5WdOJXAVhbZak/G5rhqUA9YlGU2zrIwMVN/vPiv/GFn9k2XUVpJvrY4Vaiq2+YCZcsfTDfwj23XGm2zWhoAkrJKCtrk9INf6tKP3JzHrIMO+9mjQWgdi5siPbF26hl1vxSP3zEwqHisIwx4YJgZh7TX59ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706568850; c=relaxed/simple;
	bh=FFstQCaEVYebwCAk5V39FByioEwYLF/w48Zz+jZSaII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3eND1V3kmy/iUp7PY/2rum+QqZycOZ0V2dh0Z7ovKfzxnyq5zXSDsanXGzxWHRcGZkN9pK+H7nvlsUe3xa0HmZ/wtsmzIFjTVZDUNn+5TK3USMOHhZaY72c1WgBRQdD5+XEITai+ap4DEyrkQP7tY9IosbD17twIlvNWIT0SlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pK0cD4MA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B11EC433C7;
	Mon, 29 Jan 2024 22:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706568850;
	bh=FFstQCaEVYebwCAk5V39FByioEwYLF/w48Zz+jZSaII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pK0cD4MADvaFzA0ck6IPeG52COc8b/urvJi/DKU2XRlElEZ9KresXMpci4SWXtIYi
	 CsjFjzqYZlDBhCJKWSeDpKsHtticcP8LuNVybQYdT9HxLQd/h6QuO1H1/4pCyqTDQ/
	 gmXLjVBvr4E9gsYzpxOpRmcFlEvfgVz3RWf9mhbz9CQ7+BqFOcLtcfb8QCgZkcGyxU
	 ZhfRWt7MiVh5puFO9IFA9U4VzQLkYp6WGLaIfuEgDDhduw6u80kXt6OUmuJPNDZsBx
	 llVsLkgI82ECXkZA0NsQPC/ddz8bGPgR5oh29AMmfuQdHLCxx9rCDHNg3W2pvsSmrB
	 WNzItk1Hv+eIA==
Date: Mon, 29 Jan 2024 23:54:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH v2 04/15] mux: add mux_chip_resume() function
Message-ID: <g2ikrrzfti3qu2n75f4wdrg5hxdvsgwol5uibaem7btksxce3c@vh6qvabzs44p>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>

Hi Thomas,

...

> +/**
> + * mux_chip_resume() - restores the mux-chip state
> + * @mux_chip: The mux-chip to resume.
> + *
> + * Restores the mux-chip state.
> + *
> + * Return: Zero on success or a negative errno on error.
> + */
> +int mux_chip_resume(struct mux_chip *mux_chip)
> +{
> +	int ret, i;

you could put this 'ret' in the innermost indentation part, which
here is inside the 'if (...)' (or inside the 'for (...)' if you
follow Andy's suggestion).

Andi

> +	for (i = 0; i < mux_chip->controllers; ++i) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +
> +		if (mux->cached_state != MUX_CACHE_UNKNOWN) {
> +			ret = mux_control_set(mux, mux->cached_state);
> +			if (ret < 0) {
> +				dev_err(&mux_chip->dev, "unable to restore state\n");
> +				return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mux_chip_resume);

