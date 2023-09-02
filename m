Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECA7E7909C7
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 23:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbjIBVV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 17:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjIBVV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 17:21:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910A418E;
        Sat,  2 Sep 2023 14:21:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30DE461049;
        Sat,  2 Sep 2023 21:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30770C433C8;
        Sat,  2 Sep 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693689713;
        bh=PRxo/tqFDNWIt6y7KPiZTn4Vl1jztIQ9xzPLMTJ3GiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MHxlyCt4AoPSl6QFxJ5kA1677I4BV6nGboB3lLp6dbPCd9Gwh8J5kYYx0BRzjnLoa
         kQgNrXSS3SVfJGHLT1DOLZzpCRCJYMMtk8mCLhRjwK/G2PSJb1IFIATNyQ4IN9FWkH
         1owIN79kBffdtVHBkpZbC7OImPYOiM+Vm3L0kcbYFr8+WkGVK4vj0wO7A+0qIX/s1z
         wTvgFHunezSsH1EZz+izVfe1B4aL8vdadK5NHhoXK2NebKdqcrq+8Wr33inA4lEdQn
         OREGSI9UJz1yUZ4UpzDFI1XAxeR9PS+CECLFecVr+U03j19LINYCCkkUzpgsuNSTRY
         2EMmtQkvoqFMQ==
Date:   Sat, 2 Sep 2023 23:21:49 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 8/8] i2c: sprd: Increase the waiting time for IIC
 transmission to avoid system crash issues
Message-ID: <20230902212149.wsxawpvm66j7pukx@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-9-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-9-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Thu, Aug 17, 2023 at 05:45:20PM +0800, Huangzheng Lai wrote:
> Due to the relatively low priority of the isr_thread, when the CPU
> load is high, the execution of sprd_i2c_isr_thread will be delayed.
> After the waiting time is exceeded, the IIC driver will perform
> operations such as disabling the IIC controller. Later, when
> sprd_i2c_isr_thread is called by the CPU, there will be kernel panic
> caused by illegal access to the IIC register. After pressure testing,
> we found that increasing the IIC waiting time to 10 seconds can
> avoid this problem.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

Is this a fix? Then please consider adding:

0b884fe71f9e ("i2c: sprd: use a specific timeout to avoid system hang up issue")
Cc: <stable@vger.kernel.org> # v5.11+

Andi

> ---
>  drivers/i2c/busses/i2c-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 6f65f28ea69d..3c7af04fa177 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -76,7 +76,7 @@
>  /* timeout (ms) for pm runtime autosuspend */
>  #define SPRD_I2C_PM_TIMEOUT	1000
>  /* timeout (ms) for transfer message */
> -#define I2C_XFER_TIMEOUT	1000
> +#define I2C_XFER_TIMEOUT	10000
>  /* dynamic modify clk_freq flag  */
>  #define	I2C_3M4_FLAG		0x0100
>  #define	I2C_1M_FLAG		0x0080
> -- 
> 2.17.1
> 
