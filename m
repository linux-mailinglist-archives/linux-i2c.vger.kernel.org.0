Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F40977CF9C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 17:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjHOPwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 11:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238333AbjHOPvt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 11:51:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4331BC1;
        Tue, 15 Aug 2023 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114707; x=1723650707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KqZZfPzKqYMlOuR38O7mXYsddjartQqG5CvXTaEZID4=;
  b=AXcaAbHL/JiQr96tCfPnY/vK8SlYLm3e1BfeRhW7ISGo5SNqUY2u9eS/
   3tYrkbzARCdv/CMmb0MtSqtfRUe+yH/0rLZocQ4m7jbXIw1VeF4BYQ6UD
   ChfrA/VqZJyKSRBFLc76QZA8QI3e5Z+HhioJ2QudA5QolQf0RaE7loQJX
   9CeQgs6r7kXEWjlJuA8a7QEfXUzbNnZjcKudeptXk2+WCjCw3+FXfoKvi
   Yf82j9+ddzjiGW70ooPuEaudSCaoJg8vTScqPapL1Oq5HGSyjb1uAEfgY
   KIooJET0/jwgcqAttKA1JbCk85DM0zjhyCSxYKyZif6rwEY7mc/D2S5oj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376041594"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="376041594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803862353"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="803862353"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 08:51:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVwKV-0085wu-0o;
        Tue, 15 Aug 2023 18:51:35 +0300
Date:   Tue, 15 Aug 2023 18:51:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] i2c: mux: pca954x: convert to using a pointer in
 i2c_device_id
Message-ID: <ZNufBsIT7KvEDA/c@smile.fi.intel.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
 <20230814-i2c-id-rework-v1-3-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-i2c-id-rework-v1-3-3e5bc71c49ee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 14, 2023 at 02:52:51PM -0700, Dmitry Torokhov wrote:
> Switch the driver to use newly added "data" pointer in i2c_device_id to
> streamline DT and legacy flows.

...

> @@ -206,7 +206,7 @@ static const struct of_device_id pca954x_of_match[] = {
>  	{ .compatible = "nxp,pca9847", .data = &chips[pca_9847] },
>  	{ .compatible = "nxp,pca9848", .data = &chips[pca_9848] },
>  	{ .compatible = "nxp,pca9849", .data = &chips[pca_9849] },
> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pca954x_of_match);

Stray change.

...

>  	data->chip = device_get_match_data(dev);
>  	if (!data->chip)
> -		data->chip = &chips[id->driver_data];
> +		data->chip = id->data;

Same, why not to use that helper and if anything, modify it instead.

-- 
With Best Regards,
Andy Shevchenko


