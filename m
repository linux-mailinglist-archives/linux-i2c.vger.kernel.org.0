Return-Path: <linux-i2c+bounces-12019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E598B0FF71
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 06:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2709635A6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 04:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4011F0E26;
	Thu, 24 Jul 2025 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OF1VEsjh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C61E98E6;
	Thu, 24 Jul 2025 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753330132; cv=none; b=gS9jCY7SwjZyDXD6t8c96QvJx0VwZd3U6u8YRFwhl8jpnuiPzqqFm8cwBRnaNwpoUoaX+NoE2pDpY9CkE9LHQoGjpxOUIlVaUkI0k9s0klIwNfZMWt72shFQ7HqLdWSlx75z1cqmDUfNiTWGRf4mh4ItQmvp5o4GvAT6OMn9bS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753330132; c=relaxed/simple;
	bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9dmJWvQblBQNfcE9LQ+cLAwaEBi/rjMO2cPg6ZuMthUdfmQhqW5pBNYB2N3t1p7g4GO1S/BkcvQarA2o9376gMxTjXkUmsIYrIVqND1ZpLCZa0kSTU2iJ4tanoF4TYnJJF/w0cjqlZX5+L2CGE2p4PtPevsGA/KdNAhKJ/NPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OF1VEsjh; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753330132; x=1784866132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
  b=OF1VEsjhYEs6v8jjUpRNvj8k6RagNlikvBCa271sHdvaRi9Lv9xL9onu
   kqaCkZEGCM4/GZMROby721URPTrVoMGOLp0Y62VLw54jvuiWdxSUo1jFO
   d5dVDEUgN86UDivlRAvxe1Y2JaMEr9pDXD9WI43UqNU0fgAl8V29pX+QJ
   ItVehduZmNB2gY5JZ+5WCG/gjrrwhUHwzt/2TO7t7nULGPj9VYR85R7c1
   z+iZO/9/N0tH5bKTGd8y3Mo9vK0PQRAiVJ+VOKOtAYemBDcfyB4SJmCyA
   rqdmLeLCL9z69OgpqY3RpHodNSdT6EbJbHT7+eWwVjv0U2ZU2tI7qRfcU
   w==;
X-CSE-ConnectionGUID: WLab76bnToSib36oXyi3Mw==
X-CSE-MsgGUID: vRDv8b3gRraJeP4eIxD8Kg==
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="275747009"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2025 21:08:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 23 Jul 2025 21:08:28 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 23 Jul 2025 21:08:26 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <tharunkumar.pasumarthi@microchip.com>,
	<kumaravel.thiagarajan@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 i2c-master] i2c: mchp-pci1xxxx: Update minimum bus idle time
Date: Thu, 24 Jul 2025 09:34:22 +0530
Message-ID: <20250724040422.6546-2-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724040422.6546-1-rengarajan.s@microchip.com>
References: <20250724040422.6546-1-rengarajan.s@microchip.com>
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


