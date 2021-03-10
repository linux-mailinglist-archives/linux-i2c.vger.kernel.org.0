Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03923340C8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 15:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJOwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 09:52:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:49016 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231197AbhCJOvs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 09:51:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8EDE3AC1F;
        Wed, 10 Mar 2021 14:51:46 +0000 (UTC)
Date:   Wed, 10 Mar 2021 15:51:45 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: Re: [PATCH v1 7/7] i2c: i801: convert to use common P2SB accessor
Message-ID: <20210310155145.513a7165@endymion>
In-Reply-To: <20210308122020.57071-8-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-8-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon,  8 Mar 2021 14:20:20 +0200, Andy Shevchenko wrote:
> Since we have a common P2SB accessor in tree we may use it instead of
> open coded variants.
> 
> Replace custom code by pci_p2sb_bar() call.

I like the idea. Just two things...

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/Kconfig    |  1 +
>  drivers/i2c/busses/i2c-i801.c | 40 ++++++++---------------------------
>  drivers/pci/pci-p2sb.c        |  6 ++++++
>  3 files changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 05ebf7546e3f..ffd3007f888c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -101,6 +101,7 @@ config I2C_HIX5HD2
>  config I2C_I801
>  	tristate "Intel 82801 (ICH/PCH)"
>  	depends on PCI
> +	select PCI_P2SB if X86
>  	select CHECK_SIGNATURE if X86 && DMI
>  	select I2C_SMBUS
>  	help
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 4acee6f9e5a3..23b43de9786a 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -90,6 +90,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/pci-p2sb.h>
>  #include <linux/kernel.h>
>  #include <linux/stddef.h>
>  #include <linux/delay.h>
> @@ -136,7 +137,6 @@
>  #define TCOBASE		0x050
>  #define TCOCTL		0x054
>  
> -#define SBREG_BAR		0x10
>  #define SBREG_SMBCTRL		0xc6000c
>  #define SBREG_SMBCTRL_DNV	0xcf000c
>  
> @@ -1524,52 +1524,30 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
>  	.version = 4,
>  };
>  
> -static DEFINE_SPINLOCK(p2sb_spinlock);
> -
>  static struct platform_device *
>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
>  	struct resource *res;
>  	unsigned int devfn;
> -	u64 base64_addr;
> -	u32 base_addr;
> -	u8 hidden;
> +	int ret;
>  
>  	/*
>  	 * We must access the NO_REBOOT bit over the Primary to Sideband
> -	 * bridge (P2SB). The BIOS prevents the P2SB device from being
> -	 * enumerated by the PCI subsystem, so we need to unhide/hide it
> -	 * to lookup the P2SB BAR.
> +	 * bridge (P2SB).
>  	 */
> -	spin_lock(&p2sb_spinlock);
>  
>  	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
>  
> -	/* Unhide the P2SB device, if it is hidden */
> -	pci_bus_read_config_byte(pci_dev->bus, devfn, 0xe1, &hidden);
> -	if (hidden)
> -		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, 0x0);
> -
> -	pci_bus_read_config_dword(pci_dev->bus, devfn, SBREG_BAR, &base_addr);
> -	base64_addr = base_addr & 0xfffffff0;
> -
> -	pci_bus_read_config_dword(pci_dev->bus, devfn, SBREG_BAR + 0x4, &base_addr);
> -	base64_addr |= (u64)base_addr << 32;
> -
> -	/* Hide the P2SB device, if it was hidden before */
> -	if (hidden)
> -		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
> -	spin_unlock(&p2sb_spinlock);
> -
>  	res = &tco_res[1];
> +	ret = pci_p2sb_bar(pci_dev, devfn, res);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
> -		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL_DNV;
> +		res->start += SBREG_SMBCTRL_DNV;
>  	else
> -		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL;
> -
> -	res->end = res->start + 3;
> -	res->flags = IORESOURCE_MEM;
> +		res->start += SBREG_SMBCTRL;

I can't see why you no longer set res->end and res->flags here. I can
imagine that pci_p2sb_bar() may have set the flags for us, but not that
->end is still correct after you fixed up ->start. Am I missing
something?

>  
>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
>  					tco_res, 2, &spt_tco_platform_data,
> diff --git a/drivers/pci/pci-p2sb.c b/drivers/pci/pci-p2sb.c
> index 68d7dad48cdb..7f6bc7d4482a 100644
> --- a/drivers/pci/pci-p2sb.c
> +++ b/drivers/pci/pci-p2sb.c
> @@ -22,6 +22,12 @@
>  
>  static const struct x86_cpu_id p2sb_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_D,	PCI_DEVFN(31, 1)),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_D,	PCI_DEVFN(31, 1)),
> +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		PCI_DEVFN(31, 1)),
> +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		PCI_DEVFN(31, 1)),
> +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		PCI_DEVFN(31, 1)),
> +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		PCI_DEVFN(31, 1)),
>  	{}
>  };
>  

Any reason why this is added in this patch instead of [3/7] (PCI: New
Primary to Sideband (P2SB) bridge support library)?

-- 
Jean Delvare
SUSE L3 Support
