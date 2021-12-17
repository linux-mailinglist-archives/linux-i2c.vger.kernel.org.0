Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16ECE47871F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhLQJbx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:31:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64488 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbhLQJbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733512; x=1671269512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7TY70StaNQYPEo0JEGXnyDaaE5FyFeTJVVklhVpDOHY=;
  b=qo8+mxwjo3pm1NfyrT4wA9kUn550Bx3D0jfcJfxbMVa3dMyEb+KPQ3qn
   t20fnCTslPfaTOHKKKnhbuzaj6pWMXRNmhDWJwt/9Vt521oMMHY4VDmNH
   U5mt7BYL+d5QTr/B/UBz3JJu8mBvyTIP7+I7NT2kQA/JfGMv1z/biCe8X
   BHg8DIUBAcOrD+2K89cTUGktuv/9UYLE5YviONymFspqQ96re7jxuuVpZ
   2TB/RNtO3qhqDkkk7aPik8vdzGIcKRCSMcBA7wm947WtlWThUQPP6h+ci
   c0GPmrQrhwNmnqUDh3U1Gwnb3ixhjydYCNDHbTLxHDXiZ937cOPq21lrQ
   w==;
IronPort-SDR: yEuSiCpSGDtgAUAzw1+P+lfNAEOxQDfWqlxulRJlJt4TIRaEkDe+cqPe/u+Al57/rpe48664cD
 LM8PgTZ8LKYLT+jjodofacUJF+0MAtWD6MUjcHMJQy4o1WwBEB7ILWh/R3xYqs2DomzSuXhZ9H
 JdZHiQhYGtWEz7Jxc7OTQZauODMfrnE/blILCu2JKd5gRx6uv4VU5ijUF6vJ6PoZjMZTjJ1u5o
 zbysJSuPrUcgw1xlXfYdlmtI3wVZYH/rDEtamLwbi/NQ18VqX1zj5UgWqHs3DBjpGty1JFk8KN
 52KQlW5+GxaLXG2xIdqtR3V3
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="79895927"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:31:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:31:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:31:45 -0700
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
        <atish.patra@wdc.com>
Subject: [PATCH v2 01/17] dt-bindings: interrupt-controller: create a header for RISC-V interrupts
Date:   Fri, 17 Dec 2021 09:33:09 +0000
Message-ID: <20211217093325.30612-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
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

