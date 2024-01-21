Return-Path: <linux-i2c+bounces-1393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 647108357C2
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Jan 2024 21:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EB84B218AF
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Jan 2024 20:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16479381DC;
	Sun, 21 Jan 2024 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLGeSNd+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81471EB52;
	Sun, 21 Jan 2024 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705869321; cv=none; b=T2AWSeqmE8P1pRielDfnwMtn7nm9H5lp+EuG9hSrUWUTnUsUN4h2zsYEIydmWZ1Bw40DXb7Am49Y7vmAoAhEjTddwa+7XxnaqlI3vkZt6G345wMkJD1sYy+ymUsUib9VyIaFKYde1jNvq4g7BugtWUMwVbW45NkG1eBYbdKEiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705869321; c=relaxed/simple;
	bh=kju28fnm0YhQwAXc8auDx07XfLJgrU+ex3+0la1SOE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6tBjcc6QVvA6NhhFksPDmmsftzwInDJ4X47euhxCuAuGGZunG1x6SOv62f5IwLJEtv7e+XDIkLJHUSGZgAI3RmhPcAxSkY/0k8/mB/z34GnZQC9InQik3gHVMVg2ygQemD7acwOEj/v7gaxMJz/5KB6gKWtWm/V2o2Xl7zMlfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLGeSNd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C26CC433F1;
	Sun, 21 Jan 2024 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705869321;
	bh=kju28fnm0YhQwAXc8auDx07XfLJgrU+ex3+0la1SOE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLGeSNd+NTi5H2HTjAtyYNDWRZhNjUJpyn5xCGixeCn2GYeEVhsyNHa+Nv3z3HN4d
	 FnRWlVtTKbC8LXXnkBjZS0pV781PM2sN9MLZ6QOcKVkNRYSibsCdVXD0CsW+g9mnk3
	 Am6QEYQS37sEzgOWynSfZP40QxoNX20+6fTHMz30LA9NlKw6z6CZ+fIZYL7+FZ8xrJ
	 5BUqlzv6inLsdFaIwmm0HOMuGRTdbSKqeCyNDoNhRqSDUrdtH4F5J7yAerpr/WeEiG
	 Bs82ee2fRHvMFNXOdg6DEuiy2eV238he/HJ4ZrgYClDAjoKz8uQ/mvp5u0UY7RgOhQ
	 auKFQbfx+xlbg==
Date: Sun, 21 Jan 2024 21:35:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Michal Simek <michal.simek@amd.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Message-ID: <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>

Hi Ji Sheng,

I'm not fully conviced here.

On Fri, Jan 19, 2024 at 09:33:26AM +0800, Ji Sheng Teoh wrote:
> Enable device system suspend and resume PM support, and mark the device
> state as suspended during system suspend to reject any data transfer.
> 
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
> Initial v2 was archived, previous discussion can be found in [1].
> [1]: https://lore.kernel.org/all/20231209131516.1916550-1-jisheng.teoh@starfivetech.com/
> 
> Changes since v1:
> - Add missing err assignment in cdns_i2c_resume().
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

this should go before the return '0' after checking that
cdns_i2c_runtime_suspend(), even though we know it always returns
'0', we still can use likely or unlikely.

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
> +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = cdns_i2c_runtime_resume(dev);
> +	if (err)
> +		return err;
> +
> +	if (pm_runtime_status_suspended(dev)) {
> +		err = cdns_i2c_runtime_suspend(dev);
> +		if (err)
> +			return err;

We call the cdns_i2c_resume() functions to come up from a
suspended state. But, if we fail to resume, we call the suspend
and return '0' (because this always returns '0').

In other words, if we take this path, we call resume, but we
still end up suspended and return success.

Andi

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
> 2.43.0
> 

