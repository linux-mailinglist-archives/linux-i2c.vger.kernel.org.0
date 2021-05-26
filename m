Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C853911A0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 09:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhEZH4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 03:56:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:1698 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhEZH4W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 03:56:22 -0400
IronPort-SDR: nxpnwqmksiAezhgL5EXgcKsxf47edoQYs+zF+X67YCaWAXHl7o28PNp7lbyynyI8j6Hln74Xqm
 yrmCv8GszZtQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182732023"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="182732023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 00:54:50 -0700
IronPort-SDR: BOWpYMucKBb3PRHow4HJKfeFxbQ+pJKhFKY5nU+pkjl7zsFefbeEHbETfh1r5dRm5uMGJqIp9W
 Suf9sRUeo7HA==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="464672901"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 00:54:43 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lloND-00EkYe-AH; Wed, 26 May 2021 10:54:39 +0300
Date:   Wed, 26 May 2021 10:54:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 7/8] platform/x86: Add intel_skl_int3472 driver
Message-ID: <YK3+vxmWfD0mhjU0@smile.fi.intel.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-8-djrscally@gmail.com>
 <YKeuQM/O9+jDZFpb@smile.fi.intel.com>
 <6294177b-d6e1-8bbd-d313-5cce1c498604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6294177b-d6e1-8bbd-d313-5cce1c498604@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 25, 2021 at 11:53:21PM +0100, Daniel Scally wrote:
> On 21/05/2021 13:57, Andy Shevchenko wrote:

...

> >> +static const struct regulator_ops int3472_gpio_regulator_ops;
> > Hmm... Can you use 'reg-fixed-voltage' platform device instead?
> >
> > One example, although gone from upstream, but available in the tree, I can
> > point to is this:
> >
> >   git log -p -- arch/x86/platform/intel-mid/device_libs/platform_bcm43xx.c
> >
> > It uses constant structures, but I think you may dynamically generate the
> > necessary ones.
> >
> 
> I can experiment with this, though one thing is we have no actual idea
> what voltages these are supplying...it doesn't look like that matters
> from drivers/regulator/fixed.c, but I'd have to try it to be sure.

I believe it is likely 1.8v. But I can check if I have the schematics of a
reference design for something like this.

...

> >> +	if (int3472->clock.ena_gpio) {
> >> +		ret = skl_int3472_register_clock(int3472);
> >> +		if (ret)
> >> +			goto out_free_res_list;
> >> +	} else {
> > Hmm... Have I got it correctly that we can't have ena_gpio && led_gpio together?
> 
> 
> No, just that we can only have led_gpio if we also have ena_gpio (at
> least that's the intention...)

Okay, perhaps then a comment above?

-- 
With Best Regards,
Andy Shevchenko


