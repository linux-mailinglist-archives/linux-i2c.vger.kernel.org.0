Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7BE70191F
	for <lists+linux-i2c@lfdr.de>; Sat, 13 May 2023 20:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjEMSYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 May 2023 14:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjEMSYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 May 2023 14:24:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5FD10EA;
        Sat, 13 May 2023 11:24:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0853261A60;
        Sat, 13 May 2023 18:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05DCC433EF;
        Sat, 13 May 2023 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684002243;
        bh=zySctRgeuHKJoCePxU2eLj54iQfYnmD2BGtwZP4qsl4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u/GvFFOvu6Pi8PJoyzHTddoTsG2aEZ/VDSup+00pHDPevAlX3TRPrrNv2bP5T9w4r
         Er/KlqiUq68y6VUIzfcuHjJ6VWAgEvO1VUN0z9WbgiEwzMQyWwykZjqcPxEXjLAs5T
         nqwZUQjPMM5NejZ/IWWZxFs+1gcKv89qSE2rY0KS7gsJYUPjCEFyuPuj20X+P0yWd2
         w0JQKCCGitR56UdtjIpCqMwxCSnwUHeWQ1mgpFvt9V4L3Ea7fvxh49KNekapCgV6j6
         f8z/23R0Pgm/Sa4sacA4rwrDGRYJfw/qFTYRGQL72pXxldTCUrSsgJA6fa26rmA956
         vQtaw8s+mmSng==
Date:   Sat, 13 May 2023 19:40:03 +0100
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
Subject: Re: [PATCH v3 1/3] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <20230513194003.5a27a841@jic23-huawei>
In-Reply-To: <9dd75817886fbb2a0cc58e2248dbba52d8a6d908.1683875389.git.mazziesaccount@gmail.com>
References: <cover.1683875389.git.mazziesaccount@gmail.com>
        <9dd75817886fbb2a0cc58e2248dbba52d8a6d908.1683875389.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 12 May 2023 10:53:00 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
> failure. This is contradicting the function documentation and can
> potentially be a source of errors like:
> 
> int probe(...) {
> 	...
> 
> 	irq = fwnode_irq_get_byname();
> 	if (irq <= 0)
> 		return irq;
> 
> 	...
> }
> 
> Here we do correctly check the return value from fwnode_irq_get_byname()
> but the driver probe will now return success. (There was already one
> such user in-tree).
> 
> Change the fwnode_irq_get_byname() to work as documented and according to
> the common convention and abd always return a negative errno upon failure.
> 
> Fixes: ca0acb511c21 ("device property: Add fwnode_irq_get_byname")
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Whilst the docs don't contradict behaviour for fwnode_irq_get()
unlike the byname() variant, it does seem odd to fix it only in this
version rather than modifying them both not to return 0.

Is there clear logic why they should be different?

> ---
>  drivers/base/property.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index f6117ec9805c..a3b95d2d781f 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1011,7 +1011,7 @@ EXPORT_SYMBOL(fwnode_irq_get);
>   */
>  int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  {
> -	int index;
> +	int index, ret;
>  
>  	if (!name)
>  		return -EINVAL;
> @@ -1020,7 +1020,12 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  	if (index < 0)
>  		return index;
>  
> -	return fwnode_irq_get(fwnode, index);
> +	ret = fwnode_irq_get(fwnode, index);
> +	/* We treat mapping errors as invalid case */
> +	if (ret == 0)
> +		return -EINVAL;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(fwnode_irq_get_byname);
>  

