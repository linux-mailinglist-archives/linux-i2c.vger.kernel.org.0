Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911192A7BD5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 11:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKEKaY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 05:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKEKaX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 05:30:23 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB5EC0613CF;
        Thu,  5 Nov 2020 02:30:23 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id z3so1130647pfb.10;
        Thu, 05 Nov 2020 02:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOJzhBi9qk3xmG5fix9DYsoSpE+r8wExY1ctyU+UTJw=;
        b=ZFGg0rmd+NKsGP1OyIASx8mTbwh3Uu9BXu9U9MBP05Phu2doDelMHVRmPYn8vlzUfR
         Y8tK+NG7V8RxS5aepcBdOXe9cf0BVv73NTKHvZcEjdU9s43r4bHrKw5u49ZFdVxGU9f3
         7Lp6jphMm0UMK/LgTl+1jp3bQvz9Vkci9PB5etaia9b1oHO6+LgFlbaxVSYH1LO49o/L
         x6ChJEXbwDR1a4ivvi9Z2zInT97h4iU5+i9t46Gp1Kq+mhnv0+RifV2bqYR7MH0UQf59
         C2JmQ0oFy0YbqeKeQl9bkNMAuJylnoPvpju+/IFdgrisGnLq9i4g64eNwRr05gAjr2U4
         s4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOJzhBi9qk3xmG5fix9DYsoSpE+r8wExY1ctyU+UTJw=;
        b=fY69zfoHe3wd6kB0nRUh2RNhZAftHL+T9lw07yCVFtfxqsAd8y8W8sZiKiXHXh6BJY
         w74p2D4FrdPDBIdnAgiAURWeaV2HEM7RJ6wl94AH+O3EySnTKJiZnhAX4j8s55Fp3Qb2
         oZcsiPT2HCrArF2FTie4/qatpnLcgoh23jfLSqE/7hV2wLbr8zu9ioVUrLbPWJoH9UBW
         n+lMuQQWODyh1wABLhrBrxKH3cgFVY7h85hPc/ngGE9EHqO9aXofkHEc5woRnMSDG+Dj
         N6wezR6rXVb7q3alMxdNVnSlfZ1tRRttIgP1qYl187t97xx/PMi5nZGPwLvvoU7MsF+p
         xqjQ==
X-Gm-Message-State: AOAM530VZLHyG98UmrTx0mi+d3NZp5sLfF1UEz8iaRnxT9PKlhDZK0JA
        gy/m6yUe9oDJY4n5eDmnEdSEyMn4KV71MAUPRhIEvx/Q3No=
X-Google-Smtp-Source: ABdhPJwJkM5ITRaW0VukHEqhnAv7SD57QZo8ePx8R1HuR9klGopkfrnTCFDRouchicBXA3GDS0sDV9SkORsLh/99smE=
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr1724697pjb.181.1604572223128;
 Thu, 05 Nov 2020 02:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com> <20201105080014.45410-4-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 12:31:11 +0200
Message-ID: <CAHp75VfspJRRyKd1_K+akZXPHC=k91fnbGTs4SOK8NmPr20bLw@mail.gmail.com>
Subject: Re: [RFC 3/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated I2C-clients
To:     Hans de Goede <hdegoede@redhat.com>
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
> The ACPI fwnode may contain additional info which is useful for the
> I2C-driver. E.g. some accelerometer ACPI fwnode's contain an ACPI method
> providing rotation/mount matrix info.
>
> Pass the ACPI-fwnode to the instantiated I2C-clients by setting
> i2c_board_info.fwnode, so that the I2C-drivers can access this info.
>
> Now that we set i2c_board_info.irq to -ENOENT if there is no IRQ,
> avoiding the I2C-core assigning the first IRQ described in the ACPI
> resources to the client, this is safe to do.
>
> Setting the fwnode also influences acpi_device_[uevent_]modalias and
> acpi_dev_pm_attach, but these both call acpi_device_is_first_physical_node
> and are a no-op if this returns false.

Perhaps add () to the mentioned function calls.

> The first physical node for the ACPI fwnode is actually the ACPI core
> instantiated platform-device to which the I2C-multi-instantiate driver
> binds, so acpi_device_is_first_physical_node always returns false for
> the instantiated I2C-clients and thus we can safely pass the fwnode.

Ditto.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/i2c-multi-instantiate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index cb4688bdd6b6..cbccfcbed44c 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -93,6 +93,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>                 snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
>                          inst_data[i].type, i);
>                 board_info.dev_name = name;
> +               board_info.fwnode = dev->fwnode;
>                 switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
>                 case IRQ_RESOURCE_GPIO:
>                         ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
