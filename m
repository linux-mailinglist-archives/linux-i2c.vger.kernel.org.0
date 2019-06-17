Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3871747D1C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 10:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfFQIbX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 04:31:23 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:13440 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfFQIbX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 04:31:23 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 9B41C4F744;
        Mon, 17 Jun 2019 10:31:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id nUG3YAOoa8MY; Mon, 17 Jun 2019 10:31:19 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2 v4] dt-bindings: i2c: i2c-mt7621: Add bindings for MediaTek MT7621/28/88 I2C
Date:   Mon, 17 Jun 2019 10:31:16 +0200
Message-Id: <20190617083117.1690-1-sr@denx.de>
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
v4:
- No change

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
2.22.0

