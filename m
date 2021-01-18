Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26AAB2F9DC3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 12:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389912AbhARLNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 06:13:38 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:56664 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389404AbhARLNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 06:13:34 -0500
Date:   Mon, 18 Jan 2021 11:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610968360;
        bh=peSC9o9yu05hJE1IC0P2apZMWF5VoegXfyyqCO9GoLM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=n3XZ3zXlRHqfavOYPOO4tMpM6ITEmWi7rzGm1xwFAXrA+DFpaNcnHbXyTD0eQaL0N
         xqR7q698aaAqxz/QTH/P7btgZ0H//3/BvLEHd0K+66DfrfUfORbrj5tmGE0HTdaaCw
         o1awLClmG58F+Hwqq9edfb4Q1t/wBUWASaq2qI0Y=
To:     Daniel Scally <djrscally@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "erik.kaneda@intel.com" <erik.kaneda@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <-GKrxu8GJvGe-PlKkLpblw9N-DtVtS7i87BOCLgJR72yf4hUFpUgiOlGcFero_gqgUxJrX2gxtLOnz_31hJugfam0SXXmXxIzGIhS162mhI=@protonmail.com>
In-Reply-To: <20210118003428.568892-7-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi


2021. janu=C3=A1r 18., h=C3=A9tf=C5=91 1:34 keltez=C3=A9ssel, Daniel Scally=
 =C3=ADrta:

> ACPI devices with _HID INT3472 are currently matched to the tps68470
> driver, however this does not cover all situations in which that _HID
> occurs. We've encountered three possibilities:
>
> 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
> a physical tps68470 device) that requires a GPIO and OpRegion driver
> 2. On devices designed for Windows, an ACPI device with _HID INT3472
> (again representing a physical tps68470 device) which requires GPIO,
> Clock and Regulator drivers.
> 3. On other devices designed for Windows, an ACPI device with _HID
> INT3472 which does NOT represent a physical tps68470, and is instead
> used as a dummy device to group some system GPIO lines which are meant
> to be consumed by the sensor that is dependent on this entry.
>
> This commit adds a new module, registering a platform driver to deal
> with the 3rd scenario plus an i2c-driver to deal with #1 and #2, by
> querying the CLDB buffer found against INT3472 entries to determine
> which is most appropriate.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
>
> =09- Switched to a module registering a platform driver to run
> =09the dummy ACPI devices, plus an i2c driver to replace and extend
> =09the existing tps68470 driver
> =09- Added clock handling functions to the int3472-discrete driver
> =09- A whole bunch of other changes too numerous to enumerate
>  MAINTAINERS                                   |   5 +
>  drivers/platform/x86/Kconfig                  |  25 +
>  drivers/platform/x86/Makefile                 |   4 +
>  .../platform/x86/intel_skl_int3472_common.c   | 100 ++++
>  .../platform/x86/intel_skl_int3472_common.h   | 100 ++++
>  .../platform/x86/intel_skl_int3472_discrete.c | 496 ++++++++++++++++++
>  .../platform/x86/intel_skl_int3472_tps68470.c | 145 +++++
>  7 files changed, 875 insertions(+)
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_tps68470.c

Have you considered putting the source (and header) files into a dedicated
folder? I think it'd help manageability in the long run, and it'd be immedi=
ately
obvious that these source files form a single "unit".


Regards,
Barnab=C3=A1s P=C5=91cze
