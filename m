Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7732A496C42
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 13:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbiAVMGN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 07:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiAVMGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jan 2022 07:06:12 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224ECC06173B;
        Sat, 22 Jan 2022 04:06:12 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id p12so47368701edq.9;
        Sat, 22 Jan 2022 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYb6Nzatpvxg3qByWKT69tE4DtcAsw2arG+geLWimVc=;
        b=cvZ4U9I2UL5ep8oODsKSeXyA8ssxTxnchDEAe4iVOcV7ZuOcV+LnVJyEA5wLOmWE8a
         3vTzLF0iEaYac7pGyLJGunwLUoAYidbdqSAut+Q+7uDNv4rCiRQ+CJPYQUi327md0/PU
         vwPMwxEPrmdmmRzp43X/s+pUVQeHfqnKyvAd4OAK4NA9QHtZivniXlU017dA1brcZ5zW
         R/rkM8rT9Z2VtlhedotHEVDWKzVuDxWI3ilufWBjr//i/RXjpvseU6o5rp195ZWTg88J
         qnFozoD09bRuZuenoqKa51UtVwEefRDTJo3br98brrgx5oG9eY8tdvNAsX2eXKDPI5Ev
         LAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYb6Nzatpvxg3qByWKT69tE4DtcAsw2arG+geLWimVc=;
        b=3eQjjoqZ99WgLkX2C8mLGk55ZVg7L1FkxG6BNLaKzwhUQgVyIMzLVA7GQ/B9h6YbeD
         mT3nnHAy9AyGoIWLgBfcSbd38bDliX/1kFKOHohi/JFldO2xHV4Bj35eZQAfLggfaAPk
         3bMDjtzK2RQKAi8JvV8GUVFwqQG8fMGQA64e42uMvaouq08fCqiuKCEksGf5ykZ+mNa6
         AoHdkG7sDRfAQSjVpRwu8UJc1WQuda7ZB5Jk5mh5AAwdfVK9FoFyPmEu/p1zS2aORVyC
         /uNGu6KLBBanH79NnJSpYYQd+KUIl+qh0u+x7KEM3bZupeRnsEksVdwPNEJ5+QzqXUh9
         jewQ==
X-Gm-Message-State: AOAM532nZcLRaH/09uSlivivF6NOccPXjq81pGqcQZ34m+61f9on/hdA
        HgOxmMuXF6AuRjVFvmudTjOOQ0q7a/4qW29+KHo=
X-Google-Smtp-Source: ABdhPJzjdmmDYirqInEFdJBVFwQhd6r7mUkGz5LJr4shJuDL0jpWJmpaRJvlHzUqTmFFyB5GNgS2lT6q1j7PGEWFay0=
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr7950328edy.296.1642853170555;
 Sat, 22 Jan 2022 04:06:10 -0800 (PST)
MIME-Version: 1.0
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 22 Jan 2022 14:05:34 +0200
Message-ID: <CAHp75Ve-zYz27baJ9SV3wcyKS5iMnxFO61gGE2LXQPU_hTt+qw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Enable named interrupt smbus-alert for ACPI
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
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

On Sat, Jan 22, 2022 at 1:33 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> I2C - SMBus core drivers use named interrupts to support smbus_alert.
> As named interrupts are not available for ACPI based systems, it was
> required to change the i2c bus controller driver if to use smbus alert.
> These patches provide option for named interrupts in ACPI and  make the
> implementation similar to DT. This will enable use of interrupt named
> 'smbus-alert' in ACPI as well which will be taken during i2c adapter
> register.

I'm fine with the series,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Maintainers can ask something else, though.

> v3->v4:
>   * Removed device_irq_get_byname()
>   * Updates in comments and document.
> v2->v3:
>   * Grammar/spelling corrections.
>   * Added description in function comments.
>   * Removed 'unlikely' from NULL check on 'name'
> v1->v2:
>   * Added firmware guide documentation for ACPI named interrupts
>   * Updates in function description comments
>
> Akhil R (3):
>   device property: Add fwnode_irq_get_byname
>   docs: firmware-guide: ACPI: Add named interrupt doc
>   i2c: smbus: Use device_*() functions instead of of_*()
>
>  Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
>  drivers/base/property.c                           | 29 +++++++++++++++++
>  drivers/i2c/i2c-core-base.c                       |  2 +-
>  drivers/i2c/i2c-core-smbus.c                      | 10 +++---
>  drivers/i2c/i2c-smbus.c                           |  3 +-
>  include/linux/i2c-smbus.h                         |  6 ++--
>  include/linux/property.h                          |  1 +
>  7 files changed, 80 insertions(+), 10 deletions(-)
>
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
