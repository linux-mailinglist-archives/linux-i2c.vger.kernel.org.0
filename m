Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155E87D3424
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbjJWLhD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbjJWLhC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:37:02 -0400
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83ADDFF;
        Mon, 23 Oct 2023 04:36:58 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuktlA6_1698061013;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VuktlA6_1698061013)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:36:54 +0800
Message-ID: <d028322f-ca9c-f18e-2a96-8c950a991a1a@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:37:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 4/7] i2c: sprd: Add I2C controller driver to support
 dynamic switching of 400K/1M/3.4M frequency
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-5-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-5-Huangzheng.Lai@unisoc.com>
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
> When I2C-slaves supporting different frequencies use the same I2C
> controller, the I2C controller usually only operates at lower frequencies.
> In order to improve the performance of I2C-slaves transmission supporting
> faster frequencies, we dynamically configure the I2C operating frequency
> based on the value of the input parameter msg ->flag.

I am not sure if this is suitable to expand the msg->flag. Andi, how do 
you think? Thanks.

> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>   drivers/i2c/busses/i2c-sprd.c | 101 +++++++++++++++++++---------------
>   1 file changed, 57 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index dec627ef408c..f1f7fad42ecd 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -75,7 +75,14 @@
>   #define SPRD_I2C_PM_TIMEOUT	1000
>   /* timeout (ms) for transfer message */
>   #define I2C_XFER_TIMEOUT	1000
> -
> +/* dynamic modify clk_freq flag  */
> +#define I2C_3M4_FLAG		0x0100
> +#define I2C_1M_FLAG		0x0080
> +#define I2C_400K_FLAG		0x0040
> +
> +#define I2C_FREQ_400K		400000
> +#define I2C_FREQ_1M		1000000
> +#define I2C_FREQ_3_4M		3400000
>   /* SPRD i2c data structure */
>   struct sprd_i2c {
>   	struct i2c_adapter adap;
> @@ -94,6 +101,49 @@ struct sprd_i2c {
>   	int err;
>   };
>   
> +static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
> +{
> +	u32 apb_clk = i2c_dev->src_clk;
> +	/*
> +	 * From I2C databook, the prescale calculation formula:
> +	 * prescale = freq_i2c / (4 * freq_scl) - 1;
> +	 */
> +	u32 i2c_dvd = apb_clk / (4 * freq) - 1;
> +	/*
> +	 * From I2C databook, the high period of SCL clock is recommended as
> +	 * 40% (2/5), and the low period of SCL clock is recommended as 60%
> +	 * (3/5), then the formula should be:
> +	 * high = (prescale * 2 * 2) / 5
> +	 * low = (prescale * 2 * 3) / 5
> +	 */
> +	u32 high = ((i2c_dvd << 1) * 2) / 5;
> +	u32 low = ((i2c_dvd << 1) * 3) / 5;
> +	u32 div0 = I2C_ADDR_DVD0_CALC(high, low);
> +	u32 div1 = I2C_ADDR_DVD1_CALC(high, low);
> +
> +	writel(div0, i2c_dev->base + ADDR_DVD0);
> +	writel(div1, i2c_dev->base + ADDR_DVD1);
> +
> +	/* Start hold timing = hold time(us) * source clock */
> +	switch (freq) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
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
> +}
> +
>   static void sprd_i2c_set_count(struct sprd_i2c *i2c_dev, u32 count)
>   {
>   	writel(count, i2c_dev->base + I2C_COUNT);
> @@ -269,6 +319,12 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>   		sprd_i2c_send_stop(i2c_dev, !!is_last_msg);
>   	}
>   
> +	if (msg->flags & I2C_400K_FLAG)
> +		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_400K);
> +	else if (msg->flags & I2C_1M_FLAG)
> +		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_1M);
> +	else if (msg->flags & I2C_3M4_FLAG)
> +		sprd_i2c_set_clk(i2c_dev, I2C_FREQ_3_4M);
>   	/*
>   	 * We should enable rx fifo full interrupt to get data when receiving
>   	 * full data.
> @@ -331,49 +387,6 @@ static const struct i2c_algorithm sprd_i2c_algo = {
>   	.functionality = sprd_i2c_func,
>   };
>   
> -static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
> -{
> -	u32 apb_clk = i2c_dev->src_clk;
> -	/*
> -	 * From I2C databook, the prescale calculation formula:
> -	 * prescale = freq_i2c / (4 * freq_scl) - 1;
> -	 */
> -	u32 i2c_dvd = apb_clk / (4 * freq) - 1;
> -	/*
> -	 * From I2C databook, the high period of SCL clock is recommended as
> -	 * 40% (2/5), and the low period of SCL clock is recommended as 60%
> -	 * (3/5), then the formula should be:
> -	 * high = (prescale * 2 * 2) / 5
> -	 * low = (prescale * 2 * 3) / 5
> -	 */
> -	u32 high = ((i2c_dvd << 1) * 2) / 5;
> -	u32 low = ((i2c_dvd << 1) * 3) / 5;
> -	u32 div0 = I2C_ADDR_DVD0_CALC(high, low);
> -	u32 div1 = I2C_ADDR_DVD1_CALC(high, low);
> -
> -	writel(div0, i2c_dev->base + ADDR_DVD0);
> -	writel(div1, i2c_dev->base + ADDR_DVD1);
> -
> -	/* Start hold timing = hold time(us) * source clock */
> -	switch (freq) {
> -	case I2C_MAX_STANDARD_MODE_FREQ:
> -		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
> -		break;
> -	case I2C_MAX_FAST_MODE_FREQ:
> -		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -		break;
> -	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> -		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -		break;
> -	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> -		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -		break;
> -	default:
> -		dev_err(i2c_dev->dev, "Unsupported frequency: %d\n", freq);
> -		break;
> -	}
> -}
> -
>   static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
>   {
>   	u32 tmp = I2C_DVD_OPT;
