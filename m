Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF1641AEB8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 14:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240679AbhI1MT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Sep 2021 08:19:27 -0400
Received: from inva020.nxp.com ([92.121.34.13]:60476 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240628AbhI1MTU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Sep 2021 08:19:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D09F21A0153;
        Tue, 28 Sep 2021 14:17:39 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C15381A2847;
        Tue, 28 Sep 2021 14:17:39 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3721D2030E;
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
Subject: [PATCH v2 09/10] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match
Date:   Tue, 28 Sep 2021 15:17:19 +0300
Message-Id: <1632831440-5880-10-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
References: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add i.MX8DXL lpi2c compatible to the bindings documentation.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 29b9447f3b84..3505577082d7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -18,7 +18,9 @@ properties:
       - enum:
           - fsl,imx7ulp-lpi2c
           - fsl,imx8qm-lpi2c
+          - fsl,imx8dxl-lpi2c
       - items:
+          - const: fsl,imx8dxl-lpi2c
           - const: fsl,imx8qxp-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
-- 
2.31.1

