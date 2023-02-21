Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE469E642
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 18:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbjBURsX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 12:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbjBURsV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 12:48:21 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2A972B9;
        Tue, 21 Feb 2023 09:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677001697; x=1708537697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tQ65TR6GL53BpWNiudggJWeeHh9e4Jy+6Xr7G8niexM=;
  b=RmAmSI4sqqsfZu0WaybAbRW/nWpvHI2IGqfB5uYXrsDAcHyjpUe6bFe+
   ISJghtpc8zzEGn8eQsIJuWM6MzXvWLk55PY6gTDoMiXMxMVPs/5k/i0PY
   9c7VvVRHsY2n1B5VcE2y3uD0OO7Wibc2OKFQazzJkpO7/j3d4QI3+RdeK
   L4P2g3W2bCZD4mplgWYeWi7vOA1RoDpeYroFAtK16kHBHM9ypGsWNcVki
   GiihpGEjiuYp7QT2UWqZGQDxL5Q9+ofWM4hLt/c9WrRpGYfK5xGkEqZBS
   ewttqcGJ+7Qv4km8rwPa0nJjjqgT26SdjHVTc+Hho6A5j223mBVv+7AXb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312330590"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="312330590"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845772354"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="845772354"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 09:48:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUWkO-00A3i3-26;
        Tue, 21 Feb 2023 19:48:12 +0200
Date:   Tue, 21 Feb 2023 19:48:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Message-ID: <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 21, 2023 at 05:10:00PM +0100, Robin van der Gracht wrote:
> On 2023-02-21 14:40, Andy Shevchenko wrote:
> > On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:
> > > Switching to use device_get_match_data() helps getting of
> > > i2c_of_match_device() API.

...

> > > -	id = i2c_of_match_device(dev->driver->of_match_table, client);
> > > -	if (id)
> > > -		priv->type = (uintptr_t)id->data;
> > > +	priv->type = (uintptr_t)device_get_match_data(dev);
> > 
> > Looking closer the I²C ID table should provide DISP_MATRIX to keep
> > default and this needs to be not dropped.
> > 
> > So, the question is what to do with unknown type then, return -EINVAL
> > from probe()?
> 
> If you leave out your addition of the DISP_UNKNOWN type, the default type
> will be DISP_MATRIX if no match is found, which is as it is now.
> 
> In that case the following change should suffice:
> 
> @@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev, struct
> ht16k33_priv *priv,
>  static int ht16k33_probe(struct i2c_client *client)
>  {
>      struct device *dev = &client->dev;
> -    const struct of_device_id *id;
>      struct ht16k33_priv *priv;
>      uint32_t dft_brightness;
>      int err;
> @@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client *client)
>          return -ENOMEM;
> 
>      priv->client = client;
> -    id = i2c_of_match_device(dev->driver->of_match_table, client);
> -    if (id)
> -        priv->type = (uintptr_t)id->data;
> +    priv->type = (uintptr_t)device_get_match_data(dev);
> +
>      i2c_set_clientdata(client, priv);
> 
>      err = ht16k33_initialize(priv);
> 
> Or do you think falling back to DISP_MATRIX if no match is found is wrong?

First of all, the I²C ID table should actually use DISP_MATRIX.

Second, there are two points:

- It would be nice to check if the OF ID table doesn't provide a setting
  (shouldn't we try I²C ID table and then, if still nothing, bail out?)

- The I²C ID table can be extended in the future with another entry which
  may want to have different default


-- 
With Best Regards,
Andy Shevchenko


