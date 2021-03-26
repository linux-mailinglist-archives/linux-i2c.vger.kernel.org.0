Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2386034A5B8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Mar 2021 11:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhCZKk7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Mar 2021 06:40:59 -0400
Received: from mga01.intel.com ([192.55.52.88]:29030 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhCZKkg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Mar 2021 06:40:36 -0400
IronPort-SDR: Tt4VwobvgTYhD9Ymx3enL/UpC6mUjzoR+HqjsX84ZSMriq5qYE0+49E0w/lpm1HjTNFScaFfNB
 BJqSqdTSIlXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="211281802"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="211281802"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 03:40:27 -0700
IronPort-SDR: +gh6FxyXjJofht4ywQhFQbgTKWgHznXFTgBwGrfv0yYIYHMsZEzwtKEC0tX4GsRCY/FLIQIGc7
 53F+P01RC0GQ==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; 
   d="scan'208";a="375442320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 03:40:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPjt9-00GMY1-2a; Fri, 26 Mar 2021 12:40:23 +0200
Date:   Fri, 26 Mar 2021 12:40:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
Message-ID: <YF26F8IFmbo80rMq@smile.fi.intel.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
 <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
 <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
 <YFzC19IiGZdmLCOR@smile.fi.intel.com>
 <617d0164-1290-250f-ae34-828c6b4b390a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617d0164-1290-250f-ae34-828c6b4b390a@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 26, 2021 at 03:53:34PM +0530, Goswami, Sanket wrote:
> On 25-Mar-21 22:35, Andy Shevchenko wrote:
> > On Mon, Mar 22, 2021 at 10:26:55PM +0530, Goswami, Sanket wrote:
> >> On 09-Mar-21 19:56, Andy Shevchenko wrote:
> >>> On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:

...

> > And I think I already have told you that I prefer to see rather MODEL_ quirk.
> 
> I did not find MODEL_ quirk reference in the PCI device tree, It is actually
> used in platform device tree which is completely different from our PCI
> based configuration, can you please provide some reference of MODEL_ quirk
> which will be part of the PCI device tree?

I meant the name of new definition for quirk.

...

> >>> Also why (1) and this can't be instantiated from ACPI / DT?
> >> It is in line with the existing PCIe-based DesignWare driver,
> >> A similar approach is used by the various vendors.
> > 
> > Here is no answer to the question. What prevents you to fix your ACPI tables or
> > DT?
> > 
> > We already got rid of FIFO hard coded values, timings are harder to achieve,
> > but we expect that new firmwares will provide values in the ACPI tables.
> 
> AMD NAVI GPU card is the PCI initiated driver, not ACPI initiated,

Which doesn't prevent to have an ACPI companion (via description in the
tables).

> and also
> It does not contain a corresponding ACPI match table.

Yes, that's what should be done in the firmware.
At least for the new version of firmware consider to add proper data into the
tables.

> Moreover, AMD  NAVI GPU
> based products are already in the commercial market hence going by this
> approach will break the functionalities for the same.

This is quite bad and unfortunate. So, you have to elaborate this in the commit
message.

-- 
With Best Regards,
Andy Shevchenko


