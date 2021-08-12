Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232C43EA285
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 11:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbhHLJxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 05:53:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:26248 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235291AbhHLJxi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Aug 2021 05:53:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="237349189"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="237349189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:53:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="485317119"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 02:53:12 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mE7Oc-008Xhc-HG; Thu, 12 Aug 2021 12:53:06 +0300
Date:   Thu, 12 Aug 2021 12:53:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] i2c: i801: make p2sb_spinlock a mutex
Message-ID: <YRTvgh+4oMUGDgTe@smile.fi.intel.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
 <YRPwMkQFLWfpTULY@smile.fi.intel.com>
 <3a35757b-d0f4-fa7b-6946-548782904ab8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a35757b-d0f4-fa7b-6946-548782904ab8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 11, 2021 at 10:27:26PM +0200, Heiner Kallweit wrote:
> On 11.08.2021 17:43, Andy Shevchenko wrote:
> > On Fri, Aug 06, 2021 at 11:13:29PM +0200, Heiner Kallweit wrote:
> >> p2sb_spinlock is used in i801_add_tco_spt() only, and in process context
> >> only. Therefore a mutex is sufficient, and we can make the definition
> >> local to i801_add_tco_spt().
> > 
> > The problem with either AFAICT is that it should actually hold PCI rescan lock.
> > See the discussion with Message-ID
> > 20210308122020.57071-1-andriy.shevchenko@linux.intel.com for the details.
> > 
> Thanks for the link. I see that you use pci_lock_rescan_remove() but at a first
> glance didn't see this being discussed. Maybe because it's obvious ..
> 
> i801 was discussed here:
> https://lore.kernel.org/linux-i2c/20210310155145.513a7165@endymion/
> However discussion seems to have ended w/o result. What's the status of your
> p2sb series? Backgroud of the question is: Does it make sense to wait for
> your series to be applied, to make use of your new ps2b library functions?
> Or change the mutex to the rescan mutex for the time being?

The problem with P2SB PCI device is that it's used as a holder for the firmware
programmed value of the BAR which mustn't be relocated. If PCI runs rescan
concurrently with this piece of code (still a probability higher than 0) then
we will be in bad situation.

So, yes, rescan lock is a minimum what has to be done.

In regard to the series the idea is to unhide the P2SB in early PCI quirk and
mark its resources unrelocatable. But I haven't time to research that. It's
postponed currently due to lack of time on my side because higher priority
tasks ongoing.

-- 
With Best Regards,
Andy Shevchenko


