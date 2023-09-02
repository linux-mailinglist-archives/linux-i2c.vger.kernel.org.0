Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9366E7909A3
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 23:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbjIBVFY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 17:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjIBVFY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 17:05:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1C1AB;
        Sat,  2 Sep 2023 14:05:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9B719B80471;
        Sat,  2 Sep 2023 21:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6A4C433C7;
        Sat,  2 Sep 2023 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693688718;
        bh=rk6OUUF0lju8fTJCsQyrCMTMh23x8YQNCTK57B6EXQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uffgnftZcfh0vQobjrnOagHZJ/k2irGDSeKLePIBbkNANCFGzY7aKcCnPvG33gg2S
         4qcQva1K+qp+6wu54OrL3C67oiQJKOrCDLdlagvWNg8M+RnpBe4epC2JoQ23LjUJgU
         +zfh6HK1X+0a8amJJHUNxKwmL8wGaTF8yw+AjPkbBOwqQSGTHeH0nW4MIWaTwKpq7W
         foIw++NlqbXjm5gdy3LlohxMsTYD1RNvFUldKyKtd7e/Jxl/ie1Qn21oDPdfA133YM
         gCLy/9ka3zDmJ2NN4I5AXDnHMNV1fp0lGsx3z64JRVN3ukBYbOrJcZ8C4FCXawUrYd
         dhG4o4E6wr5yQ==
Date:   Sat, 2 Sep 2023 23:05:13 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 3/8] i2c: sprd: Use global variables to record IIC
 ack/nack status instead of local variables
Message-ID: <20230902210513.3xelrcdtynz45p4o@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-4-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-4-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Thu, Aug 17, 2023 at 05:45:15PM +0800, Huangzheng Lai wrote:
> We found that when the interrupt bit of the IIC controller is cleared,
> the ack/nack bit is also cleared at the same time. After clearing the
> interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> when nack cannot be recognized. To solve this problem, we used a global
> variable to record ack/nack information before clearing the interrupt
> bit instead of a local variable.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

Is this a fix? Then please consider adding

Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
Cc: <stable@vger.kernel.org> # v4.14+

> ---
>  drivers/i2c/busses/i2c-sprd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 066b3a9c30c8..549b60dd3273 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -85,6 +85,7 @@ struct sprd_i2c {
>  	struct clk *clk;
>  	u32 src_clk;
>  	u32 bus_freq;
> +	bool ack_flag;

smells a bit racy... however we are in the same interrupt cycle.

Do you think we might need a spinlock around here?

>  	struct completion complete;
>  	struct reset_control *rst;
>  	u8 *buf;
> @@ -384,7 +385,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  {
>  	struct sprd_i2c *i2c_dev = dev_id;
>  	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>  	u32 i2c_tran;
>  
>  	if (msg->flags & I2C_M_RD)
> @@ -400,7 +400,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  	 * For reading data, ack is always true, if i2c_tran is not 0 which
>  	 * means we still need to contine to read data from slave.
>  	 */
> -	if (i2c_tran && ack) {
> +	if (i2c_tran && i2c_dev->ack_flag) {
>  		sprd_i2c_data_transfer(i2c_dev);
>  		return IRQ_HANDLED;
>  	}
> @@ -411,7 +411,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  	 * If we did not get one ACK from slave when writing data, we should
>  	 * return -EIO to notify users.
>  	 */
> -	if (!ack)
> +	if (!i2c_dev->ack_flag)
>  		i2c_dev->err = -EIO;
>  	else if (msg->flags & I2C_M_RD && i2c_dev->count)
>  		sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
> @@ -428,7 +428,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>  {
>  	struct sprd_i2c *i2c_dev = dev_id;
>  	struct i2c_msg *msg = i2c_dev->msg;
> -	bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>  	u32 i2c_tran;
>  
>  	if (msg->flags & I2C_M_RD)
> @@ -447,7 +446,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>  	 * means we can read all data in one time, then we can finish this
>  	 * transmission too.
>  	 */
> -	if (!i2c_tran || !ack) {
> +	i2c_dev->ack_flag = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);

there is a question from Chunyan here.

I like more

	val = readl(...);
	i2c_dev->ack_flag = !(val & I2C_RX_ACK);

a matter of taste, your choice.

Andi

> +	if (!i2c_tran || !i2c_dev->ack_flag) {
>  		sprd_i2c_clear_start(i2c_dev);
>  		sprd_i2c_clear_irq(i2c_dev);
>  	}
> -- 
> 2.17.1
> 
