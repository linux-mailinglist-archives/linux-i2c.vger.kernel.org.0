Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A017634F891
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 08:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbhCaGPM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 02:15:12 -0400
Received: from muru.com ([72.249.23.125]:49140 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233694AbhCaGPE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 02:15:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9068B80C3;
        Wed, 31 Mar 2021 06:16:06 +0000 (UTC)
Date:   Wed, 31 Mar 2021 09:15:00 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 03/12] ARM: omap1: osk: Constify the software node
Message-ID: <YGQTZIU2D9xp8ZDt@atomide.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Heikki Krogerus <heikki.krogerus@linux.intel.com> [210329 10:51]:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Tony Lindgren <tony@atomide.com>

Probably best to merge this via the rest of the series:

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/mach-omap1/board-osk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
> index 0a4c9b0b13b0c..e18b6f13300eb 100644
> --- a/arch/arm/mach-omap1/board-osk.c
> +++ b/arch/arm/mach-omap1/board-osk.c
> @@ -332,11 +332,15 @@ static const struct property_entry mistral_at24_properties[] = {
>  	{ }
>  };
>  
> +static const struct software_node mistral_at24_node = {
> +	.properties = mistral_at24_properties,
> +};
> +
>  static struct i2c_board_info __initdata mistral_i2c_board_info[] = {
>  	{
>  		/* NOTE:  powered from LCD supply */
>  		I2C_BOARD_INFO("24c04", 0x50),
> -		.properties = mistral_at24_properties,
> +		.swnode = &mistral_at24_node,
>  	},
>  	/* TODO when driver support is ready:
>  	 *  - optionally ov9640 camera sensor at 0x30
> -- 
> 2.30.2
> 
