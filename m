Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A49A7AA31D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 23:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjIUVsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 17:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjIUVsE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 17:48:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41744E5ED;
        Thu, 21 Sep 2023 14:35:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7798DC433C8;
        Thu, 21 Sep 2023 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695332113;
        bh=5Q9lwGR3nLKBoAjsox+oX7kPsbdEMYb7iKizTcyIEOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uxztyUIjTWdwT+T1RURT7taDdPu4y4tAUJ+xv6/zZZsitNKABQhT2GZiX20iIWaL0
         zfSGS+251U61Rj8sStvXGs+j7SKdKBhxTzCaH8jgQ9MIA7nMwyQPugWgSlhDhCkSzz
         P9S5gowLsHTIHgUK42c687Dl/6ngzJq/IWMZonmgYppUoh3R3pnWlAJXiacMygyWcJ
         PEfytyy16Y0k+gC2ewR7UwtESEkc2r3Pgb8p32fd6e3UVCKOfOAOYvv9/1qxJQSaw6
         sLRLGeBWF5KvCsewHYO2AvNF1kEn0lyF25xsP5VOzWT+m4jwea15Lqnyak186DEPGm
         IHsbhYacPqmMQ==
Date:   Thu, 21 Sep 2023 23:35:07 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, Minjie Du <duminjie@vivo.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: remove error checks with debugfs
Message-ID: <20230921213507.pfs3gp5uwgemsqoe@zenone.zhora.eu>
References: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

[...]

> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index e5a5b9e8bf2c..fb35a75fe0e3 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -263,15 +263,10 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
>  	 * 'fault-injector' dir there. Until then, we have a global dir with
>  	 * all adapters as subdirs.
>  	 */
> -	if (!i2c_gpio_debug_dir) {
> +	if (!i2c_gpio_debug_dir)
>  		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
> -		if (!i2c_gpio_debug_dir)
> -			return;
> -	}
>  
>  	priv->debug_dir = debugfs_create_dir(pdev->name, i2c_gpio_debug_dir);
> -	if (!priv->debug_dir)
> -		return;

nice... this reminds me of some more cleanups that needs to be
done elsewhere.

Another good thing that comes out from this patch is that if a
debgufs entry is not created it's not a big deal and we shouldn't
return but move ahead with the function execution.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
