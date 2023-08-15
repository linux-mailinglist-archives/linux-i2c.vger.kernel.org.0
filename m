Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB0077CAA8
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 11:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236108AbjHOJnM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 05:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236224AbjHOJmx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 05:42:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A201110D8;
        Tue, 15 Aug 2023 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692092551; x=1723628551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7h+/sSxZl6JCDHnh5reN75axgALtcqO8XExNpLMoAEQ=;
  b=nfvhqr9cJvOCEq7a0FlaFMqVf1qFKRTzpLODenqzjFwaAou9RMSCouSD
   ovQoYx+Rd1KaO5IUdaV5brq7Vp/4mFqiAJey6yE1vPujRXAgR7b7Ay13U
   DMNdLRPEeQClhWbIBb6KOy4R47V7Uh3b+H7GCmaF/GG/7U9o3kfnal0o1
   lod+uQSSGO2Dj/51i7jg8Mv7exVxQpaTm+PBFHlLMKKF9UXJfGHpoedrH
   49+I/bTQAy4AXO7ALMZzZOVN2dewGGtLg6Cu0bsT4MmwxJ+oej4tTf/Ir
   5NDZKQyRdkMKRKHcnABMrMLIm4PZriLBgXnQ6QtAoI7qrRkjt5QR85UPa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403222827"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="403222827"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 02:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763223745"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="763223745"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 02:42:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVqZE-00Cz3N-1T;
        Tue, 15 Aug 2023 12:42:24 +0300
Date:   Tue, 15 Aug 2023 12:42:24 +0300
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
Message-ID: <ZNtIgA4S2rHp/jbA@smile.fi.intel.com>
References: <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
 <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNsez3oWNcT72PGy@smile.fi.intel.com>
 <OS0PR01MB592231608697B4FB0D142CCD8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592231608697B4FB0D142CCD8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 15, 2023 at 06:58:41AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > bus_type
> > On Fri, Aug 11, 2023 at 02:46:10PM +0000, Biju Das wrote:

...

> > It's easy to work around (may be better fix can be found, haven't checked,
> > just what first comes to my mind):
> > 
> > 	match ...
> > 	name = match->name;
> 
> The device_get_match_data()API returns matched data, so we cannot use that one here.
> 
> Maybe??
> 
> /* If enumerated via ID lookup, fix the ABI */
> if (!dev_fwnode())
> 	name = id->name;

Yeah, you got the idea.

-- 
With Best Regards,
Andy Shevchenko


