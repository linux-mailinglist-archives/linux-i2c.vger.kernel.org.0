Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBB448ECF4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243038AbiANPSh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:18:37 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50786 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242435AbiANPSR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642173497; x=1673709497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=raOPInPiNpoFYNkwMgusjdwrbKTRJG+aT7u9K7/NxHA=;
  b=gPxIQ9NE9Q2L2/TckQMPVAJTxdlePIeLqS84z/5QPH6sHfgEqz1KzVXC
   4ZIrqSk7/apcKiFYrMVe6zhZa9WeW5mdOum6O7gv09b+bJOnSk4PRnDKh
   wK3ej4E/JHBJCBPW4ZUJQdf1D/t9af4PXgpICKSEInyENHjc1ydUi3eU0
   ZnA/taSOPnW19CJ1AxA+K2Lu1qV3vruDnxl4AjlnFHbebL5f1RHwfViXr
   NptbQXlRD+Fw5VjghfrTKQ9bInQcJwxOx2MxCYqFgaTIxIQqZmTHAJZ32
   rFxoL9aB4DTw6DR2LJLGNVCS95dIvgi4JiJ/CoeEAbybi36KhdIKEmtoH
   A==;
IronPort-SDR: PX/LMa5zroMvcheRMvJmmSuZSQ4sURh5136X1G6xQgzxW+k26UjOZuRymXExNiqT9MCt5VX4W+
 AITDwg3MLwbCnItLQFpO/R+A9JMURhbkHUw4cDD1w20+qK621kaXO0imVRuudpe0ht0LdeslGR
 H7JI6VySU4LTBFkJHiDczDH8KiRWEiUTurnx64EtRNyL9r54En3q5d1QEP//8ZqwWLLUL+sIR7
 NZ7YeM+nd/fNB4GkOb7mogKwvEwd1Jar8nxRkLZsMPBPHcRqvwC284lX5xB2ew4f4wryjeHDUC
 PQhuzBuwhVlxjnPA0qPqREqZ
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="142730993"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 08:18:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:18:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 08:18:07 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>
Subject: [PATCH v3 15/15] MAINTAINERS: update riscv/microchip entry
Date:   Fri, 14 Jan 2022 15:17:27 +0000
Message-ID: <20220114151727.2319915-16-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..3b1d6be7bd56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16348,8 +16348,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.32.0

