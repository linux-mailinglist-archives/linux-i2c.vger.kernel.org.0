Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F532FA976
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 19:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393802AbhARS7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 13:59:04 -0500
Received: from mga17.intel.com ([192.55.52.151]:64241 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393758AbhARS5o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 13:57:44 -0500
IronPort-SDR: EEZuxuME9l3mE+QixIgGXDuO0xp8Zaqr71Dui4xTDjcLI47ZQuLKznQOKgEV099g24wbwHMezC
 mmkVDRO8QK5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="158611194"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="158611194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 10:55:47 -0800
IronPort-SDR: oCdYzketkaLRX/z309sV9gO2FA4IjaKM+Zp4dSLawAnabkyVDYNPwOZlz07BgBRyUoCzHguLfr
 oE0JeVKPjEGw==
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="500721539"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 10:55:42 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Zhk-002W6O-7O; Mon, 18 Jan 2021 20:56:44 +0200
Date:   Mon, 18 Jan 2021 20:56:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Joe Perches <joe@perches.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20210118185644.GH4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <20210118133942.GI4077@smile.fi.intel.com>
 <d4671ea998010c9400ed7fd6cdf0d8ecf9a79af4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4671ea998010c9400ed7fd6cdf0d8ecf9a79af4.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 10:43:14AM -0800, Joe Perches wrote:
> On Mon, 2021-01-18 at 15:39 +0200, Andy Shevchenko wrote:
> > On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> > > We want to refer to an i2c device by name before it has been
> > 
> > I²C
> 
> Andy, are you next going to suggest renaming all the files with i2c?

Where did you get this from?

> Please do not use the pedantic I²C, 7 bit ascii is just fine here.
> 
> My keyboard does not have a superscripted 2 key, and yes, I know
> how to use it with multiple keypresses but it's irrelevant.

I2C is fine for me as well.

...

> > > created by the kernel; add a function that constructs the name
> > > from the acpi device instead.
> > 
> > acpi -> ACPI
> 
> Same deal with acpi filenames.

Where did you get about *file* names, really? Maybe you read again above?

...

> > Prefix: "i2c: core: "
> 
> Please stop being a pedant on these trivial things.
> It's unimportant and has almost no value.

This series is going to have a new version, that's why I did those comments.
If it had been the only comments, I would have not posted them.

-- 
With Best Regards,
Andy Shevchenko


