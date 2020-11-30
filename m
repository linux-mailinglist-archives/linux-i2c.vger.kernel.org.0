Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035592C8C65
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 19:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbgK3SOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 13:14:52 -0500
Received: from mga06.intel.com ([134.134.136.31]:15914 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbgK3SOv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 13:14:51 -0500
IronPort-SDR: t8+AuJ3qQ0PPsKOAFXSEN1kua9YzS9fWUJX1lpKLlswj5AZnV0c7Q+8FWcMP4thHQNJsWYGRm1
 3q+XXsqrZUnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="234288837"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="234288837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:13:13 -0800
IronPort-SDR: 0Ewksw0H9/WDhu0uxD54ptK+TqChK/cqDELjzzWqAAHt2Kgac+AYDSJSDr7WP9eBlRYOJz/Wc0
 nn6tZLav9HZg==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="345155875"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:13:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjngd-00B6Q6-3y; Mon, 30 Nov 2020 20:14:07 +0200
Date:   Mon, 30 Nov 2020 20:14:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20201130181407.GV4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130170955.GN14465@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 07:09:55PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:

I agree with most of Laurent's comments. S

...

> > +	  Say Y here if your device is a detachable / hybrid laptop that comes
> > +	  with Windows installed by the OEM, for example:
> > +

> > +	  	- Microsoft Surface models (except Surface Pro 3)

In this line mixed TABs and spaces. Not sure if it's only in Laurent's reply.

> > +		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
> > +		- Dell 7285

...

> > +	for (i = 0; i < ARRAY_SIZE(cio2_supported_devices); i++) {
> > +		const char *this_device = cio2_supported_devices[i];
> 
> s/this_device/name/ (or sensor_name, ...) ?

I would go with hid.

...

> > +		for_each_acpi_dev_match(adev, this_device, NULL, -1) {
> > +			if (!adev || !(adev->status.present && adev->status.enabled))
> 
> 			if (!adev || !adev->status.present || !adev->status.enabled))
> 
> may be a bit more readable. Does for_each_acpi_dev_match() return NULL
> devices though ? If no, you could drop the !adev check. You may also be
> able to drop the !present check, as I don't think ACPI allows !present
> && enabled.

I think this should be rather

        if (acpi_bus_get_status(adev) || !adev->status.present)

-- 
With Best Regards,
Andy Shevchenko


