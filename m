Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0144B103C3A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 14:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbfKTNly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 08:41:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:49640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730129AbfKTNlx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Nov 2019 08:41:53 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A18BD2251E;
        Wed, 20 Nov 2019 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257312;
        bh=p82dBoBEojEnZartlAxiV4JLOKDykjVTELMhzhYJy1g=;
        h=From:To:Cc:Subject:Date:From;
        b=sXJZMl0DZ1XPNzikD9oAzbO44QoY2xqaogFzibxNZZhQVPoJYlZSGiaW+Yvl5ypkb
         w7H3mCgRPhFTLpDv7mrBQe/IEti97gdJekYU3t4fWXlq9fB1MXiyeZuLTfKeOGo74R
         EL80VeAN33+Zf0Y4CbsHwMc0Tem3kem/r+zICANo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:41:49 +0800
Message-Id: <20191120134149.15360-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/Kconfig | 16 ++++++++--------
 drivers/i2c/muxes/Kconfig  | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 45ca099e7315..6ed89856e519 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -293,7 +293,7 @@ config I2C_VIA
 	select I2C_ALGOBIT
 	help
 	  If you say yes to this option, support will be included for the VIA
-          82C586B I2C interface
+	  82C586B I2C interface
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-via.
@@ -678,11 +678,11 @@ config I2C_IMX_LPI2C
 	tristate "IMX Low Power I2C interface"
 	depends on ARCH_MXC || COMPILE_TEST
 	help
-          Say Y here if you want to use the Low Power IIC bus controller
-          on the Freescale i.MX processors.
+	  Say Y here if you want to use the Low Power IIC bus controller
+	  on the Freescale i.MX processors.
 
-          This driver can also be built as a module. If so, the module
-          will be called i2c-imx-lpi2c.
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-imx-lpi2c.
 
 config I2C_IOP3XX
 	tristate "Intel IOPx3xx and IXP4xx on-chip I2C interface"
@@ -1285,9 +1285,9 @@ config I2C_VIPERBOARD
 	help
 	  Say yes here to access the I2C part of the Nano River
 	  Technologies Viperboard as I2C master.
-          See viperboard API specification and Nano
-          River Tech's viperboard.h for detailed meaning
-          of the module parameters.
+	  See viperboard API specification and Nano
+	  River Tech's viperboard.h for detailed meaning
+	  of the module parameters.
 
 comment "Other I2C/SMBus bus drivers"
 
diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index c6040aa839ac..1708b1a82da2 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -109,14 +109,14 @@ config I2C_DEMUX_PINCTRL
 	  want to change the I2C master at run-time depending on features.
 
 config I2C_MUX_MLXCPLD
-        tristate "Mellanox CPLD based I2C multiplexer"
-        help
-          If you say yes to this option, support will be included for a
-          CPLD based I2C multiplexer. This driver provides access to
-          I2C busses connected through a MUX, which is controlled
-          by a CPLD register.
-
-          This driver can also be built as a module.  If so, the module
-          will be called i2c-mux-mlxcpld.
+	tristate "Mellanox CPLD based I2C multiplexer"
+	help
+	  If you say yes to this option, support will be included for a
+	  CPLD based I2C multiplexer. This driver provides access to
+	  I2C busses connected through a MUX, which is controlled
+	  by a CPLD register.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mlxcpld.
 
 endmenu
-- 
2.17.1

