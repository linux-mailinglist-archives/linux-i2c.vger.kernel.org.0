Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20EE200B3A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 16:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733112AbgFSOUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 10:20:01 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:7008 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732461AbgFSOT7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Jun 2020 10:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592576399; x=1624112399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ssnJZWGFbTL4JylYeloFnuSybGj7Ww3CdtIea8ySppc=;
  b=WlYjRz/FJWiyzDsmRGnJwzAllq5wOwg2D62b6WZFVIlbVY21hfgGMqpp
   bJvNmhbXJAfu7a1DdfukMxnlDBaHsTHNU5cE/KJ1V8sBOKr6FPhG/ppyI
   HQ3grFbse8NVocklZT5PmndU6PFyz2xB2R4BsbM353gKoQ0+G0x8t+Viz
   kKEUU7uG4plAqjeDFvcqCwqMsu6u2Vt1RPlsTGPFavToo+Y4fgk38NB6W
   /9K4Io2eUYfLlJgLjq2MuiMdFR6Yq3drIU0RpF5YagdKltM3SePYbudwF
   V/ikkiZjUhqm42Q6k2itdMIZOqCWBhuFyblNDnkZcQi0nbPDNBC7bfPj7
   Q==;
IronPort-SDR: /evddRzvNCOLCsEUsCX30VVE8V6o+e2f1tpmPXD5j6RC4BN3K0DHNJCWyOqH83ETytg9LunOaq
 5fD01jEGA44KcGYq6NA839YymrbQOcZtOlLeQAomt2ZJ/5mxGKRTWtOsQsup/pewIP86yZAA6z
 MUsdenslfR4O6yFeFs27xJoINsUpUF7wiZmHy6A+Sac+dvWY5Bk/Hoo5dEYTvw3bpeBKALlYL/
 Z032xpyCvpNgrx5UMYcr1iGDPuVPR1FTYU8/WfxS6W/TZgZM7i5iifuXiYAvE+5WlM6IoEmVcS
 O/U=
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; 
   d="scan'208";a="77180733"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2020 07:19:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 19 Jun 2020 07:19:56 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 19 Jun 2020 07:19:32 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO bus recovery
Date:   Fri, 19 Jun 2020 17:19:01 +0300
Message-ID: <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C GPIO bus recovery properties consist of two GPIOS and one extra
pinctrl state ("gpio" or "recovery"). Not all are mandatory for recovery.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 438ae123107e..6a644a24fc1c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -77,6 +77,16 @@ wants to support one of the below features, it should adapt these bindings.
 	this information to detect a stalled bus more reliably, for example.
 	Can not be combined with 'multi-master'.
 
+- scl-gpios
+	specify the gpio related to SCL pin. Used for GPIO bus recovery.
+
+- sda-gpios
+	specify the gpio related to SDA pin. Optional for GPIO bus recovery.
+
+- pinctrl
+	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
+	recovery, call it "gpio" or "recovery" state
+
 Required properties (per child device)
 --------------------------------------
 
-- 
2.25.1

