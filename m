Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2774A3911A7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 09:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhEZH5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 03:57:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:64654 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhEZH5P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 03:57:15 -0400
IronPort-SDR: bZW7D8hrH2qec4wrfjjOuR0NqyAOY8lrMYPNZxbmRX+Toymd/jaaAvR4UYKOl8XuDdjIyPTGGT
 Zmm84QiFB57w==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189782802"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="189782802"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 00:55:42 -0700
IronPort-SDR: 0Bjzi997d7ikL+Npbmdw4fAsjbh0FAW8KDfeWfIv838sDz/K1I89zPNhBhRfGK4I59ql8+TI/B
 sEz6o2Uvoczg==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="547105293"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 00:55:37 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lloO6-00EkZD-5c; Wed, 26 May 2021 10:55:34 +0300
Date:   Wed, 26 May 2021 10:55:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
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
Subject: Re: [PATCH v4 0/8] Introduce intel_skl_int3472 module
Message-ID: <YK3+9uSpCaSYUmKl@smile.fi.intel.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <f2d8e74f-f33b-2489-1b90-b11bf7465d19@redhat.com>
 <f4664310-0975-335d-8dc3-95726f53ab67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4664310-0975-335d-8dc3-95726f53ab67@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 26, 2021 at 12:03:23AM +0100, Daniel Scally wrote:
> On 25/05/2021 14:10, Hans de Goede wrote:
> > On 5/20/21 4:09 PM, Daniel Scally wrote:

...

> > 4/8 and 6/8 are both gpiolib-acpi patches and seem to be ready for merging
> > now, perhaps the gpiolib-acpi maintainers can already merge these and also
> > provide an immutable branch ?  Andy/Mika ?
> 
> 
> So, Andy, you'd prefer I re-order these so they're consecutive...did I
> understand that right?

Yes.


-- 
With Best Regards,
Andy Shevchenko


