Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FAF2FA5D1
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 17:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406489AbhARQPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 11:15:13 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43302 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406484AbhARQPJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 11:15:09 -0500
Received: by mail-oi1-f179.google.com with SMTP id q25so18165410oij.10;
        Mon, 18 Jan 2021 08:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kytasFWKgvc5nOgZfApzBHs9Vw3bTByXjqhFQofMSYo=;
        b=RGI6HfMoHdxn5lyZ+SlMsj2bSwT8qKwQpbYmgsWhn9OFG0Am9NViYAZ91tMMjFU+eP
         ui5lE3XjrbdqeDAgQOJslQSGsIZaNG1j+vJ6sE8Y1NqnyekEk3ctLRV8qhTzDKQAWRmO
         wDBMGIyOQyA7uTQA1gXM4vCc5gSEZ8tb0b6Z8USchHFg9FrBHVPStUccznOAIkvJbPEy
         MoMyJqkthuipkg/el6xyY7nPRHr4a+4riyJgIZVz7KRN6erEoym+M0LjYz/WVL3C8sJ7
         Nf+JwwHlDFt+/cTbXXuR1bgKzsiDxVLeZjzkTGHY6dN1g2oGooJwGOTgWMve7OYY+jTR
         NwBw==
X-Gm-Message-State: AOAM530zBHSQpZSaF4htpm3zwggfKKNGwxATFtskCm7oCM1jvKb6SWzW
        cSIQZzxl3m/BXC2UzMFk1DIulYx7m+OQoFFdtxI=
X-Google-Smtp-Source: ABdhPJzcYWh4Vned6TY+/VKW3DmEPz34IY9LpEHScCK2HKDVDzY0CKS2HMxu5PygiGqOof6JgT3sOGKw7PMfZula10Q=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr47953oib.157.1610986468728;
 Mon, 18 Jan 2021 08:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
In-Reply-To: <20210118003428.568892-3-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 18 Jan 2021 17:14:17 +0100
Message-ID: <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent acpi_devices
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> In some ACPI tables we encounter, devices use the _DEP method to assert
> a dependence on other ACPI devices as opposed to the OpRegions that the
> specification intends. We need to be able to find those devices "from"
> the dependee, so add a function to parse all ACPI Devices and check if
> the include the handle of the dependee device in their _DEP buffer.

What exactly do you need this for?

Would it be practical to look up the suppliers in acpi_dep_list instead?

Note that supplier drivers may remove entries from there, but does
that matter for your use case?

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
>         - Used acpi_lpss_dep() as Andy suggested.
>
>  drivers/acpi/utils.c    | 34 ++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  2 ++
>  2 files changed, 36 insertions(+)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 78b38775f18b..ec6a2406a886 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -831,6 +831,18 @@ bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
>         return false;
>  }
>
> +static int acpi_dev_match_by_dep(struct device *dev, const void *data)
> +{
> +       struct acpi_device *adev = to_acpi_device(dev);
> +       const struct acpi_device *dependee = data;
> +       acpi_handle handle = dependee->handle;
> +
> +       if (acpi_lpss_dep(adev, handle))
> +               return 1;
> +
> +       return 0;
> +}
> +
>  /**
>   * acpi_dev_present - Detect that a given ACPI device is present
>   * @hid: Hardware ID of the device.
> @@ -866,6 +878,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
>  }
>  EXPORT_SYMBOL(acpi_dev_present);
>
> +/**
> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev
> + * @adev: Pointer to the dependee device
> + * @prev: Pointer to the previous dependent device (or NULL for first match)
> + *
> + * Return the next ACPI device which declares itself dependent on @adev in
> + * the _DEP buffer.
> + *
> + * The caller is responsible to call put_device() on the returned device.
> + */
> +struct acpi_device *acpi_dev_get_next_dep_dev(struct acpi_device *adev,
> +                                             struct acpi_device *prev)
> +{
> +       struct device *start = prev ? &prev->dev : NULL;
> +       struct device *dev;
> +
> +       dev = bus_find_device(&acpi_bus_type, start, adev, acpi_dev_match_by_dep);
> +
> +       return dev ? to_acpi_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(acpi_dev_get_next_dep_dev);
> +
>  /**
>   * acpi_dev_get_next_match_dev - Return the next match of ACPI device
>   * @adev: Pointer to the previous acpi_device matching this @hid, @uid and @hrv
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 02a716a0af5d..33deb22294f2 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -683,6 +683,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
> +struct acpi_device *
> +acpi_dev_get_next_dep_dev(struct acpi_device *adev, struct acpi_device *prev);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *
> --
> 2.25.1
>
