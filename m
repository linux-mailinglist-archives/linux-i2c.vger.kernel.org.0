Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E418274C71
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgIVWty (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:49:54 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48124 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726583AbgIVWty (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:49:54 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from kblaiech@mellanox.com)
        with SMTP; 23 Sep 2020 01:49:49 +0300
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 08MMnmXP017252;
        Tue, 22 Sep 2020 18:49:48 -0400
Received: (from kblaiech@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 08MMnmkF019586;
        Tue, 22 Sep 2020 18:49:48 -0400
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date:   Tue, 22 Sep 2020 18:49:38 -0400
Message-Id: <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1600804577.git.kblaiech@mellanox.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1600804577.git.kblaiech@mellanox.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Khalil Blaiech <kblaiech@mellanox.com>

Add device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
---
v5->v6:
	- Adding description of an extra resource to be
	consistent with new BlueField-2 SoCs.
	- Adding an additional example of device instance.
v3->v4:
	- Re-ordering of the property descriptions.
	- Removing useless register addresses from the
	resource description.
	- Definition of default clock-frequency value.
	- Fixing format issues; removing spaces.
	- Removing "aliases" from Example section.
	- Renaming device instance node in Example section.
v2->v3:
	- Removing shared resources from the controller
	instance.
	- Updating the 'compatible' property and support the
	second generation of the Mellanox BlueField SoC.
	- Fixing file format; replacing spaces with tabs.
v1->v2:
	- Enumeration of the device resources.
	- Updating the 'compatible' property to make it less
	generic.
	- Removing the 'bus' index property and replace it with
	standard approach to read the bus identifier.
	- Getting rid of the 'profile' property.
	- Using 'clock-frequency' property instead of 'bus-freq'.
	- Convertion of the clock frequency from KHz to Hz.
	- Removing useless examples.
---
 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
new file mode 100644
index 0000000..566ea86
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
@@ -0,0 +1,42 @@
+Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
+
+Required Properties:
+
+- compatible : should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2".
+
+- reg : address offset and length of the device registers. The
+	registers consist of the following set of resources:
+		1) Smbus block registers.
+		2) Cause master registers.
+		3) Cause slave registers.
+		4) Cause coalesce registers (if compatible isn't set
+		   to "mellanox,i2c-mlxbf1").
+
+- interrupts : interrupt number.
+
+Optional Properties:
+
+- clock-frequency : bus frequency used to configure timing registers;
+			allowed values are 100000, 400000 and 1000000;
+			those are expressed in Hz. Default is 100000.
+
+Example:
+
+i2c@2804000 {
+	compatible = "mellanox,i2c-mlxbf1";
+	reg =	<0x02804000 0x800>,
+		<0x02801200 0x020>,
+		<0x02801260 0x020>;
+	interrupts = <57>;
+	clock-frequency = <100000>;
+};
+
+i2c@2808800 {
+	compatible = "mellanox,i2c-mlxbf2";
+	reg =	<0x02808800 0x600>,
+	        <0x02808e00 0x020>,
+		<0x02808e20 0x020>,
+		<0x02808e40 0x010>;
+	interrupts = <57>;
+	clock-frequency = <400000>;
+};
-- 
2.1.2

