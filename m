Return-Path: <linux-i2c+bounces-1079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CC8222E6
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 22:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 560BE1C217F0
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 21:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6369F16436;
	Tue,  2 Jan 2024 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FXsKUh/S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFE16435
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jan 2024 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7ba8c218fe1so522819839f.3
        for <linux-i2c@vger.kernel.org>; Tue, 02 Jan 2024 13:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229723; x=1704834523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7mFJdJJR38MVoewAU3PshqnCmTUbmo4+vjrut4nXkA=;
        b=FXsKUh/St9ROpCfBxBctElZ0B8NOZqVdhhpKFefJYaizRpZLwRtSk/hSpzpGNwADQf
         EurbVWdvdquu7SIHdT0PKV6Ygvoc1xI3N7gLMSmXNZ1OR27sna3yytDi+Eij/TtOjzVj
         Z7pFyGExz2c+fIdTeavtr7qLTDYYLxrN/lUzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229723; x=1704834523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7mFJdJJR38MVoewAU3PshqnCmTUbmo4+vjrut4nXkA=;
        b=wL2AjAmM5ZFrQ9+QZcX8akytlujHbjD2pXEe7NgfkOxJMN3ZEkObKS6iXl4ItIQYp6
         dPgcZkpjoDFyuoQM3Jzbmrwgv/FBrc7Xj9Dzthx5ThT95HFUCUcpcqb9Fj+u5ZQIWHcT
         d74d+zLWANw0Xu3uWgDDwoFo/rMPw1XSpa8pMKhCLPkmkUbiIgAEZnYp1K5YWbtrCvJ6
         Xlj4tKxvuLxTl9w/S+H0dgDmPlbls3KmB7vkxseFq28zIQt1vFThBJW1k+u/q5j92mS6
         2mCOtRemF5amAFscHR0OiII8bPuTK2Uf1xvIph44DuqBDMlJAoydzk8A1bqgEr57ynsN
         wTGg==
X-Gm-Message-State: AOJu0YxUhAcYB50f7MXTybyMjatbMcWDtpncPNbhBzHBaS2OkL96SuyK
	pCaoEXEE4nkvfKSc047emDMDVxfgMYfd
X-Google-Smtp-Source: AGHT+IH30ze8lliPJsLy0+gFPaeKunMXu0LXjX1HO6/sLENHoZmveXOqCkZRgWXN24Z3/Wl9tJipHw==
X-Received: by 2002:a05:6602:e03:b0:7ba:a232:30fe with SMTP id gp3-20020a0566020e0300b007baa23230femr13087461iob.20.1704229723563;
        Tue, 02 Jan 2024 13:08:43 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:43 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
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
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Paul Barker <paul.barker@sancloud.com>,
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
Subject: [PATCH v4 00/24] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Tue,  2 Jan 2024 14:07:24 -0700
Message-ID: <20240102210820.2604667-1-markhas@chromium.org>
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

Changes in v4:
-Rebase on linux-next
-See each patch for patch specific changes

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
  device property: Update functions to use EXPORT_SYMBOL_GPL()
  platform: Modify platform_get_irq_optional() to use resource
  platform/chrome: cros_ec: Use PM subsystem to manage wakeirq

 .../bindings/power/wakeup-source.txt          | 18 ++--
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
 drivers/base/platform.c                       | 90 ++++++++++++-------
 drivers/base/property.c                       | 40 ++++++---
 drivers/gpio/gpiolib-acpi.c                   | 28 ++++--
 drivers/i2c/i2c-core-acpi.c                   | 43 ++++-----
 drivers/i2c/i2c-core-base.c                   |  6 +-
 drivers/i2c/i2c-core.h                        |  4 +-
 drivers/of/irq.c                              | 39 +++++++-
 drivers/of/property.c                         |  8 +-
 drivers/platform/chrome/cros_ec.c             | 48 ++++++++--
 drivers/platform/chrome/cros_ec_lpc.c         | 40 +++++++--
 drivers/platform/chrome/cros_ec_spi.c         | 15 ++--
 drivers/platform/chrome/cros_ec_uart.c        | 14 ++-
 include/linux/acpi.h                          | 25 +++---
 include/linux/fwnode.h                        |  8 +-
 include/linux/ioport.h                        | 20 +++--
 include/linux/of_irq.h                        | 41 +++++----
 include/linux/platform_data/cros_ec_proto.h   |  4 +-
 include/linux/platform_device.h               |  3 +
 include/linux/property.h                      |  2 +
 36 files changed, 350 insertions(+), 172 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


