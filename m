Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D0D76E7D7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 14:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbjHCMHG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 08:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjHCMHD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 08:07:03 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A4C30E0;
        Thu,  3 Aug 2023 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691064403; x=1722600403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TAPgztHRobpBw6gzSgekudQ1pJARsoQRiCukcu60D2I=;
  b=cHOLNpifVfmVavJjpmpSMDuSS9rRioTgMEtHfardFs8jWVrubz+xXJPM
   J8XxCmyjxJKANYOMzQ0lrudRrfQ0WbRGVmfRa9Loi7XY/0n7aX0yoTPUu
   fuvvckRLGTmZM9w14L4lI/t0DOXRnssClIoqp1jhEZPzZdS3BOUGGh8jN
   gGbWhbqJJW7yH0k+BItwA9HWOn6/2smSiHF18UCGArXv7LeXEebUDC0vN
   Q5rf8xK6tC/KYgFGE663LuSvBXfK2Vx/JNQkWNUPgvjVH0Ef7T8gr8GXh
   TGjxNmGr99UArsA+KV8OgfLIlCw6jy7UCLJ5fcB0/U+wyHAiCvKPywjPW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400793181"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="400793181"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843572813"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="843572813"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 05:06:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRX69-00BSsM-19;
        Thu, 03 Aug 2023 15:06:33 +0300
Date:   Thu, 3 Aug 2023 15:06:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 2/4] i2c: Add i2c_device_get_match_data()
 callback
Message-ID: <ZMuYSdVfiCiUXU8L@smile.fi.intel.com>
References: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
 <20230803103102.323987-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803103102.323987-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 03, 2023 at 11:31:00AM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().

It seems you are missing to Cc Andi for all these... (not your fault,
rather unfortunately).

Yes, while he is not directly involved into core changes the drivers
are pretty much should consider this change.

...

>  	data = device_get_match_data(&client->dev);
> -	if (!data) {
> -		match = i2c_match_id(driver->id_table, client);
> -		if (!match)
> -			return NULL;
> +	if (data)
> +		return data;
>  
> -		data = (const void *)match->driver_data;
> -	}
> -
> -	return data;

Looking at this, it _might_ make sense to split another patch to prepare for
better difference here.

 -	if (!data) {
 -		match = i2c_match_id(driver->id_table, client);
 -		if (!match)
 -			return NULL;
 +	if (data)
 +		return data;
 +
 +	match = i2c_match_id(driver->id_table, client);
 +	if (!match)
 +		return NULL;
 +
 +	return (const void *)match->driver_data;

 Just play with this idea.

-- 
With Best Regards,
Andy Shevchenko


