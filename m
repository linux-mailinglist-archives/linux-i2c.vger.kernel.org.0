Return-Path: <linux-i2c+bounces-708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE080B667
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 21:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2EA61C208E0
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 20:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EE91C29F;
	Sat,  9 Dec 2023 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1ETswpV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863AE541
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 20:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629D2C433C8;
	Sat,  9 Dec 2023 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702155474;
	bh=1ANiy4o/4nNuzVxHGjqWFyAyf+pmY1TAke9fR4OAnbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1ETswpV9364kjAIy+7PkKaYPhnGJc/K8Im8N9JzOErhiWoyC9RMzC8sbv//Ijm0i
	 vpYf23g/mmpAjc2uoZzO1TC+CT8TEviz3UIO1uLgi97nF2nPw0WwtWmEwz/v1C9qzz
	 XS8Es5d2FxPneHhElU6Ldq6mtmn6Dy/rfyoeNRCm8ilKnwQnKSe1SI2Q2r6AZTDlg0
	 7Akm+i+LnAUSxwir0NW6MS36Gf25fLUi79Z7TvAUcNkb1LPgyPNSNrWSHCTxeI6NfL
	 jc/bWjw1jOdZ3rAd1bMON2N32Q19Mx8FjovrdTpZ9d2rxBR4fhAvJty3xLcLNONOqQ
	 szl34ynhQz9kA==
Date: Sat, 9 Dec 2023 21:57:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Add system suspend and resume PM support
Message-ID: <20231209205744.ehmthjvn7nuslvhd@zenone.zhora.eu>
References: <20231209131516.1916550-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209131516.1916550-1-jisheng.teoh@starfivetech.com>

Hi Ji Sheng,

On Sat, Dec 09, 2023 at 09:15:16PM +0800, Ji Sheng Teoh wrote:
> Enable device system suspend and resume PM support, and mark the device
> state as suspended during system suspend to reject any data transfer.
> 
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
> Changes since v1:
> - Add missing err assignment in cdns_i2c_resume().

thanks for the quick version update. However, while it's nice to
see such prompt proactivity, we also need to allow more time for
others to review your change.

Next time, please give it a bit more time before sending out
version 2. :-)

> ---
>  drivers/i2c/busses/i2c-cadence.c | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index de3f58b60dce..4bb7d6756947 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1176,6 +1176,18 @@ static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused cdns_i2c_suspend(struct device *dev)
> +{
> +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&xi2c->adap);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		return cdns_i2c_runtime_suspend(dev);
> +
> +	return 0;
> +}
> +
>  /**
>   * cdns_i2c_init -  Controller initialisation
>   * @id:		Device private data structure
> @@ -1219,7 +1231,28 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused cdns_i2c_resume(struct device *dev)
> +{

I am not really understanding what you are trying to do here:

> +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = cdns_i2c_runtime_resume(dev);

First you try to resume...

> +	if (err)
> +		return err;
> +
> +	if (pm_runtime_status_suspended(dev)) {

... then you check if you are suspended ...

> +		err = cdns_i2c_runtime_suspend(dev);

... and suspend again? Shouldn't this be _resume()?

Thanks,
Andi

> +		if (err)
> +			return err;
> +	}
> +
> +	i2c_mark_adapter_resumed(&xi2c->adap);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops cdns_i2c_dev_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_i2c_suspend, cdns_i2c_resume)
>  	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
>  			   cdns_i2c_runtime_resume, NULL)
>  };
> -- 
> 2.25.1
> 

