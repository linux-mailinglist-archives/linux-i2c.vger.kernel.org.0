Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9098C773FA1
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 18:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbjHHQuZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 12:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjHHQtT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 12:49:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879F04AAAB;
        Tue,  8 Aug 2023 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510246; x=1723046246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E5LRHteZkEMYNsco/1BxeEDeFFbk8r50PGxxwtuDxOc=;
  b=exjbdw8fTLjQDA6qhjQkEDgpF35MkCeP6sEAvfXpqFaiodiPmUTj/sd5
   jXs95AJAldGx/YdIiBibFOphj/xVkYLUtkAL5mfBS59Eq1UhPMj8czuKv
   DqEEm8lcFOKttVfWdM+WnJ4ykXqcDXZkDy4x0tP6p0c/KG5rZ75foLEYM
   5/LYxDr5F6V2piuG7CDNe8KW32o2ykFILkUIYfWNCl0IRegNAdx6Itc2i
   tkfIz9Cj2t15mCdD/lYYBcC1OlCSvzuUJqVcAw6mxJeJB90+eONUJ631P
   EvZ+DArYhdMriAFY3Ds7ecAXLBAf33E1h95mo9tya+QLQlBBwj1lUmdLv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369704780"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="369704780"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 05:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821344916"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="821344916"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2023 05:14:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qTLbj-007EVK-1V;
        Tue, 08 Aug 2023 15:14:39 +0300
Date:   Tue, 8 Aug 2023 15:14:39 +0300
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
Message-ID: <ZNIxr7yNcpSU4f3k@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <20230807204505.5f3f245e@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807204505.5f3f245e@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 07, 2023 at 08:45:05PM +0100, Jonathan Cameron wrote:
> On Mon, 7 Aug 2023 17:54:07 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> > > On Sat, 5 Aug 2023 17:42:21 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> > > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  

...

> > > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > > + * but not for this function. It's recommended to convert those either to avoid
> > > > + * 0 or use a real pointer to the predefined driver data.  
> > 
> > > We still need to maintain consistency across the two tables, which
> > > is a stronger requirement than avoiding 0.  
> > 
> > True. Any suggestion how to amend the above comment? Because the documentation
> > makes sense on its own (may be split from the series?).
> 
> For bus ID tables it is fine right now as long as no one checks for NULL.
> I guess adding this to the i2c_get_match_data and spi equivalent wrapper
> functions might avoid someone shooting themselves in the foot (I've done it
> for starters more than once).

Ah, okay.

...

> > > Some drivers already do that by forcing the enum used to start at 1 which
> > > doesn't solver the different data types issue.  
> > 
> > And some maintainers do not want to see non-enum values in i2c ID table.
> > *Shrug*.
> 
> That leaves us stuck unless we move to a form where the i2c ID table isn't
> used if there is an of_device_id table (or maybe we invent yet another table
> and if that is present it is used for dt and were i2c_device_id is used and
> hence becomes an opt in?  That will also be tricky however.

This won't ever happen as it will break an ABI (as far as I understand
the current state of affairs). Seems the easiest path is to try to sell
the point that having pointers in I2C ID tables is okay to the maintainers
who don't see it that way.

-- 
With Best Regards,
Andy Shevchenko


