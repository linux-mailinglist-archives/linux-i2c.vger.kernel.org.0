Return-Path: <linux-i2c+bounces-1841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7D8585B7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 19:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108A328404F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 18:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322BB1353E4;
	Fri, 16 Feb 2024 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzGRNdsx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41312C688;
	Fri, 16 Feb 2024 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708109389; cv=none; b=WINHoyd+6amuO2KIwC0GMQmLOVBa7g78Dh1/F2iPPgsM85u1I9obB94hIb+g/iGWXWcUXP7hPcshBvOeMsIcPSB2qy93iGxGd0ekEmAOsbQ1nP9IcHv8Vwc/3pThEH5EHPGK2PfQhR5BHee7P9UfBBf+piPtCjRPhtlgQqVa0HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708109389; c=relaxed/simple;
	bh=2MZZwgYXsEOWk7BAQ+XbZ9JkDsdKEkwKD9JcUkQvF+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZoFKO3zATIVsgGl5ly0Vr6rNAhmaQWpCD5UYC6osFMQS8LKHMh/cxECgYfcpDjBU3YoyBP8pBxl+COf5oFR9cROtqoeIt760kU6U6AvyhqymCuLDKk7tnWgkluPMPdaQtARf15wHnP0udrLRiSJUo1O4PKGy/Ghx/A5a+c9gl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzGRNdsx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832CC433F1;
	Fri, 16 Feb 2024 18:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708109388;
	bh=2MZZwgYXsEOWk7BAQ+XbZ9JkDsdKEkwKD9JcUkQvF+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DzGRNdsxXYRHWPtmoiqK9SY4Bq0mtIqFSkEghcGQlJjZAJsHj1WlmCsOOGdcDjfgN
	 P3YOwPbAIFZo7MkKOwy/gmrk5U7PzEJ99HrFxrpn2/FImWzco4m31uMOkwktE5CFf+
	 gVkbhH0XjJCimIwkR7wxre+2UmsxaYuxls/jqXCs1bhEJs4sXoVJ6gSYWLYgOB7SLt
	 ojnmnIiWRL+foL5JR8/EIf/jI5dmWxoRbR1ATglpMqaYHFGIPSQJoBzH4qkQfJVc0M
	 1hYutf93F+z6GM96jbhf3NFiKRToR2Ns+/i/BTt0weLpQStxTs8+shHCy6yBiw0/Ly
	 BIssNZA8rCtow==
Date: Fri, 16 Feb 2024 12:49:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Len Brown <lenb@kernel.org>,
	Borislav Petkov <bp@suse.de>, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Message-ID: <20240216184946.GA1349514@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0iHokxYJU0Nx5gT+ay=18uhmnha-bSYk=YUKPROQGZrmw@mail.gmail.com>

On Fri, Feb 16, 2024 at 07:26:06PM +0100, Rafael J. Wysocki wrote:
> On Tue, Dec 26, 2023 at 1:50 PM Mateusz Jończyk <mat.jonczyk@o2.pl> wrote:
> >
> > On some platforms, the ACPI _PRT function returns duplicate interrupt
> > routing entries. Linux uses the first matching entry, but sometimes the
> > second matching entry contains the correct interrupt vector.
> >
> > As a debugging aid, print a warning to dmesg if duplicate interrupt
> > routing entries are present. This way, we could check how many models
> > are affected.
> >
> > This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
> > SMBus controller. This controller is nonfunctional unless its interrupt
> > usage is disabled (using the "disable_features=0x10" module parameter).
> >
> > After investigation, it turned out that the driver was using an
> > incorrect interrupt vector: in lspci output for this device there was:
> >         Interrupt: pin B routed to IRQ 19
> > but after running i2cdetect (without using any i2c-i801 module
> > parameters) the following was logged to dmesg:
> >
> >         [...]
> >         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
> >         i801_smbus 0000:00:1f.3: Transaction timeout
> >         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
> >         i801_smbus 0000:00:1f.3: Transaction timeout
> >         irq 17: nobody cared (try booting with the "irqpoll" option)
> >
> > Existence of duplicate entries in a table returned by the _PRT method
> > was confirmed by disassembling the ACPI DSDT table.
> >
> > Windows XP is using IRQ3 (as reported by HWiNFO32 and in the Device
> > Manager), which is neither of the two vectors returned by _PRT.
> > As HWiNFO32 decoded contents of the SPD EEPROMs, the i2c-i801 device is
> > working under Windows. It appears that Windows has reconfigured the
> > chipset independently to use another interrupt vector for the device.
> > This is possible, according to the chipset datasheet [1], page 436 for
> > example (PIRQ[n]_ROUT—PIRQ[A,B,C,D] Routing Control Register).
> >
> > [1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-datasheet.pdf
> >
> > Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: Borislav Petkov <bp@suse.de>
> > Cc: Jean Delvare <jdelvare@suse.de>
> > Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Previously-tested-by: Jean Delvare <jdelvare@suse.de>
> >
> > ---
> > Hello,
> >
> > I'm resurrecting an older patch that was discussed back in January:
> >
> > https://lore.kernel.org/lkml/20230121153314.6109-1-mat.jonczyk@o2.pl/T/#u
> >
> > To consider: should we print a warning or an error in case of duplicate
> > entries? This may not be serious enough to disturb the user with an
> > error message at boot.
> >
> > I'm also looking into modifying the i2c-i801 driver to disable its usage
> > of interrupts if one did not fire.
> >
> > v2: - add a newline at the end of the kernel log message,
> >     - replace: "if (match == NULL)" -> "if (!match)"
> >     - patch description tweaks.
> > v3: - fix C style issues pointed by Jean Delvare,
> >     - switch severity from warning to error.
> > v3 RESEND: retested on top of v6.2-rc4
> > v4: - rebase and retest on top of v6.7-rc7
> >     - switch severity back to warning,
> >     - change pr_err() to dev_warn() and simplify the code,
> >     - modify patch description (describe Windows behaviour etc.)
> > ---
> >  drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> > index ff30ceca2203..1fcf72e335b0 100644
> > --- a/drivers/acpi/pci_irq.c
> > +++ b/drivers/acpi/pci_irq.c
> > @@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
> >         struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> >         struct acpi_pci_routing_table *entry;
> >         acpi_handle handle = NULL;
> > +       struct acpi_prt_entry *match = NULL;
> > +       const char *match_int_source = NULL;
> >
> >         if (dev->bus->bridge)
> >                 handle = ACPI_HANDLE(dev->bus->bridge);
> > @@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
> >
> >         entry = buffer.pointer;
> >         while (entry && (entry->length > 0)) {
> > -               if (!acpi_pci_irq_check_entry(handle, dev, pin,
> > -                                                entry, entry_ptr))
> > -                       break;
> > +               struct acpi_prt_entry *curr;
> > +
> > +               if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
> > +                       if (!match) {
> > +                               match = curr;
> > +                               match_int_source = entry->source;
> > +                        } else {
> > +                               dev_warn(&dev->dev, FW_BUG
> 
> dev_info() would be sufficient here IMV.
> 
> > +                                      "ACPI _PRT returned duplicate IRQ routing entries for INT%c: %s[%d] and %s[%d]\n",
> > +                                      pin_name(curr->pin),
> > +                                      match_int_source, match->index,
> > +                                      entry->source, curr->index);
> > +                               /* We use the first matching entry nonetheless,
> > +                                * for compatibility with older kernels.

The usual comment style in this file is:

  /*
   * We use ...
   */

> > +                                */
> > +                       }
> > +               }
> > +
> >                 entry = (struct acpi_pci_routing_table *)
> >                     ((unsigned long)entry + entry->length);
> >         }
> >
> > +       *entry_ptr = match;
> > +
> >         kfree(buffer.pointer);
> >         return 0;
> >  }
> >
> > base-commit: 861deac3b092f37b2c5e6871732f3e11486f7082
> > --
> 
> Bjorn, any concerns regarding this one?

No concerns from me.  

I guess this only adds a message, right?  It doesn't actually fix
anything or change any behavior?

This talks about "duplicate" entries, which suggests to me that they
are identical, but I don't think they are.  It sounds like it's two
"matching" entries, i.e., two entries for the same (device, pin)?

And neither of the two _PRT entries yields a working i801 device?

Bjorn

