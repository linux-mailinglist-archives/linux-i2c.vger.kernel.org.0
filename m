Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121693192D5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Feb 2021 20:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhBKTLE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Feb 2021 14:11:04 -0500
Received: from mail-oo1-f47.google.com ([209.85.161.47]:33694 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhBKTLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Feb 2021 14:11:03 -0500
Received: by mail-oo1-f47.google.com with SMTP id f1so1548235oou.0;
        Thu, 11 Feb 2021 11:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdFu/6VBkN1MAmN++f/coOk+OapMFzu+uHXVkMLYEfU=;
        b=Lpl+XLR1M1PEEK0CdVRcqwu5mnQmdGNQYyvSC3YM/zLQnHBJSE5OUWFxXmuP4unysA
         0bxWIATrqwAQbLA3RfIZn1R7xC5xTuad9XGrItjx4Us4H/b6QhQ99KpstalaVbFsH8Mm
         D2CIPKSoIdWcSoSApEBnzq3YWu19WP07gfaKLSmtyxnd6+dNpon4g2krv5Ls+F3nvA1u
         GKPZG4bLTGZSDmEc6J+GZg5mjtKEhyy/F+VHmeFyzWMldh4ArXoep/FuDU92pnB1QwlH
         Si0Mj9SOaOKLXwJ8CrlnxPcT0qn+m9Kg1WAvNHSFzANe95YnzB9vUi8IQvwY01kxpTs3
         ES8g==
X-Gm-Message-State: AOAM5318uJ21MoKeKU59WUd/cysAzbJHopUnmKT16I4bl8hm2MXgdAEM
        8ufp4HeQZZzG8j6I6WhQFAGXDNoXB+z0Y3uJn2g=
X-Google-Smtp-Source: ABdhPJz9qDxkr9OfwolY9oYHRGcZmnyZ6TfMFdgsm5wh0yroMkTpmguutv7JTb4CFqLVP0+W6Eqlhz//Lt/YY+zskGY=
X-Received: by 2002:a4a:3bcb:: with SMTP id s194mr6468762oos.1.1613070622766;
 Thu, 11 Feb 2021 11:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20210210230800.30291-1-sakari.ailus@linux.intel.com> <20210210230800.30291-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 11 Feb 2021 20:10:11 +0100
Message-ID: <CAJZ5v0haRrHv=dsy=6ZOrQcPEeFc6Lz6QAXTVGyWhYZxpHpEdA@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] ACPI: scan: Obtain device's desired enumeration
 power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 11, 2021 at 12:08 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Store a device's desired enumeration power state in struct
> acpi_device_power during acpi_device object's initialisation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/acpi/scan.c     | 4 ++++
>  include/acpi/acpi_bus.h | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index a184529d8fa40..6a9b4a92c4f66 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -987,6 +987,7 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
>
>  static void acpi_bus_get_power_flags(struct acpi_device *device)
>  {
> +       unsigned long long dse = ACPI_STATE_D0;
>         u32 i;
>
>         /* Presence of _PS0|_PR0 indicates 'power manageable' */
> @@ -1008,6 +1009,9 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
>         if (acpi_has_method(device->handle, "_DSW"))
>                 device->power.flags.dsw_present = 1;
>
> +       acpi_evaluate_integer(device->handle, "_DSE", NULL, &dse);

As a matter of notice, it is likely that this object will be called
_DSC (Deepest State for Configuration) which better reflects its
function.

The ACPI ECR introducing it will be sent next week if all goes well.

Thanks!

> +       device->power.state_for_enumeration = dse;
> +
>         /*
>          * Enumerate supported power management states
>          */
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 02a716a0af5d4..becfc9f57002b 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -276,6 +276,7 @@ struct acpi_device_power {
>         int state;              /* Current state */
>         struct acpi_device_power_flags flags;
>         struct acpi_device_power_state states[ACPI_D_STATE_COUNT];      /* Power states (D0-D3Cold) */
> +       u8 state_for_enumeration; /* Maximum power state for enumeration */
>  };
>
>  /* Performance Management */
> --
> 2.20.1
>
