Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA87F1141B4
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2019 14:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbfLENka (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 08:40:30 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:52666 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbfLENka (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Dec 2019 08:40:30 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id aDgS2100T5USYZQ01DgSya; Thu, 05 Dec 2019 14:40:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrMo-00028O-Du; Thu, 05 Dec 2019 14:40:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrMo-0001dd-C3; Thu, 05 Dec 2019 14:40:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: sh_mobile: Document r8a77961 support
Date:   Thu,  5 Dec 2019 14:40:25 +0100
Message-Id: <20191205134025.6256-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document support for the IIC controller in the Renesas R-Car M3-W+
(R8A77961) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,iic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic.txt b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
index 64d11ffb07c47621..ffe085c9947e6703 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,iic.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
@@ -17,6 +17,7 @@ Required properties:
 			- "renesas,iic-r8a7794" (R-Car E2)
 			- "renesas,iic-r8a7795" (R-Car H3)
 			- "renesas,iic-r8a7796" (R-Car M3-W)
+			- "renesas,iic-r8a77961" (R-Car M3-W+)
 			- "renesas,iic-r8a77965" (R-Car M3-N)
 			- "renesas,iic-r8a77990" (R-Car E3)
 			- "renesas,iic-sh73a0" (SH-Mobile AG5)
-- 
2.17.1

