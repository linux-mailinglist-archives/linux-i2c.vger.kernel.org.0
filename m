Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249DB486F5F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 02:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344146AbiAGBDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 20:03:10 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37866 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbiAGBDJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 20:03:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A50AB82351;
        Fri,  7 Jan 2022 01:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AE9C36AE0;
        Fri,  7 Jan 2022 01:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641517386;
        bh=iV+tD780OPV+TUlCDQSfJCMkeOiIQvRtx8lIQqdQXAw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=e2OAPkn1QHNJcreKzDrn/fcJkEidQE/3AIJ6AaPB3lDvN7eI4/RZMyGlsMQFjiCrA
         2gC2BVeVlDNY/gAxi4mld2qDFf80aDDMT/G698v+X5jT0tAMzavMY6JOeBMD553if3
         1q1jk62QxAkwzhqZ1lI7k6mkaYyOEPimGh6iDMtie2NXLjoBOZH9ZkytP2j8XxyjY0
         q+/s8TO0xVov53PVL2kA4cp/HJVk89Ph4bLT7CuhivOmX8sf2TLU32Hzx4tVGIl6th
         r675eQv66qhzWnv9WwtCGzkwVlzTt1b5SWh1JXDQ4RLn8zRPRges7F36W/OvBlM6qY
         /ytTnS5uYAL3A==
Date:   Thu, 6 Jan 2022 19:03:05 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 3/8] platform/x86/intel: Add Primary to Sideband
 (P2SB) bridge support
Message-ID: <20220107010305.GA334966@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211221181526.53798-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 08:15:21PM +0200, Andy Shevchenko wrote:
> From: Jonathan Yong <jonathan.yong@intel.com>
> 
> There are already two and at least one more user is coming which
> require an access to Primary to Sideband (P2SB) bridge in order
> to get IO or MMIO BAR hidden by BIOS.

The fact that BIOS hid the BAR is a good hint that BIOS doesn't want
us to touch it.

> Create a library to access P2SB for x86 devices.
> 
> Background information
> ======================
> Note, the term "bridge" is used in the documentation and it has nothing
> to do with a PCI (host) bridge as per the PCI specifications.
> 
> The P2SB is an interesting device by it's nature and hardware design.

s/it's/its/

> First of all, it has several devices in the hardware behind it. These
> devices may or may not be represented as ACPI devices by a firmware.
> 
> It also has a hardwired (to 0s) the least significant part of the
> address space which is represented by the only 64-bit BAR0. It means
> that OS mustn't reallocate the BAR.

You say the "least significant part of the *address space*" -- I don't
know what that would be, unless you mean the least-significant bits of
a *BAR*.

The general rule is that the OS is allowed to reassign BARs unless the
firmware tells us otherwise via the "Preserve PCI Boot Configuration"
_DSM.

I'm not familiar with the rule that the least-significant bits of a
BAR being hardwired to zero means the OS must not reallocate the BAR.
Per spec, the least-significant bits being hardwired to zero is what
tells us the *size* of the BAR.

> On top of that in some cases P2SB is represented by function 0 on PCI
> slot (in terms of B:D.F) and according to the PCI specification any
> other function can't be seen until function 0 is present and visible.

This doesn't sound interesting; it sounds like standard PCI behavior.
Per PCIe r5.0, sec 7.5.1.1.9, "When [Multi-Function Device is] Clear,
software must not probe for Functions other than Function 0 unless
explicitly indicated by another mechanism, such as an ARI or SR-IOV
Extended Capability structure."

So software can't probe for functions other than 0 unless function 0
is present and has the Multi-Function Device bit set.

Is this P2SB thing function 0?

> In the PCI configuration space of P2SB device the full 32-bit register
> is allocated for the only purpose of hiding the entire P2SB device.
> 
>   3.1.39 P2SB Control (P2SBC)—Offset E0h
> 
>   Hide Device (HIDE): When this bit is set, the P2SB will return 1s on
>   any PCI Configuration Read on IOSF-P. All other transactions including
>   PCI Configuration Writes on IOSF-P are unaffected by this. This does
>   not affect reads performed on the IOSF-SB interface.

Are you saying it works like this?

  pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0x8086
  pci_write_config_dword(p2sb_dev, 0xe0, HIDE);
  pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0xffff
  pci_write_config_dword(p2sb_dev, 0xe0, ~HIDE);
  pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0x8086

> This doesn't prevent MMIO accesses though. In order to prevent OS from
> the assignment to these addresses, the firmware on the affected platforms
> marks the region as unusable (by cutting it off from the PCI host bridge
> resources) as depicted in the Apollo Lake example below:

"In order to prevent OS from the assignment to these addresses"
doesn't read quite right.  Is it supposed to say something about
"preventing the OS from assigning these addresses"?

When assigning space to PCI devices, the OS is only allowed to use
space from the host bridge _CRS.

Is the above supposed to say that the firmware omits a region from the
host bridge _CRS to prevent the OS from using it?  That's the standard
behavior, of course.

And, of course, if the OS cannot enumerate a PCI device, obviously it
cannot reassign any BARs on this device it doesn't know about.

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

Ah, OK, maybe this is seeping in.  Tell me if I'm understanding
correctly:

  - P2SB is a device connected via PCI that has one BAR
  - Firmware programs the BAR to [mem 0xd0000000-0xd0ffffff]
  - Firmware sets the P2SB HIDE bit
  - P2SB now returns ~0 to config reads, handles config writes
    normally, and handles MMIO reads/writes normally
  - Firmware ensures [mem 0xd0000000-0xd0ffffff] is not available to
    the OS by removing it from _CRS and marking it "RESERVED" in e820
    or EFI memory map
  - P2SB returns ~0 to subsequent config reads
  - Therefore, OS cannot enumerate P2SB

Now you want to know the BAR value (0xd0000000) so you can do
something with it, so you clear the HIDE bit, read the BAR,
and set the HIDE bit again.

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
> Technically it's possible to unhinde the P2SB device and devices on
> the same PCI slot and access them at any time as needed. But there are
> several potential issues with that:

s/unhinde/unhide/

>  - the systems were never tested against such configuration and hence
>    nobody knows what kind of bugs it may bring, especially when we talk
>    about SPI NOR case which contains IFWI code (including BIOS) and
>    already known to be problematic in the past for end users

No clue what "IFWI" means.

The hardware and BIOS went to some trouble to hide this MMIO space
from the OS, but now the OS wants to use it.  I'm pretty sure the
systems were never tested against *that* configuration either :)

And the fact that they went to all this trouble to hide it means
the BIOS is likely using it for its own purposes and the OS may cause
conflicts if it also uses it.

The way the BIOS has this set up, P2SB is logically not a PCI device.
It is not enumerable.  The MMIO space it uses is not in the _CRS of a
PCI host bridge.  That means it's now a platform device.

Hopefully P2SB is not behind a PCI-to-PCI bridge that *is* under OS
control, because the OS might change the bridge apertures so the MMIO
space is no longer reachable.

The correct way to use this would be as an ACPI device so the OS can
enumerate it and the firmware can mediate access to it.  Going behind
the back of the firmware does not sound advisable to me.

If you want to hack something in, I think it might be easier to treat
this purely as a platform device instead of a PCI device.  You can
hack up the config accesses you need, discover the MMIO address, plug
that in as a resource of the platform device, and go wild.  I don't
think the PCI core needs to be involved at all.

>  - the PCI by it's nature is a hotpluggable bus and in case somebody
>    attaches a driver to the functions of a P2SB slot device(s) the
>    end user experience and system behaviour can be unpredictable

s/it's/its/

>  - the kernel code would need some ugly hacks (or code looking as an
>    ugly hack) under arch/x86/pci in order to enable these devices on
>    only selected platforms (which may include CPU ID table followed by
>    a potentially growing number of DMI strings
> 
> The future improvements
> =======================
> The future improvements with this code may go in order to gain some kind
> of cache, if it's possible at all, to prevent unhiding and hiding to many
> times to take static information that may be saved once per boot.

s/to many/too many/ or even better, s/to many/many/

> Links
> =====
> [1]: https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/

Reverse engineering notes?  Nice, but not really what I would expect
to see in patches coming from INTEL to enable some INTEL hardware.

> [2]: https://lab.whitequark.org/files/gpioke/Intel-332690-004EN.pdf

An Intel datasheet (good) but from a non-Intel site (not so good).

> [3]: https://lab.whitequark.org/files/gpioke/Intel-332691-002EN.pdf

Again?  Use an intel.com link if you can.

If these support something in the commit log above, can you make the
connection a little clearer?  I guess one of these has a section
3.1.39?

> [4]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403

Are these notes on reverse engineering this thing?  Doesn't really
seem like useful information in this one.

Bjorn
