Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDC030A6C5
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 12:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBALpn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 1 Feb 2021 06:45:43 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33276 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhBALpm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Feb 2021 06:45:42 -0500
Received: by mail-oi1-f169.google.com with SMTP id j25so18502402oii.0;
        Mon, 01 Feb 2021 03:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F3brwljMK0uhzeGRjZ/IuBQwp5XiEQw0EzVWxL9yxHk=;
        b=nOiQxrcJLo1158TBeGPNaNURf699znMIIMT/o+af0IUdw2dnZfcB+RWs9GVw6cn/Nw
         y+0zC4Dp9ReQMc3InO/AKCmp0mWY/o3nk0TLFfyRurzdZbcpvLxqk2K3Msy4NDzk9LAH
         AwhG+dmKFkUWI3wYK7FgkFP+oF12REvh2fekpHuyP/qTUy+wu6HUzKQJPOP+z71JCJn+
         58+60bZ83SIym6kaWNqroxKTaUHxx2T8HaQD8UBdBb+Fy5QJDJmTKLoshprNNoylGmOL
         zoAMl8PK+dc0DJseoP1YkRhwmAo0lTq9iEOB5tuSSgpKuySKEGanl5pUpp0PUfBfbtRv
         Jvuw==
X-Gm-Message-State: AOAM532og5wZ4CkJ2PYywbNrAG+imBfbakm8VPpiLlMK5bYO3FqDOAYA
        LTKpe3/MkGLgPk3ZYeAHhKoI3/MxAtS2JH2M+ok=
X-Google-Smtp-Source: ABdhPJzoNEdv4WA1XDyCNcLyrUciFwO8fzlSNHkNfIqwp+f4fXLx2xULurRS7gSTb2eGjCfulRKi0Um3QyNdSJW8w6E=
X-Received: by 2002:aca:308a:: with SMTP id w132mr10054609oiw.69.1612179901283;
 Mon, 01 Feb 2021 03:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20210128232729.16064-1-sakari.ailus@linux.intel.com> <CAJZ5v0hdG1W0D5E6GbrTDiAjMyC0mSgb3Z2WEBy3hhb4iJhDNw@mail.gmail.com>
 <20210129164522.GJ32460@paasikivi.fi.intel.com> <CAJZ5v0iJB80QX9ze9_hpNP4R-+C36Rvn8d+7S-4-guWrN=SiWQ@mail.gmail.com>
 <20210129212211.GK32460@paasikivi.fi.intel.com>
In-Reply-To: <20210129212211.GK32460@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 1 Feb 2021 12:44:46 +0100
Message-ID: <CAJZ5v0jjgy2KXOw5pyshvaEVzLctu4jsgYK1+YDA+8sZfp-6mw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] ACPI: scan: Obtain device's desired enumeration
 power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 10:22 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Fri, Jan 29, 2021 at 05:57:17PM +0100, Rafael J. Wysocki wrote:
> > On Fri, Jan 29, 2021 at 5:45 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Rafael,
> > >
> > > Thanks for the comments.
> > >
> > > On Fri, Jan 29, 2021 at 03:07:57PM +0100, Rafael J. Wysocki wrote:
> > > > On Fri, Jan 29, 2021 at 12:27 AM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Store a device's desired enumeration power state in struct
> > > > > acpi_device_power_flags during acpi_device object's initialisation.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/acpi/scan.c     | 6 ++++++
> > > > >  include/acpi/acpi_bus.h | 3 ++-
> > > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > > > > index 1d7a02ee45e05..b077c645c9845 100644
> > > > > --- a/drivers/acpi/scan.c
> > > > > +++ b/drivers/acpi/scan.c
> > > > > @@ -987,6 +987,8 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
> > > > >
> > > > >  static void acpi_bus_get_power_flags(struct acpi_device *device)
> > > > >  {
> > > > > +       unsigned long long pre;
> > > > > +       acpi_status status;
> > > > >         u32 i;
> > > > >
> > > > >         /* Presence of _PS0|_PR0 indicates 'power manageable' */
> > > > > @@ -1008,6 +1010,10 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
> > > > >         if (acpi_has_method(device->handle, "_DSW"))
> > > > >                 device->power.flags.dsw_present = 1;
> > > > >
> > > > > +       status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &pre);
> > > > > +       if (ACPI_SUCCESS(status) && !pre)
> > > > > +               device->power.flags.allow_low_power_probe = 1;
> > > >
> > > > While this is what has been discussed and thanks for taking it into
> > > > account, I'm now thinking that it may be cleaner to introduce a new
> > > > object to return the deepest power state of the device in which it can
> > > > be enumerated, say _DSE (Device State for Enumeration) such that 4
> > > > means D3cold, 3 - D3hot and so on, so the above check can be replaced
> > > > with something like
> > > >
> > > > status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &dse);
> > >
> > > s/_PRE/_DSE/
> > >
> > > ?
> >
> > Yes, sorry.
> >
> > >
> > > > if (ACPI_FAILURE(status))
> > >
> > > ACPI_SUCCESS?
> >
> > Yup.
> >
> > > >         device->power.state_for_enumeratin = dse;
> > > >
> > > > And then, it is a matter of comparing ->power.state_for_enumeratin
> > > > with ->power.state and putting the device into D0 if the former is
> > > > shallower than the latter.
> > > >
> > > > What do you think?
> > >
> > > Sounds good. How about calling the function e.g.
> > > acpi_device_resume_for_probe(), so runtime PM could be used to resume the
> > > device if the function returns true?
> >
> > I'd rather try to power it up before enabling runtime PM, because in
> > order to do the latter properly, you need to know if the device is
> > active or suspended to start with.
> >
> > So you need something like (pseudo-code)
> >
> > if (this_device_needs_to_be_on(ACPI_COMPANION(dev))) {
> >    acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D0);
> >    pm_runtime_set_active(dev);
> > } else {
> >    pm_runtime_set_suspended(dev);
>
> I guess the else branch isn't needed? The device remains suspended if its
> state hasn't been changed.

Assuming that the initial status is always "suspended", the else
branch is not needed.

> > }
> >
> > and then you can enable PM-runtime.
>
> Yes, agreed, this is what drivers should do. The I涎 framework would use
> the function and conditionally power the device on before enabling runtime
> PM.
>
> This is how it's implemented by the set already but I think the change in
> semantics requires a little more still.

Agreed.
