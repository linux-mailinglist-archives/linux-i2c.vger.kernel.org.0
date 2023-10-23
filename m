Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173867D3399
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 13:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbjJWLcJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 07:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjJWLcI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 07:32:08 -0400
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64867DF;
        Mon, 23 Oct 2023 04:32:05 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vukm8c._1698060721;
Received: from 30.97.48.63(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Vukm8c._1698060721)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 19:32:02 +0800
Message-ID: <27d2f363-e24a-736a-9c4e-cff79ff958e0@linux.alibaba.com>
Date:   Mon, 23 Oct 2023 19:32:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 3/7] i2c: sprd: Use global variables to record I2C
 ack/nack status instead of local variables
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-4-Huangzheng.Lai@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20231023081158.10654-4-Huangzheng.Lai@unisoc.com>
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
> We found that when the interrupt bit of the I2C controller is cleared,
> the ack/nack bit is also cleared at the same time. After clearing the
> interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> when nack cannot be recognized. To solve this problem, we used a global

This is a hardware bug?

> variable to record ack/nack information before clearing the interrupt
> bit instead of a local variable.
> 
> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>   drivers/i2c/busses/i2c-sprd.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index aa602958d4fd..dec627ef408c 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -85,6 +85,7 @@ struct sprd_i2c {
>   	struct clk *clk;
>   	u32 src_clk;
>   	u32 bus_freq;
> +	bool ack_flag;
>   	struct completion complete;
>   	struct reset_control *rst;
>   	u8 *buf;
> @@ -119,6 +120,7 @@ static void sprd_i2c_clear_ack(struct sprd_i2c *i2c_dev)
>   {
>   	u32 tmp = readl(i2c_dev->base + I2C_STATUS);
>   
> +	i2c_dev->ack_flag = 0;
>   	writel(tmp & ~I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
>   }
>   
> @@ -393,7 +395,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>   {
>   	struct sprd_i2c *i2c_dev = dev_id;
>   	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);

Before this patch, we will re-read the ack bit form the register, but 
now we just read it in sprd_i2c_isr(). Is it possible that we will miss 
the ack bit?

>   	u32 i2c_tran;
>   
>   	if (msg->flags & I2C_M_RD)
> @@ -409,7 +410,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>   	 * For reading data, ack is always true, if i2c_tran is not 0 which
>   	 * means we still need to contine to read data from slave.
>   	 */
> -	if (i2c_tran && ack) {
> +	if (i2c_tran && i2c_dev->ack_flag) {
>   		sprd_i2c_data_transfer(i2c_dev);
>   		return IRQ_HANDLED;
>   	}
> @@ -420,7 +421,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>   	 * If we did not get one ACK from slave when writing data, we should
>   	 * return -EIO to notify users.
>   	 */
> -	if (!ack)
> +	if (!i2c_dev->ack_flag)
>   		i2c_dev->err = -EIO;
>   	else if (msg->flags & I2C_M_RD && i2c_dev->count)
>   		sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
> @@ -437,7 +438,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>   {
>   	struct sprd_i2c *i2c_dev = dev_id;
>   	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>   	u32 i2c_tran;
>   
>   	if (msg->flags & I2C_M_RD)
> @@ -456,7 +456,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>   	 * means we can read all data in one time, then we can finish this
>   	 * transmission too.
>   	 */
> -	if (!i2c_tran || !ack) {
> +	i2c_dev->ack_flag = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
> +	if (!i2c_tran || !i2c_dev->ack_flag) {
>   		sprd_i2c_clear_start(i2c_dev);
>   		sprd_i2c_clear_irq(i2c_dev);
>   	}
