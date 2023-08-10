Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97A6777BD0
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 17:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjHJPMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 11:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjHJPMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 11:12:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F58D26A6;
        Thu, 10 Aug 2023 08:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691680326; x=1723216326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PoPLH6q9kFPcmdWUSyqja114zqyQiVZBg03NQdgbgJA=;
  b=C4GWCdmHECke++9Bf7GWK6BC/DTCegWyp5Tn9PSpngIBpzPpt+fPwwp+
   0Ni3SxVV1Pv+qpRCFEzXh/ihtgjcTFbdCp8SzI1ZQLZQvPtofWOM9hZnq
   Hyl/ti1G0HLcZa35cqTFkLYQddYiHbWEXvhCHvzFhRu6vv36hRKEEZZgN
   EBMW+JTxj1HtzUMQoGqCwBw6eY5eCw4wFGgqnZ7/tlwcYAGFsscH5Y8fq
   9jQ9ytULTHHMuxQ4hcd8HUTUP9RwSaampdU4uISAYfLvq8W8lGSawNFfl
   idX/DM8fv3rbNTcQbGdPH9XpC6Rt+mKkzhLn4ok94PDkWTWgEkc8ISYFK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361565741"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="361565741"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 08:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797644555"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="797644555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 08:11:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qU7KH-006JF1-1j;
        Thu, 10 Aug 2023 18:11:49 +0300
Date:   Thu, 10 Aug 2023 18:11:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <ZNT+NY99n7y3abwa@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
> > On Tue, 8 Aug 2023 15:18:52 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Aug 07, 2023 at 01:37:12PM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:

...

> > > > So in legacy ID lookup path we can safely assume that values below
> > > > 4096 are scalars and return NULL from the new
> > > > device_get_match_data(). This way current drivers using the values
> > > > as indices or doing direct comparisons against them can continue
> > > > doing manual look up and using them as they see fit. And we can
> > convert the drivers at our leisure.
> > >
> > > It's a good idea, but I believe will be received as hack.
> > > But why not to try? We indeed have an error pointers for the last page
> > > and NULL (which is only up to 16 IIRC) and reserved space in the first
> > > page. To be more robust I would check all enums that are being used in
> > > I2C ID tables for maximum value and if that is less than 16, use
> > > ZERO_OR_NULL_PTR() instead of custom stuff.
> > >
> > See iio/adc/max1363 example that has 37ish.
> > 
> > Could tidy that one up first and hopefully not find any others that are in
> > subsystems not keen on the move away from enums.
> 
> If there is no objection, I can fix this using i2c_get_match_data() for
> iio/adc/max1363 and device_match_data() will return ZERO_OR_NULL_PTR()
> if max enum ID in the ID lookup table is less than 16. And the drivers
> that use legacy ID's will fallback to ID lookup. So that there won't be
> any regression.

I'm good with this approach, but make sure you checked the whole kernel source
tree for a such.

-- 
With Best Regards,
Andy Shevchenko


