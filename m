Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C127D59CF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 19:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJXRex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 13:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbjJXRew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 13:34:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40001B3
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 10:34:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90501C433C7;
        Tue, 24 Oct 2023 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698168890;
        bh=WMFWKDGHXaFpHcCYCCZf9b2QWb84y9lvP49pgqjr4DA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BuGJytx7gaw9npJLowQanXT5gUgrsxBbSCR9f1kvWA44qQo6fmM83p7Dl8y09Lawj
         +N4ELwu1+V+79Iy5h2ogs9CRzDISiVyDCpvRSklSapXKFDwk4GIdK56HNqS78fZJgY
         XVukmFgUreCRab8UoB84tiTMaoBVOC0EUNCsfD56cMdvdBRrS2OqFoI4koRJFGN+L3
         ptgbCWAQewjdlgAd1Yn95N9ViO0lopL/mXPSYoaHQINKVGJvuCeyEO17vmDp8YMt4E
         MrTLnuRveBH4mMihr26ZHgRRtAm+mhRpRwAQZht/ij/VGB1bFCSSSyq53hJHDyGnGT
         2D22Vg3L0+sUA==
Date:   Tue, 24 Oct 2023 19:34:47 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
Message-ID: <20231024173447.yfgan6kxb6fbjncq@zenone.zhora.eu>
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, Oct 15, 2023 at 11:36:17PM +0200, Heiner Kallweit wrote:
> Use new helper acpi_use_parent_companion to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a41f5349a..ac223146c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1620,7 +1620,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	priv->adapter.class = I2C_CLASS_HWMON;
>  	priv->adapter.algo = &smbus_algorithm;
>  	priv->adapter.dev.parent = &dev->dev;
> -	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
> +	acpi_use_parent_companion(&priv->adapter.dev);

I find this neater.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
