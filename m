Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A64E51C303
	for <lists+linux-i2c@lfdr.de>; Thu,  5 May 2022 16:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380807AbiEEOz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 May 2022 10:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350734AbiEEOzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 May 2022 10:55:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877542CC83;
        Thu,  5 May 2022 07:51:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C1A36198B;
        Thu,  5 May 2022 14:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB37C385AE;
        Thu,  5 May 2022 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651762304;
        bh=UYCZjEShRpoFfzDqVuQUnq+KLuye9U/K272vgc4gV+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YaaCc8QxzSWDamM6l1uMJ+YHmA7aOpzQANULytCi/9o5dCqw1RSPG0BR8oFdVnyUF
         0i7G3r879MfJ5V77awaQ7LC5UlfJkinLk+x5CMGge7jX6r9C4TxPDReme5nTSk9O5S
         LiSdMJn8FEwGCq+H7IHWwD6YTLZVPqA8E9SBPRwoJCQcjlco142d+bUuL8/yRpAeFS
         HTnfB+sQNA56TnlnoTZD8YpnEP07ihKWnGrYUMio0DwWlxAlOIfUGIcLJZeREAOSfW
         7f3XgH12q4KaIrFhOB4kr654GI/2VXtYYYwJmlG+8fwYeDLzVX4ZtJ4Nr4JhDUUcjZ
         hkEVYZlT/UfTA==
Date:   Thu, 5 May 2022 07:51:42 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] i2c: at91: use dma safe buffers
Message-ID: <YnPkfrI4Udl9lMR8@dev-arch.thelio-3990X>
References: <20220407150828.202513-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407150828.202513-1-michael@walle.cc>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 07, 2022 at 05:08:28PM +0200, Michael Walle wrote:
> The supplied buffer might be on the stack and we get the following error
> message:
> [    3.312058] at91_i2c e0070600.i2c: rejecting DMA map of vmalloc memory
> 
> Use i2c_{get,put}_dma_safe_msg_buf() to get a DMA-able memory region if
> necessary.
> 
> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> changes since v1:
>  - remove extra empty line
>  - add fixes tag as suggested by Codrin
> 
>  drivers/i2c/busses/i2c-at91-master.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index b0eae94909f4..5eca3b3bb609 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -656,6 +656,7 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
>  	unsigned int_addr_flag = 0;
>  	struct i2c_msg *m_start = msg;
>  	bool is_read;
> +	u8 *dma_buf;
>  
>  	dev_dbg(&adap->dev, "at91_xfer: processing %d messages:\n", num);
>  
> @@ -703,7 +704,17 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
>  	dev->msg = m_start;
>  	dev->recv_len_abort = false;
>  
> +	if (dev->use_dma) {
> +		dma_buf = i2c_get_dma_safe_msg_buf(m_start, 1);
> +		if (!dma_buf) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		dev->buf = dma_buf;
> +	}
> +
>  	ret = at91_do_twi_transfer(dev);
> +	i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
>  
>  	ret = (ret < 0) ? ret : num;
>  out:
> -- 
> 2.30.2
> 
> 

This change as commit 03fbb903c8bf ("i2c: at91: use dma safe buffers")
causes the following clang warning:

drivers/i2c/busses/i2c-at91-master.c:707:6: error: variable 'dma_buf' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if (dev->use_dma) {
            ^~~~~~~~~~~~
drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use occurs here
        i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
                                 ^~~~~~~
drivers/i2c/busses/i2c-at91-master.c:707:2: note: remove the 'if' if its condition is always true
        if (dev->use_dma) {
        ^~~~~~~~~~~~~~~~~~
drivers/i2c/busses/i2c-at91-master.c:659:13: note: initialize the variable 'dma_buf' to silence this warning
        u8 *dma_buf;
                   ^
                    = NULL
1 error generated.

Should this variable be initialized or should the call to
i2c_put_dma_safe_msg_buf() be moved into the if statement?

Cheers,
Nathan
