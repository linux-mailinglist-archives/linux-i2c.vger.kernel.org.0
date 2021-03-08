Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3AE3316A7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 19:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhCHSwd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 13:52:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:59284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhCHSwP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 13:52:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4989865194;
        Mon,  8 Mar 2021 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615229534;
        bh=guoYBn7p9nzr+d1LI0lqhbhGVLc1u8M5XGr+A6JAp9o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=sGYtHZLDFnmQElaBssKCzLrdqg/JH9xxnXuOMoTBVhsWvZVVjoU4MEA5i23enxMpv
         stK3R9z9hU0kmDBbVoSwQnoVcwf5r0EKok8GGaCcZLbYJOza4nZFtgoX+IBgZ3mDzV
         5C1lzkQOsAbcYlr6/EDpUTt40N3zv/mLfIvMGF39laFnSnYGvpImNExD7J2q/KRpM3
         mDu3wounGr7ckmOOiu0pIxXHm6bsrrd7HqSlVgocMmWxS2P13NHKv1F4Jq6G37oMgB
         KkJJ28nHQg4fHliR13wcNsW2i/0lPKVPOoFWOaT8r/RvwrvE3aHfB5Goo9NN7PXAFi
         uvHe/uMJY2FCw==
Date:   Mon, 8 Mar 2021 12:52:12 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
        henning.schild@siemens.com
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <20210308185212.GA1790506@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> From: Jonathan Yong <jonathan.yong@intel.com>
> 
> There is already one and at least one more user is coming which
> requires an access to Primary to Sideband bridge (P2SB) in order to
> get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> for x86 devices.

Can you include a spec reference?  I'm trying to figure out why this
belongs in drivers/pci/.  It looks very device-specific.

> Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pci/Kconfig      |  8 ++++
>  drivers/pci/Makefile     |  1 +
>  drivers/pci/pci-p2sb.c   | 83 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-p2sb.h | 28 ++++++++++++++
>  4 files changed, 120 insertions(+)
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

This doesn't sound like a "bridge".  If it's a bridge, what's on the
primary (upstream) side?  What's on the secondary side?  What
resources are passed through the bridge, i.e., what transactions does
it transfer from one side to the other?

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
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
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
> + *
> + * The BIOS prevents the P2SB device from being enumerated by the PCI
> + * subsystem, so we need to unhide and hide it back to lookup the BAR.
> + *
> + * Caller must provide a valid pointer to @mem.
> + *
> + * Locking is handled by pci_rescan_remove_lock mutex.
> + *
> + * Return:
> + * 0 on success or appropriate errno value on error.
> + */
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem)
> +{
> +	struct pci_bus *bus = pdev->bus;
> +	unsigned int df;
> +	int ret;
> +
> +	/* Get devfn for P2SB device itself */
> +	ret = pci_p2sb_devfn(&df);
> +	if (ret)
> +		return ret;
> +
> +	pci_lock_rescan_remove();
> +
> +	/* Unhide the P2SB device */
> +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
> +
> +	/* Read the first BAR of the device in question */
> +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);

I don't get this.  Apparently this normally hidden device is consuming
PCI address space.  The PCI core needs to know about this.  If it
doesn't, the PCI core may assign this space to another device.

> +	/* Hide the P2SB device */
> +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
> +
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
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem);
> +
> +#else /* CONFIG_PCI_P2SB is not set */
> +
> +static inline
> +int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif /* CONFIG_PCI_P2SB */
> +
> +#endif /* _PCI_P2SB_H */
> -- 
> 2.30.1
> 
