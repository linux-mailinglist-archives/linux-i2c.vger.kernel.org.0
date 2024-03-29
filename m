Return-Path: <linux-i2c+bounces-2677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E121F89266F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 22:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F3F01C21428
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 21:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C613D252;
	Fri, 29 Mar 2024 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKdsPb2U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C813CFB6;
	Fri, 29 Mar 2024 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749280; cv=none; b=TBvw4HgdvNM6TLbX63gtHYuMclrKSoD+EQa8k9z6ovD7BghszI7JzXFFxBy5MGRpbQTCNhHlwC6SkwobEakLC9lsq87T8Hi0s/lboB59edOqWWIxwQJ67qkEcHzfiIS3vW5VkLyS15tM244YVbjLBenK27QS8ls4FEkMEiaHahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749280; c=relaxed/simple;
	bh=Yn8bzggNIrMa+0R7bvxUaO/IzMm910e79pkJIvx8Hnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKRTpClhAqfwGsFSPez5rabrricXyBvdVqGjpBpyIqVfdkySdj+6McU5/DACG5XBLDcF1UNiS6i5nBcRClElpZOxm4i5Ek/YQ2ETDBYbiRxkV0KS5JZwMhC3iH7M+vjL2lroUY/exhu4gr/0HfwadBwPLSgWQWsARg13GGotOms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKdsPb2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C83AC433C7;
	Fri, 29 Mar 2024 21:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711749280;
	bh=Yn8bzggNIrMa+0R7bvxUaO/IzMm910e79pkJIvx8Hnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKdsPb2UFJgihUWr17wPQxP+Tdvkpf4bKqJLLWHNAyUl0/HqzhCd9qeckgyPi1nOo
	 7W8VcGKAWIiVHrlXZWYYRfTokXIvJSK01h9pS04Bh1mJSEWAD3XfgLNbn8o5sHzj1k
	 P6se1H4guq5J368QwdB1F2PQeeLT0cMYSjNbP4X/YjhY/LHZAzeYILF7qumb4ZmBn6
	 7QaCUBWMkHrTJWZwB9UU5CLzshD+G+z+6oPukZ6IcpO7jSSA1BF7aOLNLihf0TVwvL
	 C/4ozm4iw8yElwUMdTExrFHw+vegnhd9jR2LjY53D0IzRTQXNKFOxFYxdcpiokpJg7
	 ZqvzoQUWSf/8Q==
Date: Fri, 29 Mar 2024 22:54:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	quic_vdadhani@quicinc.com, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <j5zai7pw7pxe2owjsoq2ncwhsmwe2llmcvb7vp46xi757eamub@inefovgffgpp>
References: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

On Thu, Mar 28, 2024 at 06:07:43PM +0530, Mukesh Kumar Savaliya wrote:
> pm_runtime_get_sync() function fails during PM early resume and returning
> -EACCES because runtime PM for the device is disabled at the early stage
> causing i2c transfer to fail. Make changes to serve transfer with force
> resume.
> 
> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>    to avoid timeout of transfer when IRQ is not enabled during early stage.
> 2. Do force resume if pm_runtime_get_sync() is failing after system
>    suspend when runtime PM is not enabled.
> 3. Increment power usage count after forced resume to balance
>    it against regular runtime suspend.
> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Is this a fix? O mostly an improvement?

...

>  	gi2c->err = 0;
>  	reinit_completion(&gi2c->done);
> -	ret = pm_runtime_get_sync(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
> -		pm_runtime_put_noidle(gi2c->se.dev);
> -		/* Set device in suspended since resume failed */
> -		pm_runtime_set_suspended(gi2c->se.dev);
> -		return ret;
> +
> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
> +		dev_dbg(gi2c->se.dev, "RT_PM disabled, Do force resume, usage_count:%d\n",

dev

nit: you could leave a space after the ':'.

> +			atomic_read(&dev->power.usage_count));
> +		ret = geni_i2c_force_resume(gi2c);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret == -EACCES && gi2c->suspended) {
> +			dev_dbg(gi2c->se.dev, "PM get_sync() failed-%d, force resume\n", ret);

dev

> +			ret = geni_i2c_force_resume(gi2c);
> +			if (ret)
> +				return ret;
> +		}

Are we missing some cases here? Do we need a few more else's?

Andi

>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> @@ -702,8 +730,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	else
>  		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>  
> -	pm_runtime_mark_last_busy(gi2c->se.dev);
> -	pm_runtime_put_autosuspend(gi2c->se.dev);
> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_set_suspended(dev);

this looks like repeated code, how about making it a function?

> +		gi2c->suspended = 0;
> +	} else {
> +		pm_runtime_mark_last_busy(gi2c->se.dev);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +	}
> +
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
>  	return ret;
> @@ -820,7 +855,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,

Can you provide a bit more information on how an early interrupt
would be handled once the device is resumed?

Thanks,
Andi

>  			       dev_name(dev), gi2c);
>  	if (ret) {
>  		dev_err(dev, "Request_irq failed:%d: err:%d\n",
> -- 
> 2.25.1
> 

