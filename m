Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A5A349799
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 18:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCYRH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 13:07:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:24550 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229866AbhCYRHv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Mar 2021 13:07:51 -0400
IronPort-SDR: H1hyMxyU12hAkVcY5UikepL7X11tUvG5PlKPNE1+gOSlx74Os4dB72dCwuUrCX57ehnmq6vg+j
 u03e0kKJWnZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="191008784"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="191008784"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 10:05:32 -0700
IronPort-SDR: 0zVs3Ixl4PvLhsM1rLl1jNqPu0t1LvpjEpw89hXqedJG7yo8e2ebDIuA2SlnbQspll9Zm8Mo4+
 AZpL8EYBXtnQ==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="514716846"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 10:05:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPTQF-00G6sO-8O; Thu, 25 Mar 2021 19:05:27 +0200
Date:   Thu, 25 Mar 2021 19:05:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
Message-ID: <YFzC19IiGZdmLCOR@smile.fi.intel.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
 <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
 <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 22, 2021 at 10:26:55PM +0530, Goswami, Sanket wrote:
> On 09-Mar-21 19:56, Andy Shevchenko wrote:
> > On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:

...

> >> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
> > 
> > Why do you need a custom function for that? Can it be generic and not AMD
> > specific?
> This function takes care of AMD Specific bus configuration for the transfer and
> also addresses the IP issue of i2c transactions hence it is kept as custom.

Can you a bit elaborate this? IT would be nice to have a comment in the code
explaining what is the difference with a generic approach.

...

> >> +     /* Enable ucsi interrupt */
> >> +     if (dev->flags & AMD_NON_INTR_MODE)
> >> +             regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
> > 
> > This is looks like a hack. Why is it here?
> In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
> it is mandatory to set the right value in specific register
> (offset:0x474) as per the hardware IP specification.

Why it can not be done outside of this function?

...

> >> +     if (dev->flags & AMD_NON_INTR_MODE)
> >> +             return amd_i2c_dw_master_xfer(adap, msgs, num);
> > 
> > Ditto.
> Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> As it is polling based transfer mechanism, which does not support
> interrupt based functionalities of existing DesignWare driver.

Ditto.

And I think I already have told you that I prefer to see rather MODEL_ quirk.

...

> > Also why (1) and this can't be instantiated from ACPI / DT?
> It is in line with the existing PCIe-based DesignWare driver,
> A similar approach is used by the various vendors.

Here is no answer to the question. What prevents you to fix your ACPI tables or
DT?

We already got rid of FIFO hard coded values, timings are harder to achieve,
but we expect that new firmwares will provide values in the ACPI tables.

-- 
With Best Regards,
Andy Shevchenko


