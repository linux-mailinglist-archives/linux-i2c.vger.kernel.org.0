Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632DF138F5D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 11:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgAMKlZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 13 Jan 2020 05:41:25 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40474 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgAMKlY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 05:41:24 -0500
Received: by mail-ot1-f65.google.com with SMTP id w21so8474975otj.7;
        Mon, 13 Jan 2020 02:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XoJuS01vPQ4pN0b1Cp7e9TdKG+2c5zyK3vQd3vSp1BE=;
        b=uCsBp1yqPy7YmqcyyHfBxDfscrmXqjfwfaz3jDM/Ij1Vd5GF3+168idqaEKKGo+7zs
         YsLoFwsrV57a0u2IcyLFaqZ4Rpboq7h6qBVBRhNbHgM0LOKxuFITsNCIYG8+JV+aBQv9
         uae0gzI7LGoincI3jx6z1k/Hti9yxKX3Gf7jykm/YgC6dSan1hjt7ozTPyj2XHGzjk2Q
         mcrqXQtWe7DKjbmdSOoM12rQ/8G7NfVhS4r2F4zoRLGM1EzfdQkdeebCCwFk8xZV2/+R
         6vjMKdVzNNSAj60wElDl+WiB1kwba9+bJ3EW68m3UWJnGuT5i5Tmp9ygYzE0KzbZ6N6i
         W8xw==
X-Gm-Message-State: APjAAAUUenw4dJwBN5WxSGn93A0p8Pz8pEjNUnw3nYmLIrcP0LzkO9to
        XZcVB/OxhDoa4ol5XwCjaumuefnTzi+VHfLaYU9XHhar
X-Google-Smtp-Source: APXvYqwa5gGw8qcimQGa6PNGfDx1jPzYIi9NPt7xRXjzNeTA3BeF3VN1gXT/xLiMsDYGTIrnOeIl46vhNuj+RhZo9Yo=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr3910234otl.118.1578912083671;
 Mon, 13 Jan 2020 02:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com> <20200109154529.19484-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20200109154529.19484-3-sakari.ailus@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 13 Jan 2020 11:41:12 +0100
Message-ID: <CAJZ5v0hfGateSt-_EBuyHqLYi5NR4PUFB=wDF+Gu+9-tFXuohg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ACPI: Add a convenience function to tell a device
 is suspended in probe
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 9, 2020 at 4:44 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add a convenience function to tell whether a device is suspended for probe
> or remove, for busses where the custom is that drivers don't need to
> resume devices in probe, or suspend them in their remove handlers.
>
> Returns false on non-ACPI systems.
>
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/acpi/device_pm.c | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h     |  5 +++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> index 5e4a8860a9c0c..87393020276d8 100644
> --- a/drivers/acpi/device_pm.c
> +++ b/drivers/acpi/device_pm.c
> @@ -1348,4 +1348,39 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
>         return 1;
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_pm_attach);
> +
> +/**
> + * acpi_dev_low_power_state_probe - Tell if a device is in a low power state

"Check the current ACPI power state of a device."

> + *                                 during probe

Why is this limited to probe?

The function actually checks whether or not the ACPI power state of
the device is low-power at the call time (except that it is a bit racy
with respect to _set_power(), so it may not work as expected if called
in parallel with that one).

Maybe drop the "probe" part of the name (actually, I would call this
function acpi_dev_state_low_power()) and add a paragraph about the
potential race with _set_power() to the description?

> + * @dev: The device

"Physical device the ACPI power state of which to check".

> + *
> + * Tell whether a given device is in a low power state during the driver's probe
> + * or remove operation.
> + *
> + * Drivers of devices on certain busses such as I²C can generally assume (on
> + * ACPI based systems) that the devices they control are powered on without
> + * driver having to do anything about it. Using struct
> + * device_driver.probe_low_power and "probe-low-power" property, this can be
> + * negated and the driver has full control of the device power management.

The above information belongs somewhere else in my view.

> + * Always returns false on non-ACPI based systems. True is returned on ACPI

"On a system without ACPI, return false.  On a system with ACPI,
return true if the current ACPI power state of the device is not D0,
or false otherwise.

Note that the power state of a device is not well-defined after it has
been passed to acpi_device_set_power() and before that function
returns, so it is not valid to ask for the ACPI power state of the
device in that time frame."

> + * based systems iff the device is in a low power state during probe or remove.
> + */
> +bool acpi_dev_low_power_state_probe(struct device *dev)
> +{
> +       int power_state;
> +       int ret;
> +
> +       if (!is_acpi_device_node(dev_fwnode(dev)))
> +               return false;

This is (at least) inefficient, because the same check is repeated by
ACPI_COMPANION().

If you really want to print the message, it is better to do something like

struct acpi_device *adev = ACPI_COMPANION(dev);

if (!adev)
        return false;

ret = acpi_device_get_power(adev, &power_state);

> +
> +       ret = acpi_device_get_power(ACPI_COMPANION(dev), &power_state);
> +       if (ret) {
> +               dev_warn(dev, "Cannot obtain power state (%d)\n", ret);

And the log level of this message is way too high IMO.

This means a firmware bug AFAICS and so after seeing it once on a
given system it becomes noise.  I'd use pr_debug() to print it.

> +               return false;
> +       }
> +
> +       return power_state != ACPI_STATE_D0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_low_power_state_probe);
> +
>  #endif /* CONFIG_PM */
