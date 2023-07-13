Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E54751DB3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jul 2023 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbjGMJu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jul 2023 05:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGMJuY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jul 2023 05:50:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A166A2127;
        Thu, 13 Jul 2023 02:50:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A34361A04;
        Thu, 13 Jul 2023 09:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC93DC433C9;
        Thu, 13 Jul 2023 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689241822;
        bh=icvIwss5y7gK8lazKafu7EV/S77mfs58Ox8lRRkr9ls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p4NHB/+aztIlsXRINAyax057/9bZvOzQIkJzCZ/BMCiTAB3Xwc+64+5Wfi60PR6KE
         UUA/aXbJ5HFNVtYDIciAw5Sg2fwnv/UaLLqxU8/iM3FsAKBlli7CMjWUZOcOjjzY8/
         qUvjC9pArFpLpc1eYQX5Awdr83AVQ7PUzzkNnVn3ngULxTcGEFkza8L8Mh2e7sxVNR
         xtt8ULruwNTPpzh2f8Pq3LqANJ+j6tNZpvfxfie45HQpFYZNSloNANU03Zn/bRDAG0
         o+UBobsPEultuKO6RKeDQQ6Pc+D+Inwwm924WzppDAjnlaFr2QWvrI6ShA60K7BZVx
         sP8qMIfcBxWWA==
Date:   Thu, 13 Jul 2023 11:50:18 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Minjie Du <duminjie@vivo.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com, stable@vger.kernel.org,
        Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] i2c: busses: fix parameter check in
 i2c_gpio_fault_injector_init()
Message-ID: <20230713095018.3v6qhc3y7bsic6ha@intel.intel>
References: <20230713020517.614-1-duminjie@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713020517.614-1-duminjie@vivo.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Minje,

as Markus suggested, the title

“i2c: gpio: Fix an error check in i2c_gpio_fault_injector_init()”

looks more appropriate and...

On Thu, Jul 13, 2023 at 10:05:17AM +0800, Minjie Du wrote:
> Make IS_ERR() judge the debugfs_create_dir() function return.

... I think you should fix a bit the log here (also Mark has
suggested it). How about something like:

debugfs_create_dir() function returns an error value embedded in
the pointer (PTR_ERR). We need to evaluate the return value using
IS_ERR, rather than checking for NULL.

> Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: <stable@vger.kernel.org> # v4.16+
> 

don't leave space between tags.

> Signed-off-by: Minjie Du <duminjie@vivo.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

At the end it can be something like:

   i2c: gpio: Fix an error check in i2c_gpio_fault_injector_init()
   
   debugfs_create_dir() function returns an error value embedded in 
   the pointer (PTR_ERR). Evaluate the return value using IS_ERR
   rather than checking for NULL.
   
   Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")          
   Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
   Cc: <stable@vger.kernel.org> # v4.16+
   Signed-off-by: Minjie Du <duminjie@vivo.com>
   Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I'm not sure whether Wolfram can fix it or, if you don't feel
lazy, you can send a v4.

> ---
> v1-v2:
> Fix judge typo.

Please update also the changelog, v2-v3 and v3-v4.

Thanks, Markus, for the suggestions.

Andi

> ---
>  drivers/i2c/busses/i2c-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index e5a5b9e8b..545927b96 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -265,7 +265,7 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
>  	 */
>  	if (!i2c_gpio_debug_dir) {
>  		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
> -		if (!i2c_gpio_debug_dir)
> +		if (IS_ERR(i2c_gpio_debug_dir))
>  			return;
>  	}
>  
> -- 
> 2.39.0
> 
