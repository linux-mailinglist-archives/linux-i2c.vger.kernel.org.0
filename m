Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A527D5D1B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbjJXVU1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbjJXVUV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:20:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDFA10E6;
        Tue, 24 Oct 2023 14:20:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E5DC433C7;
        Tue, 24 Oct 2023 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698182407;
        bh=c/dSmB2+7TABcInFdYu7kldVit4Y6fD+dg6VWYg0+oM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pJjX9zGcKCOSoYN22PbETI4bvQR8ZUFiLi3Alp5AFijhocOt/ivXUoNcOwDvfNH7X
         BQUQl33eJi6a2poDckq8XjEI+BdAXyjuoMiC2QQS10PDIjlljX38nxmcjlTwUwzXB0
         c9z0NMxGKwgSLr14lMPmkyZLoRzKxSh4sV3jEfdta/MfxiM+m99Rgzvg9f0VZyuZ9M
         Uu4Hbqo+XCJTJdiYAAEJPIqTKY44uOxj2EKJHiwI1xkK/h3bUIEWe8SyV7C+KrKNoC
         GJuOpaiB2YgoA3czd/55nFXg71hWy++Y4Yd/+LLVzNi+2rBngcT8beHEmgZ1po8yn0
         haKiETCebPCVw==
Date:   Tue, 24 Oct 2023 23:20:03 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 3/7] i2c: sprd: Use global variables to record I2C
 ack/nack status instead of local variables
Message-ID: <20231024212003.rfakablxfst5nxba@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-4-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-4-Huangzheng.Lai@unisoc.com>
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

On Mon, Oct 23, 2023 at 04:11:54PM +0800, Huangzheng Lai wrote:
> We found that when the interrupt bit of the I2C controller is cleared,
> the ack/nack bit is also cleared at the same time. After clearing the
> interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> when nack cannot be recognized. To solve this problem, we used a global
> variable to record ack/nack information before clearing the interrupt
> bit instead of a local variable.
> 
> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index aa602958d4fd..dec627ef408c 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -85,6 +85,7 @@ struct sprd_i2c {
>  	struct clk *clk;
>  	u32 src_clk;
>  	u32 bus_freq;
> +	bool ack_flag;

So that you are telling me that this is not racy because we won't
receive any irq until we pull the ack down. Am I understanding
correctly?

But if this patch is fixing an unstable ack flag, how can I
believe this won't end up into a race?

>  	struct completion complete;
>  	struct reset_control *rst;
>  	u8 *buf;
> @@ -119,6 +120,7 @@ static void sprd_i2c_clear_ack(struct sprd_i2c *i2c_dev)
>  {
>  	u32 tmp = readl(i2c_dev->base + I2C_STATUS);
>  
> +	i2c_dev->ack_flag = 0;
>  	writel(tmp & ~I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
>  }
>  
> @@ -393,7 +395,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  {
>  	struct sprd_i2c *i2c_dev = dev_id;
>  	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);

Where exactly did you see the ack going to '0', here in the
thread or in handler?

>  	u32 i2c_tran;
>  
>  	if (msg->flags & I2C_M_RD)
> @@ -409,7 +410,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  	 * For reading data, ack is always true, if i2c_tran is not 0 which
>  	 * means we still need to contine to read data from slave.
>  	 */
> -	if (i2c_tran && ack) {
> +	if (i2c_tran && i2c_dev->ack_flag) {
>  		sprd_i2c_data_transfer(i2c_dev);
>  		return IRQ_HANDLED;
>  	}
> @@ -420,7 +421,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  	 * If we did not get one ACK from slave when writing data, we should
>  	 * return -EIO to notify users.
>  	 */
> -	if (!ack)
> +	if (!i2c_dev->ack_flag)
>  		i2c_dev->err = -EIO;
>  	else if (msg->flags & I2C_M_RD && i2c_dev->count)
>  		sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
> @@ -437,7 +438,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>  {
>  	struct sprd_i2c *i2c_dev = dev_id;
>  	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>  	u32 i2c_tran;
>  
>  	if (msg->flags & I2C_M_RD)
> @@ -456,7 +456,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>  	 * means we can read all data in one time, then we can finish this
>  	 * transmission too.
>  	 */
> -	if (!i2c_tran || !ack) {
> +	i2c_dev->ack_flag = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
> +	if (!i2c_tran || !i2c_dev->ack_flag) {
>  		sprd_i2c_clear_start(i2c_dev);

this clear_start() is called both here and in the thread, why?

Andi

>  		sprd_i2c_clear_irq(i2c_dev);
>  	}
> -- 
> 2.17.1
> 
