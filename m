Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84954772841
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 16:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjHGOyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 10:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjHGOyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 10:54:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4522310CB;
        Mon,  7 Aug 2023 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420054; x=1722956054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CyA/irSlGgoAqRyWRxyHWnwM5bPue1oYBQqCe5tRXz4=;
  b=Y0+l5alrEmwq3obV3hynzOYV/d6KxPfy8yIJvXQsfkrP4VQoHPfTLvfg
   kammXpHenx7/titxNUy/jykpLH54k7H+NqtdUCiV7Qpkkh9K/HI+4vXVu
   pFGKRyDgUk1fCN1DHI35BCTrWYSqTDExSd5/eGWxxtCwMvlyLx6bhv6RY
   kc214SsjtbMT0jNgyKAdsJCJibjfX6JaMt5+DyqCbfJI+6iZJN4Mmz5qv
   BCAHzSUPFCw08BZBvdGUQ9IvpR9yqI9sWHGzgLE5FmfJHkYv4Mjxoye+N
   0gKkGTMYGUTpSdljXuzASlQzocniP8KVdcfxsryXkgQXDCbs31EO9kzPp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369467931"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="369467931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 07:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734108295"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="734108295"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2023 07:54:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT1cW-00GD0C-0M;
        Mon, 07 Aug 2023 17:54:08 +0300
Date:   Mon, 7 Aug 2023 17:54:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Message-ID: <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230806142950.6c409600@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> On Sat, 5 Aug 2023 17:42:21 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:

...

> > + * Besides the fact that some drivers abuse the device ID driver_data type
> > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > + * but not for this function. It's recommended to convert those either to avoid
> > + * 0 or use a real pointer to the predefined driver data.

> We still need to maintain consistency across the two tables, which
> is a stronger requirement than avoiding 0.

True. Any suggestion how to amend the above comment? Because the documentation
makes sense on its own (may be split from the series?).

> Some drivers already do that by forcing the enum used to start at 1 which
> doesn't solver the different data types issue.

And some maintainers do not want to see non-enum values in i2c ID table.
*Shrug*.

-- 
With Best Regards,
Andy Shevchenko


