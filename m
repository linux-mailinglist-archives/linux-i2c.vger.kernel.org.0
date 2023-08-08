Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23767745B3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 20:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbjHHSpK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 14:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbjHHSoj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 14:44:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D933D199;
        Tue,  8 Aug 2023 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691512885; x=1723048885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eo0WgR5mRHn12TykrjAcW5PBByn61DLkNzcLEYnCe1g=;
  b=klIBUqiYSWmX9ImvHe/rEkekHrGz0dYN8Zffevdh77odpVXWhXGZjCl2
   hvEagEOVte6Y3/NmCgXQvEwoRajegFaNmOFdRAm8xTex6pal8gKm8RFt6
   4f2QbmpnLr2ipsZxKs0E6kq3IB37syNhyVERK/8OMX73hp9awJOblx1p6
   d7JBxlWKBkAH5Q50/xyeNqUKroGY9OlnPGsZKA5Ro8q6SN5nvcn0XdYxp
   ei9L/K48Kd5dcSQ+zcvZKq5HBRbvZnHJYVxRTOmtT2SmaNc92vfJpC0+s
   YvqMBiME61jUJYoj/X9qK3+8zGhkVkoYH5WMi9wiP1KzRVFD+VGQoWd7F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374480755"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="374480755"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 05:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734512997"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="734512997"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 05:18:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qTLfo-007NhS-1M;
        Tue, 08 Aug 2023 15:18:52 +0300
Date:   Tue, 8 Aug 2023 15:18:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Message-ID: <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNFV+C1HCIRJpbdC@google.com>
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

On Mon, Aug 07, 2023 at 01:37:12PM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:
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
> > 
> > > Some drivers already do that by forcing the enum used to start at 1 which
> > > doesn't solver the different data types issue.
> > 
> > And some maintainers do not want to see non-enum values in i2c ID table.
> > *Shrug*.
> 
> So in legacy ID lookup path we can safely assume that values below 4096
> are scalars and return NULL from the new device_get_match_data(). This
> way current drivers using the values as indices or doing direct
> comparisons against them can continue doing manual look up and using
> them as they see fit. And we can convert the drivers at our leisure.

It's a good idea, but I believe will be received as hack.
But why not to try? We indeed have an error pointers for the last page
and NULL (which is only up to 16 IIRC) and reserved space in the first
page. To be more robust I would check all enums that are being used
in I2C ID tables for maximum value and if that is less than 16, use
ZERO_OR_NULL_PTR() instead of custom stuff.

-- 
With Best Regards,
Andy Shevchenko


