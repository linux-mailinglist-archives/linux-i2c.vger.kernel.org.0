Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F03D4A6486
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 20:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbiBATCA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 14:02:00 -0500
Received: from mail-yb1-f176.google.com ([209.85.219.176]:45828 "EHLO
        mail-yb1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238769AbiBATB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 14:01:58 -0500
Received: by mail-yb1-f176.google.com with SMTP id w81so31576023ybg.12;
        Tue, 01 Feb 2022 11:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zetz1EMRrtQpNFO0fDTM+0U4I0bqCUCVVP0e+KHk8hI=;
        b=Qb8dH8+aQjMFf4E1QX/QpWoiUGWgaZNOFPwHLfCh3lJAhoSk2OxN9+RT/XKBANQWVv
         0rxKD3Pp1ilFdTRfHmLCBn7aq88A5BkT+qHdoJNkdDs407G/OooKaqSFddT8txjXpgxl
         cOwo6z1T1BjgAFxJdqHDCf5M6QbeTPEyc9iwr6zJW6H5tdcvUiJ3iZP8OgtBEYSR0LiL
         ELRzTagHbCOZKbsg+D76uy/J5apKuRaERvI6wt3n5cb/GqhJHZltbzhbbqEJPD2oNrvj
         zAJ5W7rFg+cO/GZylroWDa8xeqja7BsP+eckeZ2f3vMxtuQI/yLKaLkBu7fpxv3TpyjK
         3bDQ==
X-Gm-Message-State: AOAM532NLd5s837fP8Bx61cBLBQiY1mkEyFy7sFKlIimvSNpSYXEGW7F
        TprnAo2QHQZrChOcfbM47BHDr8pQ9ZTFBk+ElCI=
X-Google-Smtp-Source: ABdhPJyaXQdSdAWuhV1rlFp79N6oWZd9upRROHfEAt6roN+Zhtqn2P5Znv6SN86pFRBbzM23rHXbjKXdGd56ucOffrU=
X-Received: by 2002:a25:cc97:: with SMTP id l145mr357412ybf.272.1643742117289;
 Tue, 01 Feb 2022 11:01:57 -0800 (PST)
MIME-Version: 1.0
References: <4374434.LvFx2qVVIh@kreacher> <Yfl/Sneg9/HPOjBe@smile.fi.intel.com>
In-Reply-To: <Yfl/Sneg9/HPOjBe@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 1 Feb 2022 20:01:46 +0100
Message-ID: <CAJZ5v0jFBFKMcjYieYCL1LTvRPuM7b8_5nBx0_wnPtobzg==fw@mail.gmail.com>
Subject: Re: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 1, 2022 at 7:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 01, 2022 at 07:00:42PM +0100, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Replace acpi_bus_get_device() that is going to be dropped with
> > acpi_fetch_acpi_dev().
> >
> > No intentional functional impact.
>
> ...
>
> > +     if (!adev || i2c_acpi_get_info(adev, &info, adapter, NULL))
>
> AFAICS the !adev check is redundant since acpi_device_enumerated() does it.

No.

acpi_device_enumerated() returns false if adev is NULL, so without
this extra check i2c_acpi_get_info() will end up passing NULL to
i2c_acpi_do_lookup().

> >               return AE_OK;
>
> ...
>
> > +     struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
> >
> > -     if (i2c_acpi_do_lookup(adev, lookup))
> > +     if (!adev || i2c_acpi_do_lookup(adev, lookup))
> >               return AE_OK;
>
> Here we need it indeed.
> Dunno, if acpi_dev_ready_for_enumeration() can gain the check itself.

Well, acpi_bus_get_status() would need it too.
