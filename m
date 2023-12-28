Return-Path: <linux-i2c+bounces-1052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AE81F896
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 14:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B071C2330F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 13:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A1912B8C;
	Thu, 28 Dec 2023 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsm6+4s/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90975111A1
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d5f40ce04so12321475e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 04:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768303; x=1704373103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/YL/2OiXBxCX/gD6IApJPmq9GlVQJZGnRfROzab14c=;
        b=tsm6+4s/hz3xpEd26lt/8M4X3EVCQ0CHQE77inkpa1ZvGyHUzzxMhzn8GEOsCLVQaZ
         xClfMrKKs9Tobv4xSDbVXSoESRqv33+54OZK7cmlp1L/s4UyFO/zW7iWYlWc9kJpZblG
         Sk/9n1jsDFkDHeP725dBrh5bQmQ7yxm607qS2efQmAVLXP/Z74PuhkN2Ua+35zyCZSMT
         I0YvFM4QY90xKQPkFbYS4q3+HgczMl99IjQyHSWWfpL3gMHDw33JueHNZy8rIHoxrqj4
         O+1lp5PB08sEuaSSmAoGQzNqEJ6nnLC4Kto0iVJ2UyQ5G1Njphr/ToJk0915JQe5ThVr
         hMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768303; x=1704373103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/YL/2OiXBxCX/gD6IApJPmq9GlVQJZGnRfROzab14c=;
        b=LwbzMNfnWL5LBtVgnOuzjekHqDOxBRr2th/IbY5BPbDw1FkH4r0YX+rMIdY8qX8hny
         w+0W5C22QESVJcdXS6u0GdtdidOH1Wxc4feVRY0CvUkY1U5Re4i8iPASHFoYTGjeMaJz
         AKFjRcw0A3vtLIIqJBL79/IZbNk/PNBBBKfzO7WS5qL2ZWbHPWcUxcGOHvV7XOt/+Qg3
         SVUcmfWW+QVJUXA9E+PQ/uJJqx+EQz5I9xitpT5MuY0ypquz8n6w5uHPau4hMQq6Vf1k
         oX97DDzFlL4wWLPiC7qpl5MNFHCF3vFGLyqOohaC/a0ixKnrcv8hI5bu+nvjN2Y0LVEm
         330A==
X-Gm-Message-State: AOJu0YwdUyF40HyTClMR8B2KLkSmpF39Qbhaw2r3Wv3mI4FHG9CWCEQK
	K25tZ117YeADa0IHWa8mjtxYbOZZ2MVd7J1YidCc5v3G+W4oSw==
X-Google-Smtp-Source: AGHT+IFFojsXoPb7K03oLgZ6jOvlLwBUwXu6zQoSVyiXDmyrmZ5YE9jkYffXSKkyFMwlzu2dsPNUsQ==
X-Received: by 2002:a05:600c:4ca5:b0:40d:39cb:6af6 with SMTP id g37-20020a05600c4ca500b0040d39cb6af6mr5506215wmp.28.1703768302945;
        Thu, 28 Dec 2023 04:58:22 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:22 -0800 (PST)
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
Subject: [PATCH v2 12/12] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
Date: Thu, 28 Dec 2023 12:58:05 +0000
Message-ID: <20231228125805.661725-13-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231228125805.661725-1-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the eeprom found on the battery connector.

The selection of the USI protocol is done in the board dts file because
the USI CONFIG register comes with a 0x0 reset value, meaning that USI8
does not have a default protocol (I2C, SPI, UART) at reset.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2:
- move cells and pinctrls properties to dtsi
- collect Sam's R-b

 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 4a71f752200d..cb4d17339b6b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -63,6 +63,15 @@ &ext_200m {
 	clock-frequency = <200000000>;
 };
 
+&hsi2c_8 {
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -99,6 +108,11 @@ &usi_uart {
 	status = "okay";
 };
 
+&usi8 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.472.g3155946c3a-goog


