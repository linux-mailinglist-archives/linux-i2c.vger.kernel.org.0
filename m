Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A5243FE2B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 16:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhJ2OO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 10:14:26 -0400
Received: from ixit.cz ([94.230.151.217]:52374 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231912AbhJ2OOK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 10:14:10 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id D644224E6A;
        Fri, 29 Oct 2021 16:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635516700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=durrH59AsNBaSyMfys+XOY6Bue92IJ/k3QhhPdy8RME=;
        b=afa9mBKTA+Kmd7OmvFwBa756JRSIpME+UzCFt3YpkvcoczS6KIH47gHAguvrMVijZ+CbAp
        dmp/1FtyxKaaigb3MFWf5OrGj5ajuivvEBnmEy/7iETvyYzujS3rKE2RyUi8W3Dvc5Eu1p
        iDPco7tmUj7+Oh50nOprNuuv9w4BWSw=
From:   David Heidelberg <david@ixit.cz>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: imx: hardware do not restrict clock-frequency to only 100 and 400 kHz
Date:   Fri, 29 Oct 2021 16:11:33 +0200
Message-Id: <20211029141134.66170-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

clock-frequency is only restricted by the upper limit of 400 kHz.

Found with:
$ DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-imx.yaml make dtbs_check
...
arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: i2c@30a20000: clock-frequency:0:0: 387000 is not one of [100000, 400000]
	From schema: linux/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
...

Fixes: 4bdc44347299 ("dt-bindings: i2c: Convert imx i2c to json-schema")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index 3592d49235e0..c167958ae2a9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -57,7 +57,9 @@ properties:
     const: ipg
 
   clock-frequency:
-    enum: [ 100000, 400000 ]
+    minimum: 1
+    default: 100000
+    maximum: 400000
 
   dmas:
     items:
-- 
2.33.0

