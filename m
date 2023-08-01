Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFDB176BF71
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 23:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbjHAVo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 17:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbjHAVo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 17:44:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0D62114;
        Tue,  1 Aug 2023 14:44:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 920FE61729;
        Tue,  1 Aug 2023 21:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358F0C433C8;
        Tue,  1 Aug 2023 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690926261;
        bh=4XN7ophfZUU70Ei2mzNpkzXitUK0nETUDmiMV/+ZixM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e4Ji/LXve2hUggS5Vv5Q39TxufKa6YyTF6WKJdAah4aV0ngu1RClNU5vtxKk3Qetr
         HjhkZRV5NKYaSy5CfKoOtFVhvo2T3TIgHEW9V7w34UXxYMjw7qCtkLmBdJstlJ7Rim
         KwbeoRaIaydaTp+11qDjkPyy9MwgTtByc6a0IHMJ3iCgYw+MdJmgJpJoDyDmVz1dJX
         LnW6SmwdxKOwbl+4HUBLowYAY6lxXcakMqCW8neCCPVYv7v1ervtUsefwy5QZHxlm8
         ctaE/iToUarpRr7UfuS8iHHPtoj8Azp0dWjboMXzmkGBxKLhmw6NC7QbRDbLSA555H
         Jcr0rpc08Jqgg==
Date:   Tue, 1 Aug 2023 23:44:17 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 9/9] i2c: synquacer: Use dev_err_probe in probe function
Message-ID: <20230801214417.hivhbfhnmmgyxkes@intel.intel>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-10-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-10-liaochang1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Fri, Jul 28, 2023 at 09:31:48AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-synquacer.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 4cc196ca8f6d..cc2af638bfdd 100644
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

here you forgot a few, as well.

Andi
