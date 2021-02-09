Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94899315485
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 17:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbhBIQ7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 11:59:11 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:35876 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233188AbhBIQ7F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Feb 2021 11:59:05 -0500
Received: by mail-ot1-f49.google.com with SMTP id 100so11396486otg.3;
        Tue, 09 Feb 2021 08:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evwy4XV5Q6cMll0/XuL/bVl96ksA3QLEns1+sYmoTko=;
        b=msLssMkS3mLEqo3lzNMaZmG7yIvC9a30/M8DsEwcgajyOZvAPsnVp0tewctsqxgahR
         LoEyvqnnIK3owx3TJZeB3MEq+6OjHNkM0+MfFEhTT5xkgRM6wQ+nfrq6VkBKMqFAXUCt
         IWINXbSFoea0Wgtt1lm95RJIAA1lfmFx5KgsyjjHuXICOZELX6RBF3f5hStf3hJZRrV1
         yhdAtG70f5da8ak9ze8KqlnTFsGureCJhVy7ZZU2/IFKq0WqfGs+QAstsQoKGsL55/bW
         uxUn0S9TkByhV2gtkYTjciGv9Sa5mQ/GJC1dmSc+Ho4BmcZdZsOMV3c8cUkYEhfmkz9Y
         5gwQ==
X-Gm-Message-State: AOAM531kHa3BkJ+E/VtpHib03OhOr1ugHcfzl+DsEUV9kUhxSrR9Izsd
        pVBpJZlN8+tgLzqSEgBVd8Wh4h9t86eMC+rS4lY=
X-Google-Smtp-Source: ABdhPJyMo3OVcJErKwZDw1AwIpwz257KAaFbUa4mBXCtpt+3iOCDI+/o4eSo/qspDLxKuujPQMQhK2w4bFuvFd7JXto=
X-Received: by 2002:a9d:a2d:: with SMTP id 42mr15389022otg.321.1612889903680;
 Tue, 09 Feb 2021 08:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com> <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
 <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
 <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
 <20210209162343.GF32460@paasikivi.fi.intel.com> <CAJZ5v0h2=zKNMictJtJE5LuEi9E3n=Uf-xNO3udHxL2hqXL7Fg@mail.gmail.com>
 <20210209165418.GG32460@paasikivi.fi.intel.com>
In-Reply-To: <20210209165418.GG32460@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Feb 2021 17:58:12 +0100
Message-ID: <CAJZ5v0jc9HZ-Qa9ooN40sgispqo5BUE6ngnVMCqAO3qnUU+uqw@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 9, 2021 at 5:54 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Feb 09, 2021 at 05:42:45PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Feb 9, 2021 at 5:23 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Bartosz, Rafael,
> > >
> > > On Tue, Feb 09, 2021 at 04:49:37PM +0100, Bartosz Golaszewski wrote:
> > > > On Mon, Feb 8, 2021 at 5:54 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > >
> > > > > On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
> > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > >
> > > > > > On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> > > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > > >
> > > > > > > In certain use cases (where the chip is part of a camera module, and the
> > > > > > > camera module is wired together with a camera privacy LED), powering on
> > > > > > > the device during probe is undesirable. Add support for the at24 to
> > > > > > > execute probe while being powered off. For this to happen, a hint in form
> > > > > > > of a device property is required from the firmware.
> > > > > > >
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > > > > > ---
> > > > > >
> > > > > > I'll ack this but I still claim that the name
> > > > > > acpi_dev_state_low_power() is super misleading for this use-case and
> > > > > > I've been saying that for 10 versions now with everyone just ignoring
> > > > > > my remarks. :/
> > > > >
> > > > > Well, the function in question simply checks if the current ACPI power
> > > > > state of the device is different from "full power", so its name
> > > > > appears to be quite adequate to me.
> > > > >
> > > > > If the way in which it is used is confusing, though, I guess
> > > > > explaining what's going on would be welcome.
> > > > >
> > > >
> > > > Yes, I have explained it multiple time already - last time at v9 of this series:
> > > >
> > > >     https://www.spinics.net/lists/kernel/msg3816807.html
> > >
> > > How about adding this to the description of acpi_dev_state_low_power():
> > >
> > > -----------8<--------------
> > >  * This function is intended to be used by drivers to tell whether the device
> > >  * is in low power state (D1--D3cold) in driver's probe or remove function. See
> > >  * Documentation/firmware-guide/acpi/low-power-probe.rst for more information.
> > > -----------8<--------------
> >
> > This information is already there in the kerneldoc description of that
> > function AFAICS.
>
> Ok, the D states are mentioned already. But how to use it is not, nor
> there's a reference to the ReST file. I think that wouldn't hurt.
>
> >
> > I was thinking about adding an explanation comment to the caller.
>
> I think it'd be best if the function name would convey that without a
> comment that should then be added to all callers. How about calling the
> function e.g. acpi_dev_state_d0() and negating the return value? The D0
> state is well defined and we could do this without adding new terms.

That would work for me.
