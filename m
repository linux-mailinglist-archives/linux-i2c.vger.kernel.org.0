Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846BA763BFA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 18:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjGZQIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 12:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjGZQIs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 12:08:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A2B19B6;
        Wed, 26 Jul 2023 09:08:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 223BF61B9F;
        Wed, 26 Jul 2023 16:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28181C433C8;
        Wed, 26 Jul 2023 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690387726;
        bh=CcsaPxYgQ949an1s9anQMlRQJgSeJG8aDntwjOIFDEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uF8+Hz7GzjwLAQmgWkV8X9GjI3nff5YhwNh4L7+dWXLT30hTZ46qXJ+qls5EMKkCh
         KvufQmby6HVSEtKBOIOTJiUEk6C2orpLFU+nZawn4RKwurhYYodkizuzI1nC4E3+ji
         wo1WL4c2X9/vtRBvsl+KjsBGOQHnRfoY3FrEoWTCPiAOLt9df4pDMdHLAaCbTqwQ+1
         29Rrh/Hoq94h4e40OOuyeR3TD3cTuz+jCcWyZwmFmcq/mg6EWBjjW9ONq7d3UEYWhl
         2fWoizg25BF7Hng6medX7x3B2U2AHnErp6llOPkMvpM3MEXYjSdTMViVrvprAOI2LX
         ZQ6UtiMVLDrTA==
Date:   Wed, 26 Jul 2023 18:08:43 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Harry Geyer <harry.geyer@devtank.co.uk>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Message-ID: <20230726160843.sbutc7g7nrn5g7rh@intel.intel>
References: <20230719113838.17714-1-harry.geyer@devtank.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719113838.17714-1-harry.geyer@devtank.co.uk>
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

it's OK, just few little adjustments...

On Wed, Jul 19, 2023 at 12:38:38PM +0100, Harry Geyer wrote:
> Patch allows usb devices with multiple interfaces to use this driver without
> this driver assuming all interfaces are i2c-tiny-usb.
> 
> Signed-off-by: Harry Geyer <harry.geyer@devtank.co.uk>

Please add:

Fixes: e8c76eed2ecd ("i2c: New i2c-tiny-usb bus driver")
Cc: Till Harbaum <till@harbaum.org>
Cc: <stable@vger.kernel.org> # v2.6.22+

> ---
>  drivers/i2c/busses/i2c-tiny-usb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
> index d1fa9ff5aeab..fc194c65e50e 100644
> --- a/drivers/i2c/busses/i2c-tiny-usb.c
> +++ b/drivers/i2c/busses/i2c-tiny-usb.c
> @@ -222,6 +222,11 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
>  	int retval = -ENOMEM;
>  	u16 version;
>  
> +	if (interface->intf_assoc &&
> +		interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC) {

please fix the indentation here ('interface' and 'interface'
should go on the same line)

> +		return -ENODEV;
> +	}

please drop the brackets.

Andi

> +
>  	dev_dbg(&interface->dev, "probing usb device\n");
>  
>  	/* allocate memory for our device state and initialize it */
> -- 
> 2.34.1
> 
