Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1472ABD2
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 15:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjFJNm6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 09:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjFJNm6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 09:42:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3B030FC;
        Sat, 10 Jun 2023 06:42:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DCB7461092;
        Sat, 10 Jun 2023 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F0FC433EF;
        Sat, 10 Jun 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686404576;
        bh=4CnAMZqLhB3FkoCz0upg8L2TqWndlHMaF4YqaZOWGP8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vCwAkfnJ2jOoiAgrgeUXJD4uhcWWdh44u3pmYTP9f2E4NPHeSGH+HWVNijxZmARzg
         6vtJboiWbZ2LtpM/mTt69iPsv+M2HkiuC8OEXCUmRIaMDprqpGwdRdzYtAoBCd6atp
         SP+YKYnu+epAS8DcdzNmVi4oCCF37qF3dQqT0oHFxfePRdh9AdNyLv9ymno4miM5m3
         sumW1hAyTk7WosPTcQ+nVpQoCvMQyqk6RUG0LIVSJBJCaZfy1V2v3OIdD5qCMEhfgh
         Ga3EWZR8RZqWpPfqvPkuC1M7boN3Vo+S9Jp66oam1Y3bYzzagzU9wjSZwL+amBfpMd
         OmrzrGm1C1sfA==
Date:   Sat, 10 Jun 2023 15:42:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     wsa+renesas@sang-engineering.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: wmt: Use devm_platform_get_and_ioremap_resource()
Message-ID: <20230610134253.jphhhsfgxixtildd@intel.intel>
References: <202301281451442100100@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301281451442100100@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

On Sat, Jan 28, 2023 at 02:51:44PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/i2c/busses/i2c-wmt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
> index 7d4bc8736079..4a3e3985e418 100644
> --- a/drivers/i2c/busses/i2c-wmt.c
> +++ b/drivers/i2c/busses/i2c-wmt.c
> @@ -372,7 +372,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct wmt_i2c_dev *i2c_dev;
>  	struct i2c_adapter *adap;
> -	struct resource *res;
>  	int err;
>  	u32 clk_rate;
> 
> @@ -380,8 +379,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	if (!i2c_dev)
>  		return -ENOMEM;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
> +	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

It's also a cleaner way to handle the error when res is NULL.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

>  	if (IS_ERR(i2c_dev->base))
>  		return PTR_ERR(i2c_dev->base);
> 
> -- 
> 2.25.1
