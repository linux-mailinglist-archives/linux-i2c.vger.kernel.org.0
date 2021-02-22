Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C52632193F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhBVNp1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbhBVNnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:43:42 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3815C061794;
        Mon, 22 Feb 2021 05:41:37 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id z5so3413047pfe.3;
        Mon, 22 Feb 2021 05:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vjozFVKQtbd9R8z6ePqX0QDJApxB9ca8f7RZkFJnhg=;
        b=Hi9GAjgrttZNmbGX5K+2Kqqbg6M2du1eGsAq53n8CmzY5H1DnRMVhUv7cxcbhdG/KT
         6/uEjAsKYBtKHhjm9vAFCLvMsyzB2o2ZBNKPdj/wjzUhs/LukobtRL19TG3faPg2fhTA
         OrqKhFLw4if0HUzBja40r88q7kd42qHzs9VBaLb+FuNxV+lKOFjtI+KId3+Y9nT4eobz
         6C305sht8qnXNIS7qpR9vvPezT5AGl32MyAVUOdfA8RLXE3Q6D/5JRfRxWqujtb58cvB
         tTLiiHKQ6ghlMyGZ0zdhc/+uH/2JnIbTp/uytRxw82KF64mfONjlnM2TXTc5+9hdrMN/
         0XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vjozFVKQtbd9R8z6ePqX0QDJApxB9ca8f7RZkFJnhg=;
        b=DYWKdsFvrYQpmNEaZnOaGw/7rB/XRWRB8+ERqExF4PP8Dx0Gl5ivHWWa6iLSD1RCDb
         MNX30b8HYoZX6BgsCIBdS5wJRdvG0AXrC6n1Sm6y4ZgoI9yAiEAsWow0umnYgx62PuvD
         vn0n7aVAmFQtoBLhJQLtOoe7IGTt2rL4CVGOoj4fU1KM84rdHyTywKyFmAecNLEnDBJA
         STBIdzEK92kFxSwb4+BJB/SPE6FMN1DVNudy08aGZQtj654tspvFJzasIyjFNNPbDrQe
         fuNW6BASO6Phthva5jnaOXe3rRTRE4Vs+Uh2RH8bT0IPuvEGwiAJB542kUZ2XYM8eIBO
         npbA==
X-Gm-Message-State: AOAM533NCZM9FmXhGT+zi3f5p98pqm/NIoOSVJxVRGu9XrXQtW40OJpg
        +iFmRUXLZJNVtTr/Hab+C666F9fak0hNbcSZz9g=
X-Google-Smtp-Source: ABdhPJzpeHO5qMpXxlz6TPr3N1jkXmOoU620p7BHVZ1AhGbYNLUWadNWw3jbQVIbD9E7deEO9HIIndhy55p5PX2G5Jk=
X-Received: by 2002:a63:2643:: with SMTP id m64mr12349805pgm.4.1614001297293;
 Mon, 22 Feb 2021 05:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-3-djrscally@gmail.com>
In-Reply-To: <20210222130735.1313443-3-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Feb 2021 15:41:21 +0200
Message-ID: <CAHp75VeK-0gJ195mXjuZDPLKD4ROVKfFaoWw97yJ1NXpK1QVWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ACPI: scan: Add function to fetch dependent of
 acpi device
To:     Daniel Scally <djrscally@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 22, 2021 at 3:11 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> In some ACPI tables we encounter, devices use the _DEP method to assert
> a dependence on other ACPI devices as opposed to the OpRegions that the
> specification intends. We need to be able to find those devices "from"
> the dependee, so add a callback and a wrapper to walk over the
> acpi_dep_list and return the dependent ACPI device.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Nit-picks below as usual :-)

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
>         - Switched from a standalone function to a callback passed to
>           acpi_walk_dep_device_list().
>
>  drivers/acpi/scan.c     | 34 ++++++++++++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index c9e4190316ef..55626925261c 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -2093,6 +2093,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>                 device->handler->hotplug.notify_online(device);
>  }
>
> +static int __acpi_dev_get_dependent_dev(struct acpi_dep_data *dep, void *data)
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

Hmm... I'm wondering if
  *(void **data) = adev;
will compile and work.

But on second thought the current code is more specific and explicit,
which is good.

> +
> +       return 1;
> +}
> +
>  static int __acpi_dev_flag_dependency_met(struct acpi_dep_data *dep,
>                                           void *data)
>  {
> @@ -2145,6 +2160,25 @@ void acpi_dev_flag_dependency_met(acpi_handle handle)
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_flag_dependency_met);
>
> +/**
> + * acpi_dev_get_dependent_dev - Return ACPI device dependent on @adev
> + * @adev: Pointer to the dependee device
> + *
> + * Returns the first &struct acpi_device which declares itself dependent on
> + * @adev via the _DEP buffer, parsed from the acpi_dep_list.
> + */

> +struct acpi_device *
> +acpi_dev_get_dependent_dev(struct acpi_device *supplier)

I believe it will be okay to have it on one line

> +{
> +       struct acpi_device *adev = NULL;

> +       acpi_walk_dep_device_list(supplier->handle,
> +                                 __acpi_dev_get_dependent_dev, &adev);

Ditto.

> +       return adev;
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_get_dependent_dev);
> +
>  /**
>   * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
>   * @handle: Root of the namespace scope to scan.
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 91172af3a04d..5b14a9ae4ed5 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -690,6 +690,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
>  void acpi_dev_flag_dependency_met(acpi_handle handle);
> +struct acpi_device *acpi_dev_get_dependent_dev(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
