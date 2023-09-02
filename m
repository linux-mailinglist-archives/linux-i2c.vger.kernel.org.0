Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D227909C1
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 23:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbjIBVQh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 17:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjIBVQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 17:16:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92187DD;
        Sat,  2 Sep 2023 14:16:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2BA2DCE25EB;
        Sat,  2 Sep 2023 21:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCA0C433C7;
        Sat,  2 Sep 2023 21:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693689388;
        bh=tJJTp9jWl4v0InQK3tgpoUjQsrUBcIJai/gng1CwImQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DcvntKSM8RQnKlBc2TUXy3MtBBlV9nvKV6172AAl3FBjoKddQ4GxhS5S6f7YxTRMy
         ZX7pFOYvlWxKXMVQvevOUWhHHtBznDIrMx14/KiQRgC4WJ/2xB9/wTRPzI0Jr6qaxU
         XdkPLJRCdG7fiLBEdh9/QExQht7Qvjmb0YnTuwDGj+98S/M9yYMNVsk/dtTmqw7KeG
         oX34LfbOMdUszJdyDNoZmhemLKbDH8usaWb+MQozz2VjycRAZCDZ44iSSXsHYFU/xO
         xrRr1WPSqqT4huVCVv36xxqFerdOC/e7OqAEi2qva5cFrjyJXHzaTwG7sFxX/lDiBE
         95fYCorLHjq+w==
Date:   Sat, 2 Sep 2023 23:16:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 7/8] i2c: sprd: Set I2C_RX_ACK when clear irq
Message-ID: <20230902211623.3grw7iiuoraiwimd@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-8-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-8-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Thu, Aug 17, 2023 at 05:45:19PM +0800, Huangzheng Lai wrote:
> We found that when clearing the I2C_TX_ACK bit, the I2C_MODE bit will

where is the I2C_TX_ACK bit cleared?

> also be cleared to 0. When the IIC master reads data, this situation
> will cause the FIFO of the IIC to be empty after clearing the interrupt.

Still I am not understanding the situation. In the clear_irq you
don't seem to do anything with the TX_ACK.

> To address this issue, when clearing interrupts, set I2C_RX_ACK bit to 1,
> as writing 1 to this bit will not take effect.

writing 1 to which bit?

Andi

> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index d867389c7f17..6f65f28ea69d 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -138,7 +138,7 @@ static void sprd_i2c_clear_irq(struct sprd_i2c *i2c_dev)
>  {
>  	u32 tmp = readl(i2c_dev->base + I2C_STATUS);
>  
> -	writel(tmp & ~I2C_INT, i2c_dev->base + I2C_STATUS);
> +	writel((tmp & ~I2C_INT) | I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
>  }
>  
>  static void sprd_i2c_reset_fifo(struct sprd_i2c *i2c_dev)
> -- 
> 2.17.1
> 
