Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7DE72ABA9
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 15:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjFJNYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 09:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjFJNYp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 09:24:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE70DF;
        Sat, 10 Jun 2023 06:24:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C105960C8C;
        Sat, 10 Jun 2023 13:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECF4C433D2;
        Sat, 10 Jun 2023 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686403483;
        bh=y5JXbimmOYI0fIpDE62FlLWehnn9LJPLg1gxezHS/z4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WJP9i19rG+2MMkDQoUdjuDR0vVgPj7arky5v4v0GQ8j1fSaO8+8stmlMiN55djKK5
         IY6HMwpSHzHMeYAugoQX7DBde9NjCZ0K8ZxjMAIf8Nbcql2g/pRX7wCNlMT/6O3aN0
         OTvYOTEkxb7ds4hVFUBjaYO17JLJZkQ6YkaD18mDeLmRRJ5ZnBAlDDZOgmQq3sddaa
         OE68T4Xk2StDGin+ngGyntiw4m+R1EwiMcvNBdV96oj6cY7AD6ITfdJVW8dWRjSvr9
         VnMc+5B6TeTFYcz9WJBTaztXelsjPDiVF8DMlE5+v5peu8+Q++/f2KVHbFKBqNAeyL
         xb6P+t0mlfwqQ==
Date:   Sat, 10 Jun 2023 15:24:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, rric@kernel.org, jannadurai@marvell.com,
        cchavva@marvell.com, Suneel Garapati <sgarapati@marvell.com>
Subject: Re: [PATCH 3/3] i2c: octeon: Handle watchdog timeout
Message-ID: <20230610132439.ydiuizoolplonvjf@intel.intel>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
 <20230330133953.21074-4-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330133953.21074-4-pmalgujar@marvell.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Suneel and Piysh,

On Thu, Mar 30, 2023 at 06:39:53AM -0700, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Status code 0xF0 refers to expiry of TWSI controller
> access watchdog and needs bus monitor reset using MODE
> register.
> 
> Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> ---
>  drivers/i2c/busses/i2c-octeon-core.c | 8 ++++++++
>  drivers/i2c/busses/i2c-octeon-core.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
> index 7c49dc8ccbd2ef05fec675d282193b98f2b69835..3482db7165f243232937e0af148fe996858e9f2e 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.c
> +++ b/drivers/i2c/busses/i2c-octeon-core.c
> @@ -187,6 +187,7 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
>  static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
>  {
>  	u8 stat;
> +	u64 mode;
>  
>  	/*
>  	 * This is ugly... in HLC mode the status is not in the status register
> @@ -249,6 +250,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
>  	case STAT_RXADDR_NAK:
>  	case STAT_AD2W_NAK:
>  		return -ENXIO;
> +
> +	case STAT_WDOG_TOUT:
> +		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
> +		/* Set BUS_MON_RST to reset bus monitor */
> +		mode |= BIT(3);

Would be nice to have this masks all defined, but other than
this:

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

> +		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
> +		return -EIO;
>  	default:
>  		dev_err(i2c->dev, "unhandled state: %d\n", stat);
>  		return -EIO;
> diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
> index 89d7d3bb8e30bd5787978d17d5a9b20ab0d41e22..a8d1bf9e89b8b0d21f52ff9f77f0ecf5263b5843 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.h
> +++ b/drivers/i2c/busses/i2c-octeon-core.h
> @@ -72,6 +72,7 @@
>  #define STAT_SLAVE_ACK		0xC8
>  #define STAT_AD2W_ACK		0xD0
>  #define STAT_AD2W_NAK		0xD8
> +#define STAT_WDOG_TOUT		0xF0
>  #define STAT_IDLE		0xF8
>  
>  /* TWSI_INT values */
> -- 
> 2.17.1
> 
