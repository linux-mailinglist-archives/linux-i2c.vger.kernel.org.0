Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9E73166A5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 13:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhBJM2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 07:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhBJM11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Feb 2021 07:27:27 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B344C06174A
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 04:27:04 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id q2so2688425eds.11
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 04:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Phx2Df+hBBWF6//uqqDU9bgwk8wPxGzI8wPThN0e6e4=;
        b=XWEkebRiibdEdE+6ZB77pkBDh+47f7G/U8vuVdUs3ojDxrmD+oIRSWGm5kX5MXCP3L
         8FOw4XysMFBMfDCFK8HdIucqIu9o0gChIV8kqjE01MFl65rUCpSPso/3leXmhQch2tYd
         O5bhkzF/tafxn+1JrQIFDtPYHfUVBDSm/vzvn6Semntf5QSpf3XIsRH6aPDS2FdzsriJ
         NyKxsx2ZIxSV/G0Q+hHt8Y5ofXa1XgUI4Z4Hz2UDxq3XrOD2IknCK8R+7oL5mdybpmU0
         djiKokRfEBYKqIwNmiJsY9cG4LzSv8D6grvkhuaWb4XJeeE1D/StTKSbGG5UGVcxT8aU
         eQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Phx2Df+hBBWF6//uqqDU9bgwk8wPxGzI8wPThN0e6e4=;
        b=fSfsiv5H1Ofh6DAtIZOiZmJKdogTBuR0G9F1WdnrPTA8JfQSAK5xkN/rGkHzgF2Dor
         wBcbOlcBfxW1hdASuhGoDiQomcEJLz+GsMM+RoiWjyFfg0kA/wzxgewp6P6V/GqUWKEZ
         uBGtPHmttH5Ihal/5tAtbJeQyPKyVwPERIXlHQb50BsTrLLYWyesBcIuGtxDKWe0mF0l
         QADvEpBxfonvu5RvpwThzcADl1T7/20NqB324MIwTt2vYibiDvsFpQLVz3SWEbUcgmwu
         4GYmppE4l/7KluMqQRhedDA1rgN8H2QBttMSGPwwxTpgFMFwXnn9ZuqDtnWm5H6I7luA
         N2AQ==
X-Gm-Message-State: AOAM532fr63tYfbM9P6Dcl9k35ie+WAVPF64WrloH5T943Yu9G2ICimQ
        V037azszynKKRc27QO+8cu8qV7a/tfm2XOe6yG3xCA==
X-Google-Smtp-Source: ABdhPJw4C1QO6SGuO1XGeekpJcbdpNnmdoqCX6g5HqEjse/xlq4shvpaq+kQrErxohP4VuoElKjQrAOmM15IICl0GCQ=
X-Received: by 2002:a50:fe11:: with SMTP id f17mr2919405edt.88.1612960022961;
 Wed, 10 Feb 2021 04:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com> <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
 <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
 <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
 <20210209162343.GF32460@paasikivi.fi.intel.com> <CAJZ5v0h2=zKNMictJtJE5LuEi9E3n=Uf-xNO3udHxL2hqXL7Fg@mail.gmail.com>
 <20210209165418.GG32460@paasikivi.fi.intel.com> <CAJZ5v0jc9HZ-Qa9ooN40sgispqo5BUE6ngnVMCqAO3qnUU+uqw@mail.gmail.com>
 <20210210080311.GA3@paasikivi.fi.intel.com>
In-Reply-To: <20210210080311.GA3@paasikivi.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 10 Feb 2021 13:26:51 +0100
Message-ID: <CAMpxmJWogKNk3me76_O2nyaJCQO-Amb=rmhM9APEhFLd9ui4rg@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Wed, Feb 10, 2021 at 9:41 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Feb 09, 2021 at 05:58:12PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Feb 9, 2021 at 5:54 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Tue, Feb 09, 2021 at 05:42:45PM +0100, Rafael J. Wysocki wrote:
> > > > On Tue, Feb 9, 2021 at 5:23 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Bartosz, Rafael,
> > > > >
> > > > > On Tue, Feb 09, 2021 at 04:49:37PM +0100, Bartosz Golaszewski wrote:
> > > > > > On Mon, Feb 8, 2021 at 5:54 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > > > >
> > > > > > > On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
> > > > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> > > > > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > > > > >
> > > > > > > > > In certain use cases (where the chip is part of a camera module, and the
> > > > > > > > > camera module is wired together with a camera privacy LED), powering on
> > > > > > > > > the device during probe is undesirable. Add support for the at24 to
> > > > > > > > > execute probe while being powered off. For this to happen, a hint in form
> > > > > > > > > of a device property is required from the firmware.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > > > > > > > ---
> > > > > > > >
> > > > > > > > I'll ack this but I still claim that the name
> > > > > > > > acpi_dev_state_low_power() is super misleading for this use-case and
> > > > > > > > I've been saying that for 10 versions now with everyone just ignoring
> > > > > > > > my remarks. :/
> > > > > > >
> > > > > > > Well, the function in question simply checks if the current ACPI power
> > > > > > > state of the device is different from "full power", so its name
> > > > > > > appears to be quite adequate to me.
> > > > > > >
> > > > > > > If the way in which it is used is confusing, though, I guess
> > > > > > > explaining what's going on would be welcome.
> > > > > > >
> > > > > >
> > > > > > Yes, I have explained it multiple time already - last time at v9 of this series:
> > > > > >
> > > > > >     https://www.spinics.net/lists/kernel/msg3816807.html
> > > > >
> > > > > How about adding this to the description of acpi_dev_state_low_power():
> > > > >
> > > > > -----------8<--------------
> > > > >  * This function is intended to be used by drivers to tell whether the device
> > > > >  * is in low power state (D1--D3cold) in driver's probe or remove function. See
> > > > >  * Documentation/firmware-guide/acpi/low-power-probe.rst for more information.
> > > > > -----------8<--------------
> > > >
> > > > This information is already there in the kerneldoc description of that
> > > > function AFAICS.
> > >
> > > Ok, the D states are mentioned already. But how to use it is not, nor
> > > there's a reference to the ReST file. I think that wouldn't hurt.
> > >
> > > >
> > > > I was thinking about adding an explanation comment to the caller.
> > >
> > > I think it'd be best if the function name would convey that without a
> > > comment that should then be added to all callers. How about calling the
> > > function e.g. acpi_dev_state_d0() and negating the return value? The D0
> > > state is well defined and we could do this without adding new terms.
> >
> > That would work for me.
>
> Bartosz, would that work for you?
>
> I'd call the temporary variable in the at24 driver e.g. "full_power".
>

Yes, that works, go ahead and thank you.

Bartosz
