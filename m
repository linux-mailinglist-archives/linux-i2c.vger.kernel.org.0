Return-Path: <linux-i2c+bounces-12425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4FB3524B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 05:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0577A189374C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 03:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EF02D3A60;
	Tue, 26 Aug 2025 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RYPl0WhF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8323D7EE;
	Tue, 26 Aug 2025 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756179879; cv=none; b=WxdvC1CgMuljeIEPJ57G097VqDcW2f4rSvfoCZlLUmIBSx2tukcOr7mnhUl6f/AgvHSU/Fj/W/98OJfS08kmwcl1ErfYxcPv9Vn/lKQldkbHNelAvUmRfA4BfqRqKSM4ChC171hk959THrBFjXa7iSRKU6kHdoRnOl6TgwJ9y/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756179879; c=relaxed/simple;
	bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRPIjCHn81681UV1Edx2i28B/L5ePHC0k0KH/BBRCeA5tLF0AbOEv1BwE6hNf7gGx+hi7jZJjU70nLlZDBXGvjY/FDjGa5Cnh8He/+UO8nFfaG5Kon1fUntXTVDGKVibzypkBxV39dm4ahPsJAiFC3X6rOOzbCs4sMgfX5gv4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RYPl0WhF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756179878; x=1787715878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
  b=RYPl0WhF57GTMewxeXsRLH7x4UYqZLOW188Fy0HRh4c4i7DmXHPFIzD2
   /NAQy0a9d7435qeFn4K9WyEDqKf7kUsS5Mk8urPCAClaMWxuvOBlY+ecz
   Oecjaeh4BACU8ELTcwaMn0NO+sBJ81tO//I5SVYeZD7ty0kO+ci5GjJj6
   nYvZOCl0vPNWIRsNs0GC4ry7xyRdNiLzyhLlLJAB/yOvYAnB4jM3MXzzu
   yOw3fpSPyi1W/WumzHNUfLUW4AnOkiXbiCGtZGrw4MuHUwl5vsUcZsjrU
   e8vB1spB81fdOguvYmDTI5pDiAeAiYLagN/101kUMW0pabGq66ETqkfUB
   A==;
X-CSE-ConnectionGUID: h+d7yjNNRfSyxeG5y/G3DA==
X-CSE-MsgGUID: iSYs/6DwSUW/YbjjXyJoOw==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="46221620"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 20:44:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 20:44:19 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 25 Aug 2025 20:44:17 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <tharunkumar.pasumarthi@microchip.com>,
	<kumaravel.thiagarajan@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH RESEND v1 i2c-master] i2c: mchp-pci1xxxx: Update minimum bus idle time
Date: Tue, 26 Aug 2025 09:10:10 +0530
Message-ID: <20250826034010.8084-2-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826034010.8084-1-rengarajan.s@microchip.com>
References: <20250826034010.8084-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The SMBUS controller clock is designed with a 64 MHz clock for the
MCU, while the PCI1xxxx chip assumes a 31.25 MHz baud clock. SMBUS
controller register values are calculated considering 1 unit = 32 ns.
Based on this unit, the BUS_IDLE_MIN register values are updated for
all supported clock frequencies. Setting the MSB of BUS_IDLE_MIN[7:0]
register further scales the minimum bus idle time by a factor of 4.

Fixes: aa874cdfec07 ("i2c: mchp-pci1xxxx: Update Timing registers")
Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 5ef136c3ecb1..cb9455b38c1d 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -190,9 +190,9 @@
  * Bus Idle Minimum time = BUS_IDLE_MIN[7:0] x Baud_Clock_Period x
  * (BUS_IDLE_MIN_XK_TICKS[7] ? 4,1)
  */
-#define BUS_IDLE_MIN_100K_TICKS		36UL
-#define BUS_IDLE_MIN_400K_TICKS		10UL
-#define BUS_IDLE_MIN_1000K_TICKS	4UL
+#define BUS_IDLE_MIN_100K_TICKS		165
+#define BUS_IDLE_MIN_400K_TICKS		40
+#define BUS_IDLE_MIN_1000K_TICKS	16
 
 /*
  * CTRL_CUM_TIME_OUT_XK_TICKS defines SMBus Controller Cumulative Time-Out.
-- 
2.25.1


