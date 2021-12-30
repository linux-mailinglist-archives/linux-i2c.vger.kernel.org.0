Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8963E481E46
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240304AbhL3Qjj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 11:39:39 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:39847 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240245AbhL3Qj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 11:39:27 -0500
Received: by mail-qk1-f171.google.com with SMTP id 69so23116065qkd.6;
        Thu, 30 Dec 2021 08:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bm7jaDM/1r+5Yl5UxNXTHdA2HASuhgHh1K8xe2yBSE=;
        b=NqyQf/rnhuqkGDJ74AeNZkt49P0VUJExuqK7tYL6nUGFIKdBorbt9DiEsJTcrl75Xa
         8IW2EfxlCdO2KA7OvdZppVekR56IZvi/6eK2RGgB3fYGcdeKRxrids/7CcetygmRF7zg
         xzlCPGkSpZJi04v7YE+DMf1A7dSxgvlkQ3/Do004zoMtou5Dd/03GtzdDinsrXVoAlx/
         BIoZXL5aX+T1ll0Jlb9J4qjJCYHEFNYDcvBrrDzM0AvfGRH64f+KdSSGA/NPwuzMwaFL
         Ln9izzT7RV73DIDhc0bNnv8tyhL2GzCKxM3RQmPU0MU2qb+GCvlw2gxa3ZNhqfbVSqMk
         PBfQ==
X-Gm-Message-State: AOAM530QDN/1bxzsHHtRZYf+KQzfRrpZF7iP0M+/tshAtb/d95QtZIi3
        CjJAm/eY2gbddyC91kgUehFYshfTvQzhl7VrbtdvSMPk
X-Google-Smtp-Source: ABdhPJzo34GPmk3pOAgVa7wfeCxCIRR3GX8mHq4AzQd7Rd+nb3Gthj8t3a04HsfebZJFnetKP6EMXz4cjXxDO0hcKIg=
X-Received: by 2002:a05:620a:4721:: with SMTP id bs33mr22880881qkb.8.1640882366655;
 Thu, 30 Dec 2021 08:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20211230141722.512395-1-hdegoede@redhat.com> <20211230141722.512395-2-hdegoede@redhat.com>
In-Reply-To: <20211230141722.512395-2-hdegoede@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 30 Dec 2021 17:39:15 +0100
Message-ID: <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add acpi_quirk_skip_[i2c_client|serdev]_enumeration()
 helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 30, 2021 at 3:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> x86 ACPI boards which ship with only Android as their factory image usually
> declare a whole bunch of bogus I2C devs in their ACPI tables and sometimes
> there are issues with serdev devices on these boards too, e.g. the resource
> points to the wrong serdev_controller.
>
> Instantiating I2C / serdev devs for these bogus devs causes various issues,
> e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
> The Android x86 kernel fork shipped on these devices has some special code
> to remove the bogus I2C clients (and serdevs are ignored completely).
>
> Introduce acpi_quirk_skip_i2c_client_enumeration() and
> acpi_quirk_skip_serdev_enumeration() helpers. Which can be used by the I2C/
> serdev code to skip instantiating any I2C or serdev devs on broken boards.
>
> These 2 helpers are added to drivers/acpi/x86/utils.c so that the DMI table
> can be shared between the I2C and serdev code.
>
> Note these boards typically do actually have I2C and serdev devices, just
> different ones then the ones described in their DSDT. The devices which
> are actually present are manually instantiated by the
> drivers/platform/x86/x86-android-tablets.c kernel module.
>
> The new helpers are only build if CONFIG_X86_ANDROID_TABLETS is enabled,
> otherwise they are empty stubs to not unnecessarily grow the kernel size.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Move the i2c_acpi_known_good_ids[] list and checking into this patch /
>   into the new acpi_quirk_skip_i2c_client_enumeration() function

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

or please let me know if you want me to take this series.

Thanks!

> ---
>  drivers/acpi/x86/utils.c | 111 +++++++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h  |  16 ++++++
>  2 files changed, 127 insertions(+)
>
> diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
> index a2ae1ac41319..375a0911f06d 100644
> --- a/drivers/acpi/x86/utils.c
> +++ b/drivers/acpi/x86/utils.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
> +#include <linux/platform_device.h>
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
>  #include "../internal.h"
> @@ -208,3 +209,113 @@ bool force_storage_d3(void)
>  {
>         return x86_match_cpu(storage_d3_cpu_ids);
>  }
> +
> +#if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
> +/*
> + * x86 ACPI boards which ship with only Android as their factory image usually
> + * declare a whole bunch of bogus I2C devices in their ACPI tables and sometimes
> + * there are issues with serdev devices on these boards too, e.g. the resource
> + * points to the wrong serdev_controller.
> + *
> + * Instantiating I2C / serdev devs for these bogus devs causes various issues,
> + * e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
> + * The Android x86 kernel fork shipped on these devices has some special code
> + * to remove the bogus I2C clients (and AFAICT serdevs are ignored completely).
> + *
> + * The acpi_quirk_skip_*_enumeration() functions below are used by the I2C or
> + * serdev code to skip instantiating any I2C or serdev devs on broken boards.
> + *
> + * In case of I2C an exception is made for HIDs on the i2c_acpi_known_good_ids
> + * list. These are known to always be correct (and in case of the audio-codecs
> + * the drivers heavily rely on the codec being enumerated through ACPI).
> + *
> + * Note these boards typically do actually have I2C and serdev devices,
> + * just different ones then the ones described in their DSDT. The devices
> + * which are actually present are manually instantiated by the
> + * drivers/platform/x86/x86-android-tablets.c kernel module.
> + */
> +#define ACPI_QUIRK_SKIP_I2C_CLIENTS                            BIT(0)
> +#define ACPI_QUIRK_UART1_TTY_UART2_SKIP                                BIT(1)
> +
> +static const struct dmi_system_id acpi_skip_serial_bus_enumeration_ids[] = {
> +       {
> +               .matches = {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
> +               },
> +               .driver_data = (void *)(ACPI_QUIRK_SKIP_I2C_CLIENTS |
> +                                       ACPI_QUIRK_UART1_TTY_UART2_SKIP),
> +       },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
> +               },
> +               .driver_data = (void *)ACPI_QUIRK_SKIP_I2C_CLIENTS,
> +       },
> +       {
> +               /* Whitelabel (sold as various brands) TM800A550L */
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> +                       /* Above strings are too generic, also match on BIOS version */
> +                       DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
> +               },
> +               .driver_data = (void *)ACPI_QUIRK_SKIP_I2C_CLIENTS,
> +       },
> +       {}
> +};
> +
> +static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
> +       { "10EC5640", 0 }, /* RealTek ALC5640 audio codec */
> +       { "INT33F4", 0 },  /* X-Powers AXP288 PMIC */
> +       { "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
> +       { "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
> +       {}
> +};
> +
> +bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)
> +{
> +       const struct dmi_system_id *dmi_id;
> +       long quirks;
> +
> +       dmi_id = dmi_first_match(acpi_skip_serial_bus_enumeration_ids);
> +       if (!dmi_id)
> +               return false;
> +
> +       quirks = (unsigned long)dmi_id->driver_data;
> +       if (!(quirks & ACPI_QUIRK_SKIP_I2C_CLIENTS))
> +               return false;
> +
> +       return acpi_match_device_ids(adev, i2c_acpi_known_good_ids);
> +}
> +EXPORT_SYMBOL_GPL(acpi_quirk_skip_i2c_client_enumeration);
> +
> +int acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip)
> +{
> +       struct acpi_device *adev = ACPI_COMPANION(controller_parent);
> +       const struct dmi_system_id *dmi_id;
> +       long quirks = 0;
> +
> +       *skip = false;
> +
> +       /* !dev_is_platform() to not match on PNP enumerated debug UARTs */
> +       if (!adev || !adev->pnp.unique_id || !dev_is_platform(controller_parent))
> +               return 0;
> +
> +       dmi_id = dmi_first_match(acpi_skip_serial_bus_enumeration_ids);
> +       if (dmi_id)
> +               quirks = (unsigned long)dmi_id->driver_data;
> +
> +       if (quirks & ACPI_QUIRK_UART1_TTY_UART2_SKIP) {
> +               if (!strcmp(adev->pnp.unique_id, "1"))
> +                       return -ENODEV; /* Create tty cdev instead of serdev */
> +
> +               if (!strcmp(adev->pnp.unique_id, "2"))
> +                       *skip = true;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_quirk_skip_serdev_enumeration);
> +#endif
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 5895f6c7f6db..102b1cf433c7 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -624,6 +624,22 @@ static inline bool acpi_device_override_status(struct acpi_device *adev,
>  }
>  #endif
>
> +#if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
> +bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev);
> +int acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip);
> +#else
> +static inline bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)
> +{
> +       return false;
> +}
> +static inline int
> +acpi_quirk_skip_serdev_enumeration(struct device *controller_parent, bool *skip)
> +{
> +       *skip = false;
> +       return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_PM
>  void acpi_pm_wakeup_event(struct device *dev);
>  acpi_status acpi_add_pm_notifier(struct acpi_device *adev, struct device *dev,
> --
> 2.33.1
>
