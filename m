Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFEB40C4F2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Sep 2021 14:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhIOMKq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Sep 2021 08:10:46 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:43803 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235416AbhIOMKq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Sep 2021 08:10:46 -0400
Received: by mail-ot1-f53.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3188347ott.10;
        Wed, 15 Sep 2021 05:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fkujh9PxjM71OGPCKrpOg5lJgUP2CUgVoVH8yR4BaIY=;
        b=DNyLiE6eFWDFmU1FntmZecSYuP0M8T8J82CdqxPwD6J29p1p4p3aaH1dB15LFZUrsx
         r8dXZlXhWsDuM1ROw3tyANh4QktrJWwyiDNFOlIcVMFQjQznK3GALrxp5+tc7/923eYH
         qVP2YQdZOEeydzCjWMCALi1jfVHKqqzZxni2nYdt9PLWhlFpLHcSxTXONKVrbKVUz5X+
         p0QcAiWyF5jJBXjUVhWJhQP9ZNDTk/vi601USWo5K7GCXnVk+7kvtR3iGQeyRmSU7HhV
         dNgv0Jg3tMWl1EU5IgqFkw9NQm2ClT28ngik8OIviN8Sd6c+VQ2wY76HkR4mWFNdg5GW
         k98w==
X-Gm-Message-State: AOAM53196mjqu+o6fVth/ZYWNMkFkWq8Mrm/3oIjHSw/UrfHF9uFHAZM
        PMBPGH/rCNKiKou+ONMrz4hwEw8GhxILu4+A1X0=
X-Google-Smtp-Source: ABdhPJxk6BVtXcDyIPp33kbFV9HvmABGYLNh4VPt4/bLsHcNTvkqUEd7QXO8B6bKHtYB2adHxjqd1MlVJohjM0Y83aU=
X-Received: by 2002:a9d:6945:: with SMTP id p5mr19255341oto.301.1631707767135;
 Wed, 15 Sep 2021 05:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
In-Reply-To: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 15 Sep 2021 14:09:14 +0200
Message-ID: <CAJZ5v0igfoTuB49s+EEUYx+q_7N-GhsSyE-DQQmF_VEqOxWyZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: i801: Stop using pm_runtime_set_autosuspend_delay(-1)
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 7, 2021 at 10:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> The original change works as intended, but Andy pointed in [0] that now
> userspace could re-enable RPM via sysfs, even though we explicitly want
> to disable it. So effectively revert the original patch, just with small
> improvements:
> - Calls to pm_runtime_allow()/pm_runtime_forbid() don't have to be
>   balanced, so we can remove the call to pm_runtime_forbid() in
>   i801_remove().
> - priv->acpi_reserved is accessed after i801_acpi_remove(), and according
>   to Robert [1] the custom handler can't run any longer. Therefore we
>   don't have to take priv->acpi_lock.
>
> [0] https://www.spinics.net/lists/linux-i2c/msg52730.html
> [1] https://lore.kernel.org/linux-acpi/BYAPR11MB32561D19A0FD9AB93E2B1E5287D39@BYAPR11MB3256.namprd11.prod.outlook.com/T/#t
>
> Fixes: 4e60d5dd10cd ("i2c: i801: Improve disabling runtime pm")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
> - Resend because I missed to cc linux-i2c list
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 1f929e6c3..f3c79942c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1623,7 +1623,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>                  * BIOS is accessing the host controller so prevent it from
>                  * suspending automatically from now on.
>                  */
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> +               pm_runtime_get_sync(&pdev->dev);
>         }
>
>         if ((function & ACPI_IO_MASK) == ACPI_READ)
> @@ -1890,9 +1890,6 @@ static void i801_remove(struct pci_dev *dev)
>  {
>         struct i801_priv *priv = pci_get_drvdata(dev);
>
> -       pm_runtime_forbid(&dev->dev);
> -       pm_runtime_get_noresume(&dev->dev);
> -
>         i801_disable_host_notify(priv);
>         i801_del_mux(priv);
>         i2c_del_adapter(&priv->adapter);
> @@ -1901,6 +1898,10 @@ static void i801_remove(struct pci_dev *dev)
>
>         platform_device_unregister(priv->tco_pdev);
>
> +       /* if acpi_reserved is set then usage_count is incremented already */
> +       if (!priv->acpi_reserved)
> +               pm_runtime_get_noresume(&dev->dev);
> +
>         /*
>          * do not call pci_disable_device(dev) since it can cause hard hangs on
>          * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
> --
> 2.33.0
>
