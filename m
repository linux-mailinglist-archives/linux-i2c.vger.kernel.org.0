Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AB477C806
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 08:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbjHOGox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 02:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbjHOGok (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 02:44:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87224E72;
        Mon, 14 Aug 2023 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692081879; x=1723617879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoRkywen7QyRJh5gY+NeF3XBAuuj7J1YVN5gmyneGXU=;
  b=HwsMxuzTNnjKD4mNmnnpLkqJnmEIjMvJbxwqZ9Zty7pLwWtg/r2kJb4h
   tYrJEy53LpG/6WXYT+8bDcl0uhMGZl0edgHlrFPCnC/1fToEg9JcHQRNV
   PCr3bn1zjrMEtHVdaqe2xO6znx1VvXPu5+xgVjWm/3SmCYRND/ZQpWAt3
   hF6+IYSfpbm7O+XGuNciB8jnJnNi9tPBUloQYJLxQ9/5yTWID3ZP9qUg9
   sHkQvQVa9n2XAd3edXDVhiKHZpyvUN9sgqX1BP0p7X15GWQCEHkxr0vnA
   CIulMNzpMucW/zxa8MD8uaeMKZ2iR4d06IfD+l1vBF9g6HRXeqUXgLdhH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438554581"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="438554581"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 23:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736809481"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="736809481"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 14 Aug 2023 23:44:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVnn5-006tP3-2q;
        Tue, 15 Aug 2023 09:44:31 +0300
Date:   Tue, 15 Aug 2023 09:44:31 +0300
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
Message-ID: <ZNsez3oWNcT72PGy@smile.fi.intel.com>
References: <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
 <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 11, 2023 at 02:46:10PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > bus_type
> > On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote:
> > > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:

...

> > > > I'm good with this approach, but make sure you checked the whole
> > > > kernel source tree for a such.
> > >
> > > Checking against 16 is too short I guess??
> > >
> > > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.
> > 
> > So, what does prevent us from moving that tables to use pointers?
> 
> I think that will lead to ABI breakage(client->name vs id->name)
> 
> 	match = device_get_match_data(&client->dev);
> 	if (match) {
> 		chip_type = (uintptr_t)match;
> 		name = client->name;
> 	} else if (id) {
> 		chip_type = (enum inv_devices)
> 			id->driver_data;
> 		name = id->name;
> 	} else {
> 		return -ENOSYS;
> 	}


It's easy to work around (may be better fix can be found, haven't checked, just
what first comes to my mind):

	match ...
	name = match->name;

	/* If enumerated via firmware node, fix the ABI */
	if (dev_fwnode())
		client->name

> > > /*device enum */
> > > enum inv_devices {
> > > 	INV_MPU6050,
> > > 	INV_MPU6500,
> > > 	INV_MPU6515,
> > > 	INV_MPU6880,
> > > 	INV_MPU6000,
> > > 	INV_MPU9150,
> > > 	INV_MPU9250,
> > > 	INV_MPU9255,
> > > 	INV_ICM20608,
> > > 	INV_ICM20608D,
> > > 	INV_ICM20609,
> > > 	INV_ICM20689,
> > > 	INV_ICM20600,
> > > 	INV_ICM20602,
> > > 	INV_ICM20690,
> > > 	INV_IAM20680,
> > > 	INV_NUM_PARTS
> > > };
> > >
> > > The new helper function
> > 
> > You mean for debugging? We don't need that in production.
> 
> That is sample code for iterating through id table to find max enum
> and check against ZERO_OR_NULL_PTR

Much better with a coccinelle. You will find all or almost all occurrences
without too much effort done.

> > I think what you need is a coccinelle script to find these.
> 
> I need to explore using coccinelle script as I have n't tried before.

-- 
With Best Regards,
Andy Shevchenko


