Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17975449771
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240702AbhKHPJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:09:19 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:21223 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240677AbhKHPJQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636383991; x=1667919991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7TY70StaNQYPEo0JEGXnyDaaE5FyFeTJVVklhVpDOHY=;
  b=lgUQBoOQUks1+prlWNgwNnYy4deDNQinwI6ZnzLJzwhxTEBp9He8pir6
   K/FurHtRtVLmtPqAqAWjFpIAuRYoipBaE0kkxvTLq7Ev4S1Ue9kz+TmlD
   QD2+dnfQsdG7V2gX4rtpfg1JksKZhPWTeI5Fgf6SUshNnEi1uYl709ucG
   8l+2tU0mpu5cu2GffZ0opft4/m2zuyUPcDl2lfDeZvNxBXGel7dni+P/s
   SMQ06b8P0QrYuLAOTRdQdDV7OWK5RXsEsA/VhQ9gIbzung4Etpg2Sw8bs
   I+AofXhy0TdKY7cvcHHcvVYfteK8/WUaN5gTGvCnKF1HcuJO7S23qWzj0
   g==;
IronPort-SDR: Ntpp7n7MAYiBTQIALHMCUvFJeiU9D0S3cSUihj8H2Sa1PKofHXa5Gm6uzyYdUBtTVmZMiTI+Sm
 vRDvfd1ceVeyhMLRROFAT+SbZ16pWvUkc/6oIoCs9eQjuUWH5X2drqxkHzS6kVLG6ohPaRsNSw
 NVJc/UVeOeX3slZ4M2Dn3UhYi4z7ff4vWlQeU+CvEYtEU63f5CDX3kUZi2ib0F77+olpUP7SzH
 Ympz8b39z6uxj37N56/MHAj3IfQLiUDBbdaUkAC8pnGE2EaUvJz88DKXK/+WPwpvYko+phXh7C
 xL3ENJMyKEdgW2jyYgfUm/mn
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="75727030"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:06:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:06:20 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 01/13] dt-bindings: interrupt-controller: create a header for RISC-V interrupts
Date:   Mon, 8 Nov 2021 15:05:42 +0000
Message-ID: <20211108150554.4457-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ivan Griffin <ivan.griffin@microchip.com>

Provide named identifiers for device tree for RISC-V interrupts.

Licensed under GPL and MIT, as this file may be useful to any OS that
uses device tree.

Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h

diff --git a/include/dt-bindings/interrupt-controller/riscv-hart.h b/include/dt-bindings/interrupt-controller/riscv-hart.h
new file mode 100644
index 000000000000..e1c32f6090ac
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/riscv-hart.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
+
+#define HART_INT_U_SOFT   0
+#define HART_INT_S_SOFT   1
+#define HART_INT_M_SOFT   3
+#define HART_INT_U_TIMER  4
+#define HART_INT_S_TIMER  5
+#define HART_INT_M_TIMER  7
+#define HART_INT_U_EXT    8
+#define HART_INT_S_EXT    9
+#define HART_INT_M_EXT    11
+
+#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H */
-- 
2.33.1

