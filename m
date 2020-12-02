Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D688F2CC075
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbgLBPMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:12:06 -0500
Received: from mga04.intel.com ([192.55.52.120]:33620 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728295AbgLBPMG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:12:06 -0500
IronPort-SDR: 4csH2/19d+gOp8k3+H9bdoe2jOef9cucqVsqB4afqwgsY53M1bhaOR5Bbyjz8QFK0USMKR1FAN
 XR/3wlx8j8+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="170463685"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="170463685"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:10:13 -0800
IronPort-SDR: NNHJlp4dSoX2A8tT0n0Cs5JYBKw6g3UHC+WqmXbJ2P7yhsoVIZs4VurSGwtKoSKW/QI9gS62Hw
 KVsWmOyQQFoA==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="316123591"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 07:10:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkTmd-00BXHH-8K; Wed, 02 Dec 2020 17:11:07 +0200
Date:   Wed, 2 Dec 2020 17:11:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201202151107.GG4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
 <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
 <20201202093952.GU4077@smile.fi.intel.com>
 <20201202123540.GE4486@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202123540.GE4486@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 02:35:40PM +0200, Laurent Pinchart wrote:
> On Wed, Dec 02, 2020 at 11:39:52AM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 01, 2020 at 08:59:53PM +0000, Dan Scally wrote:
> > > On 01/12/2020 18:49, Andy Shevchenko wrote:

...

> > I just realize that the name of int3472 should follow the same pattern, i.e.
> > intel_skl_int3472.c
> 
> We're mostly focussing on Kaby Lake here though. From what I understand
> the ACPI infrastructure for camera support is mostly the same on Sky
> Lake, but not identical. I think a single driver should be able to cover
> both though.

They (KBL and SKL) are sharing a lot, so I would name if after Skylake and use
for Kaby Lake as well.

-- 
With Best Regards,
Andy Shevchenko


