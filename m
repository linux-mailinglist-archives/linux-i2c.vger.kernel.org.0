Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF47779098A
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 22:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbjIBU0H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 16:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234223AbjIBU0H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 16:26:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DABE5F;
        Sat,  2 Sep 2023 13:25:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 84851B8090A;
        Sat,  2 Sep 2023 20:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8080FC433C8;
        Sat,  2 Sep 2023 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693686338;
        bh=+WSTiNaglKsn0BH7JjBM55l1rreJQF3ZzL15znSALFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l3+ofwj+nPd9LpC4A9FvPVAWupwZCGhEL9TrlULCtfQs+CjoWVUkCSs6qj9ruUVs8
         bbxaAFePua8cgnRqDNk5ly/0mg+ATVBdYre7WRorhlRSbsEjPDcjqWKUokSRGYp6Bv
         lSXyQQ2AHgJvSFTthl0KuRCB7W6VX7HqFHD8Vlk0g92ocrFD8CgE33b1pvUVmVPhoF
         /nYbPOVG5OI5qgQ3BezOdSY3toku8Oo9L/nazCz97mjh3pLYma4Jsj+tZAqR+o4WMI
         h6mH8a6Nsy0TNaMSmqAbe2BCfs6ZKmzX0lMrBBZTZDXEk4DIW25/g+Xdv2bbXPtfsf
         tKjEkjY0l7E6Q==
Date:   Sat, 2 Sep 2023 22:25:33 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 1/8] i2c: sprd: Add configurations that support 1Mhz and
 3.4Mhz frequencies
Message-ID: <20230902202533.bpquxhjq3mrhmwew@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-2-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-2-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Thu, Aug 17, 2023 at 05:45:13PM +0800, Huangzheng Lai wrote:
> This patch adds I2C controller driver support for 1Mhz and 3.4Mhz
> frequency configurations.

please avoid the "This patch adds..." form, it can be sometimes
misleading... Use always the imperative form.

"Add support for 1Mhz and 3.5Mhz frequency configuration"

> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index ffc54fbf814d..acc2a4d4eeae 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -347,6 +347,10 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>  		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
>  	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
>  		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
> +	else if (freq == I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> +	else if (freq == I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);

if you want you can queue up a patch that makes this train of
"else if" in a switch case.

>  }
>  
>  static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
> @@ -519,9 +523,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>  	if (!of_property_read_u32(dev->of_node, "clock-frequency", &prop))
>  		i2c_dev->bus_freq = prop;
>  
> -	/* We only support 100k and 400k now, otherwise will return error. */
> +	/* We only support 100k\400k\1m\3.4m now, otherwise will return error. */
>  	if (i2c_dev->bus_freq != I2C_MAX_STANDARD_MODE_FREQ &&
> -	    i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ)
> +			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ &&
> +			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_PLUS_FREQ &&
> +			i2c_dev->bus_freq != I2C_MAX_HIGH_SPEED_MODE_FREQ)

We finally make use of these defines :)

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

>  		return -EINVAL;
>  
>  	ret = sprd_i2c_clk_init(i2c_dev);
> -- 
> 2.17.1
> 
