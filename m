Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64542D9B20
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 16:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407987AbgLNPeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 10:34:04 -0500
Received: from mga04.intel.com ([192.55.52.120]:30982 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393522AbgLNPeA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Dec 2020 10:34:00 -0500
IronPort-SDR: gVNBJJXkFZzNdbQbxUzAs5ewxYV324hQS7eyIwpMU1yulLOdGXV4i3Af+fiZWJ33tR1WudOkgX
 vpVaJZoFUK/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="172158481"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="172158481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 07:32:14 -0800
IronPort-SDR: /HG8w61mTEl4KCXsgO03xHjFiK4b90Og4EnBaLT5jruDhCYt3dgNTnMCqVWOM3o59KCNoNzbR4
 8HLWPKW8qunQ==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="411288740"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 07:32:05 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kopqU-00EIeN-LK; Mon, 14 Dec 2020 17:33:06 +0200
Date:   Mon, 14 Dec 2020 17:33:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
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
Message-ID: <20201214153306.GI4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
 <6f3b0d7b-1ce7-aaf1-63c6-08a22dc77791@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3b0d7b-1ce7-aaf1-63c6-08a22dc77791@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Dec 13, 2020 at 10:48:39PM +0000, Daniel Scally wrote:
> On 01/12/2020 18:49, Andy Shevchenko wrote:
> >>>> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> >>>> +							   ares->data.gpio.pin_table[0],
> >>>> +							   func, 0, GPIO_ACTIVE_HIGH);
> >>>
> >>> You won't need this if you have regular INT3472 platform driver.
> >>> Simple call there _DSM to map resources to the type and use devm_gpiod_get on
> >>> consumer behalf. Thus, previous patch is not needed.
> >>
> >> How does the consumer (the camera sensor) retrieve the GPIO though ? The
> >> _DSM is in the PMIC device object, while the real consumer is the camera
> >> sensor.
> > 
> > 1. A GPIO proxy
> > 2. A custom GPIO lookup tables
> > 3. An fwnode passing to the sensor (via swnodes graph)
> > 
> > First may issue deferred probe, while second needs some ordering tricks I guess.
> > Third one should also provide an ACPI GPIO mapping table or so to make the
> > consumer rely on names rather than custom numbers.
> > 
> > Perhaps someone may propose other solutions.
> 
> Hi Andy
> 
> Sorry; some more clarification here if you have time please:

No problem, thanks for discussing this.

> 1. Do you mean here, register a new gpio_chip providing GPIOs to the
> sensors, and just have the .set() callback for that function set the
> corresponding line against the INT3472 device?

Yes. On one hand it should be a consumer (*gpiod_get*() family of APIs),
on the other it should be provider of known (artificial) GPIO chip.

> 2. I thought custom GPIO lookup tables was what I was doing, are you
> referring to something else?

I think so, i.e. nothing else from high point of view.

> 3. I guess you mean something like of_find_gpio() and acpi_find_gpio()
> here? As far as I can see there isn't currently a swnodes
> equivalent...we could just pass it via reference of course but it would
> mean the sensor drivers would all need to account for that.

Theoretically we may provide GPIOs as swnodes. In that case the consumer will
get them as usual But I think it may be too complicated / over engineered.

-- 
With Best Regards,
Andy Shevchenko


