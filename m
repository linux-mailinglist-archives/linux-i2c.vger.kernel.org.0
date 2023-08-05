Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFB3770F31
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 12:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjHEKKK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 06:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjHEKKI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 06:10:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60CFE57;
        Sat,  5 Aug 2023 03:10:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2FB6F60C6B;
        Sat,  5 Aug 2023 10:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E34C433C8;
        Sat,  5 Aug 2023 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691230206;
        bh=RZD/okUT8P7W5bz60THY3oriTvZX3Irx0g2o/7jpNgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nXu7JJHLU9Jooam3uyoQ6e0wCkbz7xIrGiNIEzv+H/djdFeKyXyWdoZ+cS3ex/nwx
         Hf9os47q9i4O8rPUaHQEgCCnGE2sIREgy0TXaQFDlx0XI6OsZZ3twxM2UKb2vu8lk9
         VjGfrOnun6jBInNaow/vZ6xwduNClFon1dJhbxDxobyoV0jJhVMfWkTshDyLIiZXx8
         2JpDieuy6NeBfihyEuejwO1jTP//MyoaxMPoQ32cQNoIQeXAk9HZXylYzNVrd8TKZc
         kH3hOayvpvoIsew6gxod6r315LuWEQMQ0jQq40j4QCIftMqMIxr0mjwDZBTOR7cW9P
         a8t3p6xKC7M+g==
Date:   Sat, 5 Aug 2023 12:10:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Lixue Liang <lianglixuehao@126.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, Lixue Liang <lianglixue@greatwall.com.cn>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c
 transfers.
Message-ID: <20230805101004.dknxj7nqrt2aes5n@intel.intel>
References: <20230728122416.17782-1-lianglixuehao@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728122416.17782-1-lianglixuehao@126.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lixue,

On Fri, Jul 28, 2023 at 12:24:16PM +0000, Lixue Liang wrote:
> From: Lixue Liang <lianglixue@greatwall.com.cn>
> 
> After waiting for the transmission timeout, the I2C controller will
> continue to transmit data when the bus is idle. Clearing bus->msg will
> avoid kernel panic when accessing the freed msg->buf in
> aspeed_i2c_master_irq.

actually in aspeed_i2c_master_irq() you are already checking for
!bus->msgs.

What kind of panic are you referring to?

Andi

> Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..c83057497e26 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  		spin_lock_irqsave(&bus->lock, flags);
>  		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>  			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +
> +		bus->msgs = NULL;
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		return -ETIMEDOUT;
> -- 
> 2.27.0
> 
