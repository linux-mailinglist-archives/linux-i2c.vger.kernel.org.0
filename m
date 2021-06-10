Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F8F3A27DC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jun 2021 11:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFJJMn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 05:12:43 -0400
Received: from david.siemens.de ([192.35.17.14]:48416 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229942AbhFJJMn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Jun 2021 05:12:43 -0400
X-Greylist: delayed 491 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Jun 2021 05:12:42 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 15A92FRb022870
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 11:02:15 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.8.208])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15A92DK0011717;
        Thu, 10 Jun 2021 11:02:13 +0200
Date:   Thu, 10 Jun 2021 11:02:11 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        "Jim Quinlan" <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [rfc, PATCH v1 0/7] PCI: introduce p2sb helper
Message-ID: <20210610110211.0e239af6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 8 Mar 2021 14:20:13 +0200
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> There are a few users and even at least one more is coming
> that would like to utilize p2sb mechanisms like hide/unhide
> a device from PCI configuration space.
> 
> Here is the series to deduplicate existing users and provide
> a generic way for new comers.
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.

That bit is especially interesting. Making pinctl*lake initialize when
ACPI IDs are missing and p2sb is hidden.

However i have seen pinctl-broxton get confused because it was trying
to come up twice on a system that has the ACPI entries. Once as
"INT3452" and second as "apollolake-pinctrl". They should probably
mutually exclude each other. And the two different names for "the
same"? thing make it impossible to write a driver using those GPIOs.
Unless it would try and look up both variants or not looking up with
gpiochip.label.

I would also need that "enable GPIO w/o ACPI" for skylake. I think it
would be generally useful if the GPIO controllers would be enabled not
depending on ACPI, and coming up with only one "label" to build on top.

regards,
Henning

> Please, comment on the approach and individual patches.
> 
> (Since it's cross subsystem, the PCI seems like a main one and
>  I think it makes sense to route it thru it with immutable tag
>  or branch provided for the others).
> 
> Andy Shevchenko (5):
>   PCI: Introduce pci_bus_*() printing macros when device is not
>     available
>   PCI: Convert __pci_read_base() to __pci_bus_read_base()
>   mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
>   mfd: lpc_ich: Switch to generic pci_p2sb_bar()
>   i2c: i801: convert to use common P2SB accessor
> 
> Jonathan Yong (1):
>   PCI: New Primary to Sideband (P2SB) bridge support library
> 
> Tan Jui Nee (1):
>   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> 
>  drivers/i2c/busses/Kconfig    |   1 +
>  drivers/i2c/busses/i2c-i801.c |  40 +++-------
>  drivers/mfd/Kconfig           |   1 +
>  drivers/mfd/lpc_ich.c         | 135
> +++++++++++++++++++++++++++++----- drivers/pci/Kconfig           |
> 8 ++ drivers/pci/Makefile          |   1 +
>  drivers/pci/pci-p2sb.c        |  89 ++++++++++++++++++++++
>  drivers/pci/pci.h             |  13 +++-
>  drivers/pci/probe.c           |  81 ++++++++++----------
>  include/linux/pci-p2sb.h      |  28 +++++++
>  include/linux/pci.h           |   9 +++
>  11 files changed, 313 insertions(+), 93 deletions(-)
>  create mode 100644 drivers/pci/pci-p2sb.c
>  create mode 100644 include/linux/pci-p2sb.h
> 

