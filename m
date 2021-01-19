Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F97A2FB9A6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391089AbhASOgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:43 -0500
Received: from mga02.intel.com ([134.134.136.20]:47521 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390924AbhASLJt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 06:09:49 -0500
IronPort-SDR: ayeeKwzXc+2a1Its2izeC0KEq4y2QB0yIuiQW7WCh49++sSYfWfSTwGWmmnmvEOGCVdsV2l4Wa
 1iFf/z2Z8rpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="165999520"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="165999520"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 03:07:40 -0800
IronPort-SDR: ZuC9+ihAO86GOtXpMGq+tCSJWtRZxpK/ZQwFe9cqlfzrvLbMidkWIyPYaM9VwptmFjhsptGp+j
 G8WRrN2cEFDA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="365713651"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 03:07:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1osH-003RIQ-1u; Tue, 19 Jan 2021 13:08:37 +0200
Date:   Tue, 19 Jan 2021 13:08:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <20210119110837.GT4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
 <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
> On 19/01/2021 09:24, Andy Shevchenko wrote:
> >>>>> +static struct i2c_driver int3472_tps68470 = {
> >>>>> +	.driver = {
> >>>>> +		.name = "int3472-tps68470",
> >>>>> +		.acpi_match_table = int3472_device_id,
> >>>>> +	},
> >>>>> +	.probe_new = skl_int3472_tps68470_probe,
> >>>>> +};
> >>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> >>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> >>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
> >> Sorry, I'm a bit confused by this. The i2c device is already
> >> present...we just want the driver to bind to them, so what role do those
> >> functions have there?
> > What I meant is something like
> >
> >  *_i2c.c
> > 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
> > 	involved (and it sounds like it should be mfd/tps one, in which you
> > 	just cut out ACPI IDs and convert to pure I²C one, that what I had
> > 	suggested in the first place)
> 
> Ahh; sorry - i misunderstood what you meant there. I understand now I
> think, but there is one complication; the ACPI subsystem already creates
> a client for that i2c adapter and address; i2c_new_client_device()
> includes a check to see whether that adapter / address combination has
> an i2c device already.  So we would have to have the platform driver
> with ACPI ID first find the existing i2c_client and unregister it before
> registering the new one...the existing clients have a name matching the
> ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
> i2c_device_id of course.

See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600

static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
	{"BSG1160", },
	{"BSG2150", },
	{"INT33FE", },
	{"INT3515", },
	{}
};

So, we quirklist it here and instantiate manually from platform driver (new
coming one).

...

> > You need to modify clk-gpio.c to export
> >
> > clk_hw_register_gpio_gate()
> > clk_hw_register_gpio_mux()
> >
> > (perhaps it will require to add *_unregister() counterparts) and call it from
> > your code.
> >
> > See, for example, how clk_hw_unregister_fixed_rate() is being used. Another

Here I meant of course clk_hw_register_fixed_rate().

> > case is to add a helper directly into clk-gpio and call it instead of
> > clk_hw_*() one, see how clk_register_fractional_divider() is implemented and
> > used.
> 
> I'll take a look, thanks

-- 
With Best Regards,
Andy Shevchenko


