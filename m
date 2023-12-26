Return-Path: <linux-i2c+bounces-1003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298381E930
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 20:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDBB9283054
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 19:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0011F17FF;
	Tue, 26 Dec 2023 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bhB8gn2b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58272185B
	for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b7fe0ae57bso282925839f.0
        for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 11:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618518; x=1704223318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTMdzaXRW7qZuQbwoV3Wl84rTkfhX+SS2G9EZyVMNtM=;
        b=bhB8gn2bTOUKiZC7bfODn2IWKIXN88hgEghVvxPNszXTfyl92IViWkh1IMM6qwLBdu
         qzN1ADOBPGa9SDdjyZDlPcby60E7YYXXuTJIHzptmNgtwV+KS2O5jzigkiVZFce0Dxn2
         3RxCnlPGEbkseBWIF9g+j/7ulMMGEEAGizR1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618518; x=1704223318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTMdzaXRW7qZuQbwoV3Wl84rTkfhX+SS2G9EZyVMNtM=;
        b=cFxtWhcymIQqw8RtgZz6vTNKW/2uNes3sAl+9Mwe2SuSbxPSGzzoXT2aAm+AX6S7c1
         DL4tbEnN59io8hAWuyJJyk5LMMF7VTmMADtdzhCrQRW0KQegOXGY6YCVXI/2QCsoxYsD
         1PUA7vYGQs+k3pkVljSyCPLtKMSUmwy5Bi2oikY4ReqCwfxcrheutTCQSyZZ3J/UaVHR
         79SFIzROpQL8dyeeTjDnzH/lu7Nx6V+QPmZfIYIMR1wdg2BLQp1Sot/CkouGa04SjDmI
         iaqkZkWW7E/vIwkWWdCU+N4S1FieFKdxdD9JTJ9TIiSMvdM+Ny7lr53WqCqgckzxdP+K
         9LSQ==
X-Gm-Message-State: AOJu0YzwOVMP0ndQUYA5lAICZwI0qjioKX/2agKrVreAaahsZhDWfE92
	fCzfL6elr6Zj0l3gqGnUgLTd+5a08KZx
X-Google-Smtp-Source: AGHT+IG4C2xoYudxRt+wWDCBtgSKAQTayFQAShLTQwb4dd83mgwRgc9KhsMLLL8fkL4EZvoyrMNzzQ==
X-Received: by 2002:a6b:d90a:0:b0:7b7:b27f:351c with SMTP id r10-20020a6bd90a000000b007b7b27f351cmr12182959ioc.14.1703618518475;
        Tue, 26 Dec 2023 11:21:58 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:21:58 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baoquan He <bhe@redhat.com>,
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
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Prashant Malani <pmalani@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Barnes <robbarnes@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Takashi Iwai <tiwai@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
Subject: [PATCH v3 00/24] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Tue, 26 Dec 2023 12:21:04 -0700
Message-ID: <20231226192149.1830592-1-markhas@chromium.org>
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

Changes in v3:
-Rebase on linux-next
-See each patch for patch specific changes

Changes in v2:
-Rebase on linux-next
-Add cover letter
-See each patch for patch specific changes

Mark Hasemeyer (24):
  resource: Add DEFINE_RES_*_NAMED_FLAGS macro
  gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
  i2c: acpi: Modify i2c_acpi_get_irq() to use resource
  dt-bindings: power: Clarify wording for wakeup-source property
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
  device property: Update functions to use EXPORT_SYMBOL_GPL
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
 drivers/base/platform.c                       | 70 +++++++++++++------
 drivers/base/property.c                       | 32 +++++++--
 drivers/gpio/gpiolib-acpi.c                   | 27 ++++---
 drivers/i2c/i2c-core-acpi.c                   | 37 +++++-----
 drivers/i2c/i2c-core-base.c                   |  6 +-
 drivers/i2c/i2c-core.h                        |  4 +-
 drivers/of/irq.c                              | 39 +++++++++--
 drivers/of/property.c                         |  8 +--
 drivers/platform/chrome/cros_ec.c             | 48 ++++++++++---
 drivers/platform/chrome/cros_ec_lpc.c         | 32 ++++++++-
 drivers/platform/chrome/cros_ec_spi.c         | 15 ++--
 drivers/platform/chrome/cros_ec_uart.c        | 22 ++++--
 include/linux/acpi.h                          | 23 +++---
 include/linux/fwnode.h                        |  8 ++-
 include/linux/ioport.h                        | 20 ++++--
 include/linux/of_irq.h                        | 41 ++++++-----
 include/linux/platform_data/cros_ec_proto.h   |  4 +-
 include/linux/platform_device.h               |  3 +
 include/linux/property.h                      |  2 +
 36 files changed, 336 insertions(+), 149 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


