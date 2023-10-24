Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC187D5C92
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 22:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbjJXUpW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 16:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjJXUpV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 16:45:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D520F10CE;
        Tue, 24 Oct 2023 13:45:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0104C433C8;
        Tue, 24 Oct 2023 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698180319;
        bh=63z3mlCd2bt7TLC2rgpK22XXpUyWBM3XWwyJwKwVcdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M8hx/GLvW100t1CqGc4S2MJRFmDcQ+LGLfN46BJqv1FvMwlfj/E8ZZ1GETqW8mtA6
         YEn+V8M2jPbJPIbhS27Jx3w05BRTeOYex8TWiBgqGu5BhxyCjsCjyrCPDBSeVerxh+
         1hDVufmVTTGsu6qM8Uy/1omphgUKFx6x1nl72XLb3YE8nm5wUgXEo2+p//wqS6H5we
         MW9pcqWdzAfReIT+fh+HbWvDb4Cwz9rZ05E6HF59ZY9X0uPA40yHPgXDfv5ogySMqU
         ANn/d8Ems9MH/h0bVHQEV1tbEQElgwbVvhGJIjR8Y6AqUEkqcUaaO3JdasmRMMxJ3j
         zL4w5qOFvmwOw==
Date:   Tue, 24 Oct 2023 22:45:15 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 1/7] i2c: sprd: Add configurations that support 1Mhz
 and 3.4Mhz frequencies
Message-ID: <20231024204515.vsmu5sllt7qafbq4@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-2-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-2-Huangzheng.Lai@unisoc.com>
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

On Mon, Oct 23, 2023 at 04:11:52PM +0800, Huangzheng Lai wrote:
> Add support for 1Mhz and 3.4Mhz frequency configuration.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

you can make this:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sprd.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index ffc54fbf814d..b44916c6741d 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -343,10 +343,23 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>  	writel(div1, i2c_dev->base + ADDR_DVD1);
>  
>  	/* Start hold timing = hold time(us) * source clock */
> -	if (freq == I2C_MAX_FAST_MODE_FREQ)
> -		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
> +	switch (freq) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
> +		break;
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> +		break;
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> +		break;
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> +		break;

so these were defined but not used.

> +	default:
> +		dev_err(i2c_dev->dev, "Unsupported frequency: %d\n", freq);
> +		break;
> +	}
>  }
>  
>  static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
> @@ -519,9 +532,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
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
>  		return -EINVAL;

This is a bit of a weird management of the bus_freq because it
goes like this:

	i2c_dev->bus_freq = I2C_MAX_STANDARD_MODE_FREQ;
	...
	if (!of_property_read_u32(dev->of_node, "clock-frequency", &prop))
		i2c_dev->bus_freq = prop;

	if (...)
		return -EINVAL;

A follow-up cleanup can be removing the first assignement and
instead of returning -EINVAL, we can keep going:

	if (!of_property_read_u32(dev->of_node, "clock-frequency", &prop))
		i2c_dev->bus_freq = prop;

	if (...) {
		dev_warn("...");
		i2c_dev->bus_freq = I2C_MAX_STANDARD_MODE_FREQ;
	}

But this is topic for a different patch.

Andi

>  
>  	ret = sprd_i2c_clk_init(i2c_dev);
> -- 
> 2.17.1
> 
