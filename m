Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74BE2CD63F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 13:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbgLCM6h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 07:58:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:26619 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730341AbgLCM6g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 07:58:36 -0500
IronPort-SDR: 3ulvvhFUWS16jhJZBd7Iyw5kVwQ/PRWBapEdFlGyMZcqE6vZKkdBgW0wgZXd2WcsYOpB8J7F26
 j5zcRRHCGSFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="153013155"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="153013155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 04:56:55 -0800
IronPort-SDR: nReJWWs/9btKLFypc6qvzMJ/nhk9baKi1UlgqEzVYypbcP9P6MLJLiuEHz8ib6Dg7fHkX9Vj7Z
 JselxOpdF/9A==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="361778349"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 04:56:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkoBB-00Bkut-1Z; Thu, 03 Dec 2020 14:57:49 +0200
Date:   Thu, 3 Dec 2020 14:57:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201203125749.GV4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201155513.GB852@paasikivi.fi.intel.com>
 <20201201183758.GE3085@pendragon.ideasonboard.com>
 <20201202110956.GD852@paasikivi.fi.intel.com>
 <20201202124228.GF4486@pendragon.ideasonboard.com>
 <20201202150858.GF4077@smile.fi.intel.com>
 <8c9e8818-6b5b-d5a5-b091-dab2d34ee0ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9e8818-6b5b-d5a5-b091-dab2d34ee0ee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 03, 2020 at 12:37:12PM +0000, Dan Scally wrote:
> On 02/12/2020 15:08, Andy Shevchenko wrote:
> > On Wed, Dec 02, 2020 at 02:42:28PM +0200, Laurent Pinchart wrote:
> >> On Wed, Dec 02, 2020 at 01:09:56PM +0200, Sakari Ailus wrote:
> >>> On Tue, Dec 01, 2020 at 08:37:58PM +0200, Laurent Pinchart wrote:
> > 
> > ...
> > 
> >> I think we should consider ACPI to be a hack in the first place :-)
> > 
> > I feel that about DT (and all chaos around it) but it's not a topic here.
> > 
> >>> Could this be just one more platform device for each of the three cases (or
> >>> one for the two latter; I'm not quite sure yet)?
> >>
> >> Using MFD for this seems a bit overkill to me. I won't care much as I
> >> won't maintain those drivers, but the current situation is complex
> >> enough, it was hard for me to understand how things worked. Adding yet
> >> another layer with another platform device won't make it any simpler.
> >>
> >> If we want to split this in two, I'd rather have a tps68470 driver on
> >> one side, without ACPI op region support, but registering regulators,
> >> GPIOs and clocks (without using separate drivers and devices for these
> >> three features), and an INT3472 driver on the other side, with all the
> >> ACPI glue and hacks. The tps68470 code could possibly even be structured
> >> in such a way that it would be used as a library by the INT3472 driver
> >> instead of requiring a separate platform device.
> > 
> > I'm afraid TPS68470 is MFD in hardware and its representation in the MFD is
> > fine. What we need is to move IN3472 pieces out from it.
> > 
> > And I agree with your proposal in general.
> 
> Way back when I first joined this project we thought we needed i2c
> drivers for driving the tps68470's clks and regulators. Tsuchiya found
> some in an old Intel tree; they needed some minor tweaks but nothing
> drastic. And I think they're designed to work with the mfd driver that's
> already in the kernel.
> 
> So, can we do this by just checking (in a new
> platform/x86/intel_skl_int3472.c) for a CLDB buffer in the PMIC, and
> calling devm_mfd_add_devices() with either the GPIO and OpRegion drivers
> (if no CLDB buffer found) or with the GPIO, clk and regulator drivers
> (If there's a CLDB and it's not a discrete PMIC). Or else, using the
> code from this patch directly in the platform driver if the CLDB says
> it's a discrete PMIC?

Lee, who is a maintainer of MFD, is quite sensitive about this.
I don't think he would approve this (however I see 8 drivers
that are using MFD API out of drivers/mfd).

-- 
With Best Regards,
Andy Shevchenko


