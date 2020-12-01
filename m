Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298C22CAB62
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 20:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgLATGO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 14:06:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:29191 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729852AbgLATGO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 14:06:14 -0500
IronPort-SDR: 0daDVfHfuoyFPa4gal7fRgLdIll6A2WbXeJ/rsNCojto74UJTEnbCKzaX01UMJi6eK/WBFkqRJ
 e6P/zEbiHWIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173048853"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="173048853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 11:04:33 -0800
IronPort-SDR: J7EGALz54ZRHvU1wFs/JIJ9RFtaaeHz9vAh7mLskXigzZM0ATnfTLQfSBNhY1VKKTCZU0+keRv
 5rw/ZF2/NoLQ==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="405229510"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 11:04:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAxn-00BLJb-Oa; Tue, 01 Dec 2020 21:05:23 +0200
Date:   Tue, 1 Dec 2020 21:05:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201190523.GO4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201185548.GV4569@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
> On Tue, Dec 01, 2020 at 08:54:17PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
> > > On 30/11/2020 20:07, Andy Shevchenko wrote:

...

> > > >> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> > > >> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> > > >> +	{ "YHCU", 2, surface_go2_ov5693 },
> > > >> +	{ "MSHW0070", 2, surface_book_ov5693 },
> > > >> +};
> > > >
> > > > Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> > > > false positive matches.
> > >
> > > I considered DMI too, no problem to switch to that if it's a better choice.
> > 
> > I prefer DMI as it's a standard way to describe platform quirks in x86 world.
> 
> Do you think the Windows driver would use DMI ?

Linux is using DMI for quirks.

> That seems quite
> unlikely to me, given how they would have to release a new driver binary
> for every machine. I'm pretty sure that a different mechanism is used to
> identify camera integration, and I think it would make sense to follow
> the same approach. That would allow us to avoid large tables of DMI
> identifiers that would need to be constently updated, potentially making
> user experience better.

All Surface family can be matched in a way as Apple machines [1].

[1]: https://lkml.org/lkml/2020/4/15/1198

-- 
With Best Regards,
Andy Shevchenko


