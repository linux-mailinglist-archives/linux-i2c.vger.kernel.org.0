Return-Path: <linux-i2c+bounces-3020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B388AAACC
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 10:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F221F22226
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 08:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C706EB41;
	Fri, 19 Apr 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNRP7gv4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68871E4BE;
	Fri, 19 Apr 2024 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516428; cv=none; b=lRNX/MI8uvKQVWy8NoHc0dgzeIzosyJLdqzs0kipVIwVLI5tXPbGAPXevJTfn2IWrkBVvSuTcVPputBzAImLd45braCKqsRUvHPRYYhut3EHd7FQ22Za8HWoFN3pW+JleyCCS5J6koVbzUccgqNrZvIi+JEf6DHjNq3qjaixM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516428; c=relaxed/simple;
	bh=JMeqt/5R/X4ObeTie5ZZL2cEEJlLOQITn5aJcjiO5xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hr+hRNFETC/8IL6IEYvlUb+GHwKogAzdFT98d4S7ozlHC6VfpwG9DCGgD29kTJMi4ueV9MG0vPXyqnzzuKYfUrPaUvERpnHBCeOzOQ/r6Jpm6QxPee60mDb80N4GTUs0pzH4CWuhdDaGb7kEVYdvGM4s5m+9WFZU+KwB0DfkT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNRP7gv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7B3C072AA;
	Fri, 19 Apr 2024 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713516428;
	bh=JMeqt/5R/X4ObeTie5ZZL2cEEJlLOQITn5aJcjiO5xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNRP7gv4zpvIDLVA6xhX7CxYZWDeV+CQJyPorxrIuZsEvZ2b6d8UOWD1aPQUwe1jR
	 hwyjW4qE3KT8wa+MDpguSeQr+XGI/Xf/51zvT7mXKyUmjlngFcKJgZDoEYGpRtX1wR
	 PcreBNXDbbY7k/AZysJfwNWKY8ZBcWbveoTnTXCMYpd3Ck3PidHWtELXSakSWR4qui
	 JYaXXEZq3I0sROMMP+SCMyixZBjKZXwVkiwo+XaLddiuWFunYl/lyMGmTnV2VSW7UH
	 moyB6IielIcUXx1jOkPTzueokbZN77sRvvjdr1ttXYM5+mF6yDzGQHmq0j9VT4Xhdg
	 B8f97vxlGOP7g==
Date: Fri, 19 Apr 2024 10:47:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Peter Rosin <peda@axentia.se>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v5 02/11] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <eld637v3jvgqrjubwqlsxkafgqiqcfpukfwpcd5qoyvyrhubff@n6gzrwzr2klh>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@bootlin.com>

Hi Thomas,

> +static int omap_i2c_suspend(struct device *dev)
> +{
> +	/*
> +	 * If the controller is autosuspended, there is no way to wakeup it once
> +	 * runtime pm is disabled (in suspend_late()).
> +	 * But a device may need the controller up during suspend_noirq() or
> +	 * resume_noirq().
> +	 * Wakeup the controller while runtime pm is enabled, so it is available
> +	 * until its suspend_noirq(), and from resume_noirq().
> +	 */
> +	return pm_runtime_resume_and_get(dev);
> +}
> +
> +static int omap_i2c_resume(struct device *dev)
> +{
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops omap_i2c_pm_ops = {
>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  				      pm_runtime_force_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)

If you don't have CONFIG_PM_SLEEP, though, this doesn't compile.

Andi

