Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9421475F7AA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjGXNAy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjGXNAj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:00:39 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBEC3A87;
        Mon, 24 Jul 2023 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690203492; x=1721739492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eEKezRqxOUMYrm0xNbqQLlH0PCLXWN1g+s5jw8upy0Q=;
  b=Yt3lt1zrop+OgbABxaDnGMqmWyXoiWGewSN6eV5OSDS6rHzF+g94fbJV
   xiOSSljeYMWVxzeBsmzFAI/JykPhW1VP5Vn+2Jb5PvK4jY0k1N1J53Vib
   MkHqMQmJ4wjjega8yUkOIptHFWUupSL8fV/n51mNuZAxCCyTtEv2gW0g+
   th1SHJhH2ri20MRqSWiK9njWlgWeBcb0BDUCh6Sd/Tzv7P+mLo5/eVspx
   LpHFpl/DpePSUmWyKlv+jDdOzh8HUzdLxNZVmo5iSpSvy6cIiqv9lUNZG
   lyX4FCrChO5+u5cQi9AOHT9+Y4n3npeFu5jbd+4MGt9u1ma9ISzO0eiuo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433675127"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433675127"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 05:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869061435"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2023 05:57:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qNv83-00DniA-0I;
        Mon, 24 Jul 2023 15:57:35 +0300
Date:   Mon, 24 Jul 2023 15:57:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Message-ID: <ZL51PiWaYpn0VTa4@smile.fi.intel.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <ZL5bdwRo8CFUa5QX@smile.fi.intel.com>
 <OS0PR01MB59224593D634B3E1AC7BDF808602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224593D634B3E1AC7BDF808602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 11:46:44AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > device_get_match_data() to struct bus_type
> > On Mon, Jul 24, 2023 at 02:06:07PM +0300, Andy Shevchenko wrote:
> > > On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:

...

> > > >  const void *device_get_match_data(const struct device *dev)

(1)

> > Btw, this needs a documentation update to explain how it works now.
> 
> Can you please point me to the location where I need to update?

Sure. It's just on top of the (1). It looks like no documentation
yet existed, so you need to create one.

Not sure if fwnode.h has to be updated. At least it doesn't contradict
with the added code, while not describing all details.

-- 
With Best Regards,
Andy Shevchenko


