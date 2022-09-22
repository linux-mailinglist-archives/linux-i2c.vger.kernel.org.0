Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAE65E61B6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 13:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiIVLtS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 07:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiIVLtR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 07:49:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A525929817;
        Thu, 22 Sep 2022 04:49:15 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYD3h6lQXzlXLk;
        Thu, 22 Sep 2022 19:45:04 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:49:13 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: hisi: Add support to get clock frequency from clock
 property
To:     Weilong Chen <chenweilong@huawei.com>, <yangyicong@hisilicon.com>
References: <20220921101540.352553-1-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <739d95c7-28f3-5294-c3db-5acaa7d50823@huawei.com>
Date:   Thu, 22 Sep 2022 19:49:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220921101540.352553-1-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Weilong,

On 2022/9/21 18:15, Weilong Chen wrote:
> Support the driver to obtain clock information by clk_rate or
> clock property. Find clock first, if not, fall back to clk_rate.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  drivers/i2c/busses/i2c-hisi.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index 67031024217c..5e48d4ee0c6d 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -8,6 +8,7 @@
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> @@ -91,6 +92,7 @@ struct hisi_i2c_controller {
>  	void __iomem *iobase;
>  	struct device *dev;
>  	int irq;
> +	struct clk *clk;
>  

Prefer to make this field between @irq and @dev, to make these fields ordered
in an inverted triangle.

>  	/* Intermediates for recording the transfer process */
>  	struct completion *completion;
> @@ -456,10 +458,21 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
> -	if (ret) {
> -		dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
> -		return ret;
> +	ctlr->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(ctlr->clk)) {

Use IS_ERR_OR_NULL(), otherwise we cannot get the clock rate.

> +		ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
> +		if (ret) {
> +			dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = clk_prepare_enable(ctlr->clk);

You didn't disable and unprepare the clock on removal.

Use devm_clk_get_optional_enabled() instead then it's managed by devres and the error path
below is unnecessary as well.

BTW, do we really need to prepare and enable the clock? I checked designware-i2c seems it only
gets the clock rate and don't do the prepare and enable operations. I may miss something but
please have a check.

Thanks,
Yicong

> +		if (ret) {
> +			dev_err(dev, "failed to enable clock, ret = %d\n", ret);
> +			return ret;
> +		}
> +
> +		clk_rate_hz = clk_get_rate(ctlr->clk);
>  	}
>  
>  	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(clk_rate_hz, HZ_PER_KHZ);
> @@ -475,8 +488,10 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>  	i2c_set_adapdata(adapter, ctlr);
>  
>  	ret = devm_i2c_add_adapter(dev, adapter);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(ctlr->clk);
>  		return ret;
> +	}
>  
>  	hw_version = readl(ctlr->iobase + HISI_I2C_VERSION);
>  	dev_info(ctlr->dev, "speed mode is %s. hw version 0x%x\n",
> 
