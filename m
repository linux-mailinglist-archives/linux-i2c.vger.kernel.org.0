Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C2470192C
	for <lists+linux-i2c@lfdr.de>; Sat, 13 May 2023 20:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjEMS2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 May 2023 14:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjEMS2F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 May 2023 14:28:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB981BC2;
        Sat, 13 May 2023 11:28:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29FDC61D52;
        Sat, 13 May 2023 18:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E298EC433EF;
        Sat, 13 May 2023 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684002483;
        bh=IcFg/niQ7za//Jek+VAgnrsOkVlFXJ4WpYiKlJMxZlk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dXy5AZHf3Wea0MdZGAF84hMMzImo/ZY28/weOHGKOioztGp7nO8FQJMfbv5Z94h/r
         dxHg7unMxIQYv2x4v6JGB2nPE9Z/7p1cQIOWeqMP7WMYGlHN7btfx0CdzS3SCqPX6I
         mw4d4x/q20j8uBoVgws2/ReQxURDfDPrm8Y+Ct2DbJObnBu7U6SKRLZOFfY6Qqw9No
         8FZYWfjxLYcxbhfwAd/pjAQh3+zpovBf8OsPTnaTJ3fYf0hV/xrABSTAop4oddx7hj
         L4Ks+j7sjxfMOTD0nyFLCdhbwnpUOMr2herWBPOFSeU/uLI30YJiHstTWPiTp8V5Oo
         FtwUNwak+jtNA==
Date:   Sat, 13 May 2023 19:44:03 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iio: kx022a fix irq getting
Message-ID: <20230513194403.234b4e3f@jic23-huawei>
In-Reply-To: <b45b4b638db109c6078d243252df3a7b0485f7d5.1683875389.git.mazziesaccount@gmail.com>
References: <cover.1683875389.git.mazziesaccount@gmail.com>
        <b45b4b638db109c6078d243252df3a7b0485f7d5.1683875389.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 12 May 2023 10:53:41 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The fwnode_irq_get_byname() was returning 0 at device-tree mapping
> error. If this occurred, the KX022A driver did abort the probe but
> errorneously directly returned the return value from
> fwnode_irq_get_byname() from probe. In case of a device-tree mapping
> error this indicated success.
> 
> The fwnode_irq_get_byname() has since been fixed to not return zero on
> error so the check for fwnode_irq_get_byname() can be relaxed to only
> treat negative values as errors. This will also do decent fix even when
> backported to branches where fwnode_irq_get_byname() can still return
> zero on error because KX022A probe should later fail at IRQ requesting
> and a prober error handling should follow.
On that basis I've picked this one up directly for the fixes-togreg branch of
iio.git and marked it for stable.

Thanks,

Jonathan

> 
> Relax the return value check for fwnode_irq_get_byname() to only treat
> negative values as errors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/
> Link: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Fixes: 7c1d1677b322 ("iio: accel: Support Kionix/ROHM KX022A accelerometer")
> ---
>  drivers/iio/accel/kionix-kx022a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
> index f98393d74666..b8636fa8eaeb 100644
> --- a/drivers/iio/accel/kionix-kx022a.c
> +++ b/drivers/iio/accel/kionix-kx022a.c
> @@ -1048,7 +1048,7 @@ int kx022a_probe_internal(struct device *dev)
>  		data->ien_reg = KX022A_REG_INC4;
>  	} else {
>  		irq = fwnode_irq_get_byname(fwnode, "INT2");
> -		if (irq <= 0)
> +		if (irq < 0)
>  			return dev_err_probe(dev, irq, "No suitable IRQ\n");
>  
>  		data->inc_reg = KX022A_REG_INC5;

