Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627BD35CF6D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 19:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242144AbhDLR1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 13:27:52 -0400
Received: from gecko.sbs.de ([194.138.37.40]:36582 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239725AbhDLR1v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 13:27:51 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13CHRGYj019822
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 19:27:16 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.41.180])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13CHRExB012949;
        Mon, 12 Apr 2021 19:27:15 +0200
Date:   Mon, 12 Apr 2021 19:27:14 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        "Jonathan Yong" <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in
 non-ACPI system
Message-ID: <20210412192714.617d18b0@md1za8fc.ad001.siemens.net>
In-Reply-To: <YHR6njWCHn77v7lQ@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
        <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
        <YHR6njWCHn77v7lQ@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 12 Apr 2021 19:51:42 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> On Mon, Apr 12, 2021 at 06:01:06PM +0200, Henning Schild wrote:
> > Am Mon, 8 Mar 2021 14:20:19 +0200
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> >   
> > > From: Tan Jui Nee <jui.nee.tan@intel.com>
> > > 
> > > Add support for non-ACPI systems, such as system that uses
> > > Advanced Boot Loader (ABL) whereby a platform device has to be
> > > created in order to bind with pin control and GPIO.
> > > 
> > > At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI)
> > > system requires a driver to hide and unhide P2SB to lookup P2SB
> > > BAR and pass the PCI BAR address to GPIO.  
> 
> ...
> 
> > > +/* Offset data for Apollo Lake GPIO controllers */
> > > +#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
> > > +#define APL_GPIO_SOUTHWEST_SIZE		0x654
> > > +#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
> > > +#define APL_GPIO_NORTHWEST_SIZE		0x764
> > > +#define APL_GPIO_NORTH_OFFSET		0xc50000
> > > +#define APL_GPIO_NORTH_SIZE		0x76c  
> > 
> > drivers/pinctrl/intel/pinctrl-broxton.c:653
> > BXT_COMMUNITY(0, 77),
> >   
> > > +#define APL_GPIO_WEST_OFFSET		0xc70000
> > > +#define APL_GPIO_WEST_SIZE		0x674  
> > 
> > All these sizes correlate with 4 magic numbers from pinctrl-broxton.
> > 
> > SIZE - 0x500 (pad_base?) - 4 (no clue) / 8
> > 
> > It might be worth basing both numbers on a define and giving the
> > magic numbers some names.  
> 
> I didn't get this, sorry. The numbers above just precise sizes of the
> resources. Actually they all one page anyway, so, I can drop magic of
> SIZEs and leave only offsets.

That precise size is also in the broxton driver, i think. Say we did
have

#define BXT_NORTH_COUNT 77
#define PAD_BASE 0x500

in some central place

then we could use

size = 0x500 + 8 * BXT_NORTH_COUNT + 4 (no clue what that is)

the same pattern would work for all those sizes and their
BXT_COMMUNITY(0, XX) counterparts

So the real size seems to be a function of the magic numbers in
BXT_COMMUNITY(0, XX)

Or simply take one page as you say.

> > But all this seems like duplication of pinctrl-broxton, maybe the
> > pinctrl driver should unhide the p2sb ...  
> 
> Definitely should not. It's not a business of the pin control driver
> to know how it has to be instantiated (or from what data). These
> offsets belong to the platform description and since firmware hides
> the device without given an appropriate ACPI device node, we have
> only one choice (assuming firmware is carved in stone) -- board files.
> 
> P2SB on the other hand is a slice of many (independent) devices.
> There is no "proper" place to unhide it except some core part of x86
> / PCI.

Got it, still the fact that there are 4 regions/communities is also part
of the broxton driver so there is duplication.

regards,
Henning

