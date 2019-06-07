Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421923863E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfFGI3K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:29:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33612 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfFGI3J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 04:29:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so3534305wme.0
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nmWKh7PwMWUSmXx8hL09I0aV6DcSJSwvr9bLIGJ3tMI=;
        b=AyZfyAmQeXNEiP7RPbbfDBumiDsi4J1GXIiKS5FtoVjZAhUXPa6Cj00boE1RmzpE7H
         6TmLUUioK7k7lsUPncUpHomSWTfn0+GGfKjg1D71Sev6xfoob2h//ucywBfg5R7XzBf/
         E3grARv8fTiWcaeHEbh9BBf/er7wN16flgMAXx7ErSQqlAYSXLuneo0QGx6YAAF8CAmp
         iIgGNE7SW4mvY3vuMWpgTZCHtsZMH7tfWqI9FhfyYz/74oO6FRiwtMbGz+N8oxx+Vs5W
         ivCVi2ZkYDKvOnNj8w5TA8X3FojMNPHlnDriNRUx2vAzh0xnZdzVuW0FD6Zoi0acKiLW
         94Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nmWKh7PwMWUSmXx8hL09I0aV6DcSJSwvr9bLIGJ3tMI=;
        b=uV4xcqobLe7et8LSkZkB8i9LZPm7iMZT2NI3u8GdVJf4UPqbWbS8IFsKL8GzXucny4
         IfESX9opPYlvjk2HKHK4I/uli1MIpw+rY6SbUAlOd24P2KnPUd0FAFqlYcTHdcqJmhSx
         0rWszKtLMCfXyfB8dyUYLwbyyLtBiRaRr8jEsPM5etgD2AW48oiDGt4AH8HoJ53GNkrI
         EcxhAOWHcwCz6wgk6c7MUrmekif3ngYnozO6kCZaxP0GliqJFkXjUVuZhOH2azSzjjwi
         WThij79t3DWg5T8WKNW/sFgCd5++P6m2EHnbFMNHsmoXiFrStP/qOHWAVf+ND4S891bC
         lqYA==
X-Gm-Message-State: APjAAAWTJDyh7Ch1c2hC1mnBjVFtmAzsdy3PrZQ7AnSm6X6Z3FePy/gB
        vqsV8pEjmse477WKKsD3sd2aLg==
X-Google-Smtp-Source: APXvYqxhNGHprs5mobbbQQ3HtWKc5AtRyRdHHZ4SFkzTzb+ehcZsDkDnP806YoxTtV2cwPPWRyFnRQ==
X-Received: by 2002:a1c:f116:: with SMTP id p22mr2673398wmh.70.1559896146876;
        Fri, 07 Jun 2019 01:29:06 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Date:   Fri,  7 Jun 2019 09:28:57 +0100
Message-Id: <20190607082901.6491-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch provides basic support for booting with ACPI instead
of the currently supported Device Tree.  When doing so there are a
couple of differences which we need to taken into consideration.

Firstly, the SDM850 ACPI tables omit information pertaining to the
4 reserved GPIOs on the platform.  If Linux attempts to touch/
initialise any of these lines, the firmware will restart the
platform.

Secondly, when booting with ACPI, it is expected that the firmware
will set-up things like; Regulators, Clocks, Pin Functions, etc in
their ideal configuration.  Thus, the possible Pin Functions
available to this platform are not advertised when providing the
higher GPIOD/Pinctrl APIs with pin information.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 35 ++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 2e66ab72c10b..aafbe932424f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -168,7 +168,7 @@ config PINCTRL_SDM660
 
 config PINCTRL_SDM845
        tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
-       depends on GPIOLIB && OF
+       depends on GPIOLIB && (OF || ACPI)
        select PINCTRL_MSM
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c97f20fca5fd..7188bee3cf3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1277,6 +1278,10 @@ static const struct msm_pingroup sdm845_groups[] = {
 	UFS_RESET(ufs_reset, 0x99f000),
 };
 
+static const int sdm845_acpi_reserved_gpios[] = {
+	0, 1, 2, 3, 81, 82, 83, 84, -1
+};
+
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.pins = sdm845_pins,
 	.npins = ARRAY_SIZE(sdm845_pins),
@@ -1284,14 +1289,41 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sdm845_functions),
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
+	.reserved_gpios = sdm845_acpi_reserved_gpios,
+	.ngpios = 150,
+};
+
+static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
+	.pins = sdm845_pins,
+	.npins = ARRAY_SIZE(sdm845_pins),
+	.groups = sdm845_groups,
+	.ngroups = ARRAY_SIZE(sdm845_groups),
+	.reserved_gpios = sdm845_acpi_reserved_gpios,
 	.ngpios = 150,
 };
 
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	int ret;
+
+	if (pdev->dev.of_node) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_pinctrl);
+	} else if (ACPI_HANDLE(&pdev->dev)) {
+		ret = msm_pinctrl_probe(pdev, &sdm845_acpi_pinctrl);
+	} else {
+		dev_err(&pdev->dev, "DT and ACPI disabled\n");
+		return -EINVAL;
+	}
+
+	return ret;
 }
 
+static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
+	{ "QCOM0217"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, sdm845_pinctrl_acpi_match);
+
 static const struct of_device_id sdm845_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdm845-pinctrl", },
 	{ },
@@ -1302,6 +1334,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.name = "sdm845-pinctrl",
 		.pm = &msm_pinctrl_dev_pm_ops,
 		.of_match_table = sdm845_pinctrl_of_match,
+		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

