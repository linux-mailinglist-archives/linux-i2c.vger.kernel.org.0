Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAB2E3CD2
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 22:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbfJXUNc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 16:13:32 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49927 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfJXUNb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 16:13:31 -0400
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49E32200005;
        Thu, 24 Oct 2019 20:13:29 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 2/5] dt-bindings: i2c: at91: document optional bus recovery properties
Date:   Thu, 24 Oct 2019 22:12:59 +0200
Message-Id: <20191024201302.23376-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
References: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The at91 I2C controller can support bus recovery by re-assigning SCL
and SDA to gpios. Add the optional pinctrl and gpio properties to do
so.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
index b7cec17c3daf..8ea2ce5d8610 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -19,8 +19,13 @@ Optional properties:
   capable I2C controllers.
 - i2c-sda-hold-time-ns: TWD hold time, only available for "atmel,sama5d4-i2c"
   and "atmel,sama5d2-i2c".
+- scl-gpios: specify the gpio related to SCL pin
+- sda-gpios: specify the gpio related to SDA pin
+- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
+  bus recovery, call it "gpio" state
 - Child nodes conforming to i2c bus binding
 
+
 Examples :
 
 i2c0: i2c@fff84000 {
@@ -55,6 +60,11 @@ i2c0: i2c@f8034600 {
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
2.23.0

