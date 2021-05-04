Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631DF372C67
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhEDOu2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhEDOu2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:50:28 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EE4C061574
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:49:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0epX250023aEpPb01epXyF; Tue, 04 May 2021 16:49:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwMc-002nvc-KK; Tue, 04 May 2021 16:49:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwMc-00HQRq-7O; Tue, 04 May 2021 16:49:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: r8a7794: Remove generic compatible strings from iic blocks
Date:   Tue,  4 May 2021 16:49:26 +0200
Message-Id: <99626a30ef0bc71f4ce5244ebdb67bab20184a7e.1620139307.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620139307.git.geert+renesas@glider.be>
References: <cover.1620139307.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The IIC blocks on R-Car E2 do not have the automatic transmission
registers.  Hence they thus must not declare compatibility with the
R-Car Gen2-specific and generic versions.

Fixes: aa9b992ea2d3c2cc ("ARM: dts: r8a7794: Add IIC nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 0035770e74de80a5..f974b8676bc59222 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -457,9 +457,7 @@ i2c5: i2c@e6528000 {
 		};
 
 		i2c6: i2c@e6500000 {
-			compatible = "renesas,iic-r8a7794",
-				     "renesas,rcar-gen2-iic",
-				     "renesas,rmobile-iic";
+			compatible = "renesas,iic-r8a7794";
 			reg = <0 0xe6500000 0 0x425>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 318>;
@@ -474,9 +472,7 @@ i2c6: i2c@e6500000 {
 		};
 
 		i2c7: i2c@e6510000 {
-			compatible = "renesas,iic-r8a7794",
-				     "renesas,rcar-gen2-iic",
-				     "renesas,rmobile-iic";
+			compatible = "renesas,iic-r8a7794";
 			reg = <0 0xe6510000 0 0x425>;
 			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 323>;
-- 
2.25.1

