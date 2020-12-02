Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7242CC062
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgLBPJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:09:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:60605 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgLBPJ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:09:57 -0500
IronPort-SDR: jIE/WsanMF8LPqJP8MBPXPZdifXUgkKfxwNSnye46i0mUuAdIp4y0DneRnHBJvhcBc96sdDp7L
 BBXDhwWNwc5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152283041"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="152283041"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:08:07 -0800
IronPort-SDR: xP/V59ok5Czz+RC4Cc5aVvYbHAalo79w6UhpIC2KSi/fNABaDfWpq+rZ1R94m7lLvoQiV0Bebc
 7DvWCDM0X6/A==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="345900989"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:07:57 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkTkY-00BXG1-Ay; Wed, 02 Dec 2020 17:08:58 +0200
Date:   Wed, 2 Dec 2020 17:08:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
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
Message-ID: <20201202150858.GF4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201155513.GB852@paasikivi.fi.intel.com>
 <20201201183758.GE3085@pendragon.ideasonboard.com>
 <20201202110956.GD852@paasikivi.fi.intel.com>
 <20201202124228.GF4486@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202124228.GF4486@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 02:42:28PM +0200, Laurent Pinchart wrote:
> On Wed, Dec 02, 2020 at 01:09:56PM +0200, Sakari Ailus wrote:
> > On Tue, Dec 01, 2020 at 08:37:58PM +0200, Laurent Pinchart wrote:

...

> I think we should consider ACPI to be a hack in the first place :-)

I feel that about DT (and all chaos around it) but it's not a topic here.

> > Could this be just one more platform device for each of the three cases (or
> > one for the two latter; I'm not quite sure yet)?
> 
> Using MFD for this seems a bit overkill to me. I won't care much as I
> won't maintain those drivers, but the current situation is complex
> enough, it was hard for me to understand how things worked. Adding yet
> another layer with another platform device won't make it any simpler.
> 
> If we want to split this in two, I'd rather have a tps68470 driver on
> one side, without ACPI op region support, but registering regulators,
> GPIOs and clocks (without using separate drivers and devices for these
> three features), and an INT3472 driver on the other side, with all the
> ACPI glue and hacks. The tps68470 code could possibly even be structured
> in such a way that it would be used as a library by the INT3472 driver
> instead of requiring a separate platform device.

I'm afraid TPS68470 is MFD in hardware and its representation in the MFD is
fine. What we need is to move IN3472 pieces out from it.

And I agree with your proposal in general.

> > The GPIO regulator case is relatively safe, but the real PMICs require
> > regulator voltage control as well as enabling and disabling the regulators.
> > That probably requires either schematics or checking the register values at
> > runtime on Windows (i.e. finding out which system you're dealing with, at
> > runtime).

-- 
With Best Regards,
Andy Shevchenko


