Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAD37D3322
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbjJWL1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbjJWL1C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:27:02 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DBFC1;
        Mon, 23 Oct 2023 04:26:58 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuktKLu_1698060413;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VuktKLu_1698060413)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:26:54 +0800
Message-ID: <001b726f-bd33-7dff-a633-ca2ca83d9e8d@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 2/7] i2c: sprd: Add I2C driver to use 'reset framework'
 function
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-3-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-3-Huangzheng.Lai@unisoc.com>
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
> Add the 'reset framework' function for I2C drivers, which
> resets the I2C controller when a timeout exception occurs.

Can you explain the situations that can lead to a timeout explicitly?

> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>   drivers/i2c/busses/i2c-sprd.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index b44916c6741d..aa602958d4fd 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -17,6 +17,7 @@
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>   
>   #define I2C_CTL			0x00
>   #define I2C_ADDR_CFG		0x04
> @@ -85,6 +86,7 @@ struct sprd_i2c {
>   	u32 src_clk;
>   	u32 bus_freq;
>   	struct completion complete;
> +	struct reset_control *rst;
>   	u8 *buf;
>   	u32 count;
>   	int irq;
> @@ -278,9 +280,17 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>   
>   	time_left = wait_for_completion_timeout(&i2c_dev->complete,
>   				msecs_to_jiffies(I2C_XFER_TIMEOUT));
> -	if (!time_left)
> +	if (!time_left) {
> +		dev_err(i2c_dev->dev, "transfer timeout, I2C_STATUS = 0x%x\n",
> +			readl(i2c_dev->base + I2C_STATUS));
> +		if (i2c_dev->rst) {
> +			int ret = reset_control_reset(i2c_dev->rst);
> +
> +			if (ret < 0)
> +				dev_warn(i2c_dev->dev, "i2c soft reset failed, ret = %d\n", ret);
> +		}
>   		return -ETIMEDOUT;
> -
> +	}
>   	return i2c_dev->err;
>   }
>   
> @@ -544,6 +554,11 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	platform_set_drvdata(pdev, i2c_dev);
> +	i2c_dev->rst = devm_reset_control_get(i2c_dev->dev, "i2c_rst");

IMO, you need update the device binding file firstly.

> +	if (IS_ERR(i2c_dev->rst)) {
> +		dev_dbg(i2c_dev->dev, "reset control not configured!\n");
> +		i2c_dev->rst = NULL;
> +	}
>   
>   	ret = clk_prepare_enable(i2c_dev->clk);
>   	if (ret)
