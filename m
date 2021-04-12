Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A535CF97
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 19:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243989AbhDLRmF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 13:42:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:28457 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238649AbhDLRmF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 13:42:05 -0400
IronPort-SDR: TDHSBR1HeWKHYMPSKBf7byDc4TuQC5AP9bV+nRtgmFPaT+kARw4Gk7FKF+IUUUIACoX+8yQEGs
 SNP6B/jVy6+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="194276228"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="194276228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 10:41:46 -0700
IronPort-SDR: 0+Ip22y9x2IL5Rv+7mQQP04rLPAGoGitSlHG76msZHZ8uJTklhG1gqh3fcOp8C7gxJ/dyoyHyV
 hMAvQKeEuOIw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531963624"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 10:41:43 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lW0Z9-003WWF-Pt; Mon, 12 Apr 2021 20:41:39 +0300
Date:   Mon, 12 Apr 2021 20:41:39 +0300
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
Message-ID: <YHSGU1fOa1AWYJGr@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
 <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
 <YHR6njWCHn77v7lQ@smile.fi.intel.com>
 <20210412192714.617d18b0@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412192714.617d18b0@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 07:27:14PM +0200, Henning Schild wrote:
> Am Mon, 12 Apr 2021 19:51:42 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > On Mon, Apr 12, 2021 at 06:01:06PM +0200, Henning Schild wrote:
> > > Am Mon, 8 Mar 2021 14:20:19 +0200
> > > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

...

> > > > +#define APL_GPIO_NORTH_OFFSET		0xc50000
> > > > +#define APL_GPIO_NORTH_SIZE		0x76c  
> > > 
> > > drivers/pinctrl/intel/pinctrl-broxton.c:653
> > > BXT_COMMUNITY(0, 77),
> > >   
> > > > +#define APL_GPIO_WEST_OFFSET		0xc70000
> > > > +#define APL_GPIO_WEST_SIZE		0x674  
> > > 
> > > All these sizes correlate with 4 magic numbers from pinctrl-broxton.
> > > 
> > > SIZE - 0x500 (pad_base?) - 4 (no clue) / 8
> > > 
> > > It might be worth basing both numbers on a define and giving the
> > > magic numbers some names.  
> > 
> > I didn't get this, sorry. The numbers above just precise sizes of the
> > resources. Actually they all one page anyway, so, I can drop magic of
> > SIZEs and leave only offsets.
> 
> That precise size is also in the broxton driver, i think. Say we did
> have
> 
> #define BXT_NORTH_COUNT 77
> #define PAD_BASE 0x500
> 
> in some central place
> 
> then we could use
> 
> size = 0x500 + 8 * BXT_NORTH_COUNT + 4 (no clue what that is)
> 
> the same pattern would work for all those sizes and their
> BXT_COMMUNITY(0, XX) counterparts
> 
> So the real size seems to be a function of the magic numbers in
> BXT_COMMUNITY(0, XX)
> 
> Or simply take one page as you say.

No, not this way. We are really trying hard *not* to put *that* magic into
the code. Just FYI that SIZEs I have calculated myself, but these SIZEs
are *not* the same as the ones used in pinctrl-broxton *semantically*.

One if for resource provider, one is for consumer. They are simply different
in this sense.

> > > But all this seems like duplication of pinctrl-broxton, maybe the
> > > pinctrl driver should unhide the p2sb ...  
> > 
> > Definitely should not. It's not a business of the pin control driver
> > to know how it has to be instantiated (or from what data). These
> > offsets belong to the platform description and since firmware hides
> > the device without given an appropriate ACPI device node, we have
> > only one choice (assuming firmware is carved in stone) -- board files.
> > 
> > P2SB on the other hand is a slice of many (independent) devices.
> > There is no "proper" place to unhide it except some core part of x86
> > / PCI.
> 
> Got it, still the fact that there are 4 regions/communities is also part
> of the broxton driver so there is duplication.

See above. I guess here is a misunderstanding behind meaning of the (same)
numbers in different parts. Technically we may unify them, but it will be
a layering violation.

-- 
With Best Regards,
Andy Shevchenko


