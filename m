Return-Path: <linux-i2c+bounces-8275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992F9DEEF4
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Nov 2024 05:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED2BCB20E4E
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Nov 2024 04:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A837F13B5B3;
	Sat, 30 Nov 2024 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNm2MA03"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7413A250;
	Sat, 30 Nov 2024 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732940998; cv=none; b=goXZjR1pYvsgxHCuvFBPT8/w4O6/Q4QbEWIbHVYHKJ+4rJqG6L/ep9ai21tkjAPU8FwxWf8V0KDxHvKHD8bQUjvxln+Nzn1MK9Z1YVkRR+04dCyumlEIZUDqjv86mUy+TksaYNk1K48VFstPsvkNAYnVoVYRAYS/9wURJbVa0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732940998; c=relaxed/simple;
	bh=F1joQ4ywVF1V5nKjAMrUs3WswrNpQY62i1s6kb7v7Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1cMOs1idl4ImQIaX08RBLL1XfxnydJFeQqxO3Nq7fEe/POwIti58IG21j/e3ASwCyZuyNe/7kjLXD1SibNS/Lanejfz78lFZdXY4BKmQVfiepdvnbaQHekSfsLtPJS7YO5f5HnRGS94SxipFOA+kxFxiEPd+JWgEw+lUOryFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNm2MA03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A164C4CED3;
	Sat, 30 Nov 2024 04:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732940997;
	bh=F1joQ4ywVF1V5nKjAMrUs3WswrNpQY62i1s6kb7v7Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNm2MA03H9b8RVh5VLTLFXarx3XQGz/j2gLksExWTT3MiyByTOlZwlelwEMfMV+8d
	 CVPboGdKOoKqS+IzG2VqSHVuVmtnB2WyaLpqfsORRvQabDfuPPNhOO05Peg0khKP0x
	 AXdgwmX8xqSZlzPTiyTMXpRZS8VCe3njDAIg+9ySTSu6ZJSv2ta+/aUPbbCxXFW4Xb
	 h4y5Nq9YlrfAQEnnLWBJu+Oi1EHqlVXJZPB7iBoIjypVNSkJ5DhzoygmEucgon9rOf
	 nvWEbE7arM9lyyB4AeSwY6KaQU4pQ7v4ROnDpsDWcqIeqzI5jokeQWFmy482E+TvNt
	 oKd2X3X0H3aUw==
Date: Fri, 29 Nov 2024 22:29:55 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: andi.shyti@kernel.org, quic_bjorande@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <lun7au32tizcahzridtmx2dv3qz6onpnstadla5sf44o7o4my7@s6joggbptwgw>
References: <20241129074742.1844031-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129074742.1844031-1-quic_msavaliy@quicinc.com>

On Fri, Nov 29, 2024 at 01:17:42PM +0530, Mukesh Kumar Savaliya wrote:

Your recipients list is broken because you crafted the arguments list to
git send-email by hand. Please read go/upstream and adopt the b4 tool
for sending patches.

> pm_runtime_get_sync() function fails during PM early resume and returns
> -EACCES because runtime PM for the device is disabled at the early stage
> causing i2c transfer to fail. Make changes to serve transfer with forced
> resume.
> 
> Few i2c clients like PCI OR touch may request i2c transfers during early

What is "PCI OR"? Do you mean "PCI or" (or "PCIe and touch"). I'm not
sure why touch would need access to the I2C bus during early resume.

> resume stage. Any i2c client can keep transfer request very early resume
> stage like noirq phase of PM. To serve the transfer, register an interrupt
> with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags to avoid timeout of
> transfer when IRQ is not enabled during early stage.
> 
> The actual usecase over i2c is(Not in upstream yet), PCIe client ->

This text goes into the git history, which means that this statement
(not in upstream yet) will become incorrect before this patch becomes
needed.

> PCIe Driver -> I2C driver.
> PCIe client needs certain configurations over i2c after powering on the
> PCIe switch.

In the first sentence you use the word "client". In the second you use
"client" and "switch", but I think all three cases refer to the same
component.

The description is much better, but I think you can polish the wording
to make it even clearer - remember, this will become the only
documentation to why the code looks like it does; it's going to be read
by people outside your team (and company), who hasn't been part of any
discussions leading up to the patch, and it need to be clear why so they
know what changes they can make.

> As part of suspend it uses suspend_noirq() to turn off the
> switch, because some PCIe clients do some transfers till suspend_noirq()
> phase. And as part of resume_noirq(), it enables the power to the switch
> and configures the switch again through i2c.
> 
> If pm_runtime_get_sync() is failing when runtime PM is not enabled, then
> use pm_runtime_force_resume().

Tell us why, not what.

> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/
> 
> v3->v4 :
>  - Enhanced commit log by explaining client usecase scenario during early resume.
>  - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.
> 
> ---
> Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/
> 
>  v2 -> v3:
>  - Updated exact usecase and scenario in the commit log description.
>  - Removed bulleted points from technical description, added details in free flow.
>  - Used pm_runtime_force_resume/suspend() instead customized local implementation.
>  - Added debug log after pm_runtime_force_suspend().
> 
> ---
> 
>  v1 -> v2:
>  - Changed gi2c->se.dev to dev during dev_dbg() calls.
>  - Addressed review comments from Andi and Bjorn.
>  - Returned 0 instead garbage inside geni_i2c_force_resume().
>  - Added comments explaining forced resume transfer when runtime PM
>    remains disabled.
> ---
> 
>     V1 link: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
> ---
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 47 ++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..94f875aca9aa 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -695,17 +695,29 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  			 int num)
>  {
>  	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	struct device *dev = gi2c->se.dev;
>  	int ret;
>  
>  	gi2c->err = 0;
>  	reinit_completion(&gi2c->done);
> -	ret = pm_runtime_get_sync(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
> -		pm_runtime_put_noidle(gi2c->se.dev);
> -		/* Set device in suspended since resume failed */
> -		pm_runtime_set_suspended(gi2c->se.dev);
> -		return ret;
> +	/* Serve I2C transfer by forced resume if Runtime PM is enbled or not */

That is what the code says too, document why.

> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
> +		#if (IS_ENABLED(CONFIG_PM))

This condition doesn't look right.

> +		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",

Is the information that runtime PM being disable relevant information
for the average user? I guess it can be useful to have a debug print
telling you that power is being forced on... But this could probably be
expressed more succinct.

> +			atomic_read(&dev->power.usage_count));
> +		#endif
> +		ret = pm_runtime_force_resume(dev);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = pm_runtime_get_sync(gi2c->se.dev);
> +		if (ret < 0) {
> +			dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);

You don't need "SE" in this sentence, but "turning on resources" would
sound better. Please also include a space after ':'.

> +			pm_runtime_put_noidle(gi2c->se.dev);
> +			/* Set device in suspended since resume failed */
> +			pm_runtime_set_suspended(gi2c->se.dev);
> +			return ret;
> +		}
>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> @@ -715,8 +727,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	else
>  		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>  
> -	pm_runtime_mark_last_busy(gi2c->se.dev);
> -	pm_runtime_put_autosuspend(gi2c->se.dev);
> +	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */

That is what the code says.

> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
> +		ret = pm_runtime_force_suspend(dev);
> +		#if (IS_ENABLED(CONFIG_PM))
> +		dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
> +			atomic_read(&dev->power.usage_count));
> +		#endif
> +		if (ret)
> +			return ret;
> +	} else {
> +		pm_runtime_mark_last_busy(gi2c->se.dev);
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +	}
> +
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
>  	return ret;
> @@ -833,9 +857,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -
> -	/* Keep interrupts disabled initially to allow for low-power modes */

This comment looks incorrect. But your change doesn't change the related
fact. Please send a separate commit removing it - with proper
motivation.

Thanks,
Bjorn

> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
> +			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
>  			       dev_name(dev), gi2c);
>  	if (ret) {
>  		dev_err(dev, "Request_irq failed:%d: err:%d\n",
> -- 
> 2.25.1
> 
> 

