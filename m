Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EABCA7D3257
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbjJWLTH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjJWLTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:19:07 -0400
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EBF92;
        Mon, 23 Oct 2023 04:19:04 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VukswFj_1698059941;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VukswFj_1698059941)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:19:01 +0800
Message-ID: <9b623c51-2052-9c0e-9ef7-6e9d841ad5ce@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 1/7] i2c: sprd: Add configurations that support 1Mhz
 and 3.4Mhz frequencies
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-2-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-2-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.2 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/23/2023 4:11 PM, Huangzheng Lai wrote:
> Add support for 1Mhz and 3.4Mhz frequency configuration.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-sprd.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index ffc54fbf814d..b44916c6741d 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -343,10 +343,23 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>   	writel(div1, i2c_dev->base + ADDR_DVD1);
>   
>   	/* Start hold timing = hold time(us) * source clock */
> -	if (freq == I2C_MAX_FAST_MODE_FREQ)
> -		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
> +	switch (freq) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>   		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
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
> +	default:
> +		dev_err(i2c_dev->dev, "Unsupported frequency: %d\n", freq);
> +		break;
> +	}
>   }
>   
>   static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
> @@ -519,9 +532,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>   	if (!of_property_read_u32(dev->of_node, "clock-frequency", &prop))
>   		i2c_dev->bus_freq = prop;
>   
> -	/* We only support 100k and 400k now, otherwise will return error. */
> +	/* We only support 100k\400k\1m\3.4m now, otherwise will return error. */
>   	if (i2c_dev->bus_freq != I2C_MAX_STANDARD_MODE_FREQ &&
> -	    i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ)
> +			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ &&
> +			i2c_dev->bus_freq != I2C_MAX_FAST_MODE_PLUS_FREQ &&
> +			i2c_dev->bus_freq != I2C_MAX_HIGH_SPEED_MODE_FREQ)

Can you keep the same alignment format as the previous code? Otherwise 
look good to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
