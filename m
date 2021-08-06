Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DC33E2C46
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 16:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbhHFOMM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 10:12:12 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:41736 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbhHFOMM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 10:12:12 -0400
Received: by mail-ot1-f50.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so9030287otu.8
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 07:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3zTCK7+3gV2FjQEDLmD0euJKVYACEyndxVej2431dpA=;
        b=VqNzUj6QMQur6qF+xMirKjdFjB6mPdQ+5VZCokgiOW+fmBIXhAy9KUpgL3hX8hYFBR
         XSWd/7xgMF5ARVcLnReP0xxLACHdBEftOI8MLO8HnfyLoVYXTz6VnEoj0UuSawnBD5rQ
         9Lio22itpjhhjOd0xfE10DyO1tUheKzizdXkl1PS+Wt2ZVE/oGnU3CTMuEGd5+ZKLSGY
         b/S2HjYUeicyTc/j+qvgYAHOlYqbe5LnZ8Q3pNlyAHwBROlWqBeY+iMGqVBXOjtu9TsV
         3MqPfJeA4orqKalnCtysLjwvCllBliQXqN4OYtYN2qYqVD8fgvq+mEMP6zY5IFJUcmWY
         ctqg==
X-Gm-Message-State: AOAM5308+GsTnBCHxyfNrdTiHrdgPDBtUgoeesBVh3zX8xfWBNwtD2hc
        ZHacaLhzJhb0lPPDx3PkawMF3qGJg894mJbGrdM=
X-Google-Smtp-Source: ABdhPJxSpTWkE/SqDenCIbV2DqVBTxiniW77h4A0wbY3stpEnqwjkFsxA3Td3hech3b8pE5xqfKr4BWzjqXRgYR3EXU=
X-Received: by 2002:a05:6830:1f59:: with SMTP id u25mr7796836oth.321.1628259115071;
 Fri, 06 Aug 2021 07:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com> <20210802145347.605ce8d5@endymion>
 <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com> <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
 <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
 <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com> <20210805103150.7df1c315@endymion>
In-Reply-To: <20210805103150.7df1c315@endymion>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 6 Aug 2021 16:11:43 +0200
Message-ID: <CAJZ5v0hPK3QQ3b5eWA=szxJxnSYnvFyw8zHD0UhJV+N_YLhGHQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
To:     Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 5, 2021 at 10:31 AM Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Heiner,
>
> On Wed, 4 Aug 2021 21:02:39 +0200, Heiner Kallweit wrote:
> > On 04.08.2021 16:06, Rafael J. Wysocki wrote:
> > > On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
> > >> Yes, I'm quite sure I've copied it from another driver :-)
> > >>
> > >> This patch will cause the device here won't go automatically to D3
> > >> before some user space script allows it. E.g
> > >>
> > >> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> > >>
> > >> I think this is kind of PM regression with this patch. It's not clear to
> > >> me from the Documentation/power/pci.rst why driver should not call the
> > >> pm_runtime_allow() and what would be allowed kernel alternative for it.
> > >
> > > Please see the comment in local_pci_probe().
> > >
> > > Because the PCI bus type is involved in power management, the driver
> > > needs to cooperate.
> > >
> > >> Rafael: what would be the correct way here to allow runtime PM from the
> > >> driver or does it really require some user space script for it?
> > >
> > > No, it doesn't.
> >
> > PCI core code includes the following because of historic issues
> > with broken ACPI support on some platforms:
> >
> > void pci_pm_init(struct pci_dev *dev)
> > {
> >       int pm;
> >       u16 status;
> >       u16 pmc;
> >
> >       pm_runtime_forbid(&dev->dev);
> >       pm_runtime_set_active(&dev->dev);
> >       pm_runtime_enable(&dev->dev);
> >
> > That's why RPM has to be enabled by userspace for PCI devices:
> > echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> >
> > Or drivers (that know that they can't be used on one of the broken
> > platforms) call pm_runtime_allow(), what however is explicitly
> > discouraged.
> >
> > Not sure whether any of the old broken platforms is still relevant,
> > therefore I started a discussion about it, which however ended
> > w/o tangible result. See here:
> > https://www.spinics.net/lists/linux-pci/msg103281.html
> >
> > I work around this restriction with the following in an init script,
> > not sure how common distro's deal with this.
> >
> > # enable Runtime PM for all PCI devices
> > for i in /sys/bus/pci/devices/*/power/control; do
> >         echo auto > $i
> > done
>
> FWIW, my distribution (openSUSE Leap 15.2) doesn't do anything with
> these attributes, basically leaving the decision to the drivers. As a
> result, your proposed patch leads to the following change for me:
>
> -/sys/bus/pci/devices/0000:00:1f.3/power/control:auto
> +/sys/bus/pci/devices/0000:00:1f.3/power/control:on
>
> I don't see that as an improvement.
>
> I also see that several other drivers I'm using (pcieport,
> snd_hda_intel, amdgpu) do enable runtime power management, so the
> i2c-i801 driver isn't an exception in this respect. Therefore I am not
> willing to accept this patch, sorry.

I tend to agree with this judgement.  Drivers that already call
pm_runtime_allow() should be allowed to continue doing that or users
will be confused.

Calling pm_runtime_allow() from a PCI driver isn't nice with respect
to user space, because if the latter doesn't want the device to
runtime-suspend (whatever the reason), it needs to change the
PM-runtime control setting whenever the driver is bound to the device,
but that arguably is not a major problem.

It would still be useful to have a way to adjust the default behavior
for all PCI devices on a per-platform basis IMO.
