Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1783B72AAFB
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 12:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjFJKyk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 06:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFJKyj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 06:54:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC92C35B6;
        Sat, 10 Jun 2023 03:54:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A486612AE;
        Sat, 10 Jun 2023 10:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335A7C4339B;
        Sat, 10 Jun 2023 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686394477;
        bh=0QL4JPqiS9rPR/J8636yim1R6Z9Esq9EoitzY1XDxRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ql2HMHMwRW4FUFZI1lVKn6agtm3I+pGHDGGoUT9Jy2J71zVZZpoLXUB4/LG/iPEXr
         PB1NrjDQYFH9BJvGngMHo47PZaSfUteZ9wAaQPW+S6bvNEbdC+Aed7VpWYHtcAEHvf
         2uzwuDdTG/JzxcMRlKe+us9BJvah5caX3Phmlt20tSZU96m6wueb2/p8rF94SdNM7w
         Nf5lzTuXtuTznqqIF9Eu7luEXj1uNhnj1aqqPyuP/7UFfT1y/mwC73lqNBcPbJ1K/e
         u9jjpfC504UdF0J+9LgTlJLcQAeMTZ0Biy925ds7H9lNc+AT9YhBRH7Wc0gsXMwhNk
         i35yGz06OB9wQ==
Date:   Sat, 10 Jun 2023 12:54:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Shuai Jiang <d202180596@hust.edu.cn>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Naveen Kaje <nkaje@codeaurora.org>,
        Austin Christ <austinwc@codeaurora.org>,
        hust-os-kernel-patches@googlegroups.com,
        Andy Gross <agross@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add missing unwind goto in qup_i2c_probe()
Message-ID: <20230610105434.3jbo6svcct37pn3q@intel.intel>
References: <20230418135612.598-1-d202180596@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418135612.598-1-d202180596@hust.edu.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 18, 2023 at 09:56:12PM +0800, Shuai Jiang wrote:
> Smatch Warns:
> 	drivers/i2c/busses/i2c-qup.c:1784 qup_i2c_probe()
> 	warn: missing unwind goto?
> 
> The goto label "fail_runtime" and "fail" will disable qup->pclk, 
> but here qup->pclk failed to obtain, in order to be consistent, 
> change the direct return to goto label "fail_dma".
> 
> Fixes: 10c5a8425968 ("i2c: qup: New bus driver for the Qualcomm QUP I2C controller")
> Fixes: 515da746983b ("i2c: qup: add ACPI support")

These are not the correct Fixes, the correct fix is:

Fixes: 9cedf3b2f099 ("i2c: qup: Add bam dma capabilities")

> Signed-off-by: Shuai Jiang <d202180596@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

and

Cc: <stable@vger.kernel.org> # v4.6+

Patch looks good:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

> ---
> The issue is found by static analysis and remains untested.
> ---
>  drivers/i2c/busses/i2c-qup.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 2e153f2f71b6..78682388e02e 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1752,16 +1752,21 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  	if (!clk_freq || clk_freq > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>  		dev_err(qup->dev, "clock frequency not supported %d\n",
>  			clk_freq);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto fail_dma;
>  	}
>  
>  	qup->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(qup->base))
> -		return PTR_ERR(qup->base);
> +	if (IS_ERR(qup->base)) {
> +		ret = PTR_ERR(qup->base);
> +		goto fail_dma;
> +	}
>  
>  	qup->irq = platform_get_irq(pdev, 0);
> -	if (qup->irq < 0)
> -		return qup->irq;
> +	if (qup->irq < 0) {
> +		ret = qup->irq;
> +		goto fail_dma;
> +	}
>  
>  	if (has_acpi_companion(qup->dev)) {
>  		ret = device_property_read_u32(qup->dev,
> @@ -1775,13 +1780,15 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  		qup->clk = devm_clk_get(qup->dev, "core");
>  		if (IS_ERR(qup->clk)) {
>  			dev_err(qup->dev, "Could not get core clock\n");
> -			return PTR_ERR(qup->clk);
> +			ret = PTR_ERR(qup->clk);
> +			goto fail_dma;
>  		}
>  
>  		qup->pclk = devm_clk_get(qup->dev, "iface");
>  		if (IS_ERR(qup->pclk)) {
>  			dev_err(qup->dev, "Could not get iface clock\n");
> -			return PTR_ERR(qup->pclk);
> +			ret = PTR_ERR(qup->pclk);
> +			goto fail_dma;
>  		}
>  		qup_i2c_enable_clocks(qup);
>  		src_clk_freq = clk_get_rate(qup->clk);
> -- 
> 2.25.1
> 
