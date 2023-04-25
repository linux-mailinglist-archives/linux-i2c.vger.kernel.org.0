Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E446EE219
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 14:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234113AbjDYMp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 08:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbjDYMp7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 08:45:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC9B5274;
        Tue, 25 Apr 2023 05:45:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7C160918;
        Tue, 25 Apr 2023 12:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF82C433D2;
        Tue, 25 Apr 2023 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682426753;
        bh=9lqVfCY9lLNHU0htrkybarsz+MAML/KCYyGae4bOTcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GPQwjFbHXfbaZoMuVOWAceNN5zB/+0Wdc3tFockPvhCAKr6et06igeX9BE2m7wT9V
         E4QUM1oU2MJgBs0tH5zwQ7eyDg5derW8j9c1ebA9mysIgHR6JMu7FGOogchWzkszTE
         Ozhq8a3ODOT9jZCwhfiCLLy72vN4qfJM2pBoSJzdGaBdSfJS8GMMOOwV6iayYq1Hhd
         Mj6Xc7pp3Fxgf7+Q8LASjH0h69bWbYjbhCRKjkwLzfD82Qe6ZwzZDTUHKhojYYVCdV
         gkupWdvJS4D+ZOuD/AHUN6CVuLgzqRJQFSMCH/OssuA3hH2WPGbe1MszqCr9K3I2wg
         Dh0ci8kh3ItoA==
Date:   Tue, 25 Apr 2023 14:45:49 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Reid Tonking <reidt@ti.com>
Cc:     tony@atomide.com, vigneshr@ti.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20230425124549.kdvfyvuy4uolvsr2@intel.intel>
References: <20230424195344.627861-1-reidt@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424195344.627861-1-reidt@ti.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Reid,

On Mon, Apr 24, 2023 at 02:53:44PM -0500, Reid Tonking wrote:
> Using standard mode, rare false ACK responses were appearing with
> i2cdetect tool. This was happening due to NACK interrupt triggering
> ISR thread before register access interrupt was ready. Removing the
> NACK interrupt's ability to trigger ISR thread lets register access
> ready interrupt do this instead.
> 
> Fixes: 3b2f8f82dad7 ("i2c: omap: switch to threaded IRQ support")
> 
> Signed-off-by: Reid Tonking <reidt@ti.com>

please don't leave any space between Fixes and SoB.

Add also:

Cc: <stable@vger.kernel.org> # v3.7+

and Cc the stable list.

Andi

> ---
> Fixes: LCPD-29949
> 
>  drivers/i2c/busses/i2c-omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index f9ae520aed22..7ec252199706 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1058,7 +1058,7 @@ omap_i2c_isr(int irq, void *dev_id)
>  	u16 stat;
>  
>  	stat = omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG);
> -	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG);
> +	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG) & ~OMAP_I2C_STAT_NACK;
>  
>  	if (stat & mask)
>  		ret = IRQ_WAKE_THREAD;
> -- 
> 2.34.1
> 
