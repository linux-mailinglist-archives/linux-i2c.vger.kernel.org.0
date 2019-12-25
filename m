Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4719512A760
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2019 11:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfLYKhg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Dec 2019 05:37:36 -0500
Received: from inva021.nxp.com ([92.121.34.21]:42286 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYKhg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Dec 2019 05:37:36 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A31952007A8;
        Wed, 25 Dec 2019 11:37:34 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 93C7D20023C;
        Wed, 25 Dec 2019 11:37:30 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 42AB840282;
        Wed, 25 Dec 2019 18:37:25 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [RESEND v6,1/3] dt-bindings: i2c: support property idle-state
Date:   Wed, 25 Dec 2019 18:36:22 +0800
Message-Id: <20191225103624.48342-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This supports property idle-state

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v6:
	- add reviewed-by

Change in v5:
	- none

Change in v4:
	- none

Change in v3:
	- update subject and description
	- add some information for
  	  property idle-state

Change in v2:
	- update subject and description
	- add property idle-state

 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a60f041..7abda506b828 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -25,6 +25,8 @@ Required Properties:
 Optional Properties:
 
   - reset-gpios: Reference to the GPIO connected to the reset input.
+  - idle-state: if present, overrides i2c-mux-idle-disconnect,
+    Please refer to Documentation/devicetree/bindings/mux/mux-controller.txt
   - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
     children in idle state. This is necessary for example, if there are several
     multiplexers on the bus and the devices behind them use same I2C addresses.
-- 
2.17.1

