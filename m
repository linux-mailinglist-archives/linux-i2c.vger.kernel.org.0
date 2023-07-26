Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A320763CC4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 18:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbjGZQo3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 12:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbjGZQo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 12:44:27 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13509270B;
        Wed, 26 Jul 2023 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690389862; x=1721925862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6tWix3vXBLyeMyulZdWadAGPMWkClckhVvIhSeYx7g=;
  b=PqjSsm137MsVYiNm85GqA1NMfeDJHU3lxIuBHF8B2pKoguXotBj8+1Hm
   6NqTkTZzuxCcvlg/v7hfp/YWzf10+1xV6zsk/YLxdsPpMPFShy7NTbXJT
   zCWSCvRXifZqJHnPOFh4SJ73haf7liT0FAMG/rYZDIDVlDwcXpiTzrpmB
   YJhA66YbCoKfRjWgSeaRBKKXwv9qeRhc/i5Iq7kdi4UyEbI8dDTRF7rKC
   HHGMdMnza5XYwTakAfcsZPVMqYutq7UyzoljRrt6J8zeRPWRAPDR09Jl9
   lzJYfEfqsxY7/eQjuaJdsFwt4KhtTiCdeay91fsIhYD1wNK418TiBUPcN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="366949002"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="366949002"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840320949"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="840320949"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 09:44:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qOhcY-00FZqO-0P;
        Wed, 26 Jul 2023 19:44:18 +0300
Date:   Wed, 26 Jul 2023 19:44:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
References: <20230726130804.186313-1-biju.das.jz@bp.renesas.com>
 <20230726130804.186313-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726130804.186313-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 26, 2023 at 02:08:04PM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().

I have not been Cc'ed to this...

...

> +static const void *i2c_device_get_match_data(const struct device *dev)
> +{
> +	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> +					  to_i2c_client(dev) : NULL;

There is an API i2c_verify_client() or something like this, I don't remember
by heart.

> +	if (!dev->driver)
> +		return NULL;
> +
> +	return i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
> +}

...

> +const void *i2c_get_match_data(const struct i2c_client *client)
> +{
> +	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
>  	const void *data;
>  
>  	data = device_get_match_data(&client->dev);
> -	if (!data) {
> -		match = i2c_match_id(driver->id_table, client);
> -		if (!match)
> -			return NULL;
> -
> -		data = (const void *)match->driver_data;
> -	}
> +	if (!data)
> +		data = i2c_get_match_data_helper(driver, client);

	if (data)
		return data;

	return i2c_...;

>  
>  	return data;
>  }

...

Side question, what is the idea for i2c_of_match_device()? Shouldn't you also
take it into consideration?

-- 
With Best Regards,
Andy Shevchenko


