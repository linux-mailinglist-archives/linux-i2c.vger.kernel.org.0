Return-Path: <linux-i2c+bounces-921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2881AB44
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 00:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807D41C234B2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 23:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432BF4B143;
	Wed, 20 Dec 2023 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8hr8pYq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47E4B142
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7fb34265fso9414839f.3
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 15:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116507; x=1703721307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqPdBL+/GuMSQccpt6uaKdYbWfswQmujpY/bP5YPpNI=;
        b=Q8hr8pYq4FWBKc/qoEPWCGlisUvxT579O0+S7xTRUw6cEhEunxdUKX+ta5Gc9u14O/
         LRKRHBoOcgL0kh2n53OIED0PpLHs+H0EX9n3VQfo4jul8nSkwJ/UvbbPPbMv00c35V9x
         lW4VQtlDijHZXwOZQuj2r6ZaTqbfQUAkN1wB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116507; x=1703721307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqPdBL+/GuMSQccpt6uaKdYbWfswQmujpY/bP5YPpNI=;
        b=JI0F8ksqOCOvjPquIz4/J08hNxK/Hx4ChT9sf/eKwKNWY5BweTzTnKgDJlAAwKA/w7
         bsebdPUIU3j5xNbwTLZWVLvlBNy3m+hJ7h8zWvXRTpHaQFXCj/R5Nhjb9QhLrxJ8038k
         xyLbJWs07g85F+4gKmHlTx3tY6Fopi6DqqlXBXoyzNQf/7GsW/v/kYcDA22f9qs5lemV
         v17BKyyDoohGTMwVv/DWNb00Rz9ewfounrrMvpOa4Fcsdb2iXniYzpgehYuK5cb/PYjw
         UxY3uM38HWtMssd6RyhhWq2ieP/VF6YTAtAdMZzS+k7Jpmm1n1K/sCL+VLPnqmMiRHVs
         OHTQ==
X-Gm-Message-State: AOJu0YxvTEit8r67A/7irQpZ+Qz2yBRJviJX3rVvv5e80iBLYwJGxz0l
	6R77//uE7VfQW4t/zf5WVR/2hA==
X-Google-Smtp-Source: AGHT+IGvcm8Gmt6btmyTyMqXZVRSOfPvmnIP9TnUstnyKtl6UnorIC2YtaIno3O39yYnkXIJfI/h3g==
X-Received: by 2002:a05:6602:4148:b0:7b7:b370:bd51 with SMTP id bv8-20020a056602414800b007b7b370bd51mr10520071iob.35.1703116507495;
        Wed, 20 Dec 2023 15:55:07 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:07 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	David Gow <davidgow@google.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lee Jones <lee@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Prashant Malani <pmalani@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Barnes <robbarnes@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Takashi Iwai <tiwai@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Xu <xuwei5@hisilicon.com>,
	Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/22] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Wed, 20 Dec 2023 16:54:14 -0700
Message-ID: <20231220235459.2965548-1-markhas@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the cros_ec driver assumes that its associated interrupt is
wake capable. This is an incorrect assumption as some Chromebooks use a
separate wake pin, while others overload the interrupt for wake and IO.
This patch train updates the driver to query the underlying ACPI/DT data
to determine whether or not the IRQ should be enabled for wake.

Both the device tree and ACPI systems have methods for reporting IRQ
wake capability. In device tree based systems, a node can advertise
itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
Interrupt resource descriptors can use the 'SharedAndWake' or
'ExclusiveAndWake' share types.

Some logic is added to the platform, ACPI, and DT subsystems to more
easily pipe wakeirq information up to the driver.

Changes in v2:
-Rebase on linux-next
-Add cover letter
-See each patch for patch specific changes

Mark Hasemeyer (22):
  gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
  i2c: acpi: Modify i2c_acpi_get_irq() to use resource
  Documentation: devicetree: Clarify wording for wakeup-source property
  ARM: dts: tegra: Enable cros-ec-spi as wake source
  ARM: dts: rockchip: rk3288: Enable cros-ec-spi as wake source
  ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
  ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
  arm64: dts: tegra: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
  arm64: dts: rockchip: rk3399: Enable cros-ec-spi as wake source
  of: irq: add wake capable bit to of_irq_resource()
  of: irq: Add default implementation for of_irq_to_resource()
  of: irq: Remove extern from function declarations
  device property: Modify fwnode irq_get() to use resource
  platform: Modify platform_get_irq_optional() to use resource
  platform/chrome: cros_ec: Use PM subsystem to manage wakeirq

 .../bindings/power/wakeup-source.txt          | 18 +++--
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   |  1 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts |  1 +
 .../rockchip/rk3288-veyron-chromebook.dtsi    |  1 +
 .../boot/dts/samsung/exynos5420-peach-pit.dts |  1 +
 .../boot/dts/samsung/exynos5800-peach-pi.dts  |  1 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  1 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  1 +
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
 drivers/acpi/property.c                       | 11 ++-
 drivers/base/platform.c                       | 74 +++++++++++++------
 drivers/base/property.c                       | 24 +++++-
 drivers/gpio/gpiolib-acpi.c                   | 25 ++++---
 drivers/i2c/i2c-core-acpi.c                   | 38 +++++-----
 drivers/i2c/i2c-core-base.c                   |  6 +-
 drivers/i2c/i2c-core.h                        |  4 +-
 drivers/of/irq.c                              | 32 +++++++-
 drivers/of/property.c                         |  8 +-
 drivers/platform/chrome/cros_ec.c             |  9 ---
 drivers/platform/chrome/cros_ec_lpc.c         | 52 ++++++++++++-
 drivers/platform/chrome/cros_ec_spi.c         | 41 ++++++++--
 drivers/platform/chrome/cros_ec_uart.c        | 34 +++++++--
 include/linux/acpi.h                          | 23 +++---
 include/linux/fwnode.h                        |  8 +-
 include/linux/of_irq.h                        | 41 +++++-----
 include/linux/platform_data/cros_ec_proto.h   |  2 -
 include/linux/platform_device.h               |  3 +
 include/linux/property.h                      |  2 +
 35 files changed, 328 insertions(+), 142 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


