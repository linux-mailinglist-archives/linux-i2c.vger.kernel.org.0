Return-Path: <linux-i2c+bounces-1040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF981F842
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 13:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E5A1C21E5C
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 12:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6664079EE;
	Thu, 28 Dec 2023 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pm+ekVmV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BC749A
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d5aa35b60so19154865e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 04:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768291; x=1704373091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsbdU9VAZ2t0ZraxiZCzdliAmxrS9fPUQ39YR7Q+Pfc=;
        b=Pm+ekVmVfzrmjlBm7t02AUl7MY5cy+1ckn584dT6J2YvKK8C2ON/z6yi0VBfaG9qsv
         OyyuuaNx68DwBcD9708lH++G8SQiir2RQnRzzXkRgHUpM+rM8Ndj6WQfcI2IxeU5pMfp
         8EHhv5DrzJltXn/UvJ0G8PDxsDHcGZfjxLBHhEV7uE0bU8THy4rA0AyM5rqTNKQ63JNd
         f3Mr9WcpQTEyxe9vUPdITiZptsXjFYaVzSmaA81we3DWcSU5rNNboxxje3RrZ7/XpwmJ
         YjviQcpjmxlnb50UI4QJ7D+94Ar+3q3Rs9OzFXXfGO58b2w6HfBbxTnT0I47J5Fz1zMG
         GZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768291; x=1704373091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsbdU9VAZ2t0ZraxiZCzdliAmxrS9fPUQ39YR7Q+Pfc=;
        b=PgmbxWznkn74beQ8kQKIh9C5TjjeJyeAm8bBklwLS5X9vdJuJ3UZNZOSkpHbLBzD63
         QUMG0NGhp5F7SDOnOEG2MFyieMCGa3bfeGcAye9A58ppT+eQgT8b00C4I8bEuN2OeEU+
         oq2JdIowXpRR+bPsUvOWgTPisW11hyd3x+TlaKGWAlgVaZh1x0y++yi1jfTftkrqC/Ee
         Hugh/FiGe8gyTWuN7s1KI5Nkn3yMAe5lxLjfmbrIZaVnyQM43L4i5XMtIy4ESDnCiSvu
         9v0jZjPvxlU+8Om5OhsUveB6xVt7MEFgJpXY+KSF+miZZ1qZ4AekBGHlNbGn2pcRs4Ou
         5TGg==
X-Gm-Message-State: AOJu0YyHfF5HtGibuAKCTirWcQcJLogrPwGn2xniPyLu5HtiJLcOd9oL
	AH+Uox7oOVUl8AwC3Tfvnkfu9iAmAV+FYA==
X-Google-Smtp-Source: AGHT+IGT7Y/qsBkm1bYAfjc8+SVNa4uWWCNwMUN+bOyOZVmpbQ+Xf82nttKJqv9IsUBfmEvzJTA/nQ==
X-Received: by 2002:a05:600c:468c:b0:40d:4d91:609b with SMTP id p12-20020a05600c468c00b0040d4d91609bmr2711558wmo.355.1703768290528;
        Thu, 28 Dec 2023 04:58:10 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:09 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 00/12] GS101 Oriole: CMU_PERIC0 support and USI updates
Date: Thu, 28 Dec 2023 12:57:53 +0000
Message-ID: <20231228125805.661725-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for PERIC0 clocks. Use them for USI in serial and I2C
configurations. Tested the serial at different baudrates (115200,
1M, 3M) and the I2C with an at24 eeprom, all went fine.

Apart of the DT and defconfig changes, the patch set spans through the tty
and clk subsystems. The expectation is that Krzysztof will apply the whole
series through the Samsung SoC tree. If the tty and clk subsystem
maintainers can give an acked-by or reviewed-by on the relevant patches
that would be most appreciated!

Thanks!
ta

changes in v2:
- gs101 serial - infer the reg-io-width from the compatible as the entire
  PERIC block allows just 32-bit register accesses.
- identify the critical clocks from PERIC0 and mark them accordingly
  (if disabled these clocks hang the system even if their parents are
   still enabled).
- update dtsi and use USI's gate clocks instead of the dividers clocks
- move hsi2c_8 cells and pinctrls into dtsi
- address Sam's cosmetic changes in the device tree files
- drop defconfig patches (savedefconfig output & at24 eeprom enablement)
- collect Acked-by and Reviewed-by tags
- changes log in each patch as well, in the comments section under
  ```---```


Tudor Ambarus (12):
  dt-bindings: clock: google,gs101-clock: add PERIC0 clock management
    unit
  dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
  dt-bindings: serial: samsung: do not allow reg-io-width for gs101
  tty: serial: samsung: prepare for different IO types
  tty: serial: samsung: set UPIO_MEM32 iotype for gs101
  tty: serial: samsung: add gs101 earlycon support
  clk: samsung: gs101: add support for cmu_peric0
  arm64: dts: exynos: gs101: remove reg-io-width from serial
  arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
  arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
  arm64: dts: exynos: gs101: define USI8 with I2C configuration
  arm64: dts: exynos: gs101: enable eeprom on gs101-oriole

 .../bindings/clock/google,gs101-clock.yaml    |  25 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |   1 +
 .../bindings/serial/samsung_uart.yaml         |   2 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  14 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  56 +-
 drivers/clk/samsung/clk-gs101.c               | 583 ++++++++++++++++++
 drivers/tty/serial/samsung_tty.c              |  58 +-
 include/dt-bindings/clock/google,gs101.h      |  81 +++
 8 files changed, 796 insertions(+), 24 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


