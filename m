Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8244A7996
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 21:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236552AbiBBUgy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 15:36:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54148 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiBBUgy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 15:36:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8669619C8;
        Wed,  2 Feb 2022 20:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E97C004E1;
        Wed,  2 Feb 2022 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643834213;
        bh=0BGKMKxHDz655bbS6eHoCnQ6dfdh9lnMmg+71V26wGU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Veg9CsOJvhMMidPlW81xKh8JxyfIpA7e6kTEu5935U5A0lMsmeAlgKgm03A1wYHBy
         JPfEOe4uQyj53hkvTdHBT53GHnRYnC32qd5r6Guke+shXoEnTh5+jHKLXOw2r7Y9bL
         g+gbCka+Ss5v4qxxlB36Ln7XsGqC6F0kJZnkuaJOi9nWFKHpKMCBEIIqZR/fqy9Nhg
         hYU2CzpARjiIcVFBEeSp2dGSWQc7bVH2UI6+6P58ZyZ3iO3oOQRC+EKdDausMT1K68
         Jn+luIZrgJhs6xiiulBHeJYx4TtQXNx7cQIU69HfQ7VmB3yVWcDhM+kbPtvMhLOsHf
         nhCzwsBKwo9Pg==
Date:   Wed, 2 Feb 2022 14:36:51 -0600
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
Message-ID: <20220202203651.GA40446@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfmBZvQ28y/Mh60J@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 01, 2022 at 08:52:22PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 01, 2022 at 12:14:01PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 28, 2022 at 08:30:20PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jan 07, 2022 at 11:11:08AM -0600, Bjorn Helgaas wrote:
> > > > On Fri, Jan 07, 2022 at 04:56:42PM +0200, Andy Shevchenko wrote:
> > > 
> > > ...
> > > 
> > > > My point is that the unhide is architecturally messed up.  The OS
> > > > runs on the platform as described by ACPI.  Devices that cannot be
> > > > enumerated are described in the ACPI namespace.
> > > 
> > > This device may or may not be _partially_ or _fully_ (due to being
> > > multifunctional) described in ACPI. I agree, that ideally the
> > > devices in question it has behind should be represented properly by
> > > firmware.  However, the firmwares in the wild for selected products
> > > / devices don't do that. We need to solve (work around) it in the
> > > software.
> > > 
> > > This is already done for a few devices. This series consolidates
> > > that and enables it for very known GPIO IPs.
> > 
> > Consolidating the code to unhide the device and size the BAR is fine.
> > 
> > I would prefer the PCI core to be involved as little as possible
> > because we're violating some key assumptions and we could trip over
> > those later.  We're assuming the existence of P2SB based on the fact
> > that we found some *other* device, we're assuming firmware isn't using
> > P2SB (may be true now, but impossible to verify), we're assuming the
> > P2SB BAR contains a valid address that's not used elsewhere but also
> > won't be assigned to anything.
> > 
> > > PCI core just provides a code that is very similar to what we need
> > > here. Are you specifically suggesting that we have to copy'n'paste
> > > that rather long function and maintain in parallel with PCI?
> > 
> > I think we're talking about __pci_read_base(), which is currently an
> > internal PCI interface.  This series adds pci_bus_info/warn/etc(),
> 
> The patch that adds those macros is good on its own, if you think so...
> I tried to submit it separately, but it was no response, so I don't know.

I'd rather not add pci_bus_info(), etc.  There are only a couple
places that could use it, and if we cared enough, I think those places
could avoid it by doing pci_alloc_dev() first.

What if you used pci_alloc_dev() and then called the current
__pci_read_base() on the pci_dev *?

The caller would still have the ugly #include path, but I guess you're
OK with that.

Since the P2SB BAR is not included in the host bridge _CRS, the
pcibios_bus_to_resource() done by __pci_read_base() won't work
correctly, so this only "works" on host bridges with no address
translation.  But that's also the case with your current series.
This is an example of one of the PCI core assumptions being violated,
so things can break.

Bjorn
