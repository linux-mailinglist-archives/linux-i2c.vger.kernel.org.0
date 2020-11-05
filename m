Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B322A7BFF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 11:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgKEKiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 05:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKEKiI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 05:38:08 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F55C0613CF;
        Thu,  5 Nov 2020 02:38:08 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so1161019pfz.6;
        Thu, 05 Nov 2020 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWxaLuXzL3PLFAORGmERE44LXlHr7AcLztN/re0GyoQ=;
        b=UakB0SDE4yRFkhDdnv2m/kiDOTVGmF5Kd3B2rrUR8wbRYOH4yf/UH3c4lsg8/RGIhr
         bLrW2jv6Qz97gJxis8o3f71NEHpBsZnMvbRdoqzLrinD6pXgLcNB9dD/VcOYjCp/KZOZ
         ysdA9wIs8Fvd0yclcFSfDH5HQkkuJfAwYZQUZX6L7NsGgm1ix6tl5nGXBFFGtJ7CUQG0
         WZcg4DV2OfyLFVclBuUpSuCquDUMl4p/Y/yJ7Kdau0mUlnkGh7Pb9B+Ivwgp0d0bK9vQ
         T9pKV4b+e+SCm1FRfKRCRzdzGObVIWneNnUqt7wYo1rNfkIEEqaKG4cpuvu02YeGEQLy
         lJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWxaLuXzL3PLFAORGmERE44LXlHr7AcLztN/re0GyoQ=;
        b=EDWzsU6Aohm0sggyASODSw+ST1Xb8brv5jZCDJSW+GYSvSuMSX/KRMEM7TwqxxCmUg
         xmy3I8di3XbXbJLtMTbTfy8j+fjItY5gbP0M+w86BRLmi0yNE/4FafXrjqI8uBXZU4rd
         Q3VrZhC7HPnPX6mQUp9X3FSP/3Et2DCfX0Fbtj2WQo4s4n8zaZIDcr36kq3NR35ah0GL
         M957Bei76odXqLu5hrWkIvD3pkrUxRa/Zm+gbG0Lg+zHNULGc1rMyxTpF/E7O56cpZAn
         dSJyJX64hnb6X2OliDa8fa2kvXFwOt+0RZFD7H40ktIPmYGg+bKNZkQGYPiltjOnOhex
         xF/g==
X-Gm-Message-State: AOAM531fe3hwFkX1AT8QWVYKCCH+z+k1RBL0yc9YeTWBrtAjpntx82dr
        8VAIOgTZwkCs8u1gX953tsXkd9pn4jaQp/By+wQ=
X-Google-Smtp-Source: ABdhPJxW2QrwtfuKsNVHB2pi5vmaHBZB3oMye2xd8WDdBWNP+1tjJ67XmfFFCIc52CDILHi+fMYkW3fuU24E7tuHzDY=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr1846791pgi.203.1604572687941;
 Thu, 05 Nov 2020 02:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 12:38:56 +0200
Message-ID: <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Hans de Goede <hdegoede@redhat.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> As the subject says this series is mostly about passing the ACPI fwnode to
> i2c-clients instantiated by the i2c-multi-instantiate code.
>
> As discussed here:
> https://bugzilla.kernel.org/show_bug.cgi?id=198671
>
> BOSC0200 ACPI devices may sometimes describe 2 accelerometers in a single
> ACPI device, while working on this I noticed that BOSC0200 ACPI nodes
> contain ACCEL_MOUNT_MATRIX info (unlike all the other ACPI ids for bmc150
> accelerometers). Which is why I wanted to pass the fwnode so that we
> could use this info in the bmc150-accel driver.
>
> The plan was to use i2c-multi-instantiate for this, but doing so will
> change the modalias and /lib/udev/hwdb.d/60-sensor.hwdb matches on
> the modalias for various quirks setting ACCEL_MOUNT_MATRIX. So then the
> plan became to first add support for the mount-matrix provided inside
> the BOSC0200 ACPI node, making the udev info unnecessary. But for at
> least 1 model (and probably more) the BOSC0200 ACPI node and hwdb info
> does not match and since the hwdb info is added by users of the actual
> devices we can assume it is correct, so it seems that we cannot always
> trust the ACPI provided info.  This is ok, the hwdb info overrides it
> (iio-sensor-proxy prefers the udev provided mount-matrix over the
> one provided by the driver) but this means that we MUST keep the
> existing hwdb matches working, which means that we cannot use
> i2c-multi-instantiate for this.
>
> Instead I will dust of an old patch for this from Jeremy Cline:
> https://patchwork.kernel.org/project/linux-iio/patch/010001602cf53153-39ad69f1-1b39-4e6d-a748-9455a16c2fbd-000000@email.amazonses.com/
>
> Which deals with there being 2 accelerometers inside the bmc150-accel
> driver.
>
> But before coming to the conclusion that i2c-multi-instantiate
> would not work I had already written this series. Since this might
> be useful for some other case in the future I'm sending this out
> as a RFC now, mostly so that it gets added to the archives.

I think they are in pretty good shape (only the 4th required a bit of
attention).

Please, send as non-RFC and also Cc Heikki (just in case if he has
comments wrt INT3515).

-- 
With Best Regards,
Andy Shevchenko
