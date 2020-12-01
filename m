Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F512CA6B3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 16:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388890AbgLAPLD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 10:11:03 -0500
Received: from mga09.intel.com ([134.134.136.24]:2314 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387678AbgLAPLD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 10:11:03 -0500
IronPort-SDR: cyCZegX4Q8P86CgvrjL5zo32f7NZ3c8PQjfyd0lbKC7vuRwgG0gT8Hh/poc1djlcXctK4iDF2N
 Kbu2Nr9VXZVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="172999501"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="172999501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:09:19 -0800
IronPort-SDR: RlyogqPQm/v07Bl/w7DaKQ+1EqQ55TIIGsAcJsPsGxpr8ZpFsm/ANdOg3KbkaZAy/vlY2lXXiU
 f/Wnrtqn3eyw==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="345492105"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:09:12 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kk7IC-00BIQf-5v; Tue, 01 Dec 2020 17:10:12 +0200
Date:   Tue, 1 Dec 2020 17:10:12 +0200
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
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 14/18] acpi: utils: Add function to fetch dependent
 acpi_devices
Message-ID: <20201201151012.GG4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-15-djrscally@gmail.com>
 <20201130182354.GW4077@smile.fi.intel.com>
 <26d7fa3f-3552-90e0-1f64-5c39449dcdd7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d7fa3f-3552-90e0-1f64-5c39449dcdd7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 11:54:44PM +0000, Dan Scally wrote:
> Hi Andy
> 
> On 30/11/2020 18:23, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 01:31:25PM +0000, Daniel Scally wrote:
> >> ACPI devices declare themselves dependent on other devices via the _DEP
> >> buffer. Fetching the dependee from dependent is a matter of parsing
> >> _DEP, but currently there's no method to fetch dependent from dependee.
> >> Add one, so we can parse sensors dependent on a PMIC from the PMIC's
> >> acpi_driver.
> > Do I understand correctly that it's an existing table provided by firmware that
> > (ab)uses _DEP in such way? Note, the specification doesn't tell we may use it
> > in this way, OTOH I don't remember if it strictly forbids such use.
> >
> > So, please elaborate in the commit message why you need this and pint out to
> > the 6.5.8 "_DEP (Operation Region Dependencies)" which clearly says about
> > OpRegions and that part already supported by ACPI in the Linux, if I'm not
> > mistaken, need to refresh my memory.
> 
> 
> Laurent's reply is good explanation, but for example see my Lenovo Miix
> 510's DSDT:
> 
> 
> https://gist.githubusercontent.com/djrscally/e64d112180517352fa3392878b0f4a7d/raw/88b90b3ea4204fd7845257b6666fdade47cc2981/dsdt.dsl
> 
> 
> Search OVTI2680 and OVTI5648 for the cameras. Both are dependent on
> IN3472 devices (PMI0 and PMI1) which are the discrete type that we're
> attempting to handle here.

Yes, it seems since PMIC is kinda "power resource" (don't mix with real power
resource as by ACPI specifications) and that's why they decided to include it
into _DEP.  So, it seems a de facto common practice. Thus, it would be nice to
have the above in the commit message in some form. Can you do it?

-- 
With Best Regards,
Andy Shevchenko


