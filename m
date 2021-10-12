Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F344F42A6C3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 16:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhJLOIt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 10:08:49 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:9194 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237195AbhJLOIq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 10:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634047605; x=1665583605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bVMzgayqvCzU7trvDSn6WIhVufqrofcSSsMhtnCAVM=;
  b=D9cYXo2qQMKnmRll9jD+aPiIKCxXE+v4vCndatwg2ogNXou5zG7FIHle
   /0BUPMdf70dJMpsZWPDE+9PFK6AoOLgbAy9aojDRJit7nYxbajZek+/ce
   edeqI87IzTBcUhKE8f6Q19tzL47Hykzv0UvJu0hGftppAMujMSkAWUm5p
   tqvLeAd203WR2SunrBN+rGJow01MsQUMQRl5XXNTQXVhZgydIapIwv5us
   Q6qrAUIHxZZi3xH7B5HuH8ZibBVcNf5ybio+VXwuPZLeNKw/5YMw9X/fd
   Vx1wBq/Sli7FmA5amO3mIffFIn7YYWHFxai56tqoJTQ8pPqWzfDvdV75v
   A==;
IronPort-SDR: 9PsFVeJ4S+zOaqLezF7MkisxaT6g/K/Nkk/J2Cgbu9U5Yw72VvaZTs6UksHbSv1G/bumxkrwLB
 M4BhQfPeRnPPqru9RG3xJZM7FB25mzeVssj21WNSRIxMnzL0It2iAnuaNDtQm8fSjnMwn/Vazz
 3vfMwndv+GRqV0PH/mGTTZjorKJ0HbczzEjB3ijHZx0mPTb45PsystGPcF44ixCKSljbLCso2v
 usRYAH/5mOI5NDWhSnZqhcBbZSh8uKYnLFVlUecKgYhSK2TmWr8eKtMY0tj/8uIxR4fr0cLPAa
 rYW9vBxpxjkBEcg68kqpaZzU
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="72665545"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 07:06:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 07:06:22 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 12 Oct 2021 07:06:20 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        <codrin.ciubotariu@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 1/2] dt-bindings: i2c: at91: Extend compatible list for lan966x
Date:   Tue, 12 Oct 2021 16:07:17 +0200
Message-ID: <20211012140718.2138278-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend compatible list and the i2c-sda-hold-time-ns property
with 'microchip,lan966x-i2c'

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
index 2015f50aed0f..d3b5ed081597 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -10,7 +10,8 @@ Required properties :
 	"atmel,at91sam9x5-i2c",
 	"atmel,sama5d4-i2c",
 	"atmel,sama5d2-i2c",
-	"microchip,sam9x60-i2c".
+	"microchip,sam9x60-i2c",
+	"microchip,lan966x-i2c".
 - reg: physical base address of the controller and length of memory mapped
      region.
 - interrupts: interrupt number to the cpu.
@@ -27,7 +28,8 @@ Optional properties:
 - i2c-sda-hold-time-ns: TWD hold time, only available for:
 	"atmel,sama5d4-i2c",
 	"atmel,sama5d2-i2c",
-	"microchip,sam9x60-i2c".
+	"microchip,sam9x60-i2c",
+	"microchip,lan966x-i2c".
 - scl-gpios: specify the gpio related to SCL pin
 - sda-gpios: specify the gpio related to SDA pin
 - pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
-- 
2.33.0

