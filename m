Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8384D2F521E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 19:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbhAMSc0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 13:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbhAMScZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 13:32:25 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C390C061794
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jan 2021 10:31:30 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1B61C3F260;
        Wed, 13 Jan 2021 19:25:26 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 3/3] dt-bindings: i2c: qcom,i2c-qup: Document noise rejection properties
Date:   Wed, 13 Jan 2021 19:25:22 +0100
Message-Id: <20210113182522.443262-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113182522.443262-1-angelogioacchino.delregno@somainline.org>
References: <20210113182522.443262-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the new noise rejection properties "qcom,noise-reject-sda"
and "qcom,noise-reject-scl".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
index c5c7db3ac2a6..3f14dd65c6b9 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
@@ -58,6 +58,20 @@ properties:
   '#size-cells':
     const: 0
 
+  qcom,noise-reject-sda:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Noise rejection level for the SDA line.
+    minimum: 0
+    maximum: 3
+    default: 0
+
+  qcom,noise-reject-scl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Noise rejection level for the SCL line.
+    minimum: 0
+    maximum: 3
+    default: 0
+
 required:
   - compatible
   - clocks
-- 
2.29.2

