Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D52D3C5BEC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 14:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhGLMQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 08:16:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:26721 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230074AbhGLMQo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 08:16:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="197241595"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="197241595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 05:13:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="502106140"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 05:13:52 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m2uok-00CDPn-3s; Mon, 12 Jul 2021 15:13:46 +0300
Date:   Mon, 12 Jul 2021 15:13:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
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
Message-ID: <YOwx+gM79lnMjqeg@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
 <20210313104557.321de08e@md1za8fc.ad001.siemens.net>
 <YGXqDxSJhCO9bD1X@smile.fi.intel.com>
 <20210401180617.GL2542@lahna.fi.intel.com>
 <YGYPSoXDn8GW5iSI@smile.fi.intel.com>
 <20210401183236.GN2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401183236.GN2542@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 01, 2021 at 09:32:36PM +0300, Mika Westerberg wrote:
> On Thu, Apr 01, 2021 at 09:22:02PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 01, 2021 at 09:06:17PM +0300, Mika Westerberg wrote:
> > > On Thu, Apr 01, 2021 at 06:43:11PM +0300, Andy Shevchenko wrote:
> > > > On Sat, Mar 13, 2021 at 10:45:57AM +0100, Henning Schild wrote:
> > > > > Am Mon, 8 Mar 2021 14:20:16 +0200
> > > > > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > > > 
> > > > ...
> > > > 
> > > > > > + * pci_p2sb_bar - Get Primary to Sideband bridge (P2SB) device BAR
> > > > > > + * @pdev:	PCI device to get a PCI bus to communicate with
> > > > > > + * @devfn:	PCI slot and function to communicate with
> > > > > > + * @mem:	memory resource to be filled in
> > > > > 
> > > > > Do we really need that many arguments to it?
> > > > > 
> > > > > Before i had, in a platform driver that never had its own pci_dev or bus
> > > > > 
> > > > >   res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
> > > > >   if (res-start == 0)
> > > > >     return -ENODEV;
> > > > > 
> > > > > So helper only asked for the devfn, returned base and no dedicated
> > > > > error code.
> > > > > 
> > > > > With this i need
> > > > > 
> > > > >   struct pci_bus *bus = pci_find_bus(0, 0);
> > > > >   struct pci_dev *pci_dev = bus->self;
> > > > >   unsigned int magic_i_do_not_want =  PCI_DEVFN(13, 0);
> > > > 
> > > > What confuses me is the use for SPI NOR controller on Broxton. And I think
> > > > we actually can indeed hide all this under the hood by exposing P2SB to the OS.
> > > > 
> > > > Mika, what do you think?
> > > 
> > > Not sure I follow. Do you mean we force unhide P2SB and then bind (MFD)
> > > driver to that?
> > 
> > Not MFD, SPI NOR (if I understood correctly the code in MFD driver for SPI NOR
> > in regards to P2SB case).
> 
> I mean a new MFD driver that binds to the P2SB and that one then exposes
> the stuff needed by the SPI-NOR driver.

But as far as I understood it doesn't binds to P2SB since we do not have that
device present at PCI enumeration stage.

Maybe at the end of the day the P2SB driver should be located in drivers/mfd
and take over the SPI NOR enumeration as well on platforms in question?

-- 
With Best Regards,
Andy Shevchenko


