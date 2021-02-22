Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC22321844
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhBVNOi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhBVNMZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:12:25 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A8AC061786;
        Mon, 22 Feb 2021 05:11:44 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id l12so19030601wry.2;
        Mon, 22 Feb 2021 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eh/m8C+sIdeehkJbXdOE4XLKrXVCyCCB8xWzMqpRKQg=;
        b=pRFwFSHK41rsW50XEDM9gIipRMM/v2JL5IPY5BP30MhLVKzKR7DPMe+Aiw0Gp3b6S9
         eqNWbcgaukuy4xcZaFAiaKzDvrDZy+K8lGqJTWCb5NuO7lNesiIicis4faXf7CMqTrE4
         Y55hWEz9sT6vJEFSpEho6nVD+aPEzivT3VXxfDbAosUojwe4II6Bzz6ULFmtfzK9dGqI
         /yFpemgc7tgU0ZpK3ovpEjD2zCLK/f0uk+/1GLRouGkoqorzWfxJzccsl8oyRqhWf9M/
         6333J5XMTAdkQ2qM7zLZiPC1q5v+m+mTZkiTPBpBqciFUVfMpNEurFTnkaXovXjGNZxr
         b99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eh/m8C+sIdeehkJbXdOE4XLKrXVCyCCB8xWzMqpRKQg=;
        b=uGfO9MGvHnkmgVhvnzpL50jGnNmUYjt6OAmPyFMgc4G4LY1K/0XGhNP8ML+sqr/BfE
         cURjcJv24KMlfoE1JSFS0jitt0ZKloSri6ndrdugZVYX2kp+6mcKq3N7TlyzHEBaZz8i
         M57f+j4anOUM2n96NVDjy4l7u6sohSTE8Vg0tWa0BK1tDYe2fikFyujVSdtNlKHggxrp
         Unkt71NHuhcJ8LkrylClQlIJyXDR18aaiEzlyXXQjtgADUAxSf6vh9Y4wGfi9Sm4cgTP
         IOBTNtZAxd04BmttNXbuzhd1FHRtZD6N3dT79o8xh1e+kyGSn2CktYvXSXWxC/+qH4Qj
         DefQ==
X-Gm-Message-State: AOAM533TmoeqqTJ/XZ87fEm56O1q3N5TlN4zCq9RcgwSxTRBef31nPMt
        des/CK8xr1edQxz7Cb+BQ4k=
X-Google-Smtp-Source: ABdhPJxzE52AzyYZr2m7YX0xkoTwb5mG9B8+16tGpwyaeQqtJXVpo0sSxTPTuByR9cIwlg9DP0HK1g==
X-Received: by 2002:adf:8445:: with SMTP id 63mr21809927wrf.222.1613999503609;
        Mon, 22 Feb 2021 05:11:43 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id d23sm27122287wmd.11.2021.02.22.05.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 05:11:43 -0800 (PST)
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andriy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
Message-ID: <2ce8ed30-fae7-ac54-0f7c-33d14e7ed10a@gmail.com>
Date:   Mon, 22 Feb 2021 13:11:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+cc Andy, who's email address I managed to screw up - sorry.

On 22/02/2021 13:07, Daniel Scally wrote:
> v1 for this series was originally 14-18 of this series:
> https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
>
> v2 was here:
> https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
>
> Series level changelog:
>
> 	- Dropped the patch moving acpi_lpss_dep() to utils since it's not used
> 	in acpi_dev_get_dependent_dev() anymore.
> 	- Replaced it with a patch extending acpi_walk_dep_device_list() to be
> 	able to apply a given callback against each device in acpi_dep_list
> 	- Dropped the patch creating acpi_i2c_dev_name() and simply open coded
> 	that functionality.
>
> This has been tested on a number of devices, but currently **not** on a device
> designed for ChromeOS, which we ideally need to do to ensure no regression
> caused by replacing the tps68470 MFD driver. Sakari / Tomasz, is there any way
> you could help with that? Unfortunately, I don't have a device to test it on
> myself.
>
> Original cover letter: 
>
> At the moment in the kernel the ACPI _HID INT3472 is taken by the tps68470
> MFD driver, but that driver can only handle some of the cases of that _HID
> that we see. There are at least these three possibilities:
>
> 1. INT3472 devices that provide GPIOs through the usual framework and run
>    power and clocks through an operation region; this is the situation that
>    the current module handles and is seen on ChromeOS devices
> 2. INT3472 devices that provide GPIOs, plus clocks and regulators that are
>    meant to be driven through the usual frameworks, usually seen on devices
>    designed to run Windows
> 3. INT3472 devices that don't actually represent a physical tps68470, but
>    are being used as a convenient way of grouping a bunch of system GPIO
>    lines that are intended to enable power and clocks for sensors which
>    are called out as dependent on them. Also seen on devices designed to
>    run Windows.
>
> This series introduces a new module which registers:
>
> 1. An i2c driver that determines which scenario (#1 or #2) applies to the
>    machine and registers platform devices to be bound to GPIO, OpRegion,
>    clock and regulator drivers as appropriate.
> 2. A platform driver that binds to the dummy INT3472 devices described in
>    #3
>
> The platform driver for the dummy device registers the GPIO lines that
> enable the clocks and regulators to the sensors via those frameworks so
> that sensor drivers can consume them in the usual fashion. The existing
> GPIO and OpRegion tps68470 drivers will work with the i2c driver that's
> registered. Clock and regulator drivers are available but have not so far been
> tested, so aren't part of this series.
>
> The existing mfd/tps68470.c driver being thus superseded, it is removed.
>
> Thanks
> Dan
>
> Daniel Scally (6):
>   ACPI: scan: Extend acpi_walk_dep_device_list()
>   ACPI: scan: Add function to fetch dependent of acpi device
>   i2c: core: Add a format macro for I2C device names
>   gpiolib: acpi: Export acpi_get_gpiod()
>   platform/x86: Add intel_skl_int3472 driver
>   mfd: tps68470: Remove tps68470 MFD driver
>
>  MAINTAINERS                                   |   5 +
>  drivers/acpi/ec.c                             |   2 +-
>  drivers/acpi/pmic/Kconfig                     |   2 +-
>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
>  drivers/acpi/scan.c                           |  92 ++-
>  drivers/gpio/Kconfig                          |   2 +-
>  drivers/gpio/gpiolib-acpi.c                   |  38 +-
>  drivers/i2c/i2c-core-acpi.c                   |   2 +-
>  drivers/i2c/i2c-core-base.c                   |   4 +-
>  drivers/mfd/Kconfig                           |  18 -
>  drivers/mfd/Makefile                          |   1 -
>  drivers/mfd/tps68470.c                        |  97 ---
>  drivers/platform/surface/surface3_power.c     |   2 +-
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-int3472/Kconfig    |  31 +
>  drivers/platform/x86/intel-int3472/Makefile   |   4 +
>  .../intel-int3472/intel_skl_int3472_common.c  | 106 ++++
>  .../intel-int3472/intel_skl_int3472_common.h  | 110 ++++
>  .../intel_skl_int3472_discrete.c              | 592 ++++++++++++++++++
>  .../intel_skl_int3472_tps68470.c              | 113 ++++
>  include/acpi/acpi_bus.h                       |   8 +
>  include/linux/acpi.h                          |   4 +-
>  include/linux/gpio/consumer.h                 |   7 +
>  include/linux/i2c.h                           |   3 +
>  25 files changed, 1100 insertions(+), 148 deletions(-)
>  delete mode 100644 drivers/mfd/tps68470.c
>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
>
