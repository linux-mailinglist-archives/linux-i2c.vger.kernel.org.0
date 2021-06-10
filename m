Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179843A2DAB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jun 2021 16:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFJOGd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 10:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhFJOGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Jun 2021 10:06:33 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5892AC061574;
        Thu, 10 Jun 2021 07:04:24 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id e1so1063245pld.13;
        Thu, 10 Jun 2021 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8AXVPJv+STNoawo/hNoKgr2It26kqyxsee+omAIhuCE=;
        b=Pblo01v+18qR3ohOngCf7O5Lf57Bak5rnsArtW8TpCcZ5gFyyMRgaScW8AJqX/e2wd
         1+FvP4+0hLwScfEKxFIuONv38mpwYP3RLcERwYiFquQkLrDc+H1hqXFj8goJry5G788d
         /V+cxqiB+0KJCgDFuppfuS8zKTZv4Ow947Mst4kKmVAYTNkAv1Gunts0SMde2SZIaRAY
         J+X6WG1rOr3FdE5Uh40V7S6fX1CzhIhF9huXxpqPFkdDydkkH+xi5lYClmSshOWZT3/1
         iqDqAKbgSFsluvrwyyK6JQTTShoM8TvnUJDn6Ekgw5alPYM9VhGg3ibyroavpheukBAO
         lJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AXVPJv+STNoawo/hNoKgr2It26kqyxsee+omAIhuCE=;
        b=PDReWEIoDSIy0+PMdgLCbujbk1oGDZsb1wxS0KCYdWFwJbUn1UMTr8kTr+mc6xNvDU
         mmiJiXR9hzEDcUmSwF/ca3qCbngwp562gJ3em5+CHdAa72Ii8LOSSzUFIqhoWzf96to4
         LY67QJx33R3Y/LmGUTnqDSUlCQqS4VaFys5raKrMz7HiwPyKiaiMVRJZ76RtWmC9UL9c
         JCiTuL1Yc+D4BBGgZXJFTqKOsiZ9sKqFRQsuCGRHIaBxsVWnggjiSkBVIxbJO1Ltwl/l
         ECxvh0Z4clykWxwsPP6T337wFCUBJwaNaDTS/VCKcLkiYg+emc/j6oVnRjkodDFEv4e4
         JDYA==
X-Gm-Message-State: AOAM531N/Q2gdsVHtg7jzcuhjo9fit2YzhatiHBJEuTPtAQaNz9r0Cow
        auIT1uIkpe8PCkarnPubCgT5M7u7quP31+qCp4s=
X-Google-Smtp-Source: ABdhPJwRG7Ppgud2JWSXgRGFUJr3Gmrg5A9IuHOTOnLAbtkk5l7MCotx04GbH2Sg6kNle680OM7CThPTeRNR0Q6Iudw=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr3589906pja.181.1623333863845;
 Thu, 10 Jun 2021 07:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210610110211.0e239af6@md1za8fc.ad001.siemens.net> <CAHp75VeYy0tyP-OLZX5dbYFZM1C_K5eALo64_nb4rSvH7-93FA@mail.gmail.com>
 <20210610154844.06e1e733@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210610154844.06e1e733@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Jun 2021 17:04:07 +0300
Message-ID: <CAHp75VdaZc4yXtd1ggUgEooQfHPteded_Ba_kGpQx4c5TJ9-5g@mail.gmail.com>
Subject: Re: [rfc, PATCH v1 0/7] PCI: introduce p2sb helper
To:     Henning Schild <henning.schild@siemens.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 10, 2021 at 4:48 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Thu, 10 Jun 2021 13:14:49 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
>
> > On Thu, Jun 10, 2021 at 12:14 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > >
> > > Am Mon, 8 Mar 2021 14:20:13 +0200
> > > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > >
> > > > There are a few users and even at least one more is coming
> > > > that would like to utilize p2sb mechanisms like hide/unhide
> > > > a device from PCI configuration space.
> > > >
> > > > Here is the series to deduplicate existing users and provide
> > > > a generic way for new comers.
> > > >
> > > > It also includes a patch to enable GPIO controllers on Apollo Lake
> > > > when it's used with ABL bootloader w/o ACPI support.
> > >
> > > That bit is especially interesting. Making pinctl*lake initialize
> > > when ACPI IDs are missing and p2sb is hidden.
> > >
> > > However i have seen pinctl-broxton get confused because it was
> > > trying to come up twice on a system that has the ACPI entries. Once
> > > as "INT3452" and second as "apollolake-pinctrl". They should
> > > probably mutually exclude each other. And the two different names
> > > for "the same"? thing make it impossible to write a driver using
> > > those GPIOs.
> >
> > Then it's clearly told that BIOS provides confusing data, it exposes
> > the ACPI device and hides it in p2sb, how is it even supposed to work?
>
> The patchset works fine on a machine with hidden p2sb and no ACPI,
> except for the NULL pointer issue i sent that patch for.
>
> The problem appeared with the patchset being used on a machine having
> ACPI entries and a visible p2sb.

Yep, got it. So, basically we have to do something like call
acpi_dev_present() and forbid the platform device enumeration in this
case.

> > I consider only these are valid:
> >  - ACPI device is provided and it's enabled (status = 15) => work with
> > ACPI enumeration
> >  - no ACPI device provided and it's hidden or not by p2sb => work via
> > board file
> >  - no ACPI device provided and no device needed / present => no
> > driver is needed
> >
> > > Unless it would try and look up both variants or not looking up with
> > > gpiochip.label.
> > >
> > > I would also need that "enable GPIO w/o ACPI" for skylake.
> >
> > Not a problem to add a platform driver name there or actually for all
> > of the Intel pin control drivers (depends what suits better to the
> > current design).
> >
> > >  I think it
> > > would be generally useful if the GPIO controllers would be enabled
> > > not depending on ACPI, and coming up with only one "label" to build
> > > on top.
> >
> > I didn't get what 'label' means here...
>
> The name of the gpiochip /sys/class/gpiochipxxx/label or the first arg
> to GPIO_LOOKUP_IDX
> It seems to me that the very same device driver can come up as
> "apollolake-pinctrl.0" or "INT3452.0" depending on ACPI table entries.

Which is not a problem. Or is it? The proper way is to use character
devices and find the controller based on other means than the device
instance name, but user space also can cope with these two, Since we
never had a platform that did it in the upstream there is no formal
ABI breakage or so.

> > > > Please, comment on the approach and individual patches.
> > > >
> > > > (Since it's cross subsystem, the PCI seems like a main one and
> > > >  I think it makes sense to route it thru it with immutable tag
> > > >  or branch provided for the others).


-- 
With Best Regards,
Andy Shevchenko
