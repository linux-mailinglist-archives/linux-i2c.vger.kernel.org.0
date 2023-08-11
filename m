Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392E47791DC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 16:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbjHKOaN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 10:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjHKOaM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 10:30:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCB02728;
        Fri, 11 Aug 2023 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691764212; x=1723300212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FUo3SmG4D+rVXIoe4dtN9MY0CACMsCcU7kUpx9H9i2E=;
  b=CcMp5HuToh6AT6MxNBUqu6MPvz+nITaYhh2DzaRF5aGGujoJfmC9sDQD
   oYJsvuVC97CMCxI9Vskwc5X/oSV8j9LOJPU3NOWg9tPZgTcVGHcDjX0NK
   8vNcnquQ8Hh3QeXa4G8p31azrSLjkE8pkPAj//TTImtRlH2k738uoZRKu
   Hw0AYlMBYYTiyQcQauvt6ZealfLlxcC3/4tf+7s3AWDatAV1wSUCy7PYm
   Oy4uD3CVnNi2bk1DS0UMXp9fgnLX6IGAANrtIaG5dYeyrjF8AaHeNaMh1
   APYwPfCUzaVN8p6BqwWKv7STR/pWO+dwQ5iIcGfqjUwA0Wb66qkNgj8wa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370586495"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="370586495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735808482"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="735808482"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 07:30:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qUT9O-001HgB-0J;
        Fri, 11 Aug 2023 17:30:02 +0300
Date:   Fri, 11 Aug 2023 17:30:01 +0300
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
Message-ID: <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
References: <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote:
> > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:

...

> > I'm good with this approach, but make sure you checked the whole kernel
> > source tree for a such.
> 
> Checking against 16 is too short I guess??
> 
> drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.

So, what does prevent us from moving that tables to use pointers?

> /*device enum */
> enum inv_devices {
> 	INV_MPU6050,
> 	INV_MPU6500,
> 	INV_MPU6515,
> 	INV_MPU6880,
> 	INV_MPU6000,
> 	INV_MPU9150,
> 	INV_MPU9250,
> 	INV_MPU9255,
> 	INV_ICM20608,
> 	INV_ICM20608D,
> 	INV_ICM20609,
> 	INV_ICM20689,
> 	INV_ICM20600,
> 	INV_ICM20602,
> 	INV_ICM20690,
> 	INV_IAM20680,
> 	INV_NUM_PARTS
> };
> 
> The new helper function

You mean for debugging? We don't need that in production.

I think what you need is a coccinelle script to find these.

-- 
With Best Regards,
Andy Shevchenko


