Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3254932D491
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 14:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241562AbhCDNuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 08:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241567AbhCDNt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 08:49:57 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3CDC061574;
        Thu,  4 Mar 2021 05:49:17 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m1so9756961wml.2;
        Thu, 04 Mar 2021 05:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3+SX3U1VXxjbBb3AFkilt3hNXMs9Ccf8nN8eBgzxjZU=;
        b=CvZl9GQ1BZZAyv6izOJnS5InuxmDYt4uJJVB1al7+eRTagi8Hp3agEdzup8pVHR/sf
         o3Vni2I3nVEYqJ9YTi40pEy9V8Qptwls9CmdNMGLfHZP3vRLsuO6SyliaChK2n/BroJ/
         vncTY+vrj7cP8TGVeX56PYMc+KRVuD0mDbdi32PasHZq96URRUPwfpRJAxt4xNKtUcjE
         L7h7mihpJrDKOBwbVJVb6hB4brAiB2kKcow05wFQaVPl/InxsPVWCLuW9mPGJx4BrGRQ
         Sq6ZzZ+PEZzUPqHEw/BmBp3Qh/Up+uqFI0XmQhw1n4Pm7juaFRc+T9hQw8SRbNT6xCD0
         Pdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3+SX3U1VXxjbBb3AFkilt3hNXMs9Ccf8nN8eBgzxjZU=;
        b=U+srqDIEHIpNVpqkUoQcFWptfkSYbwDL4FcAiUR6T3Yl3T7ess5Lwc7794IyA1pfIC
         EX/aoPlfBU1lEV8qqyBjomYBYw3FFc9iEVW9loqXLAmVyGuPg9pqsUM9c0yFVFldpTEb
         vRpxdeHUoi/fXSjtK4RIqCLsyV6jRYT1zqVPY1DOuXssOIaBF3QqF4mqh/sp6CLl7A/d
         YuEhRGNmxoMwR/BVKFs0C/7f4XW9CffvFh3s/kWFdARn5FsXSCi9SBUgWoQKOjHMkY6r
         VM0Btzyg0BK2g1y30bXFUsCnDb1zZTj2GV20QCCdjmVkCT8YWQz28xAQ3CChi113j4nG
         K1eQ==
X-Gm-Message-State: AOAM531CqOLKPu/USiAj1VwGmGblCJ9HSgXaViA8Sun0xSAU4HFKGZTE
        39CxaWJXyW9LIKaNGVGzBu8=
X-Google-Smtp-Source: ABdhPJyRx+2m1kvS4rKn8ipRK5BYpQzYTY5VuQm9zqKGv70JdXH343ORRDLD6NwYhwkDbuBwDpb87A==
X-Received: by 2002:a05:600c:47d7:: with SMTP id l23mr4105259wmo.155.1614865756142;
        Thu, 04 Mar 2021 05:49:16 -0800 (PST)
Received: from [192.168.1.211] ([2.26.187.30])
        by smtp.gmail.com with ESMTPSA id l15sm10022214wmh.21.2021.03.04.05.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:49:15 -0800 (PST)
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
To:     Hans de Goede <hdegoede@redhat.com>, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, rajmohan.mani@intel.com,
        rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andriy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, mgross@linux.intel.com,
        luzmaximilian@gmail.com, robert.moore@intel.com,
        erik.kaneda@intel.com, me@fabwu.ch, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <fd2fbee6-e620-a594-8377-d2f22131af29@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5d336f50-5f25-fce2-04eb-5ad450c9cd5b@gmail.com>
Date:   Thu, 4 Mar 2021 13:49:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd2fbee6-e620-a594-8377-d2f22131af29@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans

On 04/03/2021 13:37, Hans de Goede wrote:
> Hi,
>
> On 2/22/21 2:07 PM, Daniel Scally wrote:
>> v1 for this series was originally 14-18 of this series:
>> https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
>>
>> v2 was here:
>> https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
>>
>> Series level changelog:
>>
>> 	- Dropped the patch moving acpi_lpss_dep() to utils since it's not used
>> 	in acpi_dev_get_dependent_dev() anymore.
>> 	- Replaced it with a patch extending acpi_walk_dep_device_list() to be
>> 	able to apply a given callback against each device in acpi_dep_list
>> 	- Dropped the patch creating acpi_i2c_dev_name() and simply open coded
>> 	that functionality.
>>
>> This has been tested on a number of devices, but currently **not** on a device
>> designed for ChromeOS, which we ideally need to do to ensure no regression
>> caused by replacing the tps68470 MFD driver. Sakari / Tomasz, is there any way
>> you could help with that? Unfortunately, I don't have a device to test it on
>> myself.
>>
>> Original cover letter: 
>>
>> At the moment in the kernel the ACPI _HID INT3472 is taken by the tps68470
>> MFD driver, but that driver can only handle some of the cases of that _HID
>> that we see. There are at least these three possibilities:
>>
>> 1. INT3472 devices that provide GPIOs through the usual framework and run
>>    power and clocks through an operation region; this is the situation that
>>    the current module handles and is seen on ChromeOS devices
>> 2. INT3472 devices that provide GPIOs, plus clocks and regulators that are
>>    meant to be driven through the usual frameworks, usually seen on devices
>>    designed to run Windows
>> 3. INT3472 devices that don't actually represent a physical tps68470, but
>>    are being used as a convenient way of grouping a bunch of system GPIO
>>    lines that are intended to enable power and clocks for sensors which
>>    are called out as dependent on them. Also seen on devices designed to
>>    run Windows.
>>
>> This series introduces a new module which registers:
>>
>> 1. An i2c driver that determines which scenario (#1 or #2) applies to the
>>    machine and registers platform devices to be bound to GPIO, OpRegion,
>>    clock and regulator drivers as appropriate.
>> 2. A platform driver that binds to the dummy INT3472 devices described in
>>    #3
>>
>> The platform driver for the dummy device registers the GPIO lines that
>> enable the clocks and regulators to the sensors via those frameworks so
>> that sensor drivers can consume them in the usual fashion. The existing
>> GPIO and OpRegion tps68470 drivers will work with the i2c driver that's
>> registered. Clock and regulator drivers are available but have not so far been
>> tested, so aren't part of this series.
>>
>> The existing mfd/tps68470.c driver being thus superseded, it is removed.
> Thank you for this patch series. Since there have already been a whole
> bunch of review-comments, I've not taken a detailed look at this yet.


No problem, I'm hoping to do a v3 over the weekend anyway.


> I do wonder if you have thought about how this series should be merged?
> This series is spread over quite a few subsytems and since there are
> various interdependencies in the patches it is probably best if it gets
> merged in its entirety through a single tree.
>
> I guess that merging though either Rafael's (drivers/acpi) tree or
> Lee's (drivers/mfd) tree makes the most sense.
>
> As drivers/platform/x86 maintainer I'm happy with whatever solution
> works for the other subsystem maintainers.


I also think it's a good idea to go through a single tree, and my plan
was to raise that probably after the next review round or so, but I
hadn't gotten as far as thinking about whos tree it should be or
anything yet. To be honest I'm not sure what factors dictate which
choice is best in that regard; handling complex git merges is a bit
outside my experience.

>
> Regards,
>
> Hans
>
>
>
>
>> Thanks
>> Dan
>>
>> Daniel Scally (6):
>>   ACPI: scan: Extend acpi_walk_dep_device_list()
>>   ACPI: scan: Add function to fetch dependent of acpi device
>>   i2c: core: Add a format macro for I2C device names
>>   gpiolib: acpi: Export acpi_get_gpiod()
>>   platform/x86: Add intel_skl_int3472 driver
>>   mfd: tps68470: Remove tps68470 MFD driver
>>
>>  MAINTAINERS                                   |   5 +
>>  drivers/acpi/ec.c                             |   2 +-
>>  drivers/acpi/pmic/Kconfig                     |   2 +-
>>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
>>  drivers/acpi/scan.c                           |  92 ++-
>>  drivers/gpio/Kconfig                          |   2 +-
>>  drivers/gpio/gpiolib-acpi.c                   |  38 +-
>>  drivers/i2c/i2c-core-acpi.c                   |   2 +-
>>  drivers/i2c/i2c-core-base.c                   |   4 +-
>>  drivers/mfd/Kconfig                           |  18 -
>>  drivers/mfd/Makefile                          |   1 -
>>  drivers/mfd/tps68470.c                        |  97 ---
>>  drivers/platform/surface/surface3_power.c     |   2 +-
>>  drivers/platform/x86/Kconfig                  |   2 +
>>  drivers/platform/x86/Makefile                 |   1 +
>>  drivers/platform/x86/intel-int3472/Kconfig    |  31 +
>>  drivers/platform/x86/intel-int3472/Makefile   |   4 +
>>  .../intel-int3472/intel_skl_int3472_common.c  | 106 ++++
>>  .../intel-int3472/intel_skl_int3472_common.h  | 110 ++++
>>  .../intel_skl_int3472_discrete.c              | 592 ++++++++++++++++++
>>  .../intel_skl_int3472_tps68470.c              | 113 ++++
>>  include/acpi/acpi_bus.h                       |   8 +
>>  include/linux/acpi.h                          |   4 +-
>>  include/linux/gpio/consumer.h                 |   7 +
>>  include/linux/i2c.h                           |   3 +
>>  25 files changed, 1100 insertions(+), 148 deletions(-)
>>  delete mode 100644 drivers/mfd/tps68470.c
>>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
>>
