Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955872CB949
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 10:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgLBJmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 04:42:51 -0500
Received: from mga05.intel.com ([192.55.52.43]:44310 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgLBJmv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 04:42:51 -0500
IronPort-SDR: +KrSmAWDBf/PpOKTyAqnxBpZx0JbeG1SB/rV6HfeZkEkvpoyBv05PeccrRQ0QqxEC33h4OZDF7
 SB0vxORkspOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257699549"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="257699549"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:41:08 -0800
IronPort-SDR: Zx6VlAW35gwhSvlfmzRtK+FycGmpD1pbZmxBP4828B2i7JP0s/z7sh4te87ElBTiqiOF7H49x3
 9WIv4MI16nFg==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="345808276"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:41:01 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkOeA-00BTnE-JO; Wed, 02 Dec 2020 11:42:02 +0200
Date:   Wed, 2 Dec 2020 11:42:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
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
        heikki.krogerus@linux.intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201202094202.GV4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
 <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com>
 <efd0ae7a-4ba2-e02e-6111-7f3d382d1eac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd0ae7a-4ba2-e02e-6111-7f3d382d1eac@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 09:05:11PM +0000, Dan Scally wrote:
> On 01/12/2020 19:21, Andy Shevchenko wrote:
> > On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:

...

> > I would rather ask Hans' opinion since he has quite an expertise with DMI for
> > good and bad.
> >
> I have no real preference as to the current method or DMI, but thoughts
> that come to mind are:
> 
> 
> 1. given your info that low byte 0x0c means clock enable, we need to
> register a clock too. Do we need to extend this device specific section
> to map a clock name, or is it acceptable for them to be nameless (ISTR
> that the API will let you fetch a clock using devm_clock_get(dev, NULL);)
> 
> 2. Given only 0x0b pin is actually a regulator and it's controlling
> multiple devices, my plan when we got round to adding the VCM / EEPROM
> support was simply to extend those mapping tables so that those
> supplementary devices were also able to get that regulator...and the two
> would share it. I think, from reading the regulator code and
> documentation, that that's all fine - and it won't actually be disabled
> until both drivers disable it. Does that sound about right?

Sounds right. Next step is to see the code. :-)

-- 
With Best Regards,
Andy Shevchenko


