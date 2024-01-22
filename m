Return-Path: <linux-i2c+bounces-1398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E249835DDF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 10:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1641F234ED
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 09:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDFE3A1A9;
	Mon, 22 Jan 2024 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm9Uu7jI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF56F3A1A8;
	Mon, 22 Jan 2024 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914850; cv=none; b=lT86Msv2m8yTO1D4HGtpBUkDQ3QUWleTFIwrP4x616I0HcOIY2vRSXyaG7/FDnMq+dgbfcAQL4p72OBgHOebUF1D21oeu1BN8vmkb8T2qwT5nIbfIgnjChyJ7pwWvJlnXq0gj8UXR197vQsrZwElc5LYUAj2nI2Psuy334ctAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914850; c=relaxed/simple;
	bh=Z/x2yilsMYKzRCP4UINs5eI+67p61JghJG4yQE/w6FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClacXJlTm1MjAFdxsF5lzVaZic79/0Dexsxc1mxbfloztFJU3UBwMMSqCVBdQKt/VBLLTMzS40od/mlmxWszs/vYTWRtPacaUb19zPlHrtzBhc4nwnBkQgrR0DI0SzUKfJxWrbbuJR2jsez35dgRyp3xUe7WE8SZbVpDcRGRQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm9Uu7jI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-337d58942c9so3173090f8f.0;
        Mon, 22 Jan 2024 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705914847; x=1706519647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJtoHJTf8+XexIu1jE0XJRKaRM7JxcnTxF+MvONlBrE=;
        b=nm9Uu7jIjLMzNv6GIOUDzBWAKJmTgYGlvSBZ36SI76G5DW5SVr3LOMnhIWV3bk419H
         VRVRWxPsMatgw6fpbqDzldq5DZIRvIKvPBgbCLbKHJutaGL+CWw+vvOw1Flwbw54jmms
         ooY/GaD/g/h3j8rHEoL7UQ7SSubR8rjSbJAFzEQ1BZZ7AU4gaHC5TdziCUp0XwVDLP1X
         rYNoul2yFd/M2PJKzx9Fc8TbQURgFXqJZz2ZNC9fY8xpdJL1PVZFig4D2uzVfgt/MyJ/
         l5/pa5jSOJMLb8Ai3l0rDl3a5fh+yGAVcEx9qzwaJM8CguB7OdnDlSzj79Um3PBrO59c
         qBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914847; x=1706519647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJtoHJTf8+XexIu1jE0XJRKaRM7JxcnTxF+MvONlBrE=;
        b=ZbGgqkUgmbPueY92ZTSDi69RF0Qq6Aoxugb0eAGbaV3yYB8YJjDIAt8OfYif6tWZdN
         Uk1WJSf07jBlQob5Wgx64QUuBCKOHFo+o2zIPH5j11A/HzDTvv0pOQz+5rbaCQLN/sef
         iLFxb780iIVd6fPTrtPOq2YEfk3RyPTc4eg7TZUgNgEhExxkZzhDjndheGVTJehxVfZO
         9IRgcEdZudQqgvUULA8JRVfGGjbmBFQ3akxubtBbDeN99OMb6ysLe0+cnIGEBscnF8AI
         sLgNGVbDf5Yzmzyq8/RsOkev5hE0lGtnp7ZI3278KJOK+LDoHkle9MSxvmNAW4Oj2Qzu
         Kcxw==
X-Gm-Message-State: AOJu0YxjEYqRSJpilmUET8a855kgxQLRXypDZkTTrgl47eE+52wEOOQz
	GHY7nMwuh2TQ38moUbkzg9LReqjxY444/FCIZM6M3d2/LtISvcJd
X-Google-Smtp-Source: AGHT+IHilrUOGWBhigCUyk2uI9CIxdjZPNnxB3xAR0RRJB/Ibc2npJy8kdjuDi5dIB1SbiIhxdFYrA==
X-Received: by 2002:a05:600c:4794:b0:40e:57f2:5948 with SMTP id k20-20020a05600c479400b0040e57f25948mr2001657wmo.72.1705914846940;
        Mon, 22 Jan 2024 01:14:06 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id i6-20020adfb646000000b00337bc2176f6sm13310550wre.81.2024.01.22.01.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 01:14:05 -0800 (PST)
Message-ID: <d9591107-cce8-417d-a8a3-72482d939c9c@gmail.com>
Date: Mon, 22 Jan 2024 10:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] Improve IRQ wake capability reporting and update
 the cros_ec driver to use it
Content-Language: en-US, ca-ES, es-ES
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Raul Rangel
 <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benson Leung <bleung@chromium.org>,
 Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 David Gow <davidgow@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <groeck@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Len Brown <lenb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Paul Barker <paul.barker@sancloud.com>,
 Prashant Malani <pmalani@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Barnes <robbarnes@google.com>,
 Rob Herring <robh+dt@kernel.org>, Romain Perier <romain.perier@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Takashi Iwai <tiwai@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Wei Xu <xuwei5@hisilicon.com>, Wolfram Sang <wsa@kernel.org>,
 chrome-platform@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240102210820.2604667-1-markhas@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/01/2024 22:07, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
> 
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
> 
> Some logic is added to the platform, ACPI, and DT subsystems to more
> easily pipe wakeirq information up to the driver.
> 

Patch 9, 10, 11 and 12 applied to the mediatek tree.

Thanks!


> Changes in v4:
> -Rebase on linux-next
> -See each patch for patch specific changes
> 
> Changes in v3:
> -Rebase on linux-next
> -See each patch for patch specific changes
> 
> Changes in v2:
> -Rebase on linux-next
> -Add cover letter
> -See each patch for patch specific changes
> 
> Mark Hasemeyer (24):
>    resource: Add DEFINE_RES_*_NAMED_FLAGS macro
>    gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
>    i2c: acpi: Modify i2c_acpi_get_irq() to use resource
>    dt-bindings: power: Clarify wording for wakeup-source property
>    ARM: dts: tegra: Enable cros-ec-spi as wake source
>    ARM: dts: rockchip: rk3288: Enable cros-ec-spi as wake source
>    ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
>    ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
>    arm64: dts: tegra: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
>    arm64: dts: rockchip: rk3399: Enable cros-ec-spi as wake source
>    of: irq: add wake capable bit to of_irq_resource()
>    of: irq: Add default implementation for of_irq_to_resource()
>    of: irq: Remove extern from function declarations
>    device property: Modify fwnode irq_get() to use resource
>    device property: Update functions to use EXPORT_SYMBOL_GPL()
>    platform: Modify platform_get_irq_optional() to use resource
>    platform/chrome: cros_ec: Use PM subsystem to manage wakeirq
> 
>   .../bindings/power/wakeup-source.txt          | 18 ++--
>   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   |  1 +
>   arch/arm/boot/dts/nvidia/tegra124-venice2.dts |  1 +
>   .../rockchip/rk3288-veyron-chromebook.dtsi    |  1 +
>   .../boot/dts/samsung/exynos5420-peach-pit.dts |  1 +
>   .../boot/dts/samsung/exynos5800-peach-pi.dts  |  1 +
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 +
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  1 +
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  1 +
>   .../arm64/boot/dts/nvidia/tegra132-norrin.dts |  1 +
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
>   .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
>   .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  1 +
>   arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
>   drivers/acpi/property.c                       | 11 ++-
>   drivers/base/platform.c                       | 90 ++++++++++++-------
>   drivers/base/property.c                       | 40 ++++++---
>   drivers/gpio/gpiolib-acpi.c                   | 28 ++++--
>   drivers/i2c/i2c-core-acpi.c                   | 43 ++++-----
>   drivers/i2c/i2c-core-base.c                   |  6 +-
>   drivers/i2c/i2c-core.h                        |  4 +-
>   drivers/of/irq.c                              | 39 +++++++-
>   drivers/of/property.c                         |  8 +-
>   drivers/platform/chrome/cros_ec.c             | 48 ++++++++--
>   drivers/platform/chrome/cros_ec_lpc.c         | 40 +++++++--
>   drivers/platform/chrome/cros_ec_spi.c         | 15 ++--
>   drivers/platform/chrome/cros_ec_uart.c        | 14 ++-
>   include/linux/acpi.h                          | 25 +++---
>   include/linux/fwnode.h                        |  8 +-
>   include/linux/ioport.h                        | 20 +++--
>   include/linux/of_irq.h                        | 41 +++++----
>   include/linux/platform_data/cros_ec_proto.h   |  4 +-
>   include/linux/platform_device.h               |  3 +
>   include/linux/property.h                      |  2 +
>   36 files changed, 350 insertions(+), 172 deletions(-)
> 

