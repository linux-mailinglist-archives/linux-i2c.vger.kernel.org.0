Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DE43E2BF5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhHFNxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 09:53:04 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34442 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbhHFNxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 09:53:04 -0400
Received: by mail-oi1-f176.google.com with SMTP id t128so12211664oig.1
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 06:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9AqJ3yY1Xmh1QH5vSXd0BvteoHKq617LPl2uF/m9A2E=;
        b=DzWDBuHvBE71gdvFjq8uyORmh3dpyuBwatv2Di1PpFjQD6oIoDesFeVK8zJ/SxCCm0
         U+af4GtnGT5JcXhrMp1fS0CMsWJ/u2BvbqPDVBe1DBO5zt7SJGOjUKxpkUfCkEQHNZmM
         2ADKiAulSXTrW75gYJ0Ydpank/bdA95GnhLyPOueJ9e1lbgwF8ebZHBvJx0QiiwHGJLW
         rWeZY2G+x2Bex4LVmbREG1BGG9HPRw2CjP+CZjqgoCm0IQEr8vC2Fyt1DU8+WV6Q0UYI
         XkrgWHEh/EmqnBWNCYGMExCIADbm12CyPsRD8tXBTBHXoj5Ca5NS8/kRbMl2EoH4u+lv
         XwWg==
X-Gm-Message-State: AOAM532U+d7Jz5giWI7D09Gqx7WxhC5ny8Bc8HCJQ1kbhbz0aiIFe0wa
        H5nNRbSvdxokZ3LCHucJjfxB7SeyzvEJT4jGT/Y=
X-Google-Smtp-Source: ABdhPJxOoZNm+IMaruszOS4TRKws8oPSMxJXPR3bRDiTLmgs8NKofSDYR0oI54GhsHbgD7kNNq6BsSQXy4b6MQLrxYs=
X-Received: by 2002:a05:6808:1512:: with SMTP id u18mr15453684oiw.157.1628257968638;
 Fri, 06 Aug 2021 06:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com> <20210802145347.605ce8d5@endymion>
 <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com> <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
 <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com> <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
In-Reply-To: <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 6 Aug 2021 15:52:37 +0200
Message-ID: <CAJZ5v0j2t+AZGqMwAgZEJR2RoXHqB=H+CgzErc=fq5fcWNQiSg@mail.gmail.com>
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 9:02 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 04.08.2021 16:06, Rafael J. Wysocki wrote:
> > On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
> > <jarkko.nikula@linux.intel.com> wrote:
> >>
> >> Hi
> >>
> >> On 8/2/21 7:31 PM, Heiner Kallweit wrote:
> >>> On 02.08.2021 14:53, Jean Delvare wrote:
> >>>> Hi Heiner,
> >>>>
> >>>> On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
> >>>>> Drivers should not call pm_runtime_allow(), see
> >>>>> Documentation/power/pci.rst. Therefore remove the call and leave this
> >>>>> to user space. Also remove the not needed call to pm_runtime_forbid().
> >>>>>
> >>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>>>> ---
> >>>>>   drivers/i2c/busses/i2c-i801.c | 2 --
> >>>>>   1 file changed, 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >>>>> index 92ec291c0..362e74761 100644
> >>>>> --- a/drivers/i2c/busses/i2c-i801.c
> >>>>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>>>> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>>>>     pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
> >>>>>     pm_runtime_use_autosuspend(&dev->dev);
> >>>>>     pm_runtime_put_autosuspend(&dev->dev);
> >>>>> -   pm_runtime_allow(&dev->dev);
> >>>>>
> >>>>>     return 0;
> >>>>>   }
> >>>>> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
> >>>>>   {
> >>>>>     struct i801_priv *priv = pci_get_drvdata(dev);
> >>>>>
> >>>>> -   pm_runtime_forbid(&dev->dev);
> >>>>>     pm_runtime_get_noresume(&dev->dev);
> >>>>>
> >>>>>     i801_disable_host_notify(priv);
> >>>>
> >>>> These calls were added by Jarkko (Cc'd) and I'm not familiar with power
> >>>> management so I'll need an explicit ack from him before I can accept
> >>>> this patch.
> >>>>
> >>> The calls were part of the initial submission for rpm support and supposedly
> >>> just copied from another driver. But fine with me to wait for his feedback.
> >>>
> >> Yes, I'm quite sure I've copied it from another driver :-)
> >>
> >> This patch will cause the device here won't go automatically to D3
> >> before some user space script allows it. E.g
> >>
> >> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> >>
> >> I think this is kind of PM regression with this patch. It's not clear to
> >> me from the Documentation/power/pci.rst why driver should not call the
> >> pm_runtime_allow() and what would be allowed kernel alternative for it.
> >
> > Please see the comment in local_pci_probe().
> >
> > Because the PCI bus type is involved in power management, the driver
> > needs to cooperate.
> >
> >> Rafael: what would be the correct way here to allow runtime PM from the
> >> driver or does it really require some user space script for it?
> >
> > No, it doesn't.
> >
>
> PCI core code includes the following because of historic issues
> with broken ACPI support on some platforms:
>
> void pci_pm_init(struct pci_dev *dev)
> {
>         int pm;
>         u16 status;
>         u16 pmc;
>
>         pm_runtime_forbid(&dev->dev);
>         pm_runtime_set_active(&dev->dev);
>         pm_runtime_enable(&dev->dev);

Well, thanks for reminding me about that!

> That's why RPM has to be enabled by userspace for PCI devices:
> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control

Not really enabled, but rather "unlocked".

> Or drivers (that know that they can't be used on one of the broken
> platforms) call pm_runtime_allow(), what however is explicitly
> discouraged.

The problem here is that whether or not PM-runtime works in the given
configuration is not a property of a driver or an individual device,
but it depends on the platform.

Also if the driver is unbound from the device, the modified setting is
left behind it which isn't particularly nice.

> Not sure whether any of the old broken platforms is still relevant,

That's a good question, but it boils down to whether or not any of
them are still in use, which is hard to measure.

> therefore I started a discussion about it, which however ended
> w/o tangible result. See here:
> https://www.spinics.net/lists/linux-pci/msg103281.html

So I'm thinking that there could be a global flag accessible via a
kernel command line option, say pci_pm_runtime=allow/deny that would
allow the default behavior to be adjusted.  Now, the default value of
that flag could depend on some heuristics, like the BIOS date or
whether or not the system has ACPI etc.

> I work around this restriction with the following in an init script,
> not sure how common distro's deal with this.

Some of them use powertop to do an equivalent of the loop below IIRC.

> # enable Runtime PM for all PCI devices
> for i in /sys/bus/pci/devices/*/power/control; do
>         echo auto > $i
> done
