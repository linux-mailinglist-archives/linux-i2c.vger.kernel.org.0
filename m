Return-Path: <linux-i2c+bounces-9924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E84A69CF9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4527A8E41
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 23:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC1A224AE6;
	Wed, 19 Mar 2025 23:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEs3QJCh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034F1DE3A9;
	Wed, 19 Mar 2025 23:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428693; cv=none; b=Ndoj6luz0+1V47TvDMU8A9SAhUnYbgXrpXC19oLWh9GppfgWp5VrRNgheaQhZuf9tOGi9jxFAa0HPGJisqeDTLXSGpHJztfgCo67nL91WwwLMYVyOuGNLFCUUZn781S2EEPaxJ6NWN+Mi7BgGsMtAJIE5RKenp32LrKBodwB+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428693; c=relaxed/simple;
	bh=ZZKfA84RzRDEAliz95nfjz5QwDog7cyZVSrWYTw/zI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXLJj2x84gKvXdTOhljDJhSM5yr7bzeu76svY0Y1Q2dmiB6q9DJqFoC+K5wFpieUB20t80s0PX4Cg8cnWTxkCn76rYVsxjdcbCoXQQ32Ps/0IjVz5w39AWPna44nrdh4cPP9c1i4c+fEM439NUGZozmDZtzA808PA8yManRo5D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEs3QJCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458ACC4CEE4;
	Wed, 19 Mar 2025 23:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742428692;
	bh=ZZKfA84RzRDEAliz95nfjz5QwDog7cyZVSrWYTw/zI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEs3QJChJFcdnPOHTauCmOrZ6IULAT7ZHAPKR4zUQKWpU4fVfq9xjjqMYvsI+BjnY
	 tGhOwI9ScxsMy66k/+abaRY04I7+m9j1tjEdH9fAhcXCSi4LivrGhOBfVFXXTzlwMI
	 p6De/RCvhON6CzIS0tGTyTbJuvO/FmRVGYyS9qC2+lu2dN/kngG4jI+E5IYPUo5gkM
	 HheOzDF+CuZXuwayiJHFY7XfsiLvcbIecQPzGP0Uq9g85V4ym5K4eDIuM35vhUNiP3
	 c/51O56HdxpGl/vDaGjSfPHxwvJ+8zacziTn2x/482i+A/8y3atJDVk6Ur1lsSqNve
	 C0gP39TapTPrQ==
Date: Thu, 20 Mar 2025 00:58:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 3/7] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <jpaqx2z5io2bvtluexnzrkz4zcvea7qqgpa6bdhm4yzby2rjgb@izncuolmv7tl>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-4-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225081644.3524915-4-a0282524688@gmail.com>

Hi Ming,

...

> +enum i2c_baudrate {
> +	I2C_BR_25K = 0,
> +	I2C_BR_50K,
> +	I2C_BR_100K,
> +	I2C_BR_200K,
> +	I2C_BR_400K,
> +	I2C_BR_800K,
> +	I2C_BR_1M
> +};

do we need all these frequencies? I don't see them use anywhere.

Besides, can you please use a proper prefix? I2C_BR_* prefix
doesn't belong to this driver.

Andi

