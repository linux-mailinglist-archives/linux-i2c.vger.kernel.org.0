Return-Path: <linux-i2c+bounces-9247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E850A24F74
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 19:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86CA77A1F7B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F251FCFCE;
	Sun,  2 Feb 2025 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PvRkanL+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD462A1A4;
	Sun,  2 Feb 2025 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738521504; cv=none; b=Xd6Ai8CgBofwJfdu3Y0fiKleUnxR5LNWUB5LsZyRPK+dZizmiXJlFLmK6WX6bUcQ9XjMo1+fE4jUFTf2kro8y3wO3fhKd4ITEzvxCq1VrnkFEV//NBoW4FtF0imoxaMkrXApMhlNNdHqLcVFtPd0tkmxG8JpbwiyxEqDVhuGAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738521504; c=relaxed/simple;
	bh=PJpkgskkNYqE5ktWw6CmmWj99ePEwkxlYbUu1j7z2tQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sgza5YpeXNOVeWj6Y3WNQJLndUChkGjK8Bs4jBfCEDw2LFIQYJTTQdkqKs4wDF5aki9P1At70FRFQ/QQizHOA533CoFaeNwzUwq/oAW+zBImFZ+O12jdz4wb25NC9lSSXe5LrqlYMy57MX25ls3KRBdcya8qS8hP0L5+gEG0b/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PvRkanL+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F211924D2C;
	Sun,  2 Feb 2025 19:38:11 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEy66ANLXArl; Sun,  2 Feb 2025 19:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738521487; bh=PJpkgskkNYqE5ktWw6CmmWj99ePEwkxlYbUu1j7z2tQ=;
	h=From:Subject:Date:To:Cc;
	b=PvRkanL+THf7F0wJyRMfB4LMkH1MPC/pG9VfEO20TqFB1gTnivf3bmhWs56ZXjTuy
	 1/DKfAcHXhDlpT7dQm452xmiL3Dp54ty6+0kg7giSIINEDGSL3NOR5yAxEt5GL1DH6
	 SdgrDIj+G6K/4/xY6QFe3IWjCvVqnT7BsJ5Ccfm8CwPAWI+6JaoJyUSiD7G98lqWjn
	 qsyQ2CCWkbR9M/1GzNw62FUXLt+SGgb9ptR+gHHR3LRmxC3bjWaewgB/uiFCQJ2K2/
	 i/TZvyU1Ao9ULDNM8ff3udU0yroWs6G+AyKSBU5Aj+/ZKRjWeQ7dUDMIn/0jcZax9N
	 boofc5bJitG+w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 00/33] Add support for the Exynos7870 SoC, along with three
 devices
Date: Mon, 03 Feb 2025 00:06:33 +0530
Message-Id: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADG7n2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwND3dSKyrz8YnMLcwNdAxNLUwvzVJMk85Q0JaCGgqLUtMwKsGHRsbW
 1AMsls61cAAAA
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738521464; l=6574;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=PJpkgskkNYqE5ktWw6CmmWj99ePEwkxlYbUu1j7z2tQ=;
 b=OQtdK1RGc0JLdcNe0AAwrKVcWolcTpa0ZUxZtTQKZh2HI/tE+Yxg3q5N8DaCYUDzMaj8ii3Z3
 nZlAC/KW2OeALOGfeSJkRYgLwjHwBi5N9Fw5vGYllF7W3vwwCgIL231
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
announced in 2016. The chipset was found in several popular mid-range to
low-end Samsung phones, released within 2016 to 2019.

This patch series aims to add support for Exynos 7870, starting with the
most basic yet essential components such as CPU, GPU, clock controllers,
PMIC, pin controllers, etc.

Moreover, the series also adds support for three Exynos 7870 devices via
devicetree. The devices are:
 * Samsung Galaxy J7 Prime     - released 2016, codename on7xelte
 * Samsung Galaxy J6           - released 2018, codename j6lte
 * Samsung Galaxy A2 Core      - released 2019, codename a2corelte

Additional features implemented in this series include:
 * I2C     - touchscreen, IIO sensors, etc.
 * UART    - bluetooth and serial debugging
 * MMC     - eMMC, Wi-Fi SDIO, SDCard
 * USB     - micro-USB 2.0 interface

The series has commits from me and Sergey, who has given me permission
to upstream their patches with proper attribution.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (26):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      dt-bindings: clock: document exynos7870 clock driver CMU bindings
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      dt-bindings: serial: samsung: add exynos7870-uart compatible
      dt-bindings: mfd: samsung,s2mps11: add compatible for s2mpu05-pmic
      regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      dt-bindings: gpu: arm,mali-midgard: add exynos7870 mali compatible
      dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
      dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible
      dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
      dt-bindings: soc: samsung,boot-mode: add boot mode definitions for exynos7870
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      soc: samsung: exynos-chipid: add support for exynos7870
      clk: samsung: add exynos7870 CLKOUT support
      tty: serial: samsung: add support for exynos7870
      phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      usb: dwc3: exynos: add support for exynos7870
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

Sergey Lisov (7):
      dt-bindings: clock: add clock definitions for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver
      pinctrl: samsung: add support for exynos7870 pinctrl
      mfd: sec: add support for S2MPU05 PMIC
      regulator: s2mps11: Add support for S2MPU05 regulators
      phy: exynos5-usbdrd: add exynos7870 USBDRD support
      mmc: dw_mmc: add exynos7870 support, with a quirk for accessing 64-bit FIFOs in two halves

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 .../bindings/clock/samsung,exynos7870-clock.yaml   |  246 +++
 .../devicetree/bindings/gpu/arm,mali-midgard.yaml  |    5 +-
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |    1 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |    1 +
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   13 +
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |    2 +
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |    2 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |    2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    1 +
 .../bindings/regulator/samsung,s2mpu05.yaml        |   44 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |    2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 .../bindings/usb/samsung,exynos-dwc3.yaml          |   34 +-
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  624 +++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  611 +++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  659 +++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    3 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 drivers/mfd/sec-core.c                             |   12 +
 drivers/mfd/sec-irq.c                              |   85 +
 drivers/mmc/host/dw_mmc-exynos.c                   |   41 +-
 drivers/mmc/host/dw_mmc.c                          |   94 +-
 drivers/mmc/host/dw_mmc.h                          |   27 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           |  407 ++++-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  141 ++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   29 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/regulator/Kconfig                          |    4 +-
 drivers/regulator/s2mps11.c                        |   92 +-
 drivers/soc/samsung/exynos-chipid.c                |    1 +
 drivers/tty/serial/samsung_tty.c                   |   13 +
 drivers/usb/dwc3/dwc3-exynos.c                     |    9 +
 include/dt-bindings/clock/exynos7870.h             |  324 ++++
 include/dt-bindings/soc/samsung,boot-mode.h        |    6 +
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |   44 +
 include/linux/mfd/samsung/s2mpu05.h                |  152 ++
 include/linux/soc/samsung/exynos-regs-pmu.h        |    2 +
 45 files changed, 7257 insertions(+), 81 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


