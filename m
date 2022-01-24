Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E671449890C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 19:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343683AbiAXSwc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 13:52:32 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:46697 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343542AbiAXSux (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 13:50:53 -0500
Received: by mail-qk1-f174.google.com with SMTP id 13so7050414qkd.13;
        Mon, 24 Jan 2022 10:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXczVih0FPrq5RMJMFbQoznMPhMuyGl4ivag5w/6yQo=;
        b=qjEje+L9jxsTceVKPDo2TxHNl6tCrbp9WYTwAtiyqeMoL+1G2zzTzc7yF0JGn/PpSo
         1lLFR/XXbWyerydGnFCpJ+JWgnjsWHJQrDm6kfTmFI/qVeSJo+5iTsEuySfej7mp4nuI
         +U9caO2T0cD7H6uCwmIImAtFf14KjL6tbV9+rJW3GEgCLQK7ZTh3Awh2DFC91w8NR0Xz
         SQJX4tbdpBkumHH9tUuMoIK3gkpAj+xnR/pTyh18aDCBgaoICHinOBfZdFroeCLcCkt9
         grHO1PlrN03o4kLNd3VVjywA38oKaUlCKeOtFlBJ2xF9LH41sZ7MhZT2VoxZ4pcI55UJ
         klBA==
X-Gm-Message-State: AOAM530021Ph7bI9Mj6obfunjWxP5mpnjQOc5ZLESr2SUfxGM9o7Wzdb
        pYJHKRyE4JDtJ/yVG/SbvfRLHjeCZ5GcRlAF+uI=
X-Google-Smtp-Source: ABdhPJyvSheg1mf3030MstMWntKE0XdVdAcgmjD2HcaBTrQQzYxi/X9z158mcrejkOhrhki798xK1d2hjlGKYPLD3f4=
X-Received: by 2002:ae9:f445:: with SMTP id z5mr2102446qkl.8.1643050252793;
 Mon, 24 Jan 2022 10:50:52 -0800 (PST)
MIME-Version: 1.0
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com> <CAHp75Ve-zYz27baJ9SV3wcyKS5iMnxFO61gGE2LXQPU_hTt+qw@mail.gmail.com>
In-Reply-To: <CAHp75Ve-zYz27baJ9SV3wcyKS5iMnxFO61gGE2LXQPU_hTt+qw@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 24 Jan 2022 19:50:37 +0100
Message-ID: <CAJZ5v0guL4nk21gvvs2K9Ak6sjhDSzMvDQZJvmnq6Frsj3+7yA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Enable named interrupt smbus-alert for ACPI
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 22, 2022 at 1:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jan 22, 2022 at 1:33 PM Akhil R <akhilrajeev@nvidia.com> wrote:
> >
> > I2C - SMBus core drivers use named interrupts to support smbus_alert.
> > As named interrupts are not available for ACPI based systems, it was
> > required to change the i2c bus controller driver if to use smbus alert.
> > These patches provide option for named interrupts in ACPI and  make the
> > implementation similar to DT. This will enable use of interrupt named
> > 'smbus-alert' in ACPI as well which will be taken during i2c adapter
> > register.
>
> I'm fine with the series,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Maintainers can ask something else, though.

It looks good to me.

If no one else has concerns regarding it, I'll queue it up for 5.18.

> > v3->v4:
> >   * Removed device_irq_get_byname()
> >   * Updates in comments and document.
> > v2->v3:
> >   * Grammar/spelling corrections.
> >   * Added description in function comments.
> >   * Removed 'unlikely' from NULL check on 'name'
> > v1->v2:
> >   * Added firmware guide documentation for ACPI named interrupts
> >   * Updates in function description comments
> >
> > Akhil R (3):
> >   device property: Add fwnode_irq_get_byname
> >   docs: firmware-guide: ACPI: Add named interrupt doc
> >   i2c: smbus: Use device_*() functions instead of of_*()
> >
> >  Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
> >  drivers/base/property.c                           | 29 +++++++++++++++++
> >  drivers/i2c/i2c-core-base.c                       |  2 +-
> >  drivers/i2c/i2c-core-smbus.c                      | 10 +++---
> >  drivers/i2c/i2c-smbus.c                           |  3 +-
> >  include/linux/i2c-smbus.h                         |  6 ++--
> >  include/linux/property.h                          |  1 +
> >  7 files changed, 80 insertions(+), 10 deletions(-)
> >
> > --
> > 2.7.4
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
