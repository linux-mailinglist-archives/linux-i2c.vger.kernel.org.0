Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112BF477BDA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 19:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238191AbhLPSti (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 13:49:38 -0500
Received: from inva020.nxp.com ([92.121.34.13]:60540 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237748AbhLPStb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 13:49:31 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DCE771A3124;
        Thu, 16 Dec 2021 19:49:29 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CEDC01A3118;
        Thu, 16 Dec 2021 19:49:29 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5680A202AD;
        Thu, 16 Dec 2021 19:49:28 +0100 (CET)
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
Subject: [RESEND v4 10/10] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible
Date:   Thu, 16 Dec 2021 20:48:14 +0200
Message-Id: <1639680494-23183-11-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i.MX8DXL lpuart compatible to the bindings documentation.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index fa23c60a01d0..ee37aa125c86 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -29,6 +29,10 @@ properties:
       - items:
           - const: fsl,imx8qm-lpuart
           - const: fsl,imx8qxp-lpuart
+      - items:
+          - const: fsl,imx8dxl-lpuart
+          - const: fsl,imx8qxp-lpuart
+          - const: fsl,imx7ulp-lpuart
 
   reg:
     maxItems: 1
-- 
2.31.1

