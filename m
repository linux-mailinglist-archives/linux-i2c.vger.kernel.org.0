Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201672FA989
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 20:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407891AbhARTBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 14:01:53 -0500
Received: from mga03.intel.com ([134.134.136.65]:26598 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407857AbhARTBw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 14:01:52 -0500
IronPort-SDR: MVMZKgqNU6YfDfCINLoIWcT+LncjGSoZ8c8CJsOPcyMcFYyzBmNiKeatgHQdZhBAjJHsaao3UJ
 edDno2rg408g==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="178925772"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="178925772"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 11:00:04 -0800
IronPort-SDR: 2rBoCfef6ZLro2UD9Y/ClGnvbXGYqsDOAj0Hjj6k2tYrMUWkUycEsH47pYV0fOqC/D9x/SbPDh
 vC4JUoQn5RUg==
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="573351304"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 11:00:00 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Zlt-002WNV-02; Mon, 18 Jan 2021 21:01:01 +0200
Date:   Mon, 18 Jan 2021 21:01:00 +0200
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
Message-ID: <20210118190100.GI4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <20210118133942.GI4077@smile.fi.intel.com>
 <d4671ea998010c9400ed7fd6cdf0d8ecf9a79af4.camel@perches.com>
 <20210118185644.GH4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118185644.GH4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 08:56:44PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 10:43:14AM -0800, Joe Perches wrote:
> > On Mon, 2021-01-18 at 15:39 +0200, Andy Shevchenko wrote:
> > > On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:

...

> > > Prefix: "i2c: core: "
> > 
> > Please stop being a pedant on these trivial things.
> > It's unimportant and has almost no value.
> 
> This series is going to have a new version, that's why I did those comments.
> If it had been the only comments, I would have not posted them.

And actually to the rationale: it makes slightly easier to grep for patches
against same driver / group of drivers / subsystem.

I bet the `... --grep 'i2c: core:' will give different results to the
`... -- drivers/i2c/i2c-* include/i2c*` besides being shorter.

-- 
With Best Regards,
Andy Shevchenko


