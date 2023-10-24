Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309A87D5D4A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjJXVin (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjJXVin (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:38:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905A2A6;
        Tue, 24 Oct 2023 14:38:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C7FC433C8;
        Tue, 24 Oct 2023 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698183521;
        bh=d1cHPxa8Q9ehkeX+QuV6dbadawEB4NDSOLejXgMiipA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIduF/TS/HZHCvb91BoMPY0RDfuQ3FC0eYBFqPVVF8PShBiiV2n20AIsZKc+ars4b
         NrpwX2AEGddVllamvLjBDVH00/3Y6/W+CcPRUlIEBkRrb6WqwP0CSc5oepA0I3Cewb
         0j8BJHuMNX95eKq0rrxk5jALmkKeg2TKQrZ1mxiYh2i+nRkNskgb9upH4LpaY00kqU
         B/AF2nZZcItd9TrK6V4BpaZQJjNEnWB1eYjd/kjeniQelJuzOIp3KPPtSkOArjunza
         aHEFZ/OCS0eQ5bfkDz7ugOPeWLxFafFY8B9G4en0iNOtqR8ium0uHjicVd/XHPhHxZ
         M1B8EhIHnYobg==
Date:   Tue, 24 Oct 2023 23:38:37 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 6/7] i2c: sprd: Increase the waiting time for I2C
 transmission to avoid system crash issues
Message-ID: <20231024213837.psfooptgrcawvuqs@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-7-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-7-Huangzheng.Lai@unisoc.com>
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

On Mon, Oct 23, 2023 at 04:11:57PM +0800, Huangzheng Lai wrote:
> Due to the relatively low priority of the isr_thread, when the CPU
> load is high, the execution of sprd_i2c_isr_thread will be delayed.
> After the waiting time is exceeded, the I2C driver will perform
> operations such as disabling the I2C controller. Later, when
> sprd_i2c_isr_thread is called by the CPU, there will be kernel panic
> caused by illegal access to the IIC register. After pressure testing,
> we found that increasing the IIC waiting time to 10 seconds can
> avoid this problem.
> 
> Fixes: 0b884fe71f9e ("i2c: sprd: use a specific timeout to avoid system hang up issue")
> Cc: <stable@vger.kernel.org> # v5.11+
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi

> ---
>  drivers/i2c/busses/i2c-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index b65729ba7d5a..dbdac89ad482 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -74,7 +74,7 @@
>  /* timeout (ms) for pm runtime autosuspend */
>  #define SPRD_I2C_PM_TIMEOUT	1000
>  /* timeout (ms) for transfer message */
> -#define I2C_XFER_TIMEOUT	1000
> +#define I2C_XFER_TIMEOUT	10000
>  /* dynamic modify clk_freq flag  */
>  #define I2C_3M4_FLAG		0x0100
>  #define I2C_1M_FLAG		0x0080
> -- 
> 2.17.1
> 
