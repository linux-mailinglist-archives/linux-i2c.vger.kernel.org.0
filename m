Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720087AF776
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 02:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjI0AjF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 20:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjI0AhE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 20:37:04 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E4B2D41
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 16:48:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3607E2C04AB;
        Wed, 27 Sep 2023 12:48:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1695772088;
        bh=4djadmt2Z7kYAn+dgx4Dqa4/nGoiuXn4rvyEJGFX05o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mDXn0pJ+CKnZmP4ry4xyi4WJeGY0zzZudbrBM3EmpPqvWjdL8UOYoMB5rj9KXyvsW
         WOelT94oVUat4P6gcSBjXsDfIg0YqahvkkwB/lDvWtRSD1wXNO8oKjyCFxQTpWzJO6
         r75hlllOru1gv401I5WC7Y121nmnl9W3HafyuZGlZvBCml1Rp/WHYxavp04V/sLeQu
         hCQCrTTBV//np2Ofpl+g3zaYCpE5hTo7XvsZG8fDeJQxKeGLCdGnv2+nggxHLSkXti
         4uSl83In/DdHkWGo+CZtDE43VjUGymRcqT2HCQyu919D/m61thd3eMcE+bF+/ontse
         OPuRz5rCh3TSw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65136db80000>; Wed, 27 Sep 2023 12:48:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id EA2A513EE44;
        Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E73C92809A2; Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, pierre.gondois@arm.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] dt-bindings: i2c: mv64xxx: update bindings for unstuck register
Date:   Wed, 27 Sep 2023 12:47:59 +1300
Message-ID: <20230926234801.4078042-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=fOpHIqSe c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zNV7Rl7Rt7sA:10 a=b5Pq3k1ZBCuUTZ-Yr4IA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some newer Marvell SoCs support an "unstuck" function for I2C bus
recovery. This is an alternative to the generic GPIO based recovery that
the older SoCs use. The unstuck register falls outside of the usual
address block for the I2C controller so requires an additional cell in
the register property. This is optional and does not need to be
supplied.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 984fc1ed3ec6..461d1c9ee3f7 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -45,7 +45,10 @@ properties:
       auto-detects this and sets it appropriately.
=20
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: I2C controller registers
+      - description: I2C unstuck register
=20
   interrupts:
     maxItems: 1
--=20
2.42.0

