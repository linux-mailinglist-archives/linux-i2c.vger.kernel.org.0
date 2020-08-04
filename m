Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7113423B84E
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Aug 2020 12:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgHDKAV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Aug 2020 06:00:21 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:33043 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgHDKAU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Aug 2020 06:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596535220; x=1628071220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9iPc+xgooR96zu6gZSvzswYQ4P1VQbTGDAAFAk2BvHg=;
  b=aoiA1niebva4yztk7RI0oQMzjB6ZFA7QivcPdNLphbtvLhWOxJw5kXbI
   gypa4+tmgK2c2YL827dB56SHil2Cr2AkJ7RcWWdOUvHeA85Gpq9pUtzf9
   9RqRO+b7c9xew1W7gzRU7KKkHG3lQ1DTAd0bTqsPN4x82wwI+doHMsTZM
   ipq+2HUGDuu+Jihhe0GMBX8Ip854cMC6u0Yz+k2Z+nfDLFor7pTshXPii
   3H+cyqdbvWYxxON/0erZfyiJ1mdu6ABpi5We4rmBOOZRyQWJg/B9x7Koy
   lNVy/0Wqsj5GEnNQ6fPGmyNVxSXN/teZbdySmYtqlnISCncsMTKlsvmp8
   g==;
IronPort-SDR: Tn2DDWu0R9LqOqTqxSOTUEklWa8eCPMV8mwo0EszfQ+p8hwxQDS7gntspOFg1uPIp+xScgDMyc
 jtgSewwVObKQcfuUVUjakGwcp++ZWmP7rrg6WivPklx5c4XVjksXTPj0VVv4gWC3vLJHTEOY3X
 S7cLV9QHLuw93jsvHNbv1U/nA3Nqg1g4Xq+s+Z0RiX1k1hK0k7gHHG1+OXD9sRXK7pvUASnM42
 xONQPAS7mIztE2hmr+rCqkENMcinVwI5bWIhhCMQpCWcmK5vUHh3bc084sZArY5wleO3+nwJaN
 XqY=
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="86620321"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2020 03:00:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 4 Aug 2020 03:00:17 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 4 Aug 2020 02:59:46 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 1/4] dt-binding: i2c: add generic properties for GPIO bus recovery
Date:   Tue, 4 Aug 2020 12:59:23 +0300
Message-ID: <20200804095926.205643-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C GPIO bus recovery properties consist of two GPIOS and one extra
pinctrl state ("gpio" or "recovery"). "recovery" pinctrl state is
considered deprecated and "gpio" should be used instead.
Not all are mandatory for recovery.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes from RFC:
 - "recovery" pinctrl state marked as deprecated; updated description to
   reflect this;

 Documentation/devicetree/bindings/i2c/i2c.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 438ae123107e..150a67da633d 100644
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
+	recovery, call it "gpio" or "recovery"(deprecated) state
+
 Required properties (per child device)
 --------------------------------------
 
-- 
2.25.1

