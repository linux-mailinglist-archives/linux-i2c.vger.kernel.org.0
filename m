Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1BE339D6D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Mar 2021 10:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCMJqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Mar 2021 04:46:18 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:37057 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhCMJqS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Mar 2021 04:46:18 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12D9k0DI026052
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 10:46:00 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.115.33])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12D9jvnd007966;
        Sat, 13 Mar 2021 10:45:58 +0100
Date:   Sat, 13 Mar 2021 10:45:57 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <20210313104557.321de08e@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 8 Mar 2021 14:20:16 +0200
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> From: Jonathan Yong <jonathan.yong@intel.com>
> 
> There is already one and at least one more user is coming which
> requires an access to Primary to Sideband bridge (P2SB) in order to
> get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> for x86 devices.
> 
> Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pci/Kconfig      |  8 ++++
>  drivers/pci/Makefile     |  1 +
>  drivers/pci/pci-p2sb.c   | 83
> ++++++++++++++++++++++++++++++++++++++++ include/linux/pci-p2sb.h |
> 28 ++++++++++++++ 4 files changed, 120 insertions(+)
>  create mode 100644 drivers/pci/pci-p2sb.c
>  create mode 100644 include/linux/pci-p2sb.h
> 
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 0c473d75e625..740e5b30d6fd 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -252,6 +252,14 @@ config PCIE_BUS_PEER2PEER
>  
>  endchoice
>  
> +config PCI_P2SB
> +	bool "Primary to Sideband (P2SB) bridge access support"
> +	depends on PCI && X86
> +	help
> +	  The Primary to Sideband bridge is an interface to some PCI
> +	  devices connected through it. In particular, SPI NOR
> +	  controller in Intel Apollo Lake SoC is one of such devices.
> +
>  source "drivers/pci/hotplug/Kconfig"
>  source "drivers/pci/controller/Kconfig"
>  source "drivers/pci/endpoint/Kconfig"
> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index d62c4ac4ae1b..eee8d5dda7d9 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_PCI_IOV)		+= iov.o
>  obj-$(CONFIG_PCI_BRIDGE_EMUL)	+= pci-bridge-emul.o
>  obj-$(CONFIG_PCI_LABEL)		+= pci-label.o
>  obj-$(CONFIG_X86_INTEL_MID)	+= pci-mid.o
> +obj-$(CONFIG_PCI_P2SB)		+= pci-p2sb.o
>  obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
>  obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
>  obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
> diff --git a/drivers/pci/pci-p2sb.c b/drivers/pci/pci-p2sb.c
> new file mode 100644
> index 000000000000..68d7dad48cdb
> --- /dev/null
> +++ b/drivers/pci/pci-p2sb.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Primary to Sideband bridge (P2SB) access support
> + *
> + * Copyright (c) 2017, 2021 Intel Corporation.
> + *
> + * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *	    Jonathan Yong <jonathan.yong@intel.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/export.h>
> +#include <linux/pci-p2sb.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#include "pci.h"
> +
> +#define P2SBC_HIDE_BYTE			0xe1
> +#define P2SBC_HIDE_BIT			BIT(0)
> +
> +static const struct x86_cpu_id p2sb_cpu_ids[] = {
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,
> PCI_DEVFN(13, 0)),
> +	{}
> +};
> +
> +static int pci_p2sb_devfn(unsigned int *devfn)
> +{
> +	const struct x86_cpu_id *id;
> +
> +	id = x86_match_cpu(p2sb_cpu_ids);
> +	if (!id)
> +		return -ENODEV;
> +
> +	*devfn = (unsigned int)id->driver_data;
> +	return 0;
> +}
> +
> +/**
> + * pci_p2sb_bar - Get Primary to Sideband bridge (P2SB) device BAR
> + * @pdev:	PCI device to get a PCI bus to communicate with
> + * @devfn:	PCI slot and function to communicate with
> + * @mem:	memory resource to be filled in

Do we really need that many arguments to it?

Before i had, in a platform driver that never had its own pci_dev or bus

  res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
  if (res-start == 0)
    return -ENODEV;

So helper only asked for the devfn, returned base and no dedicated
error code.

With this i need

  struct pci_bus *bus = pci_find_bus(0, 0);
  struct pci_dev *pci_dev = bus->self;
  unsigned int magic_i_do_not_want =  PCI_DEVFN(13, 0);

> + * The BIOS prevents the P2SB device from being enumerated by the PCI
> + * subsystem, so we need to unhide and hide it back to lookup the
> BAR.
> + *
> + * Caller must provide a valid pointer to @mem.
> + *
> + * Locking is handled by pci_rescan_remove_lock mutex.
> + *
> + * Return:
> + * 0 on success or appropriate errno value on error.
> + */
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct
> resource *mem) +{
> +	struct pci_bus *bus = pdev->bus;

if (!pdev)
	bus = pci_find_bus(0, 0);

Or can we drop the whole arg?

> +	unsigned int df;
> +	int ret;
> +
> +	/* Get devfn for P2SB device itself */
> +	ret = pci_p2sb_devfn(&df);
> +	if (ret)
> +		return ret;

if (!devfn)
	devfn = df;

I guess that second devfn is for devices behind that bridge. So
unhiding it might reveal several devices? But when caring about that
p2sb do i really need to know its devfn. If so i would like to get

EXPORT_SYMBOL(pci_p2sb_devfn);

regards,
Henning

> +
> +	pci_lock_rescan_remove();
> +
> +	/* Unhide the P2SB device */
> +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
> +
> +	/* Read the first BAR of the device in question */
> +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem,
> PCI_BASE_ADDRESS_0, true); +
> +	/* Hide the P2SB device */
> +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE,
> P2SBC_HIDE_BIT); +
> +	pci_unlock_rescan_remove();
> +
> +	pci_bus_info(bus, devfn, "BAR: %pR\n", mem);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_p2sb_bar);
> diff --git a/include/linux/pci-p2sb.h b/include/linux/pci-p2sb.h
> new file mode 100644
> index 000000000000..15dd42737c84
> --- /dev/null
> +++ b/include/linux/pci-p2sb.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Primary to Sideband bridge (P2SB) access support
> + */
> +
> +#ifndef _PCI_P2SB_H
> +#define _PCI_P2SB_H
> +
> +#include <linux/errno.h>
> +
> +struct pci_dev;
> +struct resource;
> +
> +#if IS_BUILTIN(CONFIG_PCI_P2SB)
> +
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct
> resource *mem); +
> +#else /* CONFIG_PCI_P2SB is not set */
> +
> +static inline
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct
> resource *mem) +{
> +	return -ENODEV;
> +}
> +
> +#endif /* CONFIG_PCI_P2SB */
> +
> +#endif /* _PCI_P2SB_H */

