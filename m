Return-Path: <linux-i2c+bounces-8772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E99FD6E3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 19:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC1E3A2576
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 18:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC361F8935;
	Fri, 27 Dec 2024 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/YJLzNG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE661F7545;
	Fri, 27 Dec 2024 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735323698; cv=none; b=Wg3zL0tmgNX0h0MxFfP6Df2yrfu/XnchbWfv/oBzrPbZWc5xDiqRi32cqWI0MVUyb5GxN4gbh30ER5UhEpv5j2NgPF2Q5JTbhMxMg8bsvaxYj9jTa9H9GCJdrOBXWCfeOpfstGaBZ3g8q9pJF6s5YUW20oJ4BvV8zonU77mwczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735323698; c=relaxed/simple;
	bh=awC04e82LjgeDYyUW6dufgCKw7+FlSZnv748WRCKT1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngiqbFU7y6Z6PNAh5ohKlqlYBfvJjhrd2sA7xBf9Ay5aext66+FJj7Sn39oJOMv8eX9YWJSXSjcj+uBGfFqg9vj/7mG6CgYgLy6uayU+IecOKJsbRmesFGo2WyLLG45PBlBfPH90bgBB87VcpgRxfRXLt7+rcEcGdr+KMC7/MJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/YJLzNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC14C4CED0;
	Fri, 27 Dec 2024 18:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735323697;
	bh=awC04e82LjgeDYyUW6dufgCKw7+FlSZnv748WRCKT1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/YJLzNG0JeiY4vwnUjV1vezSic62Q0pkMEWpc0oqekwTDpuA6oQYDilN5XkCl0nM
	 sFTO4bYCVNtyt8TzU9aQSA91xjaoO18GXTTwMnEAPbZRL7ZwSm8Q5NB/mLaCgfkBkx
	 GIaPq5WYsRPdNus7MsDgOIrbFCiY5DxAyatYQLpDemCf2Y4SJoSrxlrTgTh8Sgxt/R
	 ab9Fa5XwZRSNvyTaxF6jPUzAYlI/2i3iIAWGRf89Ii71jiXSYEF1JWFLe8kWTOl581
	 /s3UNBV+OETRFKNPIPIqJW4CJDUd7gBJaLpFGiVCfQkSh3PiD10f00oeQTM2BF537o
	 XkDwuJuoZlYYg==
Date: Fri, 27 Dec 2024 12:21:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, quic_bjorande@quicinc.com, 
	konrad.dybcio@linaro.org, quic_vdadhani@quicinc.com, vkoul@kernel.org
Subject: Re: [PATCH v5] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <aihmuvxxop7ipbsfzblbmywthxnklx34x2xlbvlrd4rio6rg77@gfqnzyjjewz3>
References: <20241227130236.755794-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227130236.755794-1-quic_msavaliy@quicinc.com>

On Fri, Dec 27, 2024 at 06:32:36PM +0530, Mukesh Kumar Savaliya wrote:
> Fix the issue where pm_runtime_get_sync() fails during the PM early resume

No.

As we discussed, start your commit messages with a description of your
problem. Don't say "Fix bla bla because of problem description", say
"The QPS615 PCIe switch needs to be configured over I2C before the PCIe
link is restored, but the I2C geni driver does not allow transfers
during the early resume phase".

> phase, returning -EACCES because runtime PM for the device is disabled at
> this stage. This failure causes I2C transfers to fail. To resolve this,
> serve transfers with a forced resume.
> 
> Allow certain I2C clients, such as PCI or Touch devices, to request I2C

I still don't understand what kind of touch device you have attached
that requires I2C communication before the system is resumed. Who are
you going to deliver the input events to at this point in time?

> transfers during the early resume stage. Enable any I2C client to initiate
> a transfer request very early in the resume stage, such as during the
> noirq phase of PM. Register an interrupt with the IRQF_EARLY_RESUME and
> IRQF_NO_SUSPEND flags to handle these transfers and avoid timeouts when
> IRQs are not enabled during the early stage.
> 
> A Potential usecase: PCIe client -> PCIe Driver -> I2C driver. It involves
> a PCIe client driver communicating with the PCIe driver, which in turn
> interfaces with the I2C driver. Upon powering on the PCIe device, send
> certain configurations over I2C. During the suspend phase, use the
> suspend_noirq() routine to turn off the PCIe device, as some PCIe clients
> continue transfers until this phase. During the resume_noirq() phase,
> restore power to the PCIe device and reconfigure it via I2C. This ensures
> that the PCIe device is properly configured and operational after resuming
> from a suspended state.

This paragraph looks like a problem description, it should be at the
top.

Read and follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> Use pm_runtime_force_resume() to address the failure of
> pm_runtime_get_sync() returning a negative value when runtime PM is
> disabled.
> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/
> 
> v4->v5:
> - Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
> - Enhanced comment with reason when using pm_runtime_force_resume().
> - Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
> - Improved debug log as per Bjorn's suggestions during suspend, resume.
> - Reverted back comment before devm_request_irq().
> 
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 47 +++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..1885e1ceb11c 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -695,17 +695,31 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
> +	/* During early resume stage, runtime PM is disabled and pm_runtime_get_sync()
> +	 * returns error Hence use force_resume() and serve transfer.
> +	 */
> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
> +		#if (!IS_ENABLED(CONFIG_PM))

Per Documentation/process/coding-style.rst section 21, this should be:
	if (!IS_ENABLED(CONFIG_PM))

> +		dev_dbg(dev, "Forced power ON, pm_usage_count: %d\n",
> +			atomic_read(&dev->power.usage_count));

What does this debug print tell you? Shouldn't usage_count be zero in
all cases where suspended = true?

> +		#endif
> +		ret = pm_runtime_force_resume(dev);

If I understand the implementation of this function, in the case that
you did not invoke pm_runtime_force_suspend() this will solely invoke
pm_runtime_enable(), not actually invoking any callbacks and hence
wouldn't turn any resources on.

Which makes sense given that this isn't the documented intended usage of
the function pair.


In fact, the kernel-doc even says "Prior invoking this function we
expect the user to have brought the device into low power state by a
call to pm_runtime_force_suspend()".

> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = pm_runtime_get_sync(gi2c->se.dev);
> +		if (ret < 0) {
> +			dev_err(gi2c->se.dev, "Error turning resources: %d\n", ret);
> +			pm_runtime_put_noidle(gi2c->se.dev);
> +			/* Set device in suspended since resume failed */
> +			pm_runtime_set_suspended(gi2c->se.dev);
> +			return ret;
> +		}
>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> @@ -715,8 +729,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	else
>  		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>  
> -	pm_runtime_mark_last_busy(gi2c->se.dev);
> -	pm_runtime_put_autosuspend(gi2c->se.dev);
> +	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {

I find the asymmetry here suspicious, but I presume what you're checking is:
1) !pm_runtime_enabled() => we're probably in late-suspend or early-resume
2) !suspended => we invoked pm_runtime_force_resume() above, which
invoked geni_i2c_runtime_resume(), which cleared suspended.

Such spaghetti should be avoided, but if necessary need to be clearly
documented, and #2 is completely ignored in the comment.

"else autosuspend the driver", that part you can obviously skip as it's
that's exactly what the code below says.

> +		ret = pm_runtime_force_suspend(dev);

The expectation expressed in the kernel-doc of these functions is that
pm_runtime_force_suspend() should be followed by a
pm_runtime_force_resume().

As you don't follow that, most of pm_runtime_force_resume() will be
skipped, but here the full pm_runtime_force_suspend() will happen.

In the event that this is the last i2c_xfer before the system is
entering the resume-phase, you will leave the device in force-suspend
and then resume it "normally" on the next i2c_xfer. 

If you instead make another i2c_xfer within the early resume, the above
pm_runtime_force_resume() will suddenly behave completely differently -
it will actually invoke geni_i2c_runtime_resume().


Perhaps I'm misunderstanding something here?

Regards,
Bjorn

> +		#if (!IS_ENABLED(CONFIG_PM))
> +		dev_dbg(dev, "Forced power OFF, pm_usage_count: %d\n",
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
> @@ -835,7 +861,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, gi2c);
>  
>  	/* Keep interrupts disabled initially to allow for low-power modes */
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

