Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74FB38B5EE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 20:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhETSYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 14:24:11 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:39712 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbhETSYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 14:24:10 -0400
Received: by mail-ot1-f52.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so15713435otc.6;
        Thu, 20 May 2021 11:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IX/ac4BjZNav43xgZL5b4i1MehQkxK1N+LxnyUnsc0=;
        b=oOoAmVa1xesemsrELOGDQQZRdjkJg1urT+pytmibQyz4ra91546diTICqI+r/spMr7
         U9Bslo713pgOCYu187j1uDvM3dyT9rsmHpcmhXyOWBROnJFlVTSbHQko1RkiSX6Rkd5M
         cq/Quw0ChZWsBA4ZPcXhPnEv0r1Z8R7wmGBg5Cr7tQKQTgDHdKUssg5Y78+mca5IkRNW
         PMckqK63rQvaMPmbym70cU/wKnNAbCo70fehYJojcxjEXELZIiLGbpq6vqxNG1OThgiW
         2e6PxqVV7pCRbV4oHle9hrOWaE3xCuFvk0oCsMXR69I489OYOggYtJtZk+COq9OaE0Yl
         pJ1A==
X-Gm-Message-State: AOAM530od9tGFsej3DB0RJXiWG+Og+FMIWBAO8bpsKpcKqCngpXNNbux
        7n/08/qPTrLKEzeYBeslJrk24/JuxNAtO+ifKTad9em/
X-Google-Smtp-Source: ABdhPJwMlJB2Ltf1POusES4FGnW6V+NopVVcEbue0U22klLDch5P0wmpg5dcwcDov/sRR7Wn4o4SUrF15MWFGJ3xw24=
X-Received: by 2002:a9d:5a7:: with SMTP id 36mr4969914otd.321.1621534968544;
 Thu, 20 May 2021 11:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210520140928.3252671-1-djrscally@gmail.com> <20210520140928.3252671-2-djrscally@gmail.com>
In-Reply-To: <20210520140928.3252671-2-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 20 May 2021 20:22:37 +0200
Message-ID: <CAJZ5v0hy=AmbBK72w+ZsVZ4x0haQerTxeDnBXKOU5bOosUHgPA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] ACPI: scan: Extend acpi_walk_dep_device_list()
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
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 4:11 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> The acpi_walk_dep_device_list() is not as generalisable as its name
> implies, serving only to decrement the dependency count for each
> dependent device of the input. Extend the function to instead accept
> a callback which can be applied to all the dependencies in acpi_dep_list.
> Replace all existing calls to the function with calls to a wrapper, passing
> a callback that applies the same dependency reduction.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

LGTM, but I will have changes depending on it.

If that's fine by Hans, I'll take this one and expose it in a git
branch that won't be rebased.

> ---
> changes since v3:
>
>         - Most of the functions got renamed
>         - acpi_dev_get_dependent_dev() was altered to take a struct acpi_device
>         This had some repurcussions in the other files, mostly switching from
>         ACPI_HANDLE() to ACPI_COMPANION().
>         - acpi_walk_dep_device_list() was altered to check the return value of
>         the callback on each iteration of the loop, to allow for error handling
>         of the callbacks or breaking the loop early to save time. Andy, Wolfram,
>         I thought this change was significant enough to drop your R-b and Ack.
>
>  drivers/acpi/ec.c                             |  2 +-
>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |  2 +-
>  drivers/acpi/scan.c                           | 69 ++++++++++++++-----
>  drivers/gpio/gpiolib-acpi.c                   | 10 +--
>  drivers/i2c/i2c-core-acpi.c                   |  8 +--
>  drivers/platform/surface/aggregator/core.c    |  6 +-
>  drivers/platform/surface/surface3_power.c     | 22 +++---
>  .../platform/surface/surface_acpi_notify.c    |  7 +-
>  include/acpi/acpi_bus.h                       |  7 ++
>  include/linux/acpi.h                          |  4 +-
>  10 files changed, 90 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
> index 13565629ce0a..3f7680a007a3 100644
> --- a/drivers/acpi/ec.c
> +++ b/drivers/acpi/ec.c
> @@ -1627,7 +1627,7 @@ static int acpi_ec_add(struct acpi_device *device)
>         WARN(!ret, "Could not request EC cmd io port 0x%lx", ec->command_addr);
>
>         /* Reprobe devices depending on the EC */
> -       acpi_walk_dep_device_list(ec->handle);
> +       acpi_dev_clear_dependencies(device);
>
>         acpi_handle_debug(ec->handle, "enumerated.\n");
>         return 0;
> diff --git a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
> index a5101b07611a..fef7831d0d63 100644
> --- a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
> +++ b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
> @@ -117,7 +117,7 @@ static int chtdc_ti_pmic_opregion_probe(struct platform_device *pdev)
>                 return err;
>
>         /* Re-enumerate devices depending on PMIC */
> -       acpi_walk_dep_device_list(ACPI_HANDLE(pdev->dev.parent));
> +       acpi_dev_clear_dependencies(ACPI_COMPANION(pdev->dev.parent));
>         return 0;
>  }
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 453eff8ec8c3..195635c3462b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -47,12 +47,6 @@ static DEFINE_MUTEX(acpi_hp_context_lock);
>   */
>  static u64 spcr_uart_addr;
>
> -struct acpi_dep_data {
> -       struct list_head node;
> -       acpi_handle supplier;
> -       acpi_handle consumer;
> -};
> -
>  void acpi_scan_lock_acquire(void)
>  {
>         mutex_lock(&acpi_scan_lock);
> @@ -2111,30 +2105,69 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>                 device->handler->hotplug.notify_online(device);
>  }
>
> -void acpi_walk_dep_device_list(acpi_handle handle)
> +static int acpi_scan_clear_dep(struct acpi_dep_data *dep, void *data)
>  {
> -       struct acpi_dep_data *dep, *tmp;
>         struct acpi_device *adev;
>
> +       acpi_bus_get_device(dep->consumer, &adev);
> +
> +       if (adev) {
> +               adev->dep_unmet--;
> +               if (!adev->dep_unmet)
> +                       acpi_bus_attach(adev, true);
> +       }
> +
> +       list_del(&dep->node);
> +       kfree(dep);
> +
> +       return 0;
> +}
> +
> +/**
> + * acpi_walk_dep_device_list - Apply a callback to every entry in acpi_dep_list
> + * @handle:    The ACPI handle of the supplier device
> + * @callback:  Pointer to the callback function to apply
> + * @data:      Pointer to some data to pass to the callback
> + *
> + * The return value of the callback determines this function's behaviour. If 0
> + * is returned we continue to iterate over acpi_dep_list. If a positive value
> + * is returned then the loop is broken but this function returns 0. If a
> + * negative value is returned by the callback then the loop is broken and that
> + * value is returned as the final error.
> + */
> +int acpi_walk_dep_device_list(acpi_handle handle,
> +                             int (*callback)(struct acpi_dep_data *, void *),
> +                             void *data)
> +{
> +       struct acpi_dep_data *dep, *tmp;
> +       int ret;
> +
>         mutex_lock(&acpi_dep_list_lock);
>         list_for_each_entry_safe(dep, tmp, &acpi_dep_list, node) {
>                 if (dep->supplier == handle) {
> -                       acpi_bus_get_device(dep->consumer, &adev);
> -
> -                       if (adev) {
> -                               adev->dep_unmet--;
> -                               if (!adev->dep_unmet)
> -                                       acpi_bus_attach(adev, true);
> -                       }
> -
> -                       list_del(&dep->node);
> -                       kfree(dep);
> +                       ret = callback(dep, data);
> +                       if (ret)
> +                               break;
>                 }
>         }
>         mutex_unlock(&acpi_dep_list_lock);
> +
> +       return ret > 0 ? 0 : ret;
>  }
>  EXPORT_SYMBOL_GPL(acpi_walk_dep_device_list);
>
> +/**
> + * acpi_dev_clear_dependencies - Inform consumers that the device is now active
> + * @supplier: Pointer to the supplier &struct acpi_device
> + *
> + * Clear dependencies on the given device.
> + */
> +void acpi_dev_clear_dependencies(struct acpi_device *supplier)
> +{
> +       acpi_walk_dep_device_list(supplier->handle, acpi_scan_clear_dep, NULL);
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
> +
>  /**
>   * acpi_bus_scan - Add ACPI device node objects in a given namespace scope.
>   * @handle: Root of the namespace scope to scan.
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 3ef22a3c104d..5b4111e4be3f 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -1233,14 +1233,14 @@ static void acpi_gpiochip_scan_gpios(struct acpi_gpio_chip *achip)
>  void acpi_gpiochip_add(struct gpio_chip *chip)
>  {
>         struct acpi_gpio_chip *acpi_gpio;
> -       acpi_handle handle;
> +       struct acpi_device *adev;
>         acpi_status status;
>
>         if (!chip || !chip->parent)
>                 return;
>
> -       handle = ACPI_HANDLE(chip->parent);
> -       if (!handle)
> +       adev = ACPI_COMPANION(chip->parent);
> +       if (!adev)
>                 return;
>
>         acpi_gpio = kzalloc(sizeof(*acpi_gpio), GFP_KERNEL);
> @@ -1254,7 +1254,7 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
>         INIT_LIST_HEAD(&acpi_gpio->events);
>         INIT_LIST_HEAD(&acpi_gpio->deferred_req_irqs_list_entry);
>
> -       status = acpi_attach_data(handle, acpi_gpio_chip_dh, acpi_gpio);
> +       status = acpi_attach_data(adev->handle, acpi_gpio_chip_dh, acpi_gpio);
>         if (ACPI_FAILURE(status)) {
>                 dev_err(chip->parent, "Failed to attach ACPI GPIO chip\n");
>                 kfree(acpi_gpio);
> @@ -1263,7 +1263,7 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
>
>         acpi_gpiochip_request_regions(acpi_gpio);
>         acpi_gpiochip_scan_gpios(acpi_gpio);
> -       acpi_walk_dep_device_list(handle);
> +       acpi_dev_clear_dependencies(adev);
>  }
>
>  void acpi_gpiochip_remove(struct gpio_chip *chip)
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 8ceaa88dd78f..6f0aa0ed3241 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -259,8 +259,8 @@ static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
>   */
>  void i2c_acpi_register_devices(struct i2c_adapter *adap)
>  {
> +       struct acpi_device *adev;
>         acpi_status status;
> -       acpi_handle handle;
>
>         if (!has_acpi_companion(&adap->dev))
>                 return;
> @@ -275,11 +275,11 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
>         if (!adap->dev.parent)
>                 return;
>
> -       handle = ACPI_HANDLE(adap->dev.parent);
> -       if (!handle)
> +       adev = ACPI_COMPANION(adap->dev.parent);
> +       if (!adev)
>                 return;
>
> -       acpi_walk_dep_device_list(handle);
> +       acpi_dev_clear_dependencies(adev);
>  }
>
>  static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
> diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
> index 8dc2c267bcd6..517f774a6e60 100644
> --- a/drivers/platform/surface/aggregator/core.c
> +++ b/drivers/platform/surface/aggregator/core.c
> @@ -621,8 +621,8 @@ static const struct acpi_gpio_mapping ssam_acpi_gpios[] = {
>
>  static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  {
> +       struct acpi_device *ssh = ACPI_COMPANION(&serdev->dev);
>         struct ssam_controller *ctrl;
> -       acpi_handle *ssh = ACPI_HANDLE(&serdev->dev);
>         acpi_status astatus;
>         int status;
>
> @@ -652,7 +652,7 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>         if (status)
>                 goto err_devopen;
>
> -       astatus = ssam_serdev_setup_via_acpi(ssh, serdev);
> +       astatus = ssam_serdev_setup_via_acpi(ssh->handle, serdev);
>         if (ACPI_FAILURE(astatus)) {
>                 status = -ENXIO;
>                 goto err_devinit;
> @@ -706,7 +706,7 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>          *       For now let's thus default power/wakeup to false.
>          */
>         device_set_wakeup_capable(&serdev->dev, true);
> -       acpi_walk_dep_device_list(ssh);
> +       acpi_dev_clear_dependencies(ssh);
>
>         return 0;
>
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index cc4f9cba6856..dea82aa1abd4 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -446,12 +446,12 @@ mshw0011_space_handler(u32 function, acpi_physical_address command,
>
>  static int mshw0011_install_space_handler(struct i2c_client *client)
>  {
> -       acpi_handle handle;
> +       struct acpi_device *adev;
>         struct mshw0011_handler_data *data;
>         acpi_status status;
>
> -       handle = ACPI_HANDLE(&client->dev);
> -       if (!handle)
> +       adev = ACPI_COMPANION(&client->dev);
> +       if (!adev)
>                 return -ENODEV;
>
>         data = kzalloc(sizeof(struct mshw0011_handler_data),
> @@ -460,25 +460,25 @@ static int mshw0011_install_space_handler(struct i2c_client *client)
>                 return -ENOMEM;
>
>         data->client = client;
> -       status = acpi_bus_attach_private_data(handle, (void *)data);
> +       status = acpi_bus_attach_private_data(adev->handle, (void *)data);
>         if (ACPI_FAILURE(status)) {
>                 kfree(data);
>                 return -ENOMEM;
>         }
>
> -       status = acpi_install_address_space_handler(handle,
> -                               ACPI_ADR_SPACE_GSBUS,
> -                               &mshw0011_space_handler,
> -                               NULL,
> -                               data);
> +       status = acpi_install_address_space_handler(adev->handle,
> +                                                   ACPI_ADR_SPACE_GSBUS,
> +                                                   &mshw0011_space_handler,
> +                                                   NULL,
> +                                                   data);
>         if (ACPI_FAILURE(status)) {
>                 dev_err(&client->dev, "Error installing i2c space handler\n");
> -               acpi_bus_detach_private_data(handle);
> +               acpi_bus_detach_private_data(adev->handle);
>                 kfree(data);
>                 return -ENOMEM;
>         }
>
> -       acpi_walk_dep_device_list(handle);
> +       acpi_dev_clear_dependencies(adev);
>         return 0;
>  }
>
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index ef9c1f8e8336..8339988d95c1 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -798,7 +798,7 @@ static int san_consumer_links_setup(struct platform_device *pdev)
>
>  static int san_probe(struct platform_device *pdev)
>  {
> -       acpi_handle san = ACPI_HANDLE(&pdev->dev);
> +       struct acpi_device *san = ACPI_COMPANION(&pdev->dev);
>         struct ssam_controller *ctrl;
>         struct san_data *data;
>         acpi_status astatus;
> @@ -821,7 +821,8 @@ static int san_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, data);
>
> -       astatus = acpi_install_address_space_handler(san, ACPI_ADR_SPACE_GSBUS,
> +       astatus = acpi_install_address_space_handler(san->handle,
> +                                                    ACPI_ADR_SPACE_GSBUS,
>                                                      &san_opreg_handler, NULL,
>                                                      &data->info);
>         if (ACPI_FAILURE(astatus))
> @@ -835,7 +836,7 @@ static int san_probe(struct platform_device *pdev)
>         if (status)
>                 goto err_install_dev;
>
> -       acpi_walk_dep_device_list(san);
> +       acpi_dev_clear_dependencies(san);
>         return 0;
>
>  err_install_dev:
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 3a82faac5767..0b2c4f170f4d 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -280,6 +280,12 @@ struct acpi_device_power {
>         struct acpi_device_power_state states[ACPI_D_STATE_COUNT];      /* Power states (D0-D3Cold) */
>  };
>
> +struct acpi_dep_data {
> +       struct list_head node;
> +       acpi_handle supplier;
> +       acpi_handle consumer;
> +};
> +
>  /* Performance Management */
>
>  struct acpi_device_perf_flags {
> @@ -685,6 +691,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
> +void acpi_dev_clear_dependencies(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index c60745f657e9..170b9bebdb2b 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -666,7 +666,9 @@ extern bool acpi_driver_match_device(struct device *dev,
>                                      const struct device_driver *drv);
>  int acpi_device_uevent_modalias(struct device *, struct kobj_uevent_env *);
>  int acpi_device_modalias(struct device *, char *, int);
> -void acpi_walk_dep_device_list(acpi_handle handle);
> +int acpi_walk_dep_device_list(acpi_handle handle,
> +                             int (*callback)(struct acpi_dep_data *, void *),
> +                             void *data);
>
>  struct platform_device *acpi_create_platform_device(struct acpi_device *,
>                                                     struct property_entry *);
> --
> 2.25.1
>
