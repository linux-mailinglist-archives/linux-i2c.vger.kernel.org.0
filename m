Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3F716C082
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 13:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgBYMOt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 07:14:49 -0500
Received: from mga14.intel.com ([192.55.52.115]:38160 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgBYMOt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 07:14:49 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 04:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="350138610"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 Feb 2020 04:14:45 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Feb 2020 14:14:45 +0200
Date:   Tue, 25 Feb 2020 14:14:45 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martin Volf <martin.volf.42@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200225121445.GY2667@lahna.fi.intel.com>
References: <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
 <20200224101800.GJ2667@lahna.fi.intel.com>
 <20200224103731.GA10400@smile.fi.intel.com>
 <20200224105121.GK2667@lahna.fi.intel.com>
 <20200224112740.GL2667@lahna.fi.intel.com>
 <20200224182730.GA29799@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224182730.GA29799@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 10:27:30AM -0800, Guenter Roeck wrote:
> On Mon, Feb 24, 2020 at 01:27:40PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 24, 2020 at 12:51:25PM +0200, Mika Westerberg wrote:
> > > > I'm wondering if
> > > > 
> > > > 		pci_dev_is_present(...);
> > > > 
> > > > returns false here.
> > > 
> > > Well that might also be the case since lspci shows this:
> > > 
> > > 00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (rev 10)
> > > 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
> > > 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
> > > 
> > > PMC is 1f.2 and not present here. However, it may be that the PMC is
> > > still there it just does not "enumerate" because its devid/vendorid are
> > > set to 0xffff. Similar hiding was done for the P2SB bridge.
> > 
> > Actually I think this is the case here.
> > 
> > I don't know the iTCO_wdt well enough to say if it could live without
> > the ICH_RES_IO_SMI. It looks like this register is used to disable SMI
> > generation but not sure how well it works if it is left to BIOS to
> > configure. I suppose these systems should use WDAT instead.
> > 
> 
> In practice the region is only used if
> 	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
> where turn_SMI_watchdog_clear_off is 1 by default. It is also
> passed to vendor specific code, but that is only relevant for
> really old systems. In short, it isn't really needed for any
> recent-generation systems, and could be made optional with
> a few lines of code in iTCO_wdt.c.

Indeed that seems to be the case. Let me come up with a series that
makes the SMI optional and fixes the problematic code in the i801 driver
by not passing the SMI resource if the PMC device is not present.
