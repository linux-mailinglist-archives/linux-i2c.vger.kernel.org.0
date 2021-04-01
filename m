Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD212351EAD
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhDASpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 14:45:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:63637 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237593AbhDASho (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Apr 2021 14:37:44 -0400
IronPort-SDR: DBRHA8ad8cfXh7D8L2eIVs4X6MpbWGm8fln6prJF3nNbWB2ljPZQ8VzC3i7kkCvrkRe/xIzLh3
 u/r9L/6m8kaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="277457339"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="277457339"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 08:43:18 -0700
IronPort-SDR: 2pgC/2XvpsQ6arvCckvZv4G5JVCsE5cF0RoD2BuJXuxZuisHgV7En4ZsKMzypSTd1o8j+9m2q3
 +K0odndjwu2w==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="446315995"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 08:43:14 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRzTT-000ID7-8B; Thu, 01 Apr 2021 18:43:11 +0300
Date:   Thu, 1 Apr 2021 18:43:11 +0300
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
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <YGXqDxSJhCO9bD1X@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
 <20210313104557.321de08e@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313104557.321de08e@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 13, 2021 at 10:45:57AM +0100, Henning Schild wrote:
> Am Mon, 8 Mar 2021 14:20:16 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

...

> > + * pci_p2sb_bar - Get Primary to Sideband bridge (P2SB) device BAR
> > + * @pdev:	PCI device to get a PCI bus to communicate with
> > + * @devfn:	PCI slot and function to communicate with
> > + * @mem:	memory resource to be filled in
> 
> Do we really need that many arguments to it?
> 
> Before i had, in a platform driver that never had its own pci_dev or bus
> 
>   res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
>   if (res-start == 0)
>     return -ENODEV;
> 
> So helper only asked for the devfn, returned base and no dedicated
> error code.
> 
> With this i need
> 
>   struct pci_bus *bus = pci_find_bus(0, 0);
>   struct pci_dev *pci_dev = bus->self;
>   unsigned int magic_i_do_not_want =  PCI_DEVFN(13, 0);

What confuses me is the use for SPI NOR controller on Broxton. And I think
we actually can indeed hide all this under the hood by exposing P2SB to the OS.

Mika, what do you think?

> I guess that second devfn is for devices behind that bridge. So
> unhiding it might reveal several devices?

Good question. I need a device where actually this happens (hidden P2SB stuff
with let's say SPI NOR there) to see how it looks like in such case. I only
understood the GPIO part. But I'm not so sure anymore.

> But when caring about that
> p2sb do i really need to know its devfn. If so i would like to get

-- 
With Best Regards,
Andy Shevchenko


