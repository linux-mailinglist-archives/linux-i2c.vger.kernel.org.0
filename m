Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311D82CAB1D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 19:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbgLASzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 13:55:05 -0500
Received: from mga18.intel.com ([134.134.136.126]:37429 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgLASzF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 13:55:05 -0500
IronPort-SDR: OkWk8voBW/YH2rmRtA5pah6Wq29iWG0fp3FPXCMbX4HnfDcMXzac/PGK7iQsKBYDRYccUbdams
 bZnxb4zRuoOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="160657211"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="160657211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:53:23 -0800
IronPort-SDR: N2Gek0O1l3J3d8Zx99TKdmfxzlVenacWcvlzEg4uXGGpiBrnzKuczd4AMLxP+Td7bzOuAztFYo
 68kXU/vbOJ5g==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="361146566"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:53:16 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAn3-00BLAP-Ck; Tue, 01 Dec 2020 20:54:17 +0200
Date:   Tue, 1 Dec 2020 20:54:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201185417.GL4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
> On 30/11/2020 20:07, Andy Shevchenko wrote:

...

> >> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> >> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> >> +	{ "YHCU", 2, surface_go2_ov5693 },
> >> +	{ "MSHW0070", 2, surface_book_ov5693 },
> >> +};
> > Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> > false positive matches.
> I considered DMI too, no problem to switch to that if it's a better choice.

I prefer DMI as it's a standard way to describe platform quirks in x86 world.

-- 
With Best Regards,
Andy Shevchenko


