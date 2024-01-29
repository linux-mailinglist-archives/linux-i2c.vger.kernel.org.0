Return-Path: <linux-i2c+bounces-1512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD98415F7
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F8AAB22DDC
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 22:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B8250A6B;
	Mon, 29 Jan 2024 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkQd5Mmf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3551D4F1F5;
	Mon, 29 Jan 2024 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706568516; cv=none; b=MKFdQYI40BAen8HCOJbvegK9n3pGJoftXaQ638sa/s2Ghq1GWA0NqXwZuqQvVzaky4BUzhBuEXMOpKNzKSCUbzJZcxAi/xW5BTG+U85kMM8g6DkYfqQkwQwlgYCd5FW4k1S85x503GpdaUU8CYFVSexxtpfEnfSHZUIs5dV0Oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706568516; c=relaxed/simple;
	bh=kVVU8d5o65JZFsimVCb2pBkQsxY72Ge4/C4lukxkvOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHvnQMVciC555M5G2VYcGXv+aNQ4eAOL9FmRbi+8Iqrhfyl7JHLbUxhG+/yO9emegN97pRHtoguTLGSmVhx6I4Z+tbDht4biLWkmGvoFTO2hrlTohQIKmuRk0uILfrvRl59YKUrJMgsEWRJc31HDyxFRHbBwM6d6X2tGDcKIaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkQd5Mmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3B2C433C7;
	Mon, 29 Jan 2024 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706568515;
	bh=kVVU8d5o65JZFsimVCb2pBkQsxY72Ge4/C4lukxkvOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkQd5MmfZEazNpa5yxrTCMe6/ENEkMSEWwyRORyr4/kRiCZ1zI5Rg0F0pJ4TStpyV
	 5YGPyR/c3WBcnr2Kxsr4Nb8MFEUyZR36dsCmM8159BbeWiGVLDATkTWfSBlC1YjMjP
	 +FAbIXkMdDdB7Srf7KKBSr54jCy6KQOU20r3vlo7wfSWJnzWbM195ITmc6bCzpYA7m
	 R1XpQ8EEUkrCkIUFNr9uUTWcGsj229dcYhui52WQvik92HvnVttz4MqqHpRZLwz24x
	 l5/OKmYnZ3o36W5AitPDJRGIlyNhzdfOQGNXpTnWeGQBOKtd9TanUZpJAi2v1LYYkO
	 cC9C0dJqSjBLw==
Date: Mon, 29 Jan 2024 23:48:27 +0100
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
Subject: Re: [PATCH v2 03/15] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <hqnxyffdsiqz5t43bexcqrwmynpjubxbzjchjaagxecso75dc7@y7lznovxg3go>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-3-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v2-3-8e4f7d228ec2@bootlin.com>

Hi Thomas,

On Fri, Jan 26, 2024 at 03:36:45PM +0100, Thomas Richard wrote:
> A device may need the controller up during suspend_noirq() or
> resume_noirq().
> But if the controller is autosuspended, there is no way to wakeup it during
> suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> time.
> 
> The suspend() callback wakes up the controller, so it is available until
> its suspend_noirq() callback (pm_runtime_force_suspend()).
> During the resume, it's restored by resume_noirq() callback
> (pm_runtime_force_resume()). Then resume() callback enables autosuspend.
> 
> So the controller is up during a little time slot in suspend and resume
> sequences even if it's not used.

Looks good, can I ask you to put this in a comment below? It's
not completely straight forward.

Thanks,
Andi

> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-omap.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 42165ef57946..cc9841cb08f1 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1575,9 +1575,23 @@ static int __maybe_unused omap_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int omap_i2c_suspend(struct device *dev)
> +{
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
>  	SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
>  			   omap_i2c_runtime_resume, NULL)
>  };
> 
> -- 
> 2.39.2
> 

