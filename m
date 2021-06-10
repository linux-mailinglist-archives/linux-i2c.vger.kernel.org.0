Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C837B3A2D6E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jun 2021 15:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhFJNvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 09:51:05 -0400
Received: from thoth.sbs.de ([192.35.17.2]:54379 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230289AbhFJNvF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Jun 2021 09:51:05 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 15ADmlsc022442
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 15:48:47 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.8.208])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 15ADmklU030937;
        Thu, 10 Jun 2021 15:48:46 +0200
Date:   Thu, 10 Jun 2021 15:48:44 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [rfc, PATCH v1 0/7] PCI: introduce p2sb helper
Message-ID: <20210610154844.06e1e733@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VeYy0tyP-OLZX5dbYFZM1C_K5eALo64_nb4rSvH7-93FA@mail.gmail.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210610110211.0e239af6@md1za8fc.ad001.siemens.net>
        <CAHp75VeYy0tyP-OLZX5dbYFZM1C_K5eALo64_nb4rSvH7-93FA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Thu, 10 Jun 2021 13:14:49 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Jun 10, 2021 at 12:14 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > Am Mon, 8 Mar 2021 14:20:13 +0200
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> >  
> > > There are a few users and even at least one more is coming
> > > that would like to utilize p2sb mechanisms like hide/unhide
> > > a device from PCI configuration space.
> > >
> > > Here is the series to deduplicate existing users and provide
> > > a generic way for new comers.
> > >
> > > It also includes a patch to enable GPIO controllers on Apollo Lake
> > > when it's used with ABL bootloader w/o ACPI support.  
> >
> > That bit is especially interesting. Making pinctl*lake initialize
> > when ACPI IDs are missing and p2sb is hidden.
> >
> > However i have seen pinctl-broxton get confused because it was
> > trying to come up twice on a system that has the ACPI entries. Once
> > as "INT3452" and second as "apollolake-pinctrl". They should
> > probably mutually exclude each other. And the two different names
> > for "the same"? thing make it impossible to write a driver using
> > those GPIOs.  
> 
> Then it's clearly told that BIOS provides confusing data, it exposes
> the ACPI device and hides it in p2sb, how is it even supposed to work?

The patchset works fine on a machine with hidden p2sb and no ACPI,
except for the NULL pointer issue i sent that patch for.

The problem appeared with the patchset being used on a machine having
ACPI entries and a visible p2sb. 

> I consider only these are valid:
>  - ACPI device is provided and it's enabled (status = 15) => work with
> ACPI enumeration
>  - no ACPI device provided and it's hidden or not by p2sb => work via
> board file
>  - no ACPI device provided and no device needed / present => no
> driver is needed
> 
> > Unless it would try and look up both variants or not looking up with
> > gpiochip.label.
> >
> > I would also need that "enable GPIO w/o ACPI" for skylake.  
> 
> Not a problem to add a platform driver name there or actually for all
> of the Intel pin control drivers (depends what suits better to the
> current design).
> 
> >  I think it
> > would be generally useful if the GPIO controllers would be enabled
> > not depending on ACPI, and coming up with only one "label" to build
> > on top.  
> 
> I didn't get what 'label' means here...

The name of the gpiochip /sys/class/gpiochipxxx/label or the first arg
to GPIO_LOOKUP_IDX
It seems to me that the very same device driver can come up as
"apollolake-pinctrl.0" or "INT3452.0" depending on ACPI table entries.

Henning

> > > Please, comment on the approach and individual patches.
> > >
> > > (Since it's cross subsystem, the PCI seems like a main one and
> > >  I think it makes sense to route it thru it with immutable tag
> > >  or branch provided for the others).  
> 
> 

