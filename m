Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C513AA2E4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 20:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhFPSKe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 14:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhFPSKe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Jun 2021 14:10:34 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A68C06175F;
        Wed, 16 Jun 2021 11:08:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id z26so2845469pfj.5;
        Wed, 16 Jun 2021 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ycID7DbnSZP9eaDdKUdtHxmB+2/7XuKoHI3CIq/KZU=;
        b=Jusjd8nRH1tNzqbReIyRyGMqdNOZovEla8AilFx6u2cRXOUefONqtH9QpYSdpHp3u+
         3+Vd0OqbzSyY/oNBvhzpfDvCobe4xCjl3J+EiSn+bCHq9Vv7xpC52u85U5i4MYpxl94J
         cr0vR3tVDddfem3jhtkQh1m6cYHCmdRbHoSrQfLyakbg+PYxBG6iE7MVET2hnKABr3MM
         XtCI7TOy4jZrIsCCpbHaIC0hSuJMoyTxuqe4dA8UqiVBhXPrBZToVXJ/XsFZahvdvUtU
         okUOsnkEuh4UZeS44dMwNFAoWjlMGsjKemltQ5vmZvC0yihNdlbajQ0zOkJS9zXE/feB
         BJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ycID7DbnSZP9eaDdKUdtHxmB+2/7XuKoHI3CIq/KZU=;
        b=oVkZHuWuJadS/BBRZjBH/qYlBidvgt9aWspmN7mLF9KNypZWWGQo0GN+PN6e69Ps53
         blw8ikEesCpQeRQ/Mt6QxFYYbm3y2kFvmvIQ+9PiHMQLSTjah2eNgMpOlvACAg7Fq30T
         ZzjLn71n7Q+UexGw9aR1fbti/zeHYrlNeX74O4icWJi080S4Jy+3Eoa5B1BBzKLg2oMf
         BqUsjf+GCSLqRukvTwIq9IDKfoviGywNWtTHqKnH7YkShmK/HEt7UN6T9qGRtjdXX7uW
         s2tVPDSyZ/I2HR2XjVpwrURim5Cx3ukmCKBfFXnCA7eL8fWj15h75iBEz8BHvyYpM41g
         Myxw==
X-Gm-Message-State: AOAM5333i0upHc3o1zr87zFmqdR+ZEzzPsRiCBgMsBnmZh97/lhe114O
        D3uUHVHUtpAf2UZuM20GPXQS0KMsjXaw0SgJy0c=
X-Google-Smtp-Source: ABdhPJw1QqhinOwO4jllcnvXxgpVFMS7su2PcbZWi0JnPyMT+n+Bj40r0AGZmLY6UjTJJqLlDf8lVpVVfdQrNbCTlz0=
X-Received: by 2002:a63:4145:: with SMTP id o66mr889626pga.4.1623866907518;
 Wed, 16 Jun 2021 11:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210603224007.120560-1-djrscally@gmail.com> <20210603224007.120560-6-djrscally@gmail.com>
 <ea322abe-fa78-bbc3-b4c5-b372a4f28235@redhat.com>
In-Reply-To: <ea322abe-fa78-bbc3-b4c5-b372a4f28235@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Jun 2021 21:08:11 +0300
Message-ID: <CAHp75VccZbv8+u-jO8wYSsyQrw+Bd_zeDa==aiTvkh=fteuT3w@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 16, 2021 at 8:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 6/4/21 12:40 AM, Daniel Scally wrote:
> > ACPI devices with _HID INT3472 are currently matched to the tps68470
> > driver, however this does not cover all situations in which that _HID
> > occurs. We've encountered three possibilities:
> >
> > 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
> > a physical TPS68470 device) that requires a GPIO and OpRegion driver
> > 2. On devices designed for Windows, an ACPI device with _HID INT3472
> > (again representing a physical TPS68470 device) which requires GPIO,
> > Clock and Regulator drivers.
> > 3. On other devices designed for Windows, an ACPI device with _HID
> > INT3472 which does **not** represent a physical TPS68470, and is instead
> > used as a dummy device to group some system GPIO lines which are meant
> > to be consumed by the sensor that is dependent on this entry.
> >
> > This commit adds a new module, registering a platform driver to deal
> > with the 3rd scenario plus an i2c driver to deal with #1 and #2, by
> > querying the CLDB buffer found against INT3472 entries to determine
> > which is most appropriate.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> I've fixed up the missing static marking of skl_int3472_tps68470_calc_type()
> spotted by lkp@intel.com while applying the patch to my tree.

Are you going to apply patch 6 as well?
IIRC it's acked by Lee.

-- 
With Best Regards,
Andy Shevchenko
