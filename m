Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F96442A6B8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 16:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhJLOI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 10:08:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:33011 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbhJLOI2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 10:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634047587; x=1665583587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A0HJ1L4RAxgrnu670Fu9z6eUkxENtCwk60XBuTGkTJc=;
  b=d6cAc6GOtKR7c2TAn3wOjbVkGUmw+IlkFtm9/xK7Z2/ZAM2CAssA0oSt
   Q+ONjzJcACIb+frdbLwFz9uQh7rp469nt9TxvfhPQCflr8RtuelH5bq2b
   blyVAnn+VbBdPQXkPPQ/BWf/DNadM8COe4dMetb38CQH3bWvzAyBmfSCI
   8C/q0eHnl3SaUH9vfQdUOsW+WBZ9LsxzOB6k9hwM6/lMIRwXgrtOMFm8U
   IK49TBV0PGfTAXsYPNCGNHyLb41TND6e4xhjgfPuBcuuQ3fcI1SAMypbz
   v7vBpbgYFcPvUqaVntc5H71b1RlEbhHre6Za5blBD+9vV5J+eSEcnJ4es
   g==;
IronPort-SDR: ktGpWK/6cNqbIkdRQtHHtS4Fooz4rQgmIYjxTHAmBmaRsU2qbAXrA1EvEldEH7vP5daqLc/hrN
 uLHOVSe/PCEIrscLA+f4m/mX9mKPZ0cfphZjY5vbjIeoRlyei8TC+JbfjnZ0+UrazXvgzKGlZ7
 6tsii7WB+jNrHyUos0oK3XxtE+3cB4U+5yYO8Pwu/7Cp/YFLymcW+sJd6lhyHj+HIlfpPNgwE5
 G9K5VanjON5CfzJFrF8m8zn5IUEwicQq99cHEjXoXeSqb7bqjhPHP/30GNg/X848wSJVXCcdQT
 EbxTQVQe9c009KiEK/O3T3Am
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="139412090"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 07:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 07:06:24 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 12 Oct 2021 07:06:22 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        <codrin.ciubotariu@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 2/2] i2c: at91: add support for brsrcclk
Date:   Tue, 12 Oct 2021 16:07:18 +0200
Message-ID: <20211012140718.2138278-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows to set the TWI bite rate based on a programmable clock source.
The lan966x supports this feature.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c   | 16 ++++++++++++++++
 drivers/i2c/busses/i2c-at91-master.c | 23 +++++++++++++++++++++--
 drivers/i2c/busses/i2c-at91.h        |  1 +
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 2df9df585131..d98b437e5775 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -146,6 +146,19 @@ static struct at91_twi_pdata sam9x60_config = {
 	.has_clear_cmd = true,
 };
 
+static struct at91_twi_pdata lan966x_config = {
+	.clk_max_div = 7,
+	.clk_offset = 0,
+	.clk_brsrcclk = true,
+	.has_unre_flag = true,
+	.has_alt_cmd = true,
+	.has_hold_field = true,
+	.has_dig_filtr = true,
+	.has_adv_dig_filtr = true,
+	.has_ana_filtr = true,
+	.has_clear_cmd = true,
+};
+
 static const struct of_device_id atmel_twi_dt_ids[] = {
 	{
 		.compatible = "atmel,at91rm9200-i2c",
@@ -174,6 +187,9 @@ static const struct of_device_id atmel_twi_dt_ids[] = {
 	}, {
 		.compatible = "microchip,sam9x60-i2c",
 		.data = &sam9x60_config,
+	}, {
+		.compatible = "microchip,lan966x-i2c",
+		.data = &lan966x_config,
 	}, {
 		/* sentinel */
 	}
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index b0eae94909f4..f504af30adbe 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -120,8 +120,27 @@ static void at91_calc_twi_clock(struct at91_twi_dev *dev)
 		}
 	}
 
-	dev->twi_cwgr_reg = (ckdiv << 16) | (cdiv << 8) | cdiv
-			    | AT91_TWI_CWGR_HOLD(hold);
+	if (pdata->clk_brsrcclk) {
+		u8 chdiv, cldiv, gck_pr;
+
+		gck_pr = 1000000000 / clk_get_rate(dev->clk);
+
+		/* thigh = bus_freq_hz in ns * 0.4
+		 * tlow = bus_freq_hz in ns * 0.6
+		 * chdiv = (thigh / GCK_PR)/2 ^ CKDIV
+		 * cldiv = (tlow / GCK_PR)/2 ^ CKDIV
+		 * where ckdiv = 0;
+		 */
+		cldiv = (1000000000 / t->bus_freq_hz * 6 / 10) / gck_pr;
+		chdiv = (1000000000 / t->bus_freq_hz * 4 / 10) / gck_pr;
+
+		dev->twi_cwgr_reg = (chdiv << 8) | cldiv
+			| AT91_TWI_CWGR_HOLD(hold)
+			| pdata->clk_brsrcclk << 20;
+	} else {
+		dev->twi_cwgr_reg = (ckdiv << 16) | (cdiv << 8) | cdiv
+			| AT91_TWI_CWGR_HOLD(hold);
+	}
 
 	dev->filter_width = filter_width;
 
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 942e9c3973bb..f7328fbe8eb8 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -115,6 +115,7 @@
 struct at91_twi_pdata {
 	unsigned clk_max_div;
 	unsigned clk_offset;
+	bool clk_brsrcclk;
 	bool has_unre_flag;
 	bool has_alt_cmd;
 	bool has_hold_field;
-- 
2.33.0

