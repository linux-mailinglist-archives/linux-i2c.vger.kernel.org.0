Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637BE16A454
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 11:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgBXKv0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 05:51:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:44085 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgBXKv0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 05:51:26 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 02:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
   d="scan'208";a="349895885"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 24 Feb 2020 02:51:21 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Feb 2020 12:51:21 +0200
Date:   Mon, 24 Feb 2020 12:51:21 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Martin Volf <martin.volf.42@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200224105121.GK2667@lahna.fi.intel.com>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
 <20200224101800.GJ2667@lahna.fi.intel.com>
 <20200224103731.GA10400@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224103731.GA10400@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 12:37:31PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 24, 2020 at 12:18:00PM +0200, Mika Westerberg wrote:
> > On Sat, Feb 22, 2020 at 01:26:48PM -0800, Guenter Roeck wrote:
> > > On 2/22/20 12:49 PM, Martin Volf wrote:
> > > > On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> 
> ...
> 
> > > >          devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
> 
> I'm wondering if
> 
> 		pci_dev_is_present(...);
> 
> returns false here.

Well that might also be the case since lspci shows this:

00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)

PMC is 1f.2 and not present here. However, it may be that the PMC is
still there it just does not "enumerate" because its devid/vendorid are
set to 0xffff. Similar hiding was done for the P2SB bridge.
