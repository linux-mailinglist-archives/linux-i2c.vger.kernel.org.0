Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1CBA12A764
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2019 11:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfLYKhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Dec 2019 05:37:38 -0500
Received: from inva021.nxp.com ([92.121.34.21]:42330 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYKhi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Dec 2019 05:37:38 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7667620084C;
        Wed, 25 Dec 2019 11:37:36 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6741F2007D4;
        Wed, 25 Dec 2019 11:37:32 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 17BCB402B3;
        Wed, 25 Dec 2019 18:37:27 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [RESEND v6,3/3] arm64: dts: fsl-ls208xa-rdb: fix an errata E-00013
Date:   Wed, 25 Dec 2019 18:36:24 +0800
Message-Id: <20191225103624.48342-3-biwen.li@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225103624.48342-1-biwen.li@nxp.com>
References: <20191225103624.48342-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Specify a channel zero in idle state to
avoid enterring tri-stated state for PCA9547.
About E-00013:
	- Description: I2C1 and I2C3 buses
	  are missing pull-up.
	- Impact: When the PCA954x device is tri-stated, the I2C bus
	  will float. This makes the I2C bus and its associated
	  downstream devices inaccessible.
	- Hardware fix: Populate resistors R189 and R190 for I2C1
	  and resistors R228 and R229 for I2C3.
	- Software fix: Remove the tri-state option from the PCA954x
	  driver(PCA954x always on enable status, specify a
	  channel zero in dts to fix the errata E-00013).

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v6:
	- none

Change in v5:
	- specify a channel zero when pca9547 in idle state.

 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
index 6fd7f63085c9..412f1bc0db5f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
@@ -49,6 +49,7 @@
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		idle-state = <0>;
 		i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.17.1

