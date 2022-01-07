Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A23487960
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 15:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbiAGO6G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 09:58:06 -0500
Received: from mga02.intel.com ([134.134.136.20]:6984 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239495AbiAGO6G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jan 2022 09:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641567486; x=1673103486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=B3/ZP+bquPRnbe4zwmMOFvS0HMVfaS0mhA/nllOGCic=;
  b=ljm2FJmPDePOrzDQOt6mAiui7aCV94sCJ+1G9uo/9QzCOjNVlb9twx+d
   R5atBLDd9nE6t8PFZBDHDnpZdTHlRq8O08l/LuXtDNfIjCDp/ulWGv80e
   F89dfh7X4OY3HDCcHfKEV5LuEcgVSgqa/6tK15rfT53OMsqZso+M/V1db
   zpiWj3JOmH+XlsShM0KFo0p5H2qKQfRMmhvbdLDes3nkM5duQdaikbaIA
   Pegs3IIwpBxUnIcKzgye9PmMjTv2ip0JjiM1wTntxi+9b5P3i6rV/HhCS
   Lt/tHz58+CaRPl7Xnb8jtxWM7J+jK78Tt/xXVioD7V/mq2doNdBtN2hdC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230218476"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="230218476"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 06:58:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="761498948"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 06:57:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n5qfb-007QGN-2E;
        Fri, 07 Jan 2022 16:56:43 +0200
Date:   Fri, 7 Jan 2022 16:56:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <YdhUqhflS/0YsRWJ@smile.fi.intel.com>
References: <20211221181526.53798-4-andriy.shevchenko@linux.intel.com>
 <20220107010305.GA334966@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107010305.GA334966@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 06, 2022 at 07:03:05PM -0600, Bjorn Helgaas wrote:
> On Tue, Dec 21, 2021 at 08:15:21PM +0200, Andy Shevchenko wrote:

Thanks for review, my answers below.

> > There are already two and at least one more user is coming which
> > require an access to Primary to Sideband (P2SB) bridge in order
> > to get IO or MMIO BAR hidden by BIOS.
> 
> The fact that BIOS hid the BAR is a good hint that BIOS doesn't want
> us to touch it.

The main reason is to avoid yellow bang in Windows. But the consequences of
this are the untested configurations in case it's always enabled and unhidden.

> > Create a library to access P2SB for x86 devices.
> > 
> > Background information
> > ======================
> > Note, the term "bridge" is used in the documentation and it has nothing
> > to do with a PCI (host) bridge as per the PCI specifications.
> > 
> > The P2SB is an interesting device by it's nature and hardware design.
> 
> s/it's/its/

Fixed locally.

> > First of all, it has several devices in the hardware behind it. These
> > devices may or may not be represented as ACPI devices by a firmware.
> > 
> > It also has a hardwired (to 0s) the least significant part of the
> > address space which is represented by the only 64-bit BAR0. It means
> > that OS mustn't reallocate the BAR.
> 
> You say the "least significant part of the *address space*" -- I don't
> know what that would be, unless you mean the least-significant bits of
> a *BAR*.

Yeah, I rephrased this as

  "...the least significant bits of the base address register which is
  represented by the only 64-bit BAR0."

> The general rule is that the OS is allowed to reassign BARs unless the
> firmware tells us otherwise via the "Preserve PCI Boot Configuration"
> _DSM.
> 
> I'm not familiar with the rule that the least-significant bits of a
> BAR being hardwired to zero means the OS must not reallocate the BAR.
> Per spec, the least-significant bits being hardwired to zero is what
> tells us the *size* of the BAR.

I believe more about this is discussed below (1).

> > On top of that in some cases P2SB is represented by function 0 on PCI
> > slot (in terms of B:D.F) and according to the PCI specification any
> > other function can't be seen until function 0 is present and visible.
> 
> This doesn't sound interesting; it sounds like standard PCI behavior.
> Per PCIe r5.0, sec 7.5.1.1.9, "When [Multi-Function Device is] Clear,
> software must not probe for Functions other than Function 0 unless
> explicitly indicated by another mechanism, such as an ARI or SR-IOV
> Extended Capability structure."
> 
> So software can't probe for functions other than 0 unless function 0
> is present and has the Multi-Function Device bit set.

So, you are repeating what I told you when you asked me why we read a BAR
of another device. I put it here to avoid again the same question from you
or anyone else (who may well be not familiar with the spec).

What do you want me to do here?

> Is this P2SB thing function 0?

It depends.

> > In the PCI configuration space of P2SB device the full 32-bit register
> > is allocated for the only purpose of hiding the entire P2SB device.
> > 
> >   3.1.39 P2SB Control (P2SBC)—Offset E0h
> > 
> >   Hide Device (HIDE): When this bit is set, the P2SB will return 1s on
> >   any PCI Configuration Read on IOSF-P. All other transactions including
> >   PCI Configuration Writes on IOSF-P are unaffected by this. This does
> >   not affect reads performed on the IOSF-SB interface.
> 
> Are you saying it works like this?
> 
>   pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0x8086
>   pci_write_config_dword(p2sb_dev, 0xe0, HIDE);
>   pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0xffff
>   pci_write_config_dword(p2sb_dev, 0xe0, ~HIDE);
>   pci_read_config_word  (p2sb_dev, PCI_VENDOR_ID, &id);	# id = 0x8086

It's not me, the documentation, but yes, something like you provided above
is what it does.

> > This doesn't prevent MMIO accesses though. In order to prevent OS from
> > the assignment to these addresses, the firmware on the affected platforms
> > marks the region as unusable (by cutting it off from the PCI host bridge
> > resources) as depicted in the Apollo Lake example below:
> 
> "In order to prevent OS from the assignment to these addresses"
> doesn't read quite right.  Is it supposed to say something about
> "preventing the OS from assigning these addresses"?

Yes, thanks, I fixed as suggested.

> When assigning space to PCI devices, the OS is only allowed to use
> space from the host bridge _CRS.

(1)

Correct and the P2SB area is not included there.

> Is the above supposed to say that the firmware omits a region from the
> host bridge _CRS to prevent the OS from using it?  That's the standard
> behavior, of course.

Yes, and again the purpose of this paragraph is to document the background
of all these as requested by you in previous round. It might be I misread
what you wanted that time.

> And, of course, if the OS cannot enumerate a PCI device, obviously it
> cannot reassign any BARs on this device it doesn't know about.

Exactly. And I believe this explains why the region is excluded from _CRS and
why we mustn't reallocate it. It probably will work (again, no-one have broadly
tested this), but it will consume resources which can be used by others (like
Thunderbolt).

> >   PCI host bridge to bus 0000:00
> >   pci_bus 0000:00: root bus resource [io  0x0070-0x0077]
> >   pci_bus 0000:00: root bus resource [io  0x0000-0x006f window]
> >   pci_bus 0000:00: root bus resource [io  0x0078-0x0cf7 window]
> >   pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> >   pci_bus 0000:00: root bus resource [mem 0x7c000001-0x7fffffff window]
> >   pci_bus 0000:00: root bus resource [mem 0x7b800001-0x7bffffff window]
> >   pci_bus 0000:00: root bus resource [mem 0x80000000-0xcfffffff window]
> >   pci_bus 0000:00: root bus resource [mem 0xe0000000-0xefffffff window]
> >   pci_bus 0000:00: root bus resource [bus 00-ff]
> > 
> > The P2SB 16MB BAR is located at 0xd0000000-0xd0ffffff memory window.
> 
> Ah, OK, maybe this is seeping in.  Tell me if I'm understanding
> correctly:
> 
>   - P2SB is a device connected via PCI that has one BAR

Yes.

>   - Firmware programs the BAR to [mem 0xd0000000-0xd0ffffff]

Yes.

>   - Firmware sets the P2SB HIDE bit

Yes.

>   - P2SB now returns ~0 to config reads,

Yes.

> handles config writes normally,

Only to 0xe0. The rest is skipped.

> and handles MMIO reads/writes normally

Yes.

>   - Firmware ensures [mem 0xd0000000-0xd0ffffff] is not available to
>     the OS by removing it from _CRS and marking it "RESERVED" in e820
>     or EFI memory map

Yes.

>   - P2SB returns ~0 to subsequent config reads
>   - Therefore, OS cannot enumerate P2SB

Correct.

> Now you want to know the BAR value (0xd0000000) so you can do
> something with it, so you clear the HIDE bit, read the BAR,
> and set the HIDE bit again.

Correct.

> > The generic solution
> > ====================
> > The generic solution for all cases when we need to access to the information
> > behind P2SB device is a library code where users ask for necessary resources
> > by demand and hence those users take care of not being run on the systems
> > where this access is not required.
> > 
> > The library provides the p2sb_bar() API to retrieve the MMIO of the BAR0 of
> > the device from P2SB device slot.
> > 
> > P2SB unconditional unhiding awareness
> > =====================================
> > Technically it's possible to unhinde the P2SB device and devices on
> > the same PCI slot and access them at any time as needed. But there are
> > several potential issues with that:
> 
> s/unhinde/unhide/

Fixed locally.

> >  - the systems were never tested against such configuration and hence
> >    nobody knows what kind of bugs it may bring, especially when we talk
> >    about SPI NOR case which contains IFWI code (including BIOS) and
> >    already known to be problematic in the past for end users
> 
> No clue what "IFWI" means.

Intel FirmWare Image, I will spell it in full.

> The hardware and BIOS went to some trouble to hide this MMIO space
> from the OS, but now the OS wants to use it.  I'm pretty sure the
> systems were never tested against *that* configuration either :)

What do you mean? The unhide/hide back has been tested and we have
already users in the kernel (they have other issues though with the
PCI rescan lock, but it doesn't mean it wasn't ever tested).

> And the fact that they went to all this trouble to hide it means
> the BIOS is likely using it for its own purposes and the OS may cause
> conflicts if it also uses it.

What purposes do you have in mind?

> The way the BIOS has this set up, P2SB is logically not a PCI device.
> It is not enumerable.  The MMIO space it uses is not in the _CRS of a
> PCI host bridge.  That means it's now a platform device.

I do not follow what you are implying here.

As you see the code, it's not a driver, it's a library that reuses PCI
functions because the hardware is represented by an IP inside PCI hierarchy
and with PCI programming interface.

> Hopefully P2SB is not behind a PCI-to-PCI bridge that *is* under OS
> control, because the OS might change the bridge apertures so the MMIO
> space is no longer reachable.

No it's not (at least on all platforms what I know of). We are good here.

> The correct way to use this would be as an ACPI device so the OS can
> enumerate it and the firmware can mediate access to it.  Going behind
> the back of the firmware does not sound advisable to me.

Are you going to fix all firmwares and devices on the market?
We have it's done like this and unfortunately we can't fix what's
is done due to users who won't update their firmwares by one or
another reason.

> If you want to hack something in, I think it might be easier to treat
> this purely as a platform device instead of a PCI device.  You can
> hack up the config accesses you need, discover the MMIO address, plug
> that in as a resource of the platform device, and go wild.  I don't
> think the PCI core needs to be involved at all.

Sorry, I do not follow you. The device is PCI, but it's taken out of PCI
subsystem control by this hardware trick.

> >  - the PCI by it's nature is a hotpluggable bus and in case somebody
> >    attaches a driver to the functions of a P2SB slot device(s) the
> >    end user experience and system behaviour can be unpredictable

> s/it's/its/

Fixed locally.

> >  - the kernel code would need some ugly hacks (or code looking as an
> >    ugly hack) under arch/x86/pci in order to enable these devices on
> >    only selected platforms (which may include CPU ID table followed by
> >    a potentially growing number of DMI strings
> > 
> > The future improvements
> > =======================
> > The future improvements with this code may go in order to gain some kind
> > of cache, if it's possible at all, to prevent unhiding and hiding to many
> > times to take static information that may be saved once per boot.
> 
> s/to many/too many/ or even better, s/to many/many/

Fixed locally.

> > Links
> > =====
> > [1]: https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
> 
> Reverse engineering notes?  Nice, but not really what I would expect
> to see in patches coming from INTEL to enable some INTEL hardware.
> 
> > [2]: https://lab.whitequark.org/files/gpioke/Intel-332690-004EN.pdf
> 
> An Intel datasheet (good) but from a non-Intel site (not so good).
> 
> > [3]: https://lab.whitequark.org/files/gpioke/Intel-332691-002EN.pdf
> 
> Again?  Use an intel.com link if you can.

There are document numbers that make sense.
I believe that

[2]: https://cdrdv2.intel.com/v1/dl/getContent/332690?wapkw=332690
[3]: https://cdrdv2.intel.com/v1/dl/getContent/332691?wapkw=332691

work for you. Tell me if not (Meanwhile I have changed locally)

> If these support something in the commit log above, can you make the
> connection a little clearer?  I guess one of these has a section
> 3.1.39?

Done.

> > [4]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403
> 
> Are these notes on reverse engineering this thing?  Doesn't really
> seem like useful information in this one.

-- 
With Best Regards,
Andy Shevchenko


