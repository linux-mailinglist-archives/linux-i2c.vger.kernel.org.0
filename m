Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE632186B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhBVNV1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbhBVNUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:20:16 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE12EC061574;
        Mon, 22 Feb 2021 05:19:35 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id l30so3367665wrb.12;
        Mon, 22 Feb 2021 05:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6X/6werYZIK9fs7IYM81mAmrveN5anqppuHIMRZRmzc=;
        b=VqlPjwDKhgHfcIhWElmNqEyxYj26vqTIX6qKDdJcHjdlZm12+/oO+cEMEePI15mLDm
         pRzsdmSKnZCVj/ynv1/QIyB+Y0m259lgso4aafWmWS6nwh6pS7ImTLjZ29/3XLVcdZ5k
         KnhrvQAeBgyorunZto1mBqmwgCyHtrdPF+I95qR5MSIRdWd19PivuCA2t+1XONpszgT+
         YIryD6jRCkeCK09NQbz9hoU/DRLFrgm5UVs8xLfZ1MFxcUmcVCrlkvZkaNMs1EqEVnFW
         rUffncQsrkls6ft2EMwS87dtFfcExYN1Fq/uqWVbPxjeHWtqWAFzMOmONeVmn+tOe5t9
         Tnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6X/6werYZIK9fs7IYM81mAmrveN5anqppuHIMRZRmzc=;
        b=E7ewVoN4Na3iMhWxk3qtrSyMyiiicbYq0hNF7twWUQl+PNEIFedWJ/1PC9K30rBV0m
         9maWdITxc50TNfz3qOZFOafgVuue1Qz2GrWnrKhdwEEfN8tAGutqRyUBEqKAhBhR4xoj
         5XMDTirOXp6uMXY9QnLvIxRbJiW+5y8cnAQS0B70ifixdNnrxfIwLPmb5KG3vOd0h0sl
         7dt+FRkz2J0IrCvYWGyXqtkAuv26LhdxO6GpkAaQISnS04aDkX4rGbfeXxeoxrzNqPIT
         o0f7R3agmdTGUl+XpM3mWeU4KRw1plEp0+26YPWk9jf8thp84RcTPqib5bA0BihTjC1A
         MenA==
X-Gm-Message-State: AOAM5308kCSdmWWKY6tZMFmPl0x8sKQt0ipXCUyCipbuMwNXLQmbZ9by
        9MVUZRZ5wh6b0aM4waB0mcwp1cBkP0jj1A==
X-Google-Smtp-Source: ABdhPJxLQ7VsEJcJPOeo++tiA5ZW1gY78KJSstmL6q5mpvjC8PeI8k17A1rZmXX+v+OrDLvyHy54zQ==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr7582543wrw.177.1613999974492;
        Mon, 22 Feb 2021 05:19:34 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id v5sm26708387wmh.2.2021.02.22.05.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 05:19:33 -0800 (PST)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
Message-ID: <04c106e3-fd95-c19d-115f-8acd07df4c0c@gmail.com>
Date:   Mon, 22 Feb 2021 13:19:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222130735.1313443-6-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all

On 22/02/2021 13:07, Daniel Scally wrote:
> diff --git a/drivers/platform/x86/intel-int3472/Kconfig b/drivers/platform/x86/intel-int3472/Kconfig
> new file mode 100644
> index 000000000000..b94622245c21
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/Kconfig
> @@ -0,0 +1,31 @@
> +config INTEL_SKL_INT3472
> +	tristate "Intel SkyLake ACPI INT3472 Driver"
> +	depends on ACPI
> +	depends on REGULATOR
> +	depends on GPIOLIB
> +	depends on COMMON_CLK && CLKDEV_LOOKUP
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  This driver adds support for the INT3472 ACPI devices found on some
> +	  Intel SkyLake devices.
> +
> +	  The INT3472 is an Intel camera power controller, a logical device
> +	  found on some Skylake-based systems that can map to different
> +	  hardware devices depending on the platform. On machines
> +	  designed for Chrome OS, it maps to a TPS68470 camera PMIC. On
> +	  machines designed for Windows, it maps to either a TP68470
> +	  camera PMIC, a uP6641Q sensor PMIC, or a set of discrete GPIOs
> +	  and power gates.
> +
> +	  If your device was designed for Chrome OS, this driver will provide
> +	  an ACPI OpRegion, which must be available before any of the devices
> +	  using it are probed. For this reason, you should select Y if your
> +	  device was designed for ChromeOS. For the same reason the
> +	  I2C_DESIGNWARE_PLATFORM option must be set to Y too.
> +
> +	  Say Y or M here if you have a SkyLake device designed for use
> +	  with Windows or ChromeOS. Say N here if you are not sure.
> +
> +	  The module will be named "intel-skl-int3472"
The Kconfig option for the existing tps68470 driver is a bool which
depends on I2C_DESIGNWARE_PLATFORM=y, giving the following reason:

This option is a bool as it provides an ACPI operation
region, which must be available before any of the devices
using this are probed. This option also configures the
designware-i2c driver to be built-in, for the same reason.

One problem I've faced is that that scenario only applies to some
devices that this new driver can support, so hard-coding it as built in
didn't make much sense. For that reason I opted to set it tristate, but
of course that issue still exists for ChromeOS devices where the
OpRegion will be registered. I opted for simply documenting that
requirement, as is done in aaac4a2eadaa6: "mfd: axp20x-i2c: Document
that this must be builtin on x86", but that's not entirely satisfactory.
Possible alternatives might be setting "depends on
I2C_DESIGNWARE_PLATFORM=y if CHROME_PLATFORMS" or something similar,
though of course the User would still have to realise they need to
build-in the INTEL_SKL_INT3472 Kconfig option too.

Feedback around this issue would be particularly welcome, as I'm not
sure what the best approach might be.
