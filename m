Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6CDF76526D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjG0Lbg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 07:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbjG0Lbe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 07:31:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CD830DB;
        Thu, 27 Jul 2023 04:31:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73CEE61E4A;
        Thu, 27 Jul 2023 11:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEE3C433B9;
        Thu, 27 Jul 2023 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690457432;
        bh=VAVgWucxeJJI9Wt5KmRjcPVztLb3rVZJ/YSNgUL7k7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJYZAv7sKGIKaidDYGfcIuWJ5VTe5GdWgRVn8QgY0VKYvxdIg+Okmn6uyfbSjWQyc
         G7ulBKyX2ic6kSNJpxjjazxgrtwNFqbD+Ee1Ri3l0bZ3zRfVKvi5CwpuSHSX8k9A6+
         KjfcMf0eLfSOraAvwiOkPN5hyjc8sX6YS+V1UR/6pYsDgbpwuptTt54QW6SbAKRqgG
         7UUttZBCw8IFJkRVHW1aXAJ/AGeMcwdWiL9JhVC0YJ0QjsBcU5SXdUMl+0BF2wEZoG
         3Tdty9BY50pAJbL4DshiqUaWx6Vu7h315Iqfq70qzlESS9lW3dy7/CKUITdWwlrB6u
         /to4IyL0DuFiA==
Date:   Thu, 27 Jul 2023 13:30:29 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Harry Geyer <harry.geyer@devtank.co.uk>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Message-ID: <20230727113029.ckrxe4qmy2nznh4e@intel.intel>
References: <20230727083354.4903-1-harry.geyer@devtank.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727083354.4903-1-harry.geyer@devtank.co.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Harry,

On Thu, Jul 27, 2023 at 09:33:54AM +0100, Harry Geyer wrote:
> Patch allows usb devices with multiple interfaces to use this driver without
> this driver assuming all interfaces are i2c-tiny-usb.
> 
> Signed-off-by: Harry Geyer <harry.geyer@devtank.co.uk>
> ---
>  drivers/i2c/busses/i2c-tiny-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
> index d1fa9ff5aeab..d6578e8908ac 100644
> --- a/drivers/i2c/busses/i2c-tiny-usb.c
> +++ b/drivers/i2c/busses/i2c-tiny-usb.c
> @@ -222,6 +222,9 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
>  	int retval = -ENOMEM;
>  	u16 version;
>  
> +	if (interface->intf_assoc && interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC)

I'm sorry, I meant the same column, my bad here!
Would you please be so kind to resend it as


	if (interface->intf_assoc &&
	    interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC)

It's a nitpick, though.

On the other hand, checkpatch is OK with lines up to 100
characters and this one looks like it's withing that length. So,
up to your personal preference.

If you resend it, you can add my r-b.

Thank you and again, sorry,
Andi

PS Next time, please add a changelog and a versioning to
   following patches.

> +		return -ENODEV;
> +
>  	dev_dbg(&interface->dev, "probing usb device\n");
>  
>  	/* allocate memory for our device state and initialize it */
> -- 
> 2.34.1
> 
