Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE1C339D55
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Mar 2021 10:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhCMJbH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Mar 2021 04:31:07 -0500
Received: from gecko.sbs.de ([194.138.37.40]:37192 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233446AbhCMJau (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Mar 2021 04:30:50 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12D9US2d008194
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 10:30:28 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.115.33])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12D9PQjp011793;
        Sat, 13 Mar 2021 10:25:26 +0100
Date:   Sat, 13 Mar 2021 10:25:25 +0100
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
Message-ID: <20210313102525.425cf40d@md1za8fc.ad001.siemens.net>
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

Tried this for my usecase and can confirm it to work as expected.

Tested-by: Henning Schild <henning.schild@siemens.com>

Henning

> Here is the series to deduplicate existing users and provide
> a generic way for new comers.
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
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

