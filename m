Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F224151C30F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 May 2022 16:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240812AbiEEO6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 May 2022 10:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbiEEO6q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 May 2022 10:58:46 -0400
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CF25A5B5;
        Thu,  5 May 2022 07:55:05 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id D70CF3000A3AD;
        Thu,  5 May 2022 16:55:03 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id CB4F01D8B44; Thu,  5 May 2022 16:55:03 +0200 (CEST)
Date:   Thu, 5 May 2022 16:55:03 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband
 (P2SB) bridge support
Message-ID: <20220505145503.GA25423@wunner.de>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 05:13:39PM +0200, Andy Shevchenko wrote:
> Background information
> ======================

The wealth of information in the commit message obscures what the
actual problem is, which is actually quite simple:  SoC features
such as GPIO are accessed via a reserved MMIO area, we don't know
its address but can obtain it from the BAR of the P2SB device,
that device is normally hidden so we have to temporarily unhide it.


> On top of that in some cases P2SB is represented by function 0 on PCI
> slot (in terms of B:D.F) and according to the PCI specification any
> other function can't be seen until function 0 is present and visible.

I find that paragraph confusing:  Do multi-function P2SB devices exist?
What are the other functions?  Are they visible but merely not enumerated
because function 0 is not visible?


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

Honestly I would have taken the step to always expose the device,
identify breakages and then fix those.

We had a similar issue with HD audio controllers on Nvidia GPUs
which were only visible when an HDMI cable was plugged in.
We always expose them since b516ea586d71 and I recall we merely
had a few cases that an audio device was exposed in cases when
the card had no HDMI connectors at all.  So there was a useless
HD audio card visible to the user but no real harm.


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

Please add a code comment why you're calling pci_lock_rescan_remove(),
such as:

	/*
	 * Prevent concurrent PCI bus scan from seeing the P2SB device
	 * while it is temporarily exposed.
	 */

Otherwise it looks like you're abusing that lock to prevent multiple
simultaneous RMW operations of the P2SBC_HIDE bit.


I think the first if-clause above can be simplified to

	if (value & P2SBC_HIDE)

I don't understand why one of the two if-clauses adds "== P2SBC_HIDE".


Do you really need all the complicated logic in __pci_bus_read_base()?
For comparison, simatic_ipc_get_membase0() in simatic-ipc.c merely does:

	pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);

If that's sufficient for simatic-ipc.c, why is the more complicated code
necessary in p2sb.c?


I'm wondering, since you're only retrieving the base address (and thus
temporarily expose the P2SB device) when it's actually needed by a driver,
would there be any harm in keeping the P2SB device exposed indefinitely
from the moment a driver first requests the base address?  I.e., unhide it
but don't hide it again.  That would allow you to call pci_scan_slot() and
pci_bus_add_devices(), thus instantiating a proper pci_dev which you can
access without the __pci_bus_read_base() kludge.


> +	/*
> +	 * I don't know how l can have all bits set.  Copied from old code.
> +	 * Maybe it fixes a bug on some ancient platform.
> +	 */
> +	if (PCI_POSSIBLE_ERROR(l))
> +		l = 0;

l can have all bits set if the device was hot-removed.  That can't happen
with a built-in device such as P2SB.

Thanks,

Lukas
