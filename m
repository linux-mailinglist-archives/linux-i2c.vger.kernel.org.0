Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4037441B24
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 13:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhKAM2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 08:28:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:51132 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhKAM2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 08:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635769580; x=1667305580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iN/RibOja1wF59XrxjcY2hghoc0UxWtklGtFy7NCwA0=;
  b=2WxNHVHUhQe2QI+Z8tP1hGhvvQFq3pGqa3K+nHl8UZFaxyTHyVKoRtZ2
   aEJ3982Yl5owmW9P7YdkIJckWGL9K0CQOG18KnAMGfa329sInjEVJwYSg
   2m4x4iZF1bNbpTsHOVbrHl3wUjo9UaVazcx654qeEZmJj0Dv1gOK/CzLJ
   UDCnXG99YD9aK0b9d9vJksa1UBpqYgGyG79mJhsHdcu61dOdPW3oP75AM
   6SADSJmu6gQ8L/cunlJZMw+jJSBFscFjAi4e3YdVmBPSZwV+aSR4CDZXX
   8piuqh6TLCpPTv4ztDHC7T7aP8r+DcyRwaQoABpDIXmMTsHhtgTZ0HsgQ
   w==;
IronPort-SDR: hRnROIqmSKvUpr87OHdDMnyPQd7X0LeJYfV1OfVL32rOCHMJC2mYBNmNL/szXmm/H46INuHj/J
 zuYNLXX6nh7i311NjJcoyDyeSBTiUD+O2rcqkG0l/dguzLd+3Dw8vKGV0xH1i0UF9G7rTTlPQz
 i7arzfgDRYunGYP9blg96Dr1q7hIGsokFJnsI2YvJepuzu/bzPoL2tXFHJsdu/OAFWuQDKxdHR
 7Pu47aiz2p2dL0su8pDwgJveM5a/KfsBbLFQeJp23Ld2/4b40HF9AyWjRSf49VjyEshK1AwWUC
 EQU1xV5aeCeZ/obM3+PGyts4
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="137580111"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 05:26:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 05:26:09 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 1 Nov 2021 05:26:07 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Subject: [PATCH v3 2/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Mon, 1 Nov 2021 13:25:45 +0100
Message-ID: <20211101122545.3417624-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for settle-time-us property. If this is defined in device
tree then add this delay to mux APIs.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/i2c/muxes/i2c-mux-gpmux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index d3acd8d66c32..f64a4b6034df 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -16,6 +16,7 @@
 
 struct mux {
 	struct mux_control *control;
+	u32 delay_us;
 
 	bool do_not_deselect;
 };
@@ -25,7 +26,7 @@ static int i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
 	struct mux *mux = i2c_mux_priv(muxc);
 	int ret;
 
-	ret = mux_control_select(mux->control, chan);
+	ret = mux_control_select_delay(mux->control, chan, mux->delay_us);
 	mux->do_not_deselect = ret < 0;
 
 	return ret;
@@ -106,6 +107,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, muxc);
 
+	of_property_read_u32(np, "settle-time-us", &mux->delay_us);
 	muxc->mux_locked = of_property_read_bool(np, "mux-locked");
 
 	for_each_child_of_node(np, child) {
-- 
2.33.0

