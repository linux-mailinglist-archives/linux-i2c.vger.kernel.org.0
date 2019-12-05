Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591031141AD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2019 14:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbfLENkA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 08:40:00 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:50734 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbfLENkA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Dec 2019 08:40:00 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id aDfx2100N5USYZQ01Dfx3U; Thu, 05 Dec 2019 14:39:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrML-00028C-Mk; Thu, 05 Dec 2019 14:39:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrML-0001ca-Kl; Thu, 05 Dec 2019 14:39:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: rcar: Document r8a77961 support
Date:   Thu,  5 Dec 2019 14:39:56 +0100
Message-Id: <20191205133956.6191-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document support for the I2C controller in the Renesas R-Car M3-W+
(R8A77961) SoC.

Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
index 0660a3eb25474e74..c359965d0724e23f 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
@@ -17,7 +17,8 @@ Required properties:
 	"renesas,i2c-r8a7793" if the device is a part of a R8A7793 SoC.
 	"renesas,i2c-r8a7794" if the device is a part of a R8A7794 SoC.
 	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
-	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
+	"renesas,i2c-r8a7796" if the device is a part of a R8A77960 SoC.
+	"renesas,i2c-r8a77961" if the device is a part of a R8A77961 SoC.
 	"renesas,i2c-r8a77965" if the device is a part of a R8A77965 SoC.
 	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
 	"renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
-- 
2.17.1

