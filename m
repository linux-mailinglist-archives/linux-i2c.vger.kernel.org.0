Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B007D34E8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbjJWLnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbjJWLn3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:43:29 -0400
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E30310F7;
        Mon, 23 Oct 2023 04:43:25 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VukmBk1_1698061400;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VukmBk1_1698061400)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:43:21 +0800
Message-ID: <33b514a0-2ea3-35d6-944c-03ce4c61a6c4@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:43:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 7/7] i2c: sprd: Add I2C_NACK_EN and I2C_TRANS_EN
 control bits
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-8-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-8-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.2 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/23/2023 4:11 PM, Huangzheng Lai wrote:
> The new I2C IP version on the UNISOC platform has added I2C_NACK_EN and
> I2C_TRANS_EN control bits. To ensure that the I2C controller can initiate
> transmission smoothly, these two bits need to be configured.

What is the side impact for old hardwares that does not support these 2 
bits?

> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>   drivers/i2c/busses/i2c-sprd.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index dbdac89ad482..431c0db84d22 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -33,6 +33,8 @@
>   #define ADDR_RST		0x2c
>   
>   /* I2C_CTL */
> +#define I2C_NACK_EN		BIT(22)
> +#define I2C_TRANS_EN		BIT(21)
>   #define STP_EN			BIT(20)
>   #define FIFO_AF_LVL_MASK	GENMASK(19, 16)
>   #define FIFO_AF_LVL		16
> @@ -366,7 +368,7 @@ static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
>   	sprd_i2c_clear_irq(i2c_dev);
>   
>   	tmp = readl(i2c_dev->base + I2C_CTL);
> -	writel(tmp | I2C_EN | I2C_INT_EN, i2c_dev->base + I2C_CTL);
> +	writel(tmp | I2C_EN | I2C_INT_EN | I2C_NACK_EN | I2C_TRANS_EN, i2c_dev->base + I2C_CTL);
>   }
>   
>   static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
