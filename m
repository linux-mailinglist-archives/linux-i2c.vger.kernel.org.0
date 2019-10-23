Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9B57E2643
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 00:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436819AbfJWWO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 18:14:56 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53266 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2436818AbfJWWO4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 18:14:56 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from kblaiech@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Oct 2019 00:14:53 +0200
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x9NMEqtu019145;
        Wed, 23 Oct 2019 18:14:52 -0400
Received: (from kblaiech@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x9NMEqbK007588;
        Wed, 23 Oct 2019 18:14:52 -0400
From:   Khalil Blaiech <kblaiech@mellanox.com>
To:     Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Woods <dwoods@mellanox.com>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
Subject: [PATCH v6 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date:   Wed, 23 Oct 2019 18:14:42 -0400
Message-Id: <c9c9dee31683c08282150d88301af999b7be6403.1571868492.git.kblaiech@mellanox.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1571868492.git.kblaiech@mellanox.com>
References: <cover.1571868492.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1571868492.git.kblaiech@mellanox.com>
References: <cover.1571868492.git.kblaiech@mellanox.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
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

