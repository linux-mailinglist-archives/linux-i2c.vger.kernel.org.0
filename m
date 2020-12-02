Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B382CB93D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 10:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388132AbgLBJkl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 04:40:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:64067 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728186AbgLBJkk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 04:40:40 -0500
IronPort-SDR: hoJbzPDi0zqgCc87VwjYv2w1/L9Oe29st83AcNB38LuGb4nh1YE9BGjt1fhWsToakmSk3FcvWN
 Nlu/F0D6PY3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234594992"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="234594992"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:38:58 -0800
IronPort-SDR: 4KKeLzJnz0Eguq+itLgG7BfwOPeG+jY32kyPc+3b6La7DzEahHe8LzRDR0+2i44FM806MK86/0
 vKerPXkWmG1Q==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="316039161"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:38:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkOc4-00BTlt-MR; Wed, 02 Dec 2020 11:39:52 +0200
Date:   Wed, 2 Dec 2020 11:39:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201202093952.GU4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
 <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 08:59:53PM +0000, Dan Scally wrote:
> On 01/12/2020 18:49, Andy Shevchenko wrote:

...

> > Seems we can do this, by locating intel_int3472.c under PDx86 hood and dropping
> > ACPI ID table from TPS68470 MFD driver. The PMIC can be instantiated via
> > i2c_acpi_new_device() (IIRC the API name).
> >
> > And actually it makes more sense since it's not and MFD and should not be there.
> >
> > (Dan, patch wise the one creates intel_int3472.c followed by another one that
> >  moves ACPI ID from PMIC and introduces its instantiation via I²C board info
> >  structure)
> 
> I'm mostly following this, but why would we need an i2c_board_info or
> i2c_acpi_new_device()? The INT3472 entries that refer to actual tps68470
> devices do have an I2cSerialBusV2 enumerated in _CRS so in their case
> there's an i2c device registered with the kernel already.

Because as we discussed already we can't have two drivers for the same ID
without a big disruption in the driver(s).

If you have a single point of enumeration, it will make things much easier
(refer to the same intel_cht_int33fe driver you mentioned earlier).

I just realize that the name of int3472 should follow the same pattern, i.e.
intel_skl_int3472.c

> I think we need those things when we get round to handling the
> VCM/EEPROM that's hidden within the sensor's ACPI entry, but I've not
> done any work on that yet at all.

Let's consider this later — one step at a time.

-- 
With Best Regards,
Andy Shevchenko


