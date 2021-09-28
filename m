Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC93D41AEBA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 14:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240681AbhI1MT2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Sep 2021 08:19:28 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58724 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240528AbhI1MTU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Sep 2021 08:19:20 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 719DE202836;
        Tue, 28 Sep 2021 14:17:40 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 64157200235;
        Tue, 28 Sep 2021 14:17:40 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D0FF12030E;
        Tue, 28 Sep 2021 14:17:39 +0200 (CEST)
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
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 10/10] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible
Date:   Tue, 28 Sep 2021 15:17:20 +0300
Message-Id: <1632831440-5880-11-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
References: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i.MX8DXL lpuart compatible to the bindings documentation.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..d84bb33f3b4c 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
       - items:
+          - const: fsl,imx8dxl-lpuart
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
 
-- 
2.31.1

