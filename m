Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B33C658933
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 04:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiL2Dmw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 22:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiL2Dmv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 22:42:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E4313DF3;
        Wed, 28 Dec 2022 19:42:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90187616C4;
        Thu, 29 Dec 2022 03:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57072C433F0;
        Thu, 29 Dec 2022 03:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672285369;
        bh=YCFfazlrKJ1K2+tzGvPB4JZ+l5oyPMQSpGBxkr4HqUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNzi2MRt/n/gSTiYAYZh3sm1OsoLkHQn9dZ1gKDCqxoqEySeqMf5ONRl6qS8/2vwW
         yvaxjf2EpFIiEweK7JAUfjq2x2x1okfWQHvC5Xi/p5oyIkOvs/3httapM9MkFgzAOo
         kzYAJJhvdQ6Nm2rbRstW8UKyQ+1ClNAE9EZSRl8xfU8TqvxIWgDSKV5mcndlPB4aI+
         427e2CSKpDqEM7NuDht/UwlMt2WieMGTFtmlPiRGJ0jpD63njNXy0lI3PxWX/Nfguw
         N7WApvGxHKxjk/9OqtMiB4KFPor3WaCdOJpW+XukScLtU7mEZfKWdzWbwdToEly6+6
         9aygmaCHN/Lng==
Date:   Wed, 28 Dec 2022 21:42:47 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        neil.armstrong@linaro.org, wsa@kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix missing clk_disable_unprepare()
Message-ID: <20221229034247.5wyn57g2yssjzk6n@builder.lan>
References: <20221228093209.3164540-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228093209.3164540-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 28, 2022 at 05:32:09PM +0800, Yang Yingliang wrote:
> Add missing clk_disable_unprepare() in the error path in geni_i2c_probe().
> 
> Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Nice.

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index fd70794bfcee..f292e4dab98f 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -859,6 +859,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
>  		dev_err(dev, "Error turning on resources %d\n", ret);
> +		clk_disable_unprepare(gi2c->core_clk);
>  		return ret;
>  	}
>  	proto = geni_se_read_proto(&gi2c->se);
> @@ -878,8 +879,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		/* FIFO is disabled, so we can only use GPI DMA */
>  		gi2c->gpi_mode = true;
>  		ret = setup_gpi_dma(gi2c);
> -		if (ret)
> +		if (ret) {
> +			clk_disable_unprepare(gi2c->core_clk);

If I'm not mistaken, we need a geni_se_resources_off() here as well.

>  			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
> +		}
>  
>  		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>  	} else {
> @@ -892,6 +895,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  
>  		if (!tx_depth) {
>  			dev_err(dev, "Invalid TX FIFO depth\n");

Same here.

Regards,
Bjorn

> +			clk_disable_unprepare(gi2c->core_clk);
>  			return -EINVAL;
>  		}
>  
> -- 
> 2.25.1
> 
