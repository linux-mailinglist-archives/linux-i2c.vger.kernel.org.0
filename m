Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4576F60C7BD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 11:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbiJYJQu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 05:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiJYJQI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 05:16:08 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C485100426;
        Tue, 25 Oct 2022 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666688931; x=1698224931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HgrdKUgujA7E49WPTLgHTiOQBOk56ZMiGnMQmbOaoxM=;
  b=mrhgd4443cIxgA/iFzvlUi5GdKGIRy/R4sIdkvAZ5BK/GnySW4UxL8SZ
   lDV/LMz0SwH8e2Weaifn4zqYcSGk6Xb5ZNHoZFgCQKxtOK1LC+s4Nua4i
   gZcPI2USbhnWGMh9eQa2PnQxRglUuShHjJiW7FnphiwqC5I6ICUpxc0bJ
   PgBUAEz6oDGqBKC5X6Dli0npZ5FRcWJet4qd1BY2sHtCDovofK2tDmiZk
   q3zGsZV2CTF40e01JInTY4NmgVDEvotKHXswAcBEXEran9bBKjLso2E+T
   bHHlaY9zTrHsv4YW/HWivOFXW2cj1vM/2+BzFtDKrb0Ob+3iIUMDtJec7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="305241008"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="305241008"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 02:08:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="631565075"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="631565075"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 02:08:47 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 99B1E20144;
        Tue, 25 Oct 2022 12:08:45 +0300 (EEST)
Date:   Tue, 25 Oct 2022 09:08:45 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <Y1ennbK6WSHT27Am@paasikivi.fi.intel.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
 <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Moi,

On Tue, Oct 25, 2022 at 11:50:59AM +0300, Matti Vaittinen wrote:
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
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> 
> I did a quick audit for the callers at v6.1-rc2:
> drivers/i2c/i2c-smbus.c
> drivers/iio/accel/adxl355_core.c
> drivers/iio/gyro/fxas21002c_core.c
> drivers/iio/imu/adis16480.c
> drivers/iio/imu/bmi160/bmi160_core.c
> drivers/iio/imu/bmi160/bmi160_core.c
> 
> I did not spot any errors to be caused by this change. There will be a

It won't as you're decreasing the possible values the function may
return...

> functional change in i2c-smbus.c as the probe will now return -EINVAL
> should the IRQ dt-mapping fail. It'd be nice if this was checked to be
> Ok by the peeps knowing the i2c-smbus :)

FWIW, for both patches (but see below):

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  drivers/base/property.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 4d6278a84868..bfc6c7286db2 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -964,7 +964,7 @@ EXPORT_SYMBOL(fwnode_irq_get);
>   */
>  int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  {
> -	int index;
> +	int index, ret;
>  
>  	if (!name)
>  		return -EINVAL;
> @@ -973,7 +973,12 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  	if (index < 0)
>  		return index;
>  
> -	return fwnode_irq_get(fwnode, index);
> +	ret = fwnode_irq_get(fwnode, index);
> +

This newline is extra.

Or:

	return ret ?: -EINVAL;

Or even:

	return fwnode_irq_get(fwnode, index) ?: -EINVAL;

Up to you.

> +	if (!ret)
> +		return -EINVAL;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(fwnode_irq_get_byname);

-- 
Terveisin,

Sakari Ailus
