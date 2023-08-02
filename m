Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9B76D11B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 17:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbjHBPJY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 11:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjHBPJJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 11:09:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1956E3C00;
        Wed,  2 Aug 2023 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690988925; x=1722524925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mkc214XucPLuiQx3tXVDVqoVn/g0wPoNP+39pZX93aU=;
  b=GGi2ahE6ufZz45xUM5pxBYRCI3yjRVsubYvHU0brcDQymHyFcbE9Esx2
   hhaXiWuYnv6vFTiWabX1sA8Z3/9eq/1srwpHUT4twhj7dV3Z3nm/iU3Fp
   Ednt/zWjgbFhCWuHSzvDri7C8sgmVteCvBFZP3FkW50BZkKGgOLvr4Fuc
   yA00iOFzZ/+qbJwXHcdXhFNpZ27Qj7bCn5MgGtnrKF9VusQcINtIbUcGW
   WKEdllCBVbyvPLrmLzYhGmrf5ZE42fkNPXAKi0hNfiNbWk+wyd1yljvtK
   7jZesCMuIPZp68foFR/9D0tL6hSTBT8aW59bzpZ9bqLA6KV8gCUJYhfBi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433450818"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="433450818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 08:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764244568"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="764244568"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 08:08:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRDSp-003sRv-1j;
        Wed, 02 Aug 2023 18:08:39 +0300
Date:   Wed, 2 Aug 2023 18:08:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMpxd91WelcwGicN@smile.fi.intel.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802112317.252745-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 02, 2023 at 12:23:16PM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().

...

> +static const void *i2c_get_match_data_helper(const struct i2c_client *client)
>  {
> -	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
> +	const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
>  	const struct i2c_device_id *match;
> +
> +	match = i2c_match_id(driver->id_table, client);
> +	if (!match)
> +		return NULL;
> +
> +	return (const void *)match->driver_data;
> +}

Yes, perfect!

...

> +static const void *i2c_device_get_match_data(const struct device *dev)
> +{
> +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> +	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> +					  to_i2c_client(dev) : NULL;
> +
> +	if (!client || !dev->driver)
> +		return NULL;
> +
> +	return i2c_get_match_data_helper(client);


I believe below looks better from readability and maintenance perspectives.

	const struct i2c_client *client;

	/* ...comment as in Dmitry's reply in v3 thread on why we need this check... */
	if (!dev->driver)
		return NULL;

	/* TODO: use i2c_verify_client() when it accepts const pointer */
	client = (dev->type == &i2c_client_type) ? to_i2c_client(dev) : NULL;
	if (!client)
		return NULL;

> +	return i2c_get_match_data_helper(client);
> +}

-- 
With Best Regards,
Andy Shevchenko


