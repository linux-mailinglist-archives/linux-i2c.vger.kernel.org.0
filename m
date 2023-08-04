Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E5E770BD7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 00:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjHDWS3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 18:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjHDWS2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 18:18:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A01E70;
        Fri,  4 Aug 2023 15:18:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A587E6214E;
        Fri,  4 Aug 2023 22:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83737C433C7;
        Fri,  4 Aug 2023 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691187507;
        bh=6CrCpVZnADD76JTF1UuXcC6NkgYFxpprY68bB2hP7N8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B0glLNaZS+xW9jO0scZa70wgwB0CJ+xW8DM4c0/hjxbELhfid603kOjNDb+CCMA9l
         dWAOUgAlFa0JVi3/82X9onrYhrqsczQh+bQAejZCngr1XbFjmIBnwi56CM2eD2Knsv
         fSFuoItTshFBE7XJhK3XYD3xoGPGyo+Dsi4Sq4AlyMAJuQ/ngFq580ONBsNfMdEJMl
         FLasU8hQYZhZUVGPuI0nnpKtPKF6vKTFtLG4eVgyXrv6i83rfVf2E0pHlv3ARrF6xU
         jT+Um4iH9sf5F3cf1sG82m6NQIMOHE3IWbpii4pJ76LNufV90nTioGtC81kq79YMfe
         rcXuN5oPkKKFw==
Date:   Sat, 5 Aug 2023 00:18:24 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 9/9] i2c: synquacer: Use dev_err_probe in probe function
Message-ID: <20230804221824.6ajx25lmymf3hcfd@intel.intel>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
 <20230802095737.3957587-10-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802095737.3957587-10-liaochang1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 05:57:37PM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-synquacer.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 4cc196ca8f6d..8ada613598eb 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -557,11 +557,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>  		dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
>  
>  		ret = clk_prepare_enable(i2c->pclk);
> -		if (ret) {
> -			dev_err(&pdev->dev, "failed to enable clock (%d)\n",
> -				ret);
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
>  		i2c->pclkrate = clk_get_rate(i2c->pclk);
>  	}
>  

you forgot

		dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
			i2c->pclkrate);
		return -EINVAL;

Thanks,
Andi
