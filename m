Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBDB2CA68A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 16:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391716AbgLAPHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 10:07:19 -0500
Received: from mga12.intel.com ([192.55.52.136]:56660 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387462AbgLAPHT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 10:07:19 -0500
IronPort-SDR: O0Gq3HRctk79IbPZ5bOC9GaU9TuwpVT112ZXX20mvKAQnlJp+Nn5XMHWLUNlCoZ5/hyBzQKYrQ
 Q5zMmdkXyMSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152093092"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="152093092"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:05:36 -0800
IronPort-SDR: OQ4oSN/ZfoiCZhKZjYG9XGJcVgAuKTLV12ethorldSZdb2n1J8QTmg5CGra7aN4/3BwuY5Evsq
 sSZ/uEhZiGHw==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="367579376"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:05:30 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kk7Ec-00BIOo-Rr; Tue, 01 Dec 2020 17:06:30 +0200
Date:   Tue, 1 Dec 2020 17:06:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201201150630.GF4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 10:35:51PM +0200, Sakari Ailus wrote:
> On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:

...

> > +/*
> > + * Extend this array with ACPI Hardware ID's of devices known to be working.
> > + * Do not add a HID for a sensor that is not actually supported.
> > + */
> > +static const char * const cio2_supported_devices[] = {
> > +	"INT33BE",
> > +	"OVTI2680",
> 
> I guess we don't have the known-good frequencies for the CSI-2 bus in
> firmware?
> 
> One option would be to put there what the drivers currently use. This
> assumes the support for these devices is, well, somewhat opportunistic but
> I guess there's no way around that right now at least.
> 
> As the systems are laptops, they're likely somewhat less prone to EMI
> issues to begin with than mobile phones anyway.

ACPI has only XTAL clock frequency (dunno if it's the same as CSI-2 bus clock).
Currently it may be one out of 19.2 MHz, 24 MHz (with a remark that all sensors
must use same value as PMIC can't produce several clocks).

> > +};

...

> > +	strcpy(sensor->prop_names.clock_frequency, "clock-frequency");
> > +	strcpy(sensor->prop_names.rotation, "rotation");
> > +	strcpy(sensor->prop_names.bus_type, "bus-type");
> > +	strcpy(sensor->prop_names.data_lanes, "data-lanes");
> > +	strcpy(sensor->prop_names.remote_endpoint, "remote-endpoint");
> 
> Please use the actual field size instead with strncpy / strscpy.

Perhaps Laurent's proposal is better?

-- 
With Best Regards,
Andy Shevchenko


