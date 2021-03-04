Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FB132D44F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 14:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241355AbhCDNjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 08:39:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56502 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241358AbhCDNjY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 08:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614865078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sErK1+fYSiX7fIUfG8XoiemjBnRw4Soed1Ko/ms/wtA=;
        b=TuPgnfgOHOyq6YTFV5yueSXcfqzxjylKmWMjnPGmZ+dV4XJ61O3MngwDaDA3vBRn7/vQl/
        neWBAYsmuJM/ayYInS77Vj/wXDnYF2/cIVc4sdqObWW6NVQlbtZilfTyXcWV5mcuUxQ9Yx
        15IeoyGdyoEWcMeTcH4H2gzkOZHtyXs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554--MMeBt4nOLKwgz3MlmSlpw-1; Thu, 04 Mar 2021 08:37:56 -0500
X-MC-Unique: -MMeBt4nOLKwgz3MlmSlpw-1
Received: by mail-ed1-f72.google.com with SMTP id q1so14074273edv.5
        for <linux-i2c@vger.kernel.org>; Thu, 04 Mar 2021 05:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sErK1+fYSiX7fIUfG8XoiemjBnRw4Soed1Ko/ms/wtA=;
        b=elrpIhbW38uGgjlZlXD/ORh3uWk9T46v9qWrYQt8UIP2JOV1S+97+NJVyuPErMktAF
         6uzy+nLNPfSh6eQArWDVXbDBoaAM9J/4YsESKVIKroZdwG8tjVDB1hE9wp0VaKgMSyDe
         bt2IIxalhXeedegc5nGJGxxMBGjFRw56Qr5OB+DnxIoG9qC+0jsJobQqMda+cdyu+0B6
         oOx3BXmZARMM1XBdahwl1i17YBBaNLp8NtH9kebunzIjDHpWmw+TqndNFCsfOXJsnfRG
         oiAD03RV2YZ2sEpU43XENbjSJ6OP/N8WXFmvFfaCDuS/TNjJtBjHoru/gAaL3jgmA3XZ
         a97A==
X-Gm-Message-State: AOAM531Yt5curf0l4Os7EVwaPvB5ND/fGUloNpWLqRjOhw+eX/M+ZOoj
        BsUPsMm8hsWVZL7MuCCxOvaA44HD3uwwNe3PjmR1f3otpT+qmtUiGalJxdaBV12yYOl/TchKyWp
        HClNHyklDlRhZ0vb6uXjZ
X-Received: by 2002:a17:906:688:: with SMTP id u8mr4204739ejb.38.1614865075628;
        Thu, 04 Mar 2021 05:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyslfyn1Am8CmL2fz1QOs76PlY+wck4n2yoB4rF8PtXkZhDo+yrzvL4QXXKudV9gjXzRYg9UQ==
X-Received: by 2002:a17:906:688:: with SMTP id u8mr4204726ejb.38.1614865075435;
        Thu, 04 Mar 2021 05:37:55 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v24sm14639942ejw.17.2021.03.04.05.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:37:54 -0800 (PST)
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
To:     Daniel Scally <djrscally@gmail.com>, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, rajmohan.mani@intel.com,
        rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, mgross@linux.intel.com,
        luzmaximilian@gmail.com, robert.moore@intel.com,
        erik.kaneda@intel.com, me@fabwu.ch, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fd2fbee6-e620-a594-8377-d2f22131af29@redhat.com>
Date:   Thu, 4 Mar 2021 14:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 2/22/21 2:07 PM, Daniel Scally wrote:
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

Thank you for this patch series. Since there have already been a whole
bunch of review-comments, I've not taken a detailed look at this yet.

I do wonder if you have thought about how this series should be merged?
This series is spread over quite a few subsytems and since there are
various interdependencies in the patches it is probably best if it gets
merged in its entirety through a single tree.

I guess that merging though either Rafael's (drivers/acpi) tree or
Lee's (drivers/mfd) tree makes the most sense.

As drivers/platform/x86 maintainer I'm happy with whatever solution
works for the other subsystem maintainers.

Regards,

Hans




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

