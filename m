Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FF5443F25
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 10:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhKCJVC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 05:21:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:15233 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbhKCJVB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 05:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635931105; x=1667467105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iN/RibOja1wF59XrxjcY2hghoc0UxWtklGtFy7NCwA0=;
  b=re2RXfbcP310r/5pk/GTSUZFjvEs9gS3vwecUONEt6QSBpeasEz3zdbQ
   Si7NFds0Sv1bqAMyD6wwldE5kc1k3E6xOWgReQ2LDfPvT0y5m24XUd4jy
   66/AJQI0nqV9Xa2W/p0PY5rNV9Bkyuh4dSDbFLx3Q6aol/InlGeRvXLAU
   fyn0sBhNkfOPOriLYRMWIhtQ6BvNsIrjTA4haOWMZsXpjXAiB6oAleSvq
   9gS3MZkXn8IeJW1FmXNsUKdeucfkfsZ6OYQrwnW3bk8SSXz1O6R9EORmY
   4Y4TYxn2iYyYimRg6P4zUghXkL1bT7IBASi5GwpL+lzpkf1xpqDAw1RYv
   A==;
IronPort-SDR: WjR/TLftE+a3fBQJPCUtjkF2m1zm3By1YNNY3TRiAD50lLyEWCWYr4YdbukcKJgzpbfQT0uUgC
 CpxRZUEoWQgoz5GjDq/WlABL2UTSqjvUZORyOI1LImmBb1SiaK32l2nl28z3RAphT+k1l9ky9S
 7yXBYHK6LIGry1noEe8WKexHynsSPnCFIHKuY6aSky5RjvKY7tiyRNCMvlFV0ghyrtHHOeWLeJ
 2hko54jvgaWPs5dYywML59tKwHL9dPWAFqy+lDKlpfsh6ls+FC8NvBiqYgyhLqOom+VsuoHsFV
 Sqm1ih8Cal58O2KNXuRtVCOE
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="135314110"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Nov 2021 02:18:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 02:18:24 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 3 Nov 2021 02:18:23 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Subject: [PATCH v4 2/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Wed, 3 Nov 2021 10:18:39 +0100
Message-ID: <20211103091839.1665672-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
References: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
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

