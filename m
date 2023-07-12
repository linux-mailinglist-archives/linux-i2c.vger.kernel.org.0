Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A6B750BA7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbjGLPC2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjGLPC0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:02:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577431BC5;
        Wed, 12 Jul 2023 08:02:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1E5361838;
        Wed, 12 Jul 2023 15:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9947BC433C8;
        Wed, 12 Jul 2023 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689174144;
        bh=V4letznKfRZNzEd4wooyqiB8BCzI8t17et3dpTTFaq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U69YBmuwykZY8XEjisZKIhjXDY1L3L4vCRgHiO3pPkV9UEwS/moqJDlO9Z+o5hodd
         Gkh6mZ8AwDQ+MXKuzoeD7OehN4XyOE8o2EnkjQhRd6KqTLgH8a4AgbmYmpeqWs0fyM
         qfGbEvyyh2dUWWgtMbybdDS4lIoA07TN+HVcv4WPDWJ4Uw1/+yMd05EbULr8TwGlmn
         9E01dmfhaQU9sIsGzOtHeb0HESeeunMZt4esNWcnxwvT3NkpPIWewaQOZmtLDkta42
         P50aRA0rDRXVGn2cljzxZ0Xdb611KXPoL3DVaJRmIkIQj8PxOneyCugu0uI7CA7LWk
         uhqS8MrlJdCgA==
Date:   Wed, 12 Jul 2023 17:02:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Minjie Du <duminjie@vivo.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com
Subject: Re: [PATCH v2] i2c: busses: fix parameter check in
 i2c_gpio_fault_injector_init()
Message-ID: <20230712150219.pla7unac7e7azwti@intel.intel>
References: <20230712112223.12286-1-duminjie@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712112223.12286-1-duminjie@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Minje,

On Wed, Jul 12, 2023 at 07:22:22PM +0800, Minjie Du wrote:
> Make IS_ERR() judge the debugfs_create_dir() function return.
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> 
> v1-v2:
> Fix judge typo.

Please next time add the changelog after the "---" section.

You will also need:

Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: <stable@vger.kernel.org> # v4.16+

Said that:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

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
