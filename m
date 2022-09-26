Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239375E9C65
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 10:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbiIZIsT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 04:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234586AbiIZIsH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 04:48:07 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B7C1E735;
        Mon, 26 Sep 2022 01:48:05 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mbbrk59gnz1P6qF;
        Mon, 26 Sep 2022 16:43:50 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 16:48:03 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yangyicong@hisilicon.com>
Subject: Re: [PATCH next v2] i2c: hisi: Add support to get clock frequency
 from clock property
To:     Weilong Chen <chenweilong@huawei.com>
References: <20220923011417.78994-1-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <36c1742f-f0a5-84e9-15af-07c888058759@huawei.com>
Date:   Mon, 26 Sep 2022 16:48:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220923011417.78994-1-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/9/23 9:14, Weilong Chen wrote:
> Support the driver to obtain clock information by clk_rate or
> clock property. Find clock first, if not, fall back to clk_rate.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v1:
> - Ordered struct field to inverted triangle.
> - Use devm_clk_get_optional_enabled().
> - Use IS_ERR_OR_NULL.
> Link: https://lore.kernel.org/lkml/20220921101540.352553-1-chenweilong@huawei.com/
> 
>  drivers/i2c/busses/i2c-hisi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index 67031024217c..b3bcce71dd2c 100644
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
> @@ -90,6 +91,7 @@ struct hisi_i2c_controller {
>  	struct i2c_adapter adapter;
>  	void __iomem *iobase;
>  	struct device *dev;
> +	struct clk *clk;
>  	int irq;
>  
>  	/* Intermediates for recording the transfer process */
> @@ -456,10 +458,16 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
> -	if (ret) {
> -		dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
> -		return ret;
> +	ctlr->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	if (IS_ERR_OR_NULL(ctlr->clk)) {
> +		ret = device_property_read_u64(dev, "clk_rate", &clk_rate_hz);
> +		if (ret) {
> +			dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +

redundant blank line? with this addressed:

Acked-by: Yicong Yang <yangyicong@hisilicon.com>

> +		clk_rate_hz = clk_get_rate(ctlr->clk);
>  	}
>  
>  	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(clk_rate_hz, HZ_PER_KHZ);
> 
