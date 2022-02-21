Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352DD4BDE48
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 18:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241773AbiBUKgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 05:36:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355126AbiBUKf3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 05:35:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB26F38D80;
        Mon, 21 Feb 2022 01:56:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 638F2B80EB5;
        Mon, 21 Feb 2022 09:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0D2C340E9;
        Mon, 21 Feb 2022 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645437384;
        bh=ms7TryAFAv/sW33oOXuBP+Ote5/OxOHAD1GYysN5aqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iuFX/8B24MFQHFgKVXoHk+//zuMU0xHxPYFn9LkbBCSLkNTcNoD1JaG59NDlFTVBK
         ui9CYy2ugXwD+dKBQyr6hO3M5qpJFHC1EmDoeJ/5y4vDEqZBWYjrhedqm3aXquhEXE
         Fkke+ZPjbQfdw6uvxgCbx2cGxOtHB3pbeJHNpPn+Isu7vYFiSjBLNnybLfiq1rGwrn
         MB9aFENo3i6VYMmu4gUCw3imdxECMzehlWXTLrKjNouMU0V2OpY2OrwaOup7tIjWqA
         Ei1xB2qnQh7Ea/xmO572tSyXr8jbzGxeUON3t1IJ0/DdWab6lR93u+KR+GPm5hZjwH
         6jFDogBGpJ3Cw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nM5Qa-0007HI-Hc; Mon, 21 Feb 2022 10:56:21 +0100
Date:   Mon, 21 Feb 2022 10:56:20 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: Re: [PATCH v1 1/1] i2c: robotfuzz-osif: Propagate parent device to
 I2C core
Message-ID: <YhNhxPEt6kZ2xzMJ@hovoldconsulting.com>
References: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 04, 2022 at 05:17:26PM +0200, Andy Shevchenko wrote:
> I2C core might use parent device to retrieve properties of
> the controller. Propagate parent device for that.

What is the problem you're trying to solve here?

If you've changed some core function so that the kernel crashes because
of this, you need to address this in core.

Looks like you're also changing the device topology with this change.

This needs more details.

> Fixes: 83e53a8f120f ("i2c: Add bus driver for for OSIF USB i2c device.")

This isn't the commit causing the NULL deref.

> Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-robotfuzz-osif.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
> index 66dfa211e736..bfbfa0d07bb2 100644
> --- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
> +++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
> @@ -128,6 +128,7 @@ MODULE_DEVICE_TABLE(usb, osif_table);
>  static int osif_probe(struct usb_interface *interface,
>  			     const struct usb_device_id *id)
>  {
> +	struct device *dev = &interface->dev;
>  	int ret;
>  	struct osif_priv *priv;
>  	u16 version;
> @@ -145,6 +146,7 @@ static int osif_probe(struct usb_interface *interface,
>  	priv->adapter.class = I2C_CLASS_HWMON;
>  	priv->adapter.algo = &osif_algorithm;
>  	priv->adapter.algo_data = priv;
> +	priv->adapter.dev.parent = dev;
>  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>  		 "OSIF at bus %03d device %03d",
>  		 priv->usb_dev->bus->busnum, priv->usb_dev->devnum);

Johan
