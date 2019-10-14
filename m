Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE09DD6173
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 13:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730314AbfJNLg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 07:36:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47746 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbfJNLg7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 07:36:59 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B4D7200178;
        Mon, 14 Oct 2019 13:36:57 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 51E262003CE;
        Mon, 14 Oct 2019 13:36:53 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2FCDA402AE;
        Mon, 14 Oct 2019 19:36:48 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 1/2] dt-bindings: i2c: replace property i2c-mux-idle-disconnect
Date:   Mon, 14 Oct 2019 19:25:57 +0800
Message-Id: <20191014112558.3881-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This replaces property i2c-mux-idle-disconnect with idle-state

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a60f041..f2db517b1635 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -25,9 +25,7 @@ Required Properties:
 Optional Properties:
 
   - reset-gpios: Reference to the GPIO connected to the reset input.
-  - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
-    children in idle state. This is necessary for example, if there are several
-    multiplexers on the bus and the devices behind them use same I2C addresses.
+  - idle-state: Please refer to Documentation/devicetree/bindings/mux/mux-controller.txt
   - interrupts: Interrupt mapping for IRQ.
   - interrupt-controller: Marks the device node as an interrupt controller.
   - #interrupt-cells : Should be two.
-- 
2.17.1

