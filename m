Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA8F4B4EC7
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352028AbiBNLg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:36:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352933AbiBNLgh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA8BA6A026
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644838000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gdUHXOdmucODhw+DUzYCo7FmPoeixrVYnMhYegQCSUU=;
        b=hZIjtcEiqeq0ArNo1Ujkq14IDnotBiFVV9PHzf8CLLLnqrmDx/jsweV80b+VSou5gkTWnX
        JFRAgyFc8FSbF8mMVt0ARNfdVDtInSaPSyliIe0JA7n6V/7T6xoKg3DPZAdfPKGCIMi3qX
        wKE7+ymvlUy4yMfpf9/EuMJ9yhOa7/U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-vioYDGfBNoCfyZWRp9JQgg-1; Mon, 14 Feb 2022 06:26:38 -0500
X-MC-Unique: vioYDGfBNoCfyZWRp9JQgg-1
Received: by mail-ed1-f69.google.com with SMTP id m11-20020a056402430b00b00410678d119eso5628276edc.21
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gdUHXOdmucODhw+DUzYCo7FmPoeixrVYnMhYegQCSUU=;
        b=KHp1LvrKSgyo/00GGQE09/GKgk2p+FyVxmsVSpOpBrLOBr7oyMDvHa2BkjulIRd7nc
         RBqPiVbVk3qETG4Oq7hd781TwKCyShjA8GzxFr3sX3YE+ejnmoTjuQVU6br+cSiUlfVX
         4jCLxUFC8vISXhqkAiIa2Q0g8ulmWuW0YZkJYoA7GPxmF8DdxNszuL8G2dalMqmbWB8d
         81ChhHwSlfczuv0HHfz8IcbOyKtzZEE9UtPM6je6J8AoMRnIoYXE9/JFFeuBAGyUAwyq
         J/zO4AEvJCRVncQvaSdhKRqRepvDqLsu+1rV6RsEsXU75KCxIv8b9lsp1/OzOHYrEC5h
         D3Ag==
X-Gm-Message-State: AOAM5301J2DDZC7lC7qD5YB5PEKktypYmCDn22XeSqaQ/00vnOoNO7VX
        EPm3lYiGGDOhwJDEfpnt9clC4gcbkjcXX1m/2q9sRcFR2CWzE+Jyy+Ut7jIyaCq3oas2EN92cz5
        YkXzr8PA3hF53z61wva4S
X-Received: by 2002:a17:907:2d2c:: with SMTP id gs44mr2380405ejc.54.1644837997355;
        Mon, 14 Feb 2022 03:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjsUOixDtylkI600SKj/YeeNYJ4PlvDfokcAuspvBdlzj1zmGJB9aNsxe2ewwzl7/bmZllHg==
X-Received: by 2002:a17:907:2d2c:: with SMTP id gs44mr2380379ejc.54.1644837996994;
        Mon, 14 Feb 2022 03:26:36 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ed9sm10160035edb.59.2022.02.14.03.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 03:26:36 -0800 (PST)
Message-ID: <5f285d15-621b-100d-b0a8-106b88739e97@redhat.com>
Date:   Mon, 14 Feb 2022 12:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband (P2SB)
 bridge support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 1/31/22 16:13, Andy Shevchenko wrote:
> From: Jonathan Yong <jonathan.yong@intel.com>
> 
> There are already two and at least one more user is coming which
> require an access to Primary to Sideband (P2SB) bridge in order
> to get IO or MMIO BAR hidden by BIOS.
> 
> Create a library to access P2SB for x86 devices.
> 
> Background information
> ======================
> Note, the term "bridge" is used in the documentation and it has nothing
> to do with a PCI (host) bridge as per the PCI specifications.
> 
> The P2SB is an interesting device by its nature and hardware design.
> First of all, it has several devices in the hardware behind it. These
> devices may or may not be represented as ACPI devices by a firmware.
> 
> It also has a hardwired (to 0s) the least significant bits of the
> base address register which is represented by the only 64-bit BAR0.
> It means that OS mustn't reallocate the BAR.
> 
> On top of that in some cases P2SB is represented by function 0 on PCI
> slot (in terms of B:D.F) and according to the PCI specification any
> other function can't be seen until function 0 is present and visible.
> 
> In the PCI configuration space of P2SB device the full 32-bit register
> is allocated for the only purpose of hiding the entire P2SB device. As
> per [3]:
> 
>   3.1.39 P2SB Control (P2SBC)—Offset E0h
> 
>   Hide Device (HIDE): When this bit is set, the P2SB will return 1s on
>   any PCI Configuration Read on IOSF-P. All other transactions including
>   PCI Configuration Writes on IOSF-P are unaffected by this. This does
>   not affect reads performed on the IOSF-SB interface.
> 
> This doesn't prevent MMIO accesses, although preventing the OS from
> assigning these addresses. The firmware on the affected platforms marks
> the region as unusable (by cutting it off from the PCI host bridge
> resources) as depicted in the Apollo Lake example below:
> 
>   PCI host bridge to bus 0000:00
>   pci_bus 0000:00: root bus resource [io  0x0070-0x0077]
>   pci_bus 0000:00: root bus resource [io  0x0000-0x006f window]
>   pci_bus 0000:00: root bus resource [io  0x0078-0x0cf7 window]
>   pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
>   pci_bus 0000:00: root bus resource [mem 0x7c000001-0x7fffffff window]
>   pci_bus 0000:00: root bus resource [mem 0x7b800001-0x7bffffff window]
>   pci_bus 0000:00: root bus resource [mem 0x80000000-0xcfffffff window]
>   pci_bus 0000:00: root bus resource [mem 0xe0000000-0xefffffff window]
>   pci_bus 0000:00: root bus resource [bus 00-ff]
> 
> The P2SB 16MB BAR is located at 0xd0000000-0xd0ffffff memory window.
> 
> The generic solution
> ====================
> The generic solution for all cases when we need to access to the information
> behind P2SB device is a library code where users ask for necessary resources
> by demand and hence those users take care of not being run on the systems
> where this access is not required.
> 
> The library provides the p2sb_bar() API to retrieve the MMIO of the BAR0 of
> the device from P2SB device slot.
> 
> P2SB unconditional unhiding awareness
> =====================================
> Technically it's possible to unhide the P2SB device and devices on
> the same PCI slot and access them at any time as needed. But there are
> several potential issues with that:
> 
>  - the systems were never tested against such configuration and hence
>    nobody knows what kind of bugs it may bring, especially when we talk
>    about SPI NOR case which contains Intel FirmWare Image (IFWI) code
>    (including BIOS) and already known to be problematic in the past for
>    end users
> 
>  - the PCI by its nature is a hotpluggable bus and in case somebody
>    attaches a driver to the functions of a P2SB slot device(s) the
>    end user experience and system behaviour can be unpredictable
> 
>  - the kernel code would need some ugly hacks (or code looking as an
>    ugly hack) under arch/x86/pci in order to enable these devices on
>    only selected platforms (which may include CPU ID table followed by
>    a potentially growing number of DMI strings
> 
> The future improvements
> =======================
> The future improvements with this code may go in order to gain some kind
> of cache, if it's possible at all, to prevent unhiding and hiding many
> times to take static information that may be saved once per boot.
> 
> Links
> =====
> [1]: https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
> [2]: https://cdrdv2.intel.com/v1/dl/getContent/332690?wapkw=332690
> [3]: https://cdrdv2.intel.com/v1/dl/getContent/332691?wapkw=332691
> [4]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403
> 
> Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/platform/x86/intel/Kconfig     |  12 +
>  drivers/platform/x86/intel/Makefile    |   1 +
>  drivers/platform/x86/intel/p2sb.c      | 299 +++++++++++++++++++++++++
>  include/linux/platform_data/x86/p2sb.h |  27 +++
>  4 files changed, 339 insertions(+)
>  create mode 100644 drivers/platform/x86/intel/p2sb.c
>  create mode 100644 include/linux/platform_data/x86/p2sb.h
> 
> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
> index 8e65086bb6c8..55b499fb8249 100644
> --- a/drivers/platform/x86/intel/Kconfig
> +++ b/drivers/platform/x86/intel/Kconfig
> @@ -68,6 +68,18 @@ config INTEL_OAKTRAIL
>  	  enable/disable the Camera, WiFi, BT etc. devices. If in doubt, say Y
>  	  here; it will only load on supported platforms.
>  
> +config P2SB
> +	bool "Primary to Sideband (P2SB) bridge access support"
> +	depends on PCI
> +	help
> +	  The Primary to Sideband (P2SB) bridge is an interface to some
> +	  PCI devices connected through it. In particular, SPI NOR controller
> +	  in Intel Apollo Lake SoC is one of such devices.
> +
> +	  The main purpose of this library is to unhide P2SB device in case
> +	  firmware kept it hidden on some platforms in order to access devices
> +	  behind it.
> +
>  config INTEL_BXTWC_PMIC_TMU
>  	tristate "Intel Broxton Whiskey Cove TMU Driver"
>  	depends on INTEL_SOC_PMIC_BXTWC
> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
> index 35f2066578b2..6ce944285730 100644
> --- a/drivers/platform/x86/intel/Makefile
> +++ b/drivers/platform/x86/intel/Makefile
> @@ -26,6 +26,7 @@ intel_int0002_vgpio-y			:= int0002_vgpio.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>  intel_oaktrail-y			:= oaktrail.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> +obj-$(CONFIG_P2SB)			+= p2sb.o
>  intel_vsec-y				:= vsec.o
>  obj-$(CONFIG_INTEL_VSEC)		+= intel_vsec.o
>  
> diff --git a/drivers/platform/x86/intel/p2sb.c b/drivers/platform/x86/intel/p2sb.c
> new file mode 100644
> index 000000000000..8c12882d0bde
> --- /dev/null
> +++ b/drivers/platform/x86/intel/p2sb.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Primary to Sideband (P2SB) bridge access support
> + *
> + * Copyright (c) 2017, 2021-2022 Intel Corporation.
> + *
> + * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *	    Jonathan Yong <jonathan.yong@intel.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/export.h>
> +#include <linux/pci.h>
> +#include <linux/platform_data/x86/p2sb.h>
> +#include <linux/printk.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#define p2sb_printk(level, bus, devfn, fmt, arg...) \
> +	printk(level "pci %04x:%02x:%02x.%d: " fmt, \
> +	       pci_domain_nr(bus), (bus)->number, PCI_SLOT(devfn), PCI_FUNC(devfn), ##arg)
> +
> +#define p2sb_err(bus, devfn, fmt, arg...)	p2sb_printk(KERN_ERR, (bus), devfn, fmt, ##arg)
> +#define p2sb_info(bus, devfn, fmt, arg...)	p2sb_printk(KERN_INFO, (bus), devfn, fmt, ##arg)
> +
> +#define P2SBC			0xe0
> +#define P2SBC_HIDE		BIT(8)
> +
> +static const struct x86_cpu_id p2sb_cpu_ids[] = {
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
> +	{}
> +};
> +
> +static int p2sb_get_devfn(unsigned int *devfn)
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
> +/*
> + * Here is practically a copy'n'paste of __pci_read_base() and Co,
> + * modified to work with PCI bus and devfn instead of PCI device.
> + *
> + * Note, the PCI core doesn't want to have that being refactored
> + * and reused.
> + */
> +static u64 pci_size(u64 base, u64 maxbase, u64 mask)
> +{
> +	u64 size = mask & maxbase;	/* Find the significant bits */
> +	if (!size)
> +		return 0;
> +
> +	/*
> +	 * Get the lowest of them to find the decode size, and from that
> +	 * the extent.
> +	 */
> +	size = size & ~(size-1);
> +
> +	/*
> +	 * base == maxbase can be valid only if the BAR has already been
> +	 * programmed with all 1s.
> +	 */
> +	if (base == maxbase && ((base | (size - 1)) & mask) != mask)
> +		return 0;
> +
> +	return size;
> +}
> +
> +static inline unsigned long decode_bar(u32 bar)
> +{
> +	u32 mem_type;
> +	unsigned long flags;
> +
> +	if ((bar & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO) {
> +		flags = bar & ~PCI_BASE_ADDRESS_IO_MASK;
> +		flags |= IORESOURCE_IO;
> +		return flags;
> +	}
> +
> +	flags = bar & ~PCI_BASE_ADDRESS_MEM_MASK;
> +	flags |= IORESOURCE_MEM;
> +	if (flags & PCI_BASE_ADDRESS_MEM_PREFETCH)
> +		flags |= IORESOURCE_PREFETCH;
> +
> +	mem_type = bar & PCI_BASE_ADDRESS_MEM_TYPE_MASK;
> +	switch (mem_type) {
> +	case PCI_BASE_ADDRESS_MEM_TYPE_32:
> +		break;
> +	case PCI_BASE_ADDRESS_MEM_TYPE_1M:
> +		/* 1M mem BAR treated as 32-bit BAR */
> +		break;
> +	case PCI_BASE_ADDRESS_MEM_TYPE_64:
> +		flags |= IORESOURCE_MEM_64;
> +		break;
> +	default:
> +		/* mem unknown type treated as 32-bit BAR */
> +		break;
> +	}
> +	return flags;
> +}
> +
> +/**
> + * __pci_bus_read_base - Read a PCI BAR
> + * @bus: the PCI bus
> + * @devfn: the PCI device and function
> + * @res: resource buffer to be filled in
> + * @pos: BAR position in the config space
> + *
> + * Returns 1 if the BAR is 64-bit, or 0 if 32-bit.
> + * In case of error resulting @res->flags is 0.
> + */
> +static int __pci_bus_read_base(struct pci_bus *bus, unsigned int devfn,
> +			       struct resource *res, unsigned int pos)
> +{

Andy, as discussed already, this is quite a big function to mostly duplicate
from the PCI-core. AFAIK the last status of the discussion surrounding this
was trying to have the P2SB code here create a fake pci_dev struct and use
that with the existing function instead.

Have you given this approach a try ?

Note if that does not work out I'm fine with taking this patch as is.

Regards,

Hans


> +	u32 l = 0, sz = 0, mask = ~0;
> +	u64 l64, sz64, mask64;
> +	struct pci_bus_region region, inverted_region;
> +
> +	pci_bus_read_config_dword(bus, devfn, pos, &l);
> +	pci_bus_write_config_dword(bus, devfn, pos, l | mask);
> +	pci_bus_read_config_dword(bus, devfn, pos, &sz);
> +	pci_bus_write_config_dword(bus, devfn, pos, l);
> +
> +	/*
> +	 * All bits set in sz means the device isn't working properly.
> +	 * If the BAR isn't implemented, all bits must be 0.  If it's a
> +	 * memory BAR or a ROM, bit 0 must be clear; if it's an io BAR, bit
> +	 * 1 must be clear.
> +	 */
> +	if (PCI_POSSIBLE_ERROR(sz))
> +		sz = 0;
> +
> +	/*
> +	 * I don't know how l can have all bits set.  Copied from old code.
> +	 * Maybe it fixes a bug on some ancient platform.
> +	 */
> +	if (PCI_POSSIBLE_ERROR(l))
> +		l = 0;
> +
> +	res->flags = decode_bar(l);
> +	res->flags |= IORESOURCE_SIZEALIGN;
> +	if (res->flags & IORESOURCE_IO) {
> +		l64 = l & PCI_BASE_ADDRESS_IO_MASK;
> +		sz64 = sz & PCI_BASE_ADDRESS_IO_MASK;
> +		mask64 = PCI_BASE_ADDRESS_IO_MASK & (u32)IO_SPACE_LIMIT;
> +	} else {
> +		l64 = l & PCI_BASE_ADDRESS_MEM_MASK;
> +		sz64 = sz & PCI_BASE_ADDRESS_MEM_MASK;
> +		mask64 = (u32)PCI_BASE_ADDRESS_MEM_MASK;
> +	}
> +
> +	if (res->flags & IORESOURCE_MEM_64) {
> +		pci_bus_read_config_dword(bus, devfn, pos + 4, &l);
> +		pci_bus_write_config_dword(bus, devfn, pos + 4, ~0);
> +		pci_bus_read_config_dword(bus, devfn, pos + 4, &sz);
> +		pci_bus_write_config_dword(bus, devfn, pos + 4, l);
> +
> +		l64 |= ((u64)l << 32);
> +		sz64 |= ((u64)sz << 32);
> +		mask64 |= ((u64)~0 << 32);
> +	}
> +
> +	if (!sz64)
> +		goto fail;
> +
> +	sz64 = pci_size(l64, sz64, mask64);
> +	if (!sz64) {
> +		p2sb_info(bus, devfn, FW_BUG "reg 0x%x: invalid BAR (can't size)\n", pos);
> +		goto fail;
> +	}
> +
> +	if (res->flags & IORESOURCE_MEM_64) {
> +		if ((sizeof(pci_bus_addr_t) < 8 || sizeof(resource_size_t) < 8)
> +		    && sz64 > 0x100000000ULL) {
> +			res->flags |= IORESOURCE_UNSET | IORESOURCE_DISABLED;
> +			res->start = 0;
> +			res->end = 0;
> +			p2sb_err(bus, devfn,
> +				 "reg 0x%x: can't handle BAR larger than 4GB (size %#010llx)\n",
> +				 pos, (unsigned long long)sz64);
> +			goto out;
> +		}
> +
> +		if ((sizeof(pci_bus_addr_t) < 8) && l) {
> +			/* Above 32-bit boundary; try to reallocate */
> +			res->flags |= IORESOURCE_UNSET;
> +			res->start = 0;
> +			res->end = sz64 - 1;
> +			p2sb_info(bus, devfn,
> +				  "reg 0x%x: can't handle BAR above 4GB (bus address %#010llx)\n",
> +				  pos, (unsigned long long)l64);
> +			goto out;
> +		}
> +	}
> +
> +	region.start = l64;
> +	region.end = l64 + sz64 - 1;
> +
> +	pcibios_bus_to_resource(bus, res, &region);
> +	pcibios_resource_to_bus(bus, &inverted_region, res);
> +
> +	/*
> +	 * If "A" is a BAR value (a bus address), "bus_to_resource(A)" is
> +	 * the corresponding resource address (the physical address used by
> +	 * the CPU.  Converting that resource address back to a bus address
> +	 * should yield the original BAR value:
> +	 *
> +	 *     resource_to_bus(bus_to_resource(A)) == A
> +	 *
> +	 * If it doesn't, CPU accesses to "bus_to_resource(A)" will not
> +	 * be claimed by the device.
> +	 */
> +	if (inverted_region.start != region.start) {
> +		res->flags |= IORESOURCE_UNSET;
> +		res->start = 0;
> +		res->end = region.end - region.start;
> +		p2sb_info(bus, devfn, "reg 0x%x: initial BAR value %#010llx invalid\n",
> +			  pos, (unsigned long long)region.start);
> +	}
> +
> +	goto out;
> +
> +fail:
> +	res->flags = 0;
> +out:
> +	if (res->flags)
> +		p2sb_info(bus, devfn, "reg 0x%x: %pR\n", pos, res);
> +
> +	return (res->flags & IORESOURCE_MEM_64) ? 1 : 0;
> +}
> +
> +/**
> + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> + * @bus: PCI bus to communicate with
> + * @devfn: PCI slot and function to communicate with
> + * @mem: memory resource to be filled in
> + *
> + * The BIOS prevents the P2SB device from being enumerated by the PCI
> + * subsystem, so we need to unhide and hide it back to lookup the BAR.
> + *
> + * if @bus is NULL, the bus 0 in domain 0 will be in use.
> + * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> + *
> + * Caller must provide a valid pointer to @mem.
> + *
> + * Locking is handled by pci_rescan_remove_lock mutex.
> + *
> + * Return:
> + * 0 on success or appropriate errno value on error.
> + */
> +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +{
> +	unsigned int devfn_p2sb;
> +	u32 value = P2SBC_HIDE;
> +	int ret;
> +
> +	/* Get devfn for P2SB device itself */
> +	ret = p2sb_get_devfn(&devfn_p2sb);
> +	if (ret)
> +		return ret;
> +
> +	/* if @pdev is NULL, use bus 0 in domain 0 */
> +	bus = bus ?: pci_find_bus(0, 0);
> +
> +	/* If @devfn is 0, replace it with devfn of P2SB device itself */
> +	devfn = devfn ?: devfn_p2sb;
> +
> +	pci_lock_rescan_remove();
> +
> +	/* Unhide the P2SB device, if needed */
> +	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> +	if ((value & P2SBC_HIDE) == P2SBC_HIDE)
> +		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> +
> +	/* Read the first BAR of the device in question */
> +	__pci_bus_read_base(bus, devfn, mem, PCI_BASE_ADDRESS_0);
> +
> +	/* Hide the P2SB device, if it was hidden */
> +	if (value & P2SBC_HIDE)
> +		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
> +
> +	pci_unlock_rescan_remove();
> +
> +	if (mem->flags == 0) {
> +		p2sb_err(bus, devfn, "Can't read BAR0: %pR\n", mem);
> +		return -ENODEV;
> +	}
> +
> +	p2sb_info(bus, devfn, "BAR: %pR\n", mem);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(p2sb_bar);
> diff --git a/include/linux/platform_data/x86/p2sb.h b/include/linux/platform_data/x86/p2sb.h
> new file mode 100644
> index 000000000000..2f71de65aee4
> --- /dev/null
> +++ b/include/linux/platform_data/x86/p2sb.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Primary to Sideband (P2SB) bridge access support
> + */
> +
> +#ifndef _PLATFORM_DATA_X86_P2SB_H
> +#define _PLATFORM_DATA_X86_P2SB_H
> +
> +#include <linux/errno.h>
> +
> +struct pci_bus;
> +struct resource;
> +
> +#if IS_BUILTIN(CONFIG_P2SB)
> +
> +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem);
> +
> +#else /* CONFIG_P2SB */
> +
> +static inline int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif /* CONFIG_P2SB is not set */
> +
> +#endif /* _PLATFORM_DATA_X86_P2SB_H */

