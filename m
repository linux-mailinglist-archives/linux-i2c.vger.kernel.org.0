Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B2A35CEFB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 18:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243442AbhDLQ5H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 12:57:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:24006 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244368AbhDLQwI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 12:52:08 -0400
IronPort-SDR: TivuLrmIPHMibLHdrWvTJ5MtKwUno963G6TSY83nCi/Kn/b2+arhdck0i4S2PJcpHWrJs9OD4K
 gpzhclO4/nyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="194265471"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="194265471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 09:51:49 -0700
IronPort-SDR: +2NDBeYEuHbsavSRhE/tlGBPSLVIVHBRrCwkuKGbUmKbsK6u1IrgYxOipgX2+rd3iw5icwxp1X
 OqyhIjlOOXkg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="450051426"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 09:51:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lVzmo-003Vvq-Jk; Mon, 12 Apr 2021 19:51:42 +0300
Date:   Mon, 12 Apr 2021 19:51:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YHR6njWCHn77v7lQ@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
 <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 06:01:06PM +0200, Henning Schild wrote:
> Am Mon, 8 Mar 2021 14:20:19 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> 
> > From: Tan Jui Nee <jui.nee.tan@intel.com>
> > 
> > Add support for non-ACPI systems, such as system that uses
> > Advanced Boot Loader (ABL) whereby a platform device has to be created
> > in order to bind with pin control and GPIO.
> > 
> > At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
> > requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
> > the PCI BAR address to GPIO.

...

> > +/* Offset data for Apollo Lake GPIO controllers */
> > +#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
> > +#define APL_GPIO_SOUTHWEST_SIZE		0x654
> > +#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
> > +#define APL_GPIO_NORTHWEST_SIZE		0x764
> > +#define APL_GPIO_NORTH_OFFSET		0xc50000
> > +#define APL_GPIO_NORTH_SIZE		0x76c
> 
> drivers/pinctrl/intel/pinctrl-broxton.c:653
> BXT_COMMUNITY(0, 77),
> 
> > +#define APL_GPIO_WEST_OFFSET		0xc70000
> > +#define APL_GPIO_WEST_SIZE		0x674
> 
> All these sizes correlate with 4 magic numbers from pinctrl-broxton.
> 
> SIZE - 0x500 (pad_base?) - 4 (no clue) / 8
> 
> It might be worth basing both numbers on a define and giving the magic
> numbers some names.

I didn't get this, sorry. The numbers above just precise sizes of the
resources. Actually they all one page anyway, so, I can drop magic of SIZEs and
leave only offsets.

> But all this seems like duplication of pinctrl-broxton, maybe the
> pinctrl driver should unhide the p2sb ...

Definitely should not. It's not a business of the pin control driver to know
how it has to be instantiated (or from what data). These offsets belong to the
platform description and since firmware hides the device without given an
appropriate ACPI device node, we have only one choice (assuming firmware is
carved in stone) -- board files.

P2SB on the other hand is a slice of many (independent) devices. There is no
"proper" place to unhide it except some core part of x86 / PCI.


-- 
With Best Regards,
Andy Shevchenko


