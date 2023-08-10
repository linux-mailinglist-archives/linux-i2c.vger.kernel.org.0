Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD7E777BC3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 17:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234398AbjHJPKT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 11:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbjHJPKS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 11:10:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCB826B7;
        Thu, 10 Aug 2023 08:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691680218; x=1723216218;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=E3ZMke54mtosCQbG55UwhQh1q58r9W+COrYMi8FksLs=;
  b=UUi6OmvgurLe6GQUvazqKkcz+DoptSvufz9wAAtoIzlhhdOoULsbq8uz
   WRkSKSFUzQUXcfnmoCf8rJcElgNicr6fFQkWgYwGzTu0HtNqadmz90o5i
   VnSWDqwZHgak8bPAqAPXsYIO5o/GeZNo2uvr/MAXk33N0lznUmN1PrTy3
   6vZj5zX1zoKeFsGxu+5+xmM7enEzYYuhgOSk0ksFjiEb29bbNnRVq314z
   GGhgn1UNNz9tJFoFONToXifF7rbQjkH6pznpQQs9Grn/Fh8yMFuUrrApI
   ZOJWO+reoowe8CZ6GvGfQ10F2WmgCIMq3HXgkuaSoAuwWTXcDjJsvuLCV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351033520"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="351033520"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 08:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="855968836"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="855968836"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 08:09:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qU7Hi-006DXR-1o;
        Thu, 10 Aug 2023 18:09:10 +0300
Date:   Thu, 10 Aug 2023 18:04:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Message-ID: <ZNT8mrh6seDQL3kz@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809182551.7eca502e@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 09, 2023 at 06:25:51PM +0100, Jonathan Cameron wrote:
> On Tue, 8 Aug 2023 15:18:52 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Aug 07, 2023 at 01:37:12PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:  
> > > > On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:  
> > > > > On Sat, 5 Aug 2023 17:42:21 +0000
> > > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> > > > > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  

...

> > > > > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > > > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > > > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > > > > + * but not for this function. It's recommended to convert those either to avoid
> > > > > > + * 0 or use a real pointer to the predefined driver data.  
> > > >   
> > > > > We still need to maintain consistency across the two tables, which
> > > > > is a stronger requirement than avoiding 0.  
> > > > 
> > > > True. Any suggestion how to amend the above comment? Because the documentation
> > > > makes sense on its own (may be split from the series?).
> > > >   
> > > > > Some drivers already do that by forcing the enum used to start at 1 which
> > > > > doesn't solver the different data types issue.  
> > > > 
> > > > And some maintainers do not want to see non-enum values in i2c ID table.
> > > > *Shrug*.  
> > > 
> > > So in legacy ID lookup path we can safely assume that values below 4096
> > > are scalars and return NULL from the new device_get_match_data(). This
> > > way current drivers using the values as indices or doing direct
> > > comparisons against them can continue doing manual look up and using
> > > them as they see fit. And we can convert the drivers at our leisure.  
> > 
> > It's a good idea, but I believe will be received as hack.
> > But why not to try? We indeed have an error pointers for the last page
> > and NULL (which is only up to 16 IIRC) and reserved space in the first
> > page. To be more robust I would check all enums that are being used
> > in I2C ID tables for maximum value and if that is less than 16, use
> > ZERO_OR_NULL_PTR() instead of custom stuff.
> > 
> See iio/adc/max1363 example that has 37ish.
> 
> Could tidy that one up first and hopefully not find any others that
> are in subsystems not keen on the move away from enums.

Oh, yep, this needs a treewide audit and fixes around before going further.
As you said.

-- 
With Best Regards,
Andy Shevchenko


