Return-Path: <linux-i2c+bounces-13169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D5CB9FD22
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 16:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 394884E06D0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 14:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3060E298CC4;
	Thu, 25 Sep 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="A+b/CA+/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D02877C8;
	Thu, 25 Sep 2025 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809126; cv=none; b=Hw+C4z74qAdGJr3Tu/jdRQQNrXrRNhMLU0uvlbuZX6EvgY6DqaiCIzTZjFq9Bodmc7cA/cfr/W+GKMnxSx2SW6g8Knq4cudG1ntPxc2BKo06xhwd6YXrdypqXqX+4UITV18/RE5bccAb4BXvUv65VGUnZguON4WMqkNluTO+BcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809126; c=relaxed/simple;
	bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ypzz94vDWzWqXs9YOSJ3VADqvpSgpxBos+Vpo19YV4ufREJkS15QMCYRnHbGoOt6JNAb10q0Vp2z125TzexUVq7bbiOtXU3p0Cx9tYSRQZLGZw8UAUli7MmdwSOrC0YqymyykaNH020BYzXPbVSMLk1BcGs6ePetydOY6dsg+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=A+b/CA+/; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758809125; x=1790345125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFbOsv4uJX6MrAOQSsqn1mF5ZkvhtaW1FmyaM43FJI8=;
  b=A+b/CA+/Vn57ZcutYkGmoJmoyVKe4oEDwMXsbn1I33nL2kFuqw8ZeMah
   NE3I30UJEIaW/wnGOIAR2YuCGQPFdqVt0/N3vId2IhHzOs4vqsXbZ3SNq
   vTuR0dXJXKaOEfP48kTL+BjpqdRHtbJPJi3RyTsKye5U4J/w7RmLmLo89
   Di2wzs0p0ovSuIMF6Y3GWdBvhyS7TAKd9Ec1JqB327GoQQoPN+BZxbOFK
   wc9T6D2zynn57YCaUI2X6INC7TbQKWwEnF8+2C5ou2d+mHDlJgcpDqIBM
   qtlqspjKOf7HMs0mStcpHlwqCtxOw993fs90Ye1CR7wrU/ejqwL486j3h
   A==;
X-CSE-ConnectionGUID: 8A5UjjvdTiWuEN1Fn89UBA==
X-CSE-MsgGUID: +0zqSiR8RdaP074ZOyZgDg==
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="278356166"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2025 07:05:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 25 Sep 2025 07:05:05 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 25 Sep 2025 07:05:02 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <tharunkumar.pasumarthi@microchip.com>,
	<kumaravel.thiagarajan@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH RESEND v1 i2c-master] i2c: mchp-pci1xxxx: Update minimum bus idle time
Date: Thu, 25 Sep 2025 19:30:49 +0530
Message-ID: <20250925140049.14454-2-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250925140049.14454-1-rengarajan.s@microchip.com>
References: <20250925140049.14454-1-rengarajan.s@microchip.com>
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


