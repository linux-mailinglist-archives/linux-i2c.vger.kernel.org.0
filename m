Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5374239DFA7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhFGOzG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:55:06 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:40491 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhFGOzA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 10:55:00 -0400
Received: by mail-oi1-f171.google.com with SMTP id r17so8056084oic.7;
        Mon, 07 Jun 2021 07:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFKKKRb67LGq4j/7jOKF7wGRXnfTmyHqm4pxSTe6iqE=;
        b=mBQdOWvRwOxHF6ABeBC4ZKP8EUTILSIqM85QZ+mB8CMCIdkVn6x5IxwPArAI9GEkNU
         YmgnT6mFBLVbNQQav2zxaqWW3MhRh4yC/XZHDRYVARmnS4iKsJQzyijuhUeJTQZVow40
         aDVedgN1gWvzsZIOfTfSYsbRaOueegEQWQJFwaparxXeg9M3mlHBA7YAJe1FJti6rpC3
         eL8fPXCb7X1xNOaRmsVAXCjaV4zb31UwJs+3bxCp/6PSxTyjg66ii5tGBlg+Hbuu4txX
         slEPoBpDdSlj2H73XuL5l6CLaRrjhCrVArW2wkhPgYADr6Yh58K9HsMN9G7fSq5iCtUe
         gicw==
X-Gm-Message-State: AOAM532t9y+AIl1t/wVdl/bph5kFR+1RheBvz5FnlHpAC09YpkyV+BJK
        q/E0pbcq32t48TOH+ao5yhHr/09n5vGdXFKdTuc=
X-Google-Smtp-Source: ABdhPJwuRWOyfnhsiiN2oAZTElAD/OIy6HNxvm4F6pIar5hcDOtjzrcZfAXKJpjv2/tbxAHYxWHt/mSVGktoFLA+unc=
X-Received: by 2002:aca:b406:: with SMTP id d6mr11602849oif.71.1623077574350;
 Mon, 07 Jun 2021 07:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210603224007.120560-1-djrscally@gmail.com> <20210603224007.120560-3-djrscally@gmail.com>
In-Reply-To: <20210603224007.120560-3-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 7 Jun 2021 16:52:43 +0200
Message-ID: <CAJZ5v0j8pLo3pjuByYxJue9mr4TOGieYTHm8tghNQgk+LphL=w@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: scan: Add function to fetch dependent of
 acpi device
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
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
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 4, 2021 at 12:41 AM Daniel Scally <djrscally@gmail.com> wrote:
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
> Changes since v5:
>
>         - Functions renamed
>
>  drivers/acpi/scan.c     | 35 +++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  1 +
>  2 files changed, 36 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 195635c3462b..9af64c34e286 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -2105,6 +2105,20 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>                 device->handler->hotplug.notify_online(device);
>  }
>
> +static int acpi_dev_get_first_consumer_dev_cb(struct acpi_dep_data *dep, void *data)
> +{
> +       struct acpi_device *adev;
> +
> +       adev = acpi_bus_get_acpi_device(dep->consumer);
> +       if (!adev)
> +               /* If we don't find an adev then we want to continue parsing */
> +               return 0;
> +
> +       *(struct acpi_device **)data = adev;
> +
> +       return 1;
> +}
> +
>  static int acpi_scan_clear_dep(struct acpi_dep_data *dep, void *data)
>  {
>         struct acpi_device *adev;
> @@ -2168,6 +2182,27 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
>
> +/**
> + * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
> + * @supplier: Pointer to the dependee device
> + *
> + * Returns the first &struct acpi_device which declares itself dependent on
> + * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
> + *
> + * The caller is responsible for putting the reference to adev when it is no
> + * longer needed.
> + */
> +struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier)
> +{
> +       struct acpi_device *adev = NULL;
> +
> +       acpi_walk_dep_device_list(supplier->handle,
> +                                 acpi_dev_get_first_consumer_dev_cb, &adev);
> +
> +       return adev;
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_get_first_consumer_dev);
> +
>  /**
>   * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
>   * @handle: Root of the namespace scope to scan.
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 0b2c4f170f4d..4bed30e61c5b 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -692,6 +692,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
>  void acpi_dev_clear_dependencies(struct acpi_device *supplier);
> +struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *
> --

Applied as 5.14 material along the [1/6].

I'll expose a branch containing the 2 patches to pull from later this week.

Thanks!
