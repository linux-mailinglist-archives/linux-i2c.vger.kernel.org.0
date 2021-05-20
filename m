Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D5438B615
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 20:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhETSe4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 14:34:56 -0400
Received: from mail-oo1-f42.google.com ([209.85.161.42]:33464 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbhETSez (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 14:34:55 -0400
Received: by mail-oo1-f42.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so4022008oot.0;
        Thu, 20 May 2021 11:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VpIZNz0K+hrxnCAMqgX+GPbbK86F0GzoMq8JmMIGB7w=;
        b=GK4z/Lyn3/Yv9zAQgDPIP247ZIy3vqJ5084pFF4+qC3n8CsEYBFo93LP0kCNaSXfTI
         Cno/PKiz9eMdFGpaPxVvdrStrRcj5a7/i1b2WArii4WGagifu6y/p06M6NsaRbAPf0GZ
         /V/cebsYhJs/tf0XxTYfG820iIy7tG7fRVT8Pn81By7J+rPNHLnI0+kYpZq49kOo/Rex
         ucdy5TaSjqer7gF9GTGPLmw1ddoWcqN/dT++6NYkyx7vrEWPLKpyxOFznRc/DS6ssGEY
         pbaLd9FCjl7QXHMnuPDReJcAN5YxgL7gbVqP2RJN6CCPirh5Cyc+Xqlxu/d6okALDhRv
         Ezpw==
X-Gm-Message-State: AOAM531I1IkmasjLeY9ZqpjyfOiV03i5bIwY+JhFSfvtxsjpo0a5869y
        KU1eqdhOO9OJviBliYxOSwQQvVunXG7Qw6lbwqg=
X-Google-Smtp-Source: ABdhPJyt7I5FNcJxtfGw3djcsM8WjYoSDjCWd/Wk635t7zznxdsE+ePyb48FtPDEjnEzSsgrW+Rdz3XedxcVLKfq4P0=
X-Received: by 2002:a4a:e5d5:: with SMTP id r21mr4913042oov.1.1621535612897;
 Thu, 20 May 2021 11:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210520140928.3252671-1-djrscally@gmail.com> <20210520140928.3252671-3-djrscally@gmail.com>
In-Reply-To: <20210520140928.3252671-3-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 20 May 2021 20:33:21 +0200
Message-ID: <CAJZ5v0hoDswjr+7r4uf6jZvV3t+-UDtEA0V7A_MvdT_34XrbJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] ACPI: scan: Add function to fetch dependent of
 acpi device
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 4:11 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> In some ACPI tables we encounter, devices use the _DEP method to assert
> a dependence on other ACPI devices as opposed to the OpRegions that the
> specification intends. We need to be able to find those devices "from"
> the dependee, so add a callback and a wrapper to walk over the
> acpi_dep_list and return the dependent ACPI device.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v3:
>
>         Both new functions were renamed.
>
>  drivers/acpi/scan.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  1 +
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 195635c3462b..1a76fbdfa669 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -2105,6 +2105,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>                 device->handler->hotplug.notify_online(device);
>  }
>
> +static int acpi_return_dep_dev(struct acpi_dep_data *dep, void *data)

What about calling this acpi_get_first_consumer_cb()?

> +{
> +       struct acpi_device *adev;
> +       int ret;
> +
> +       ret = acpi_bus_get_device(dep->consumer, &adev);
> +       if (ret)
> +               /* If we don't find an adev then we want to continue parsing */
> +               return 0;
> +
> +       *(struct acpi_device **)data = adev;

And it can do the get_device() here, can't it?

So maybe use acpi_bus_get_acpi_device() instead of
acpi_bus_get_device()?  Would be simpler.

> +
> +       return 1;
> +}
> +
>  static int acpi_scan_clear_dep(struct acpi_dep_data *dep, void *data)
>  {
>         struct acpi_device *adev;
> @@ -2168,6 +2183,29 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
>
> +/**
> + * acpi_dev_get_dependent_dev - Return ACPI device dependent on @supplier

And what about calling this acpi_get_first_consumer() ?

> + * @supplier: Pointer to the dependee device
> + *
> + * Returns the first &struct acpi_device which declares itself dependent on
> + * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
> + *
> + * The caller is responsible for putting the reference to adev when it is no
> + * longer needed.
> + */
> +struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier)
> +{
> +       struct acpi_device *adev = NULL;
> +
> +       acpi_walk_dep_device_list(supplier->handle, acpi_return_dep_dev, &adev);
> +
> +       if (adev)
> +               get_device(&adev->dev);
> +
> +       return adev;
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_get_dependent_dev);
> +
>  /**
>   * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
>   * @handle: Root of the namespace scope to scan.
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 0b2c4f170f4d..68d378207704 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -692,6 +692,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
>  void acpi_dev_clear_dependencies(struct acpi_device *supplier);
> +struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *
> --
> 2.25.1
>
