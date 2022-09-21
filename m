Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32F05E5664
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 00:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiIUWyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 18:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiIUWyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 18:54:32 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535B4DAD;
        Wed, 21 Sep 2022 15:54:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso295873pjd.4;
        Wed, 21 Sep 2022 15:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+9lx9pWwkpFg+deGJFraXQmhQkGgzJ44ldE4yW4YjNc=;
        b=YuxkQrws61RLKnCTtTqRzwhJroEuDa+2u7O9RNcVFO6uGI6+Gb9LimWi2CAupO5WmP
         u0+xKEYUHd+KYQibx9mrg2xuVUMjAyF5krQ8s143w4AiuTkdj2qndVOdVeCb7I28mLT9
         VmSv6jaohL61/stY75UHaBmxmBszIdqvr+IxLxOFVFIkgl28+fZflWXHIPg+QBZvhrQy
         iXsJ2oGAcoVAAnr9ANJetrKCsWeO6rf5o0NHT926wEKUj31Qry5lC1qXlzmZWFMz+xeW
         00y2hKhiv+RjLjaw9m0JDszojR0IqoxkcvGHbC6v9cqSfc/1W6lH/GMQsvu4f/Hn+iur
         4X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+9lx9pWwkpFg+deGJFraXQmhQkGgzJ44ldE4yW4YjNc=;
        b=jmKXq1VKXVG8fM4dK2TTjay5WRcp9IcichxLd+PS3osn2xVZYX8te2wWvGu3f/F+u0
         8KhzgTSJo5Egn/H7pBjbXgmKECoXm4gH/wdfKHywsBovVhMUIpng+XnvkIUVhvabF5Mc
         gLQIOrhBeRi/1VPhuT7etrsY4N4LtakwlR3up8Xqa7Dqe8zwnKzD9oOPt3w3CaHonvJD
         x0XC+fdrF9y6KmaWW9pT10YIqgGVhjfe9SQcfIiPx1PLpoKiZsSv8MsZNIi8XcubO+eT
         0bWz+wbJoGlWgOXAWPBbFw/0YcNGMBWmXU/ftPlAUGu8M4y5Hm1RiPMD0r+xUFzdVLkW
         EpWQ==
X-Gm-Message-State: ACrzQf3RQz3CvP84wQE+uUxOxv4wloCVLG5KdNifmKdWh1uR6dowaTlp
        5+TUDiafvcW95sObw0k5CbQ=
X-Google-Smtp-Source: AMsMyM6+qWS6iD0OyI+fwoxd8rbReFk/rkcJfuesARiX+zzV9Q2OBmjqY03hPYK7PBXqNhEL4SVNqg==
X-Received: by 2002:a17:902:b08b:b0:178:48b6:f5a8 with SMTP id p11-20020a170902b08b00b0017848b6f5a8mr314579plr.3.1663800869267;
        Wed, 21 Sep 2022 15:54:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:24df:bb59:8f79:12a6])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090a474e00b001fd803f057bsm2396335pjg.33.2022.09.21.15.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 15:54:28 -0700 (PDT)
Date:   Wed, 21 Sep 2022 15:54:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        jingle.wu@emc.com.tw, hdegoede@redhat.com,
        mario.limonciello@amd.com, linus.walleij@linaro.org,
        Alistair Francis <alistair@alistair23.me>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Dan Williams <dan.j.williams@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Len Brown <lenb@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] acpi: i2c: Use SharedAndWake and
 ExclusiveAndWake to enable wake irq
Message-ID: <YyuWICMhpUFU4Qq4@google.com>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 09:51:52AM -0600, Raul E Rangel wrote:
> Today, i2c drivers are making the assumption that their IRQs can also
> be used as wake IRQs. This isn't always the case and it can lead to
> spurious wakes. This has recently started to affect AMD Chromebooks.
> With the introduction of
> d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
> controller gained the capability to set the wake bit on each GPIO. The
> ACPI specification defines two ways to inform the system if a device is
> wake capable:
> 1) The _PRW object defines the GPE that can be used to wake the system.
> 2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.
> 
> Currently only the first method is supported. The i2c drivers don't have
> any indication that the IRQ is wake capable, so they guess. This causes
> spurious interrupts, for example:
> * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
>   `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
>   system.
> * The IRQ line is active level low for this device and is pulled up by
>   the power resource defined in `_PR0`/`_PR3`.
> * The i2c driver will (incorrectly) arm the GPIO for wake by calling
>   `enable_irq_wake` as part of its suspend hook.
> * ACPI will power down the device since it doesn't have a wake GPE
>   associated with it.
> * When the device is powered down, the IRQ line will drop, and it will
>   trigger a wake event.
> 
> See the following debug log:
> [   42.335804] PM: Suspending system (s2idle)
> [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> [   42.535293] PM: Wakeup unrelated to ACPI SCI
> [   42.535294] PM: resume from suspend-to-idle
> 
> In order to fix this, we need to take into account the wake capable bit
> defined on the Interrupt/GpioInt. This is accomplished by:
> * Migrating some of the i2c drivers over to using the PM subsystem to
>   manage the wake IRQ.
> * Expose the wake_capable bit from the ACPI Interrupt/GpioInt resource
>   to the  i2c core.
> * Use the wake_capable bit in the i2c core to call
>   `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
> * Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
>   handled by the i2c core.
> * Make the ACPI device PM system aware of the wake_irq. This is
>   necessary so the device doesn't incorrectly get powered down when a
>   wake_irq is enabled.
> 
> I've tested this code with various combinations of having _PRW,
> ExclusiveAndWake and power resources all defined or not defined, but it
> would be great if others could test this out on their hardware.
> 
> I'm sure this will surface some devices where the IRQs were not
> correctly marked as wake capable. Ideally the firmware can be fixed, but
> if not we can work around this in the kernel by providing a board
> specific `struct i2c_board_info` with the `I2C_CLIENT_WAKE` flag set.
> See `chromeos_laptop.c` for an example of matching DMI properties and
> setting the `I2C_CLIENT_WAKE` override.

How do we want to land this? I see there are a few acked-by/reviewed-by
already, should I take it through the input tree?

Thanks.

-- 
Dmitry
