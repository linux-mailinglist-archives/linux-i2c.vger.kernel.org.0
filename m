Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB501A9B6C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896397AbgDOKvj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:51:39 -0400
Received: from sauhun.de ([88.99.104.3]:52178 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896415AbgDOKvJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 06:51:09 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 1610D2C1FF1;
        Wed, 15 Apr 2020 12:51:01 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2c: regroup documentation of bindings
Date:   Wed, 15 Apr 2020 12:51:00 +0200
Message-Id: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some bindings are for the bus master, some are for the slaves.
Regroup them and give them seperate headings to make it clear.
Also, remove references to "generic names" which is for nodes and not
for compatibles.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 66 +++++++++++--------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 9a53df4243c6..819436b48fae 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -2,32 +2,26 @@ Generic device tree bindings for I2C busses
 ===========================================
 
 This document describes generic bindings which can be used to describe I2C
-busses in a device tree.
+busses and their child devices in a device tree.
 
-Required properties
--------------------
+Required properties (per bus)
+-----------------------------
 
 - #address-cells  - should be <1>. Read more about addresses below.
 - #size-cells     - should be <0>.
-- compatible      - name of I2C bus controller following generic names
-		    recommended practice.
+- compatible      - name of I2C bus controller
 
 For other required properties e.g. to describe register sets,
 clocks, etc. check the binding documentation of the specific driver.
 
 The cells properties above define that an address of children of an I2C bus
-are described by a single value. This is usually a 7 bit address. However,
-flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
-bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
-of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
-Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
-be devices ourselves.
+are described by a single value.
 
-Optional properties
--------------------
+Optional properties (per bus)
+-----------------------------
 
 These properties may not be supported by all drivers. However, if a driver
-wants to support one of the below features, it should adapt the bindings below.
+wants to support one of the below features, it should adapt these bindings.
 
 - clock-frequency
 	frequency of bus clock in Hz.
@@ -73,31 +67,49 @@ wants to support one of the below features, it should adapt the bindings below.
 	i2c bus clock frequency (clock-frequency).
 	Specified in Hz.
 
-- interrupts
-	interrupts used by the device.
-
-- interrupt-names
-	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
-	other names are	left to individual drivers.
-
-- host-notify
-	device uses SMBus host notify protocol instead of interrupt line.
-
 - multi-master
 	states that there is another master active on this bus. The OS can use
 	this information to adapt power management to keep the arbitration awake
 	all the time, for example.
 
-- wakeup-source
-	device can be used as a wakeup source.
+Required properties (per child device)
+--------------------------------------
+
+- compatible
+	name of I2C slave device
 
 - reg
-	I2C slave addresses
+	One or many I2C slave addresses. These are usually a 7 bit addresses.
+	However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
+	used to mark a 10 bit address. It is needed to avoid the ambiguity
+	between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
+	which, in theory, can be on the same bus.
+	Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we
+	listen to be devices ourselves.
+
+Optional properties (per child device)
+--------------------------------------
+
+These properties may not be supported by all drivers. However, if a driver
+wants to support one of the below features, it should adapt these bindings.
+
+- host-notify
+	device uses SMBus host notify protocol instead of interrupt line.
+
+- interrupts
+	interrupts used by the device.
+
+- interrupt-names
+	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
+	other names are	left to individual drivers.
 
 - reg-names
 	Names of map programmable addresses.
 	It can contain any map needing another address than default one.
 
+- wakeup-source
+	device can be used as a wakeup source.
+
 Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
-- 
2.20.1

