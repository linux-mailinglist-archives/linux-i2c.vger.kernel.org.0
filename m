Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A2344B0FD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 17:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbhKIQT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 11:19:57 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38764 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbhKIQT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 11:19:56 -0500
Received: by mail-oi1-f173.google.com with SMTP id r26so13295672oiw.5;
        Tue, 09 Nov 2021 08:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4hv3lNiKtCV9caPy7LZaczGaDSUcKdCzFY13hA0esuk=;
        b=wonHPy4S3Vn+eMLGTE5F38W/7mZf6mD9zj+O/tN01pbM+z6XFH6CpuHewtFVWVEWRI
         wHsXtyWsqdvlKu7f/Y7ufbzc+I9PzUoqk1lIz0+ECol44rWAc1kCRqacrPVXV3q2BOaX
         Xmr/9RadaCow47YZhBhGt15jr54n22RgIRU8/arWosRsfLnXjPUVwej/HZxrUZuNg7rE
         qZf3ve0Cv7YojuMHSimkGZXPbKK0IYBULm7n5XhciSUx8Ad9XCH3xMmYdnuH1VblS14W
         iqEgEVEF5PvVUwBF55v8N1ApTyFUGxeQOCm2qwxeSlfrvjOkktUwvZd+1Pl5JmD0EcLV
         oCbg==
X-Gm-Message-State: AOAM532zi8tJkwu/BmIIFCydPX9JBEA1BjnoR14P8CEUDXWaZ0n90vuy
        moPjnODnrl2OogU1Fs7FGkALUdbbmA==
X-Google-Smtp-Source: ABdhPJxHZ4VI7DSvTKNUC5hrVKjdgRHeB9oCykyK0rT2lAjdeeJyho5biBnNUY8N6L/QrBqc2rDLfQ==
X-Received: by 2002:aca:ad95:: with SMTP id w143mr5695268oie.47.1636474629421;
        Tue, 09 Nov 2021 08:17:09 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id g2sm1001861oic.35.2021.11.09.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:17:08 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH] dt-bindings: Remove Netlogic bindings
Date:   Tue,  9 Nov 2021 10:17:07 -0600
Message-Id: <20211109161707.2209170-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support for Netlogic was removed in commit 95b8a5e0111a ("MIPS: Remove
NETLOGIC support"). Remove the now unused bindings.

The GPIO binding also includes "brcm,vulcan-gpio", but it appears to be
unused as well as Broadcom Vulkan became Cavium ThunderX2 which is ACPI
based.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: George Cherian <gcherian@marvell.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-xlp.txt     | 49 -------------------
 .../devicetree/bindings/i2c/i2c-xlp9xx.txt    | 22 ---------
 .../devicetree/bindings/spi/spi-xlp.txt       | 38 --------------
 3 files changed, 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xlp.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-xlp.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xlp.txt b/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
deleted file mode 100644
index 47fc64922fe0..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Netlogic XLP Family GPIO
-========================
-
-This GPIO driver is used for following Netlogic XLP SoCs:
-	XLP832, XLP316, XLP208, XLP980, XLP532
-This GPIO driver is also compatible with GPIO controller found on
-Broadcom Vulcan ARM64.
-
-Required properties:
--------------------
-
-- compatible: Should be one of the following:
-  - "netlogic,xlp832-gpio": For Netlogic XLP832
-  - "netlogic,xlp316-gpio": For Netlogic XLP316
-  - "netlogic,xlp208-gpio": For Netlogic XLP208
-  - "netlogic,xlp980-gpio": For Netlogic XLP980
-  - "netlogic,xlp532-gpio": For Netlogic XLP532
-  - "brcm,vulcan-gpio": For Broadcom Vulcan ARM64
-- reg: Physical base address and length of the controller's registers.
-- #gpio-cells: Should be two. The first cell is the pin number and the second
-  cell is used to specify optional parameters (currently unused).
-- gpio-controller: Marks the device node as a GPIO controller.
-- nr-gpios: Number of GPIO pins supported by the controller.
-- interrupt-cells: Should be two. The first cell is the GPIO Number. The
-  second cell is used to specify flags. The following subset of flags is
-  supported:
-  - trigger type:
-	1 = low to high edge triggered.
-	2 = high to low edge triggered.
-	4 = active high level-sensitive.
-	8 = active low level-sensitive.
-- interrupts: Interrupt number for this device.
-- interrupt-controller: Identifies the node as an interrupt controller.
-
-Example:
-
-	gpio: xlp_gpio@34000 {
-		compatible = "netlogic,xlp316-gpio";
-		reg = <0 0x34100 0x1000
-		       0 0x35100 0x1000>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		nr-gpios = <57>;
-
-		#interrupt-cells = <2>;
-		interrupt-parent = <&pic>;
-		interrupts = <39>;
-		interrupt-controller;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt b/Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
deleted file mode 100644
index f818ef507ab7..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device tree configuration for the I2C controller on the XLP9xx/5xx SoC
-
-Required properties:
-- compatible      : should be "netlogic,xlp980-i2c"
-- reg             : bus address start and address range size of device
-- interrupts      : interrupt number
-
-Optional properties:
-- clock-frequency : frequency of bus clock in Hz
-                    Defaults to 100 KHz when the property is not specified
-
-Example:
-
-i2c0: i2c@113100 {
-	compatible = "netlogic,xlp980-i2c";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0 0x113100 0x100>;
-	clock-frequency = <400000>;
-	interrupts = <30>;
-	interrupt-parent = <&pic>;
-};
diff --git a/Documentation/devicetree/bindings/spi/spi-xlp.txt b/Documentation/devicetree/bindings/spi/spi-xlp.txt
deleted file mode 100644
index f4925ec0ed33..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-xlp.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-SPI Master controller for Netlogic XLP MIPS64 SOCs
-==================================================
-
-Currently this SPI controller driver is supported for the following
-Netlogic XLP SoCs:
-	XLP832, XLP316, XLP208, XLP980, XLP532
-
-Required properties:
-- compatible		: Should be "netlogic,xlp832-spi".
-- #address-cells	: Number of cells required to define a chip select address
-			  on the SPI bus.
-- #size-cells		: Should be zero.
-- reg			: Should contain register location and length.
-- clocks		: Phandle of the spi clock
-- interrupts		: Interrupt number used by this controller.
-
-SPI slave nodes must be children of the SPI master node and can contain
-properties described in Documentation/devicetree/bindings/spi/spi-bus.txt.
-
-Example:
-
-	spi: xlp_spi@3a100 {
-		compatible = "netlogic,xlp832-spi";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0 0x3a100 0x100>;
-		clocks = <&spi_clk>;
-		interrupts = <34>;
-		interrupt-parent = <&pic>;
-
-		spi_nor@1 {
-			compatible = "spansion,s25sl12801";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <1>;	/* Chip Select */
-			spi-max-frequency = <40000000>;
-		};
-};
-- 
2.32.0

