Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B343C5BE5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 14:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhGLMOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 08:14:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:52381 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230074AbhGLMOw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 08:14:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209785552"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="209785552"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 05:12:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="652927011"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 05:12:00 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m2umv-00CDOQ-W1; Mon, 12 Jul 2021 15:11:53 +0300
Date:   Mon, 12 Jul 2021 15:11:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <YOwxidwFKL9fS9gr@smile.fi.intel.com>
References: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
 <20210309014221.GA1831206@bjorn-Precision-5520>
 <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
 <3f33a178-3002-e93e-89f1-8cf05097da25@metux.net>
 <20210406154001.3eec0698@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406154001.3eec0698@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 06, 2021 at 03:40:01PM +0200, Henning Schild wrote:
> Am Fri, 2 Apr 2021 15:09:12 +0200
> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
> 
> > On 09.03.21 09:42, Henning Schild wrote:
> > 
> > > The device will respond to MMIO while being hidden. I am afraid
> > > nothing stops a collision, except for the assumption that the BIOS
> > > is always right and PCI devices never get remapped. But just
> > > guessing here.  
> > 
> > What could go wrong if it is remapped, except that this driver would
> > write to the wrong mmio space ?
> > 
> > If it's unhidden, pci-core should see it and start the usual probing,
> > right ?
> 
> I have seen this guy exposed to Linux on coreboot machines. No issues.
> But i can imagine BIOSs that somehow make use of the device and assume
> it wont move. So we would at least need a parameter to allow keeping
> that device hidden, or "fixed" in memory.

I'm wondering if they have pin control device described in the ACPI.
If so, how in that case you prevent double initialisation?

We would need to check both: P2SB and ACPI tables. Basically if we enable P2SB
as a PCI device we may create a corresponding driver (somewhere under
drivers/pci or PDx86) and check in its probe that ACPI device is also present
and functional.

-- 
With Best Regards,
Andy Shevchenko


