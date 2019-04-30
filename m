Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDEAEFA5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 06:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbfD3Eb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 00:31:29 -0400
Received: from inva020.nxp.com ([92.121.34.13]:51448 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfD3Eb3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 00:31:29 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A713E1A0014;
        Tue, 30 Apr 2019 06:31:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ACEDA1A0013;
        Tue, 30 Apr 2019 06:31:17 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C57A5402D9;
        Tue, 30 Apr 2019 12:31:06 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, leoyang.li@nxp.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, sumit.batra@nxp.com,
        l.stach@pengutronix.de, peda@axentia.se,
        Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 1/3] dt-bindings: i2c: add optional mul-value property to binding
Date:   Tue, 30 Apr 2019 12:32:40 +0800
Message-Id: <20190430043242.29687-1-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

NXP Layerscape SoC have up to three MUL options available for all
divider values, we choice of MUL determines the internal monitor rate
of the I2C bus (SCL and SDA signals):
A lower MUL value results in a higher sampling rate of the I2C signals.
A higher MUL value results in a lower sampling rate of the I2C signals.

So in Optional properties we added our custom mul-value property in the
binding to select which mul option for the device tree i2c controller
node.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
index b967544590e8..ba8e7b7b3fa8 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
@@ -18,6 +18,9 @@ Optional properties:
 - sda-gpios: specify the gpio related to SDA pin
 - pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
   bus recovery, call it "gpio" state
+- mul-value: NXP Layerscape SoC have up to three MUL options available for
+all I2C divider values, it describes which MUL we choose to use for the driver,
+the values should be 1,2,4.
 
 Examples:
 
-- 
2.17.1

