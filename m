Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E22E76BDBB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 21:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbjHAT2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 15:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjHAT2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 15:28:45 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEC7AC;
        Tue,  1 Aug 2023 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690918122; x=1722454122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Brglk51lLjqK20Rtn27fYMnv0zZZouqPLGtdMxNPDeg=;
  b=E6neH/kNdFyjAOvYU9ml8rbjMZD866koW3EnuB1Zi1aHZA3neYEHq4Bm
   4islk8Ik6f/se+JNkgsZhsZBnyIE5jZ1HJIQ3FFFGHqgd77HhgQOSwzGC
   r/DQwhuuXC3tWk6vCqFm+8OhRNquLF8hpXdI5RhezIxZiFoKu5bodRGzw
   Y4PZB8LKT5N+3F0l+cLVRhzCiPtcHTYgJ+NSLBZVOnSRuyJjXgBWHwSK8
   X1F7ZjanovlFFWl+PvK30v+9dtLAoduG+SYt9Mp4En4Co3XxeFO2hKlDP
   tEdC1xpGIbt0L22jZVxuZ7fdDEM14F6ogBoNubw/A89DCGvWHcPWTaR0H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354321767"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="354321767"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 12:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722585277"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="722585277"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 12:28:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQv2s-00GbgV-1h;
        Tue, 01 Aug 2023 22:28:38 +0300
Date:   Tue, 1 Aug 2023 22:28:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().

Have you used --patience when prepared the patch for sending?

...

> -const void *i2c_get_match_data(const struct i2c_client *client)
> +static const void *i2c_get_match_data_helper(const struct i2c_driver *driver,
> +					     const struct i2c_client *client)
>  {

> -	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);

Does it make sense to remove and add an additional parameter? In one case it's
a copy, in another it probably the same, just hidden in the code.

>  	const struct i2c_device_id *match;
> +
> +	match = i2c_match_id(driver->id_table, client);
> +	if (!match)
> +		return NULL;
> +
> +	return (const void *)match->driver_data;
> +}
> +
> +static const void *i2c_device_get_match_data(const struct device *dev)
> +{
> +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> +	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> +					  to_i2c_client(dev) : NULL;
>  	const void *data;

> +	if (!dev->driver)
> +		return NULL;

When can this be true?

> +	data = i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
> +	if (data)
> +		return data;
>  
> -		data = (const void *)match->driver_data;
> +	if (dev->driver->of_match_table) {
> +		const struct of_device_id *match;
> +
> +		match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
> +						  (struct i2c_client *)client);
> +		if (match)
> +			data = match->data;
>  	}
>  
>  	return data;
>  }

...

> -static const struct of_device_id*
> +const struct of_device_id*

While here, add a missing space after of_device_id.

...

> +const struct of_device_id*

Ditto.

Or use below (weird) style in case it occurs more often than usual one.

> +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> +			  struct i2c_client *client);
> +
>  const struct of_device_id
>  *i2c_of_match_device(const struct of_device_id *matches,
>  		     struct i2c_client *client);

...

> +static inline const struct of_device_id
> +*i2c_of_match_device(const struct of_device_id *matches,

As per above.

> +		     struct i2c_client *client)
> +{
> +	return NULL;
> +}

-- 
With Best Regards,
Andy Shevchenko


