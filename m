Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AED35746A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355360AbhDGSfy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:35:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhDGSfy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 14:35:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7912D611BD;
        Wed,  7 Apr 2021 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617820544;
        bh=Mp8qO66K8R97GNEk9Yj4pyRmjCadgvAcQoGazyjZvlU=;
        h=From:To:Cc:Subject:Date:From;
        b=srqoNU9ZXUvBBLLvV6qrBd8iPDQt5U5FoIQMX0pXtjtCGSP8b3uGkM7cAOEyoBNnc
         AXg6CP5gr0GXt1TnNt8VJypZdauI4GwZRF2l1OcAmbWh04V2rP7Do9GQx7WCtWQSTh
         ZioFGfMMxlITzOBJqJpqKNQuCRkEvMokWfIaZGRK2JBbnMmRFV7fhxRt2HKNvWOq6Q
         exPk8vEktM1jc3Hh/dicHPwVxoEji0YBCvyVl1Iozx5CEvObXmRRH6Xw4nkfCxobch
         Vx4yt8H3VCkRXn7IZIMPa+n8u1SROar9BN3TLpzvAWTntUZrQZQpMnFNPzjw+txA6y
         yNNIR0uuryzrQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH] i2c: imx: mention Oleksij as maintainer of the binding docs
Date:   Wed,  7 Apr 2021 20:35:32 +0200
Message-Id: <20210407183532.2682-1-wsa@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When I removed myself as a maintainer of the yaml file, I missed that
some maintainer is required. Oleksij is already listed in MAINTAINERS
for this file, so add him here as well.

Fixes: 1ae6b3780848 ("i2c: imx: drop me as maintainer of binding docs")
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index f33c6b29966b..3592d49235e0 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -6,6 +6,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
 
+maintainers:
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
-- 
2.29.2

