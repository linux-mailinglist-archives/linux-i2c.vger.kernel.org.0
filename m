Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E12D3457F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 13:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfFDLeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 07:34:16 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:41238 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfFDLeQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 07:34:16 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id E61C25030F;
        Tue,  4 Jun 2019 13:34:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id Swgtn0RtekVf; Tue,  4 Jun 2019 13:34:08 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2 v3] dt-bindings: i2c: i2c-mt7621: Add bindings for MediaTek MT7621/28/88 I2C
Date:   Tue,  4 Jun 2019 13:34:06 +0200
Message-Id: <20190604113407.8948-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bindings for the I2C controller that can be found in the MediaTek
MT7621/7628/7688 SoCs.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
- New patch

 .../devicetree/bindings/i2c/i2c-mt7621.txt    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
new file mode 100644
index 000000000000..bc36f0eb94cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
@@ -0,0 +1,25 @@
+MediaTek MT7621/MT7628 I2C master controller
+
+Required properties:
+
+- compatible: Should be one of the following:
+  - "mediatek,mt7621-i2c": for MT7621/MT7628/MT7688 platforms
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+- reg: Address and length of the register set for the device
+- resets: phandle to the reset controller asserting this device in
+          reset
+  See ../reset/reset.txt for details.
+
+Optional properties :
+
+Example:
+
+i2c: i2c@900 {
+	compatible = "mediatek,mt7621-i2c";
+	reg = <0x900 0x100>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	resets = <&rstctrl 16>;
+	reset-names = "i2c";
+};
-- 
2.21.0

