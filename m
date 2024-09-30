Return-Path: <linux-i2c+bounces-7086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3193989999
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 05:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AEC1F21F6D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 03:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063542BB0D;
	Mon, 30 Sep 2024 03:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIWkq1ZU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA751878;
	Mon, 30 Sep 2024 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727668001; cv=none; b=MBQBIvzf6fB7NW4oXDgQ38HtFJTwr8h5jvKDVrWkCa8UT9pqg1TosOWodVx08UrsBwWOOCPbpFihfB8g6zFZl2VeUE1cTYjI0vnqZugeIyT4IZ+VU4az6iIQKqGwHUSkG0yh3RGAm0BlwK+wk2abVBhpmPqQqhRmTFTIG6ruUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727668001; c=relaxed/simple;
	bh=3ZRQb9frZrN0U2tLqZABd0zVgfSMsnleCdXyG8mS+KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhS01NF86MJGEhaRbK3mUB5iu4stczBEbd0dv69ZD6Pdd2zI1lFmr/Rays2Vm+QQ39Tz9/+nCXgV/apCBkp/uSXrQDbuHaENJ16wCULMaJzvHZFbEjDoSR4a53QThqq350dMlazzm2FQnr+3xZ1GPopdEJO2kBKnYizq5TAijsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIWkq1ZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDCAC4CEC4;
	Mon, 30 Sep 2024 03:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727668000;
	bh=3ZRQb9frZrN0U2tLqZABd0zVgfSMsnleCdXyG8mS+KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIWkq1ZUBe2fdkk+pYKC8athvpuJSOisu9in60smfN355pj3z6/O6qvR+CXJGz/0f
	 lhp6yECMYO7TDKRLNV9hK9nwn0i63aC6xaqQnkEUMc6R8hoUmXAMtjm4qbORfC8k+X
	 8DAduYsPQ57h59sWO/Ve5Jhjob+BCdUQc9m7Uc7MeSysREJZmrP+3USHp4HBIY28E4
	 NFrNEypnmQbNU3DVqdBJiTBe9o6hxOoRFG1k5YOLUaz0W1VVHn6HxJl5nXOAwnYSUI
	 c8hX9Aqzz+RU6hPdQU9LYCjuG1jra+1e/nx7lJ9xbTRay132Nrk7Z91lgNr9lU9N5l
	 Z5MTkkt4WYLuQ==
Date: Sun, 29 Sep 2024 22:46:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
Message-ID: <lmo4jylfwt3wingdqb6zc6ew2537kqksuckfyd7vwuu4ufg5cr@ic2j7bv2r6e4>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927063108.2773304-5-quic_msavaliy@quicinc.com>

On Fri, Sep 27, 2024 at 12:01:08PM GMT, Mukesh Kumar Savaliya wrote:
> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
> Use "qcom,shared-se" flag in a particular i2c instance node if the usecase
> requires i2c controller to be shared.
> 

Please start your commit message by describing the problem your patch
is solving.

> Sharing of SE(Serial engine) is possible only for GSI mode as each
> subsystem(SS) can queue transfers over its own GPII Channel. For non GSI
> mode, we should force disable this feature even if set by user from DT by
> mistake.
> 
> I2C driver just need to mark first_msg and last_msg flag to help indicate
> GPI driver to take lock and unlock TRE there by protecting from concurrent
> access from other EE or Subsystem.
> 
> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
> Unlock TRE for the respective transfer operations.
> 
> Since the GPIOs are also shared between two SS, do not unconfigure them
> during runtime suspend. This will allow other SS to continue to transfer
> the data without any disturbance over the IO lines.
> 

This last paragraph describes patch 3, right?

> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..479fa8e1c33f 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> @@ -602,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.clk_div = itr->clk_div;
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
> +	peripheral.shared_se = gi2c->se.shared_geni_se;
>  
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
> @@ -612,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		if (i < num - 1)
>  			peripheral.stretch = 1;
>  
> +		peripheral.first_msg = (i == 0);
> +		peripheral.last_msg = (i == num - 1);

There are multiple error paths in this loop, which would result in us
never issuing the unlock TRE - effectively blocking other subsystems
from accessing the serial engine until we perform our next access
(assuming that APSS issuing a lock TRE when APSS already has the channel
locked isn't a problem?)

>  		peripheral.addr = msgs[i].addr;
>  
>  		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> @@ -631,8 +635,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		dma_async_issue_pending(gi2c->tx_c);
>  
>  		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!time_left)
> +		if (!time_left) {
> +			dev_dbg(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
> +						gi2c->cur->flags, gi2c->cur->addr);

This looks useful, but unrelated to this patch.

>  			gi2c->err = -ETIMEDOUT;
> +		}
>  
>  		if (gi2c->err) {
>  			ret = gi2c->err;
> @@ -800,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		gi2c->clk_freq_out = KHZ(100);
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
> +		gi2c->se.shared_geni_se = true;

	gi2c->se.shared_geni_se = of_property_read_bool(dev->of_node, "qcom,shared-se");

> +		dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
> +	}
> +
>  	if (has_acpi_companion(dev))
>  		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>  
> @@ -870,8 +882,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	else
>  		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>  
> -	if (fifo_disable) {
> -		/* FIFO is disabled, so we can only use GPI DMA */
> +	if (fifo_disable || gi2c->se.shared_geni_se) {
> +		/* FIFO is disabled, so we can only use GPI DMA.
> +		 * SE can be shared in GSI mode between subsystems, each SS owns a GPII.
> +		 **/

I think you're trying to document why we're entering the "GPI-only"
branch. The addition you made was that if the user has requested
"shared-se", then it's GPI-only.

But I'm not able to wrap my head around your addition here. Why does it
matter that each subsystem own a GPII? Is that a reason for choosing
GPI-only mode?

>  		gi2c->gpi_mode = true;
>  		ret = setup_gpi_dma(gi2c);
>  		if (ret) {
> @@ -883,6 +897,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>  	} else {
>  		gi2c->gpi_mode = false;
> +
> +		/* Force disable shared SE case for non GSI mode */

GSI or GPI mode?

> +		gi2c->se.shared_geni_se = false;

If shared_geni_se was true prior to this assignment, wouldn't we have
entered the if (fifo_disable ...) branch?

>  		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>  
>  		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
> @@ -964,7 +981,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	if (ret) {
>  		enable_irq(gi2c->irq);
>  		return ret;
> -

Please avoid such unrelated cleanups.

Regards,
Bjorn

>  	} else {
>  		gi2c->suspended = 1;
>  	}
> -- 
> 2.25.1
> 

