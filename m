Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D766375DF3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 02:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhEGAlu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 20:41:50 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41787 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbhEGAlu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 20:41:50 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D91B0891AD;
        Fri,  7 May 2021 12:40:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620348048;
        bh=47/c17VIj6d/N+J2xs5Gz7yzioMSYApf0E6Fif/tnbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=UV7dYDYFqGPmIpGXW9D5+6osHWvQA7WJ3REUE3YVV/bR5f4OpNVxpfOtaXMklPwOB
         t1vdbOhIELrHvPr9PKVZRzaLcPyiw8zsJ15EL60e6gs6c/BJYPO/BCFo/b+JbyrX/2
         Mg+w/HIHOoo4HoMnf+Rr0MOcgjbdxc/LaMmCv2MCpmohauuSsCuCV7VopNBAzMxQ1I
         mBs/CHLPCS0HhPREzoJmW6eA8UeRggO1Z/BdBAFpuJxz8Bizb9zzcn4bdNBAcmXuUl
         F6DleIV8PoZ9g4I/XgjmkLAIc4k1tyqJH3dzXuAU56UCID43ZCSMC/vw7s29JpnjM/
         VpG/q46XjkUaQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60948c900001>; Fri, 07 May 2021 12:40:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id B96B013ECA5;
        Fri,  7 May 2021 12:40:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id B46CC283A61; Fri,  7 May 2021 12:40:48 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
Date:   Fri,  7 May 2021 12:40:45 +1200
Message-Id: <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=3WbeyVfOhAup7pk4KgsA:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the fsl,i2c-erratum-a004447 flag which indicates the presence
of an i2c erratum on some QorIQ SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
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

