Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF8B2FC3C1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387540AbhASOej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:34:39 -0500
Received: from mga18.intel.com ([134.134.136.126]:26223 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387605AbhASJff (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:35:35 -0500
IronPort-SDR: xCOr8GpXxSqSgM5Sat1/KBJKDKkHVAIAg19Nfv/gncqNKWnVNoWBzpidAkdPrejbuJ+nmCzojZ
 pBhRWu1nD/cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166567897"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="166567897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:33:03 -0800
IronPort-SDR: pk1kIY+FtklPKJVn9jyGzPzmFrbdK3SjXPmZh+sE+Xd9jHulku9vuU1H72GvEwOQNkJIj3up9z
 q7K7YbNah8uQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="353740646"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:32:56 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1nOg-003LYJ-8N; Tue, 19 Jan 2021 11:33:58 +0200
Date:   Tue, 19 Jan 2021 11:33:58 +0200
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
Message-ID: <20210119093358.GO4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> On 18/01/2021 21:19, Daniel Scally wrote:

> I'm more and more confident that this will work, but it has some
> knock-on effects:
> 
> The both clk and regulator gpio driver expects to be able to fetch the
> GPIO using devm_gpiod_get(&pdev->dev, "enable", ...). That won't work of
> course, so we need to add another GPIO lookup table so those drivers can
> see the GPIOs. For that, we need to know what dev_name(&pdev->dev) will
> be so we can set the .dev_id member of a gpiod_lookup_table to that
> value, but that isn't set until _after_ the pdev is registered (because
> it has to figure out the id, we can't manually set the IDs because there
> could be more than one instance of int3472-discrete bound to multiple
> PMIC devices, and we don't know which id the current one should have).
> Finally, we can't wait until the device is registered because it
> immediately probes, can't find the GPIO and then fails probe.
> 
> It's similar problem that causes us to need the i2c-acpi name format
> macros, but complicated by the dynamic ID part of dev_name(&pdev->dev)
> 
> Solving it is a bit of a sticky one; perhaps something like moving the
> dev_set_name() part of platform_device_add() [1] to its own function,
> that's called in both platform_device_alloc() and
> platform_device_register(). That way it would be available before the
> device itself was registered, meaning we could create the lookup table
> before it probes the driver.

See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
methods to be able to use it as a library.

> (also, Laurent, if we did it this way we wouldn't be able to also handle
> the led-indicator GPIO here without some fairly major rework)

LED indicators are done as LED class devices (see plenty of examples in PDx86
drivers: drivers/platform/x86/)

-- 
With Best Regards,
Andy Shevchenko


