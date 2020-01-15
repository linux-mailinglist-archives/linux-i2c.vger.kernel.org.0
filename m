Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4612F13BEF3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 12:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbgAOLyw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 06:54:52 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22077 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730202AbgAOLyq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 06:54:46 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 8ta0GVqnRosUh0dsqcKmr/VZ6X5NupaqcxIURil3G+SuFiLjv9sx1iSg2Kg7YD7SWIx0Y+UcgE
 8UfqFN0tb0pDf5vxK6QMLdtJoEjckNEnAnfHh8ec+7ooGUoe/9M5MayZd+HSXm65vGYaQGJYbn
 jAZNQ7y606W5NRarrPapAJpubYCYxAgQNxOkWtNKfFFI8uClYmaaYxum3QwKL/i3NjDgAoYVqX
 mr98JTJ6kcqHCBNI1nYGDNrZANFA1GrZh8ZNFn4XOcMckjfbLZDfawSTcUpHI7W4VKJk3pRxIl
 yAw=
X-IronPort-AV: E=Sophos;i="5.70,322,1574146800"; 
   d="scan'208";a="60862983"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jan 2020 04:54:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Jan 2020 04:54:43 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 15 Jan 2020 04:54:40 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v3 1/6] dt-bindings: i2c: at91: document optional bus recovery properties
Date:   Wed, 15 Jan 2020 13:54:17 +0200
Message-ID: <20200115115422.17097-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

The at91 I2C controller can support bus recovery by re-assigning SCL
and SDA to gpios. Add the optional pinctrl and gpio properties to do
so.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[codrin.ciubotariu@microchip.com: rebased]
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v3:
 - rebased;
 - added Reviewed-by tag from Rob;

Changes in v2:
 - none;

 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
index d4bad86107b8..96c914e048f5 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -28,8 +28,13 @@ Optional properties:
 	"atmel,sama5d4-i2c",
 	"atmel,sama5d2-i2c",
 	"microchip,sam9x60-i2c".
+- scl-gpios: specify the gpio related to SCL pin
+- sda-gpios: specify the gpio related to SDA pin
+- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
+  bus recovery, call it "gpio" state
 - Child nodes conforming to i2c bus binding
 
+
 Examples :
 
 i2c0: i2c@fff84000 {
@@ -64,6 +69,11 @@ i2c0: i2c@f8034600 {
 	clocks = <&flx0>;
 	atmel,fifo-size = <16>;
 	i2c-sda-hold-time-ns = <336>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	pinctrl-1 = <&pinctrl_i2c0_gpio>;
+	sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
 
 	wm8731: wm8731@1a {
 		compatible = "wm8731";
-- 
2.20.1

