Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2CE76D9B8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 23:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjHBVjv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 17:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjHBVjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 17:39:49 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686E82690;
        Wed,  2 Aug 2023 14:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012386; x=1722548386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uEU5x/K3vAHku3JXmZcMWza0vDzy3fcQfxFN6HHw08c=;
  b=gpn458gw1iXR+AJSktSMHniKQfMg65e+rz0I+Mq/1aGLBSqDje1a80fA
   uzBi4JMbMjwjA0yXBkDqWRgQqQWi/UGy4kqUFO82pPeOOrg2NJC/T7ttF
   vFXNxCEU1L7q8r4KePXGOGQj7zscye1m41j/N/SXqzyWThuKno8/SCfh7
   HRPXGSGUTWs73IxVoWPjsfGNSd0PZtiX9WkQBV0lTlrWGeItGHwptwqB3
   9f4r0msbvmQJnI70ZvBdFBWRNn2GY4t86xjUiyVh0CiDkWLpWLfbGfDYN
   ub45CCWU8bQ340CJ8fLNo0KLgdjwPx+EocE2sRcUsa1iK7DvB8Xgso9ge
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436021597"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="436021597"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872666011"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2023 14:39:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRJZG-00HAo5-0F;
        Thu, 03 Aug 2023 00:39:42 +0300
Date:   Thu, 3 Aug 2023 00:39:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
 support i2c sysfs
Message-ID: <ZMrNHXmRppNWgTHd@smile.fi.intel.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 12:23:17PM +0100, Biju Das wrote:
> Extend i2c_device_get_match_data() to i2c sysfs interface by changing
> i2c_of_match_device_sysfs() to non-static and call this function as a
> fallback for i2c_get_match_data_helper().

...

>  	/* TODO: use i2c_verify_client() when it accepts const pointer */
>  	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
>  					  to_i2c_client(dev) : NULL;
> +	const void *data;

Oh, yeah, definitely, please follow advice for previous patch I have given.

>  	if (!client || !dev->driver)
>  		return NULL;
>  
> -	return i2c_get_match_data_helper(client);
> +	data = i2c_get_match_data_helper(client);
> +	if (data)
> +		return data;
> +
> +	if (dev->driver->of_match_table) {
> +		const struct of_device_id *match;
> +
> +		match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
> +						  client);

So, with this it makes sense to have

	strucct device_driver *drv = dev->driver;
	...
	if (!drv)
		return NULL;

The above for the first patch even. And here

		match = i2c_of_match_device_sysfs(drv->of_match_table, client);

> +		if (match)
> +			return match->data;
> +	}

> +	return data;

This actually should be

	return NULL;

to avoid (potentially) stale pointers.

>  }

...

> -static const struct of_device_id*
> +const struct of_device_id *
>  i2c_of_match_device_sysfs(const struct of_device_id *matches,
> -				  struct i2c_client *client)
> +			  const struct i2c_client *client)
>  {
>  	const char *name;
>  
> @@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct of_device_id *matches,
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);
>  
>  const struct of_device_id
>  *i2c_of_match_device(const struct of_device_id *matches,
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 1247e6e6e975..e4d397b67989 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -82,8 +82,17 @@ static inline void i2c_acpi_remove_space_handler(struct i2c_adapter *adapter) {
>  
>  #ifdef CONFIG_OF
>  void of_i2c_register_devices(struct i2c_adapter *adap);
> +const struct of_device_id *
> +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> +			  const struct i2c_client *client);
>  #else
>  static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
> +static inline const struct of_device_id *
> +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> +			  const struct i2c_client *client)
> +{
> +	return NULL;
> +}
>  #endif
>  extern struct notifier_block i2c_of_notifier;

That's what above I meant to see as a separate change.

-- 
With Best Regards,
Andy Shevchenko


