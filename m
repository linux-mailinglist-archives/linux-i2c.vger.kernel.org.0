Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4442A37B0AB
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 23:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhEKVWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 17:22:06 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48237 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEKVWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 17:22:05 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7DB6084488;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620768055;
        bh=BgAjOuGtonx7aZqvvw9jeRLkSYu+EAFqQXChSZxwKRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xj2pZaksDcmF5nI3+ChJF7VrjVxJNE8KSyWLOMbvetvNW3h7l1EjBiPKSaPNNwIck
         3pVUVrpMaE5Bez/OgB7Px00CKfmyywghmiXIjKj32b3gSfd3WRNOzwpZ26s3zOqIFm
         idgLL4siJTbluVNDaNyvVhnsYkUrz+byon+g1lm/QcHLvQWjQbyUdGcE1/kTPV5TgD
         R+PrMNOinMZLbpXry3Bx592VG6p4lcUyCt5M5uG78iNeIG1Y06bnZb+/Z4zBhgAJDM
         IGRs/P+w00lnsCkN0ZODPbYSu9EA0tiyq8wWvQK72JkIXQqbPAiFl2dLjcdorCeSL0
         lq5x8joDexfkQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609af5370001>; Wed, 12 May 2021 09:20:55 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 5CF9C13ECA6;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 59F78283A61; Wed, 12 May 2021 09:20:55 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/4] dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
Date:   Wed, 12 May 2021 09:20:49 +1200
Message-Id: <20210511212052.27242-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=VwQbUJbxAAAA:8 a=Qb3TSHUbMK0G8g0bADAA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the fsl,i2c-erratum-a004447 flag which indicates the presence
of an i2c erratum on some QorIQ SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    Changes in v3:
    - Add Ack from Rob

 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documen=
tation/devicetree/bindings/i2c/i2c-mpc.yaml
index 7b553d559c83..98c6fcf7bf26 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -46,6 +46,13 @@ properties:
     description: |
       I2C bus timeout in microseconds
=20
+  fsl,i2c-erratum-a004447:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Indicates the presence of QorIQ erratum A-004447, which
+      says that the standard i2c recovery scheme mechanism does
+      not work and an alternate implementation is needed.
+
 required:
   - compatible
   - reg
--=20
2.31.1

