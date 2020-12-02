Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EDF2CC087
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbgLBPP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:15:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:30623 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728343AbgLBPP4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:15:56 -0500
IronPort-SDR: uZ5Q/teyCLygilMbdgVlcmYYT3Ty8wmolQ9fxqnSfuWfbJfdLiB4h+vcDHzAYXn5TYkNbqc62l
 7MsJ/K/kuVqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="234636202"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="234636202"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:14:14 -0800
IronPort-SDR: CqDZFkSYXsVrekZwPTty2cC7yxRwdKO3E5zYFuLrzziyePVD5LBV3aubjNLYsdmGcgwBC08zke
 sAfmqrbN8b+w==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="345903040"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:14:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkTqV-00BXJa-8n; Wed, 02 Dec 2020 17:15:07 +0200
Date:   Wed, 2 Dec 2020 17:15:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <20201202151507.GH4077@smile.fi.intel.com>
References: <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
 <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com>
 <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
 <20201202124847.GG4486@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202124847.GG4486@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 02:48:47PM +0200, Laurent Pinchart wrote:
> On Tue, Dec 01, 2020 at 09:34:58PM +0100, Hans de Goede wrote:
> > On 12/1/20 8:21 PM, Andy Shevchenko wrote:
> > > On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:

...

> > > I would rather ask Hans' opinion since he has quite an expertise with DMI for
> > > good and bad.
> > 
> > So generally there are 2 ways how things like this can go:
> > 
> > 1) There is sufficient information in the ACPI table and we use data from the
> > ACPI tables
> > 
> > 2) There is unsufficient info in the ACPI tables (or we don't know how to
> > get / interpret the data) and we use DMI quirks
> 
> And this specific case I believe there is sufficient data in the ACPI
> tables, as I don't believe the Windows driver uses DMI quirks, or comes
> in the form of machine-specific binaries. We however don't know how to
> interpret all the data, but that should hopefully get better over time
> (especially as we'll get more data points, with ACPI dumps from machines
> whose schematics have leaked).

I think you are too optimistic about this part of Windows drivers.
I would rather think about hardware stuck with the same frequencies which
simply are hard coded in the Windows driver.

I have description of ASL for this camera, but I don't see anything like this
you are describing.

> > Although we do often also use a combination, getting what we can from ACPI,
> > combined with a set of defaults for what we cannot get from ACPI
> > based on what reference designs use (IOW what most devices seem to have
> > copy and pasted). Combined with DMI quirks for when the defaults do not
> > work (which is quite often).
> > 
> > Depending on if "not working because of wrong defaults" has bad side effects,
> > another option is also to only allow the driver to load on devices which
> > have the necessary info provided through a DMI match.
> 
> Right now there shouldn't be bad side effects, but in the future we'll
> need to setup a PMIC whose output voltages can be controlled, and
> getting it wrong would be very bad. For that I'll definitely vote for
> DMI match to start with, but I don't think that precludes using data
> from ACPI. We could just prevent the driver from loading if the machine
> isn't whitelisted in DMI matches, and still use ACPI data.

I also think about DMI as a narrowing scope of supported platforms.

-- 
With Best Regards,
Andy Shevchenko


