Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6C42FB9A7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392051AbhASOgp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:45 -0500
Received: from mga11.intel.com ([192.55.52.93]:49505 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405240AbhASLMX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 06:12:23 -0500
IronPort-SDR: 3uYPwzDIQ74XV46GpVMoSozFwrE3m5nPN72LzvC/gSgi+kodCpc0uq3Muln088cmEQ42CZybe3
 4FNP4YdF9O7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="175407051"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="175407051"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 03:10:27 -0800
IronPort-SDR: qyBoVzudwLBj/l7BjOhWTnh9a9OJS7YiHbyJra8Jlwne0DRqr15v4uwaFEzRmL8KEvFfXgwl9j
 AzKWny92iNBw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="569671485"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 03:10:21 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1ouw-003RSK-QR; Tue, 19 Jan 2021 13:11:22 +0200
Date:   Tue, 19 Jan 2021 13:11:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <20210119111122.GU4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <2d8d7072-3b6f-4ffa-29dc-51f31fe4af72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d8d7072-3b6f-4ffa-29dc-51f31fe4af72@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 10:56:17AM +0000, Kieran Bingham wrote:
> On 18/01/2021 00:34, Daniel Scally wrote:

...

> > +config INTEL_SKL_INT3472
> > +	tristate "Intel SkyLake ACPI INT3472 Driver"
> > +	depends on X86 && ACPI
> > +	select REGMAP_I2C
> 
> I've tried compiling this as a built in and a module and on my minimal
> config I had failures on both for regulator_register and
> regulator_unregister.
> 
> I suspect this needs to have either a selects or a depends upon
> CONFIG_REGULATOR

Valid point, although it seems no consensus on which is better to use. It seems
to me that in this case we need to select it.

-- 
With Best Regards,
Andy Shevchenko


