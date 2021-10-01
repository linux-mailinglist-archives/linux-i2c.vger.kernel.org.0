Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30ED41E8D0
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 10:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352794AbhJAIOd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 04:14:33 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52852 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352704AbhJAIOJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 04:14:09 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FA982019CA;
        Fri,  1 Oct 2021 10:12:24 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 91A2A2019AE;
        Fri,  1 Oct 2021 10:12:24 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 05569202F7;
        Fri,  1 Oct 2021 10:12:23 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [RESEND v2 08/10] dt-bindings: fsl: scu: Add i.MX8DXL ocotp binding
Date:   Fri,  1 Oct 2021 11:11:33 +0300
Message-Id: <1633075894-10214-9-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
References: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i.MX8DXL ocotp compatible to the SCU bindings documentation.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index fd0061712443..f1470d562156 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -141,7 +141,8 @@ OCOTP bindings based on SCU Message Protocol
 Required properties:
 - compatible:		Should be one of:
 			"fsl,imx8qm-scu-ocotp",
-			"fsl,imx8qxp-scu-ocotp".
+			"fsl,imx8qxp-scu-ocotp",
+			"fsl,imx8dxl-scu-ocotp".
 - #address-cells:	Must be 1. Contains byte index
 - #size-cells:		Must be 1. Contains byte length
 
-- 
2.31.1

