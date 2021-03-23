Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AE43456CF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCWEe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:27 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39014 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhCWEdv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:51 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D80F2891AE;
        Tue, 23 Mar 2021 17:33:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474027;
        bh=vSTLpwh5K444l5BGf/dQ0YOvwBnK3lHUEiyx1CVu4MY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xdm/KCwCMFtQGvsSZGGyQLdJhUW9VpRb9Nkc3YZriMTI7+C79bwx5gv4oWS7DauK8
         6em6ot4Z9D8vkUHccV/OubN3gfxQ2Q9IguW63MBKW+WOd4ThUCVb/urYFuDrdEOFTJ
         6Df6zHrJGrNh1f3XHrZ3zOQtVNTaYQVZ6KyFASDcMBE74X+YcW6tzqsUvII1D51UzA
         yIndODVmQATo/TQudqmsCUH+ZCn1TrUtm7SC5ma2byt3jKwpn79IGJR19wio/KJ2hA
         oOFGbksPdU6Cu6YLeXmftYFdzVGuMtcGf8UbeZfwx5EfrNQyhAshSWyI867UMjcntK
         pFD7h8JdoIE/A==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fab0001>; Tue, 23 Mar 2021 17:33:47 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4049513EED4;
        Tue, 23 Mar 2021 17:34:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id B350228409A; Tue, 23 Mar 2021 17:33:47 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/6] dt-bindings: i2c-mpc: Document interrupt property as required
Date:   Tue, 23 Mar 2021 17:33:26 +1300
Message-Id: <20210323043331.21878-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=yq7alYDTZcx5lnFy0mkA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All of the in-tree device-trees that use the one of the compatible
strings from i2c-mpc.c supply an interrupts property. Make this property
mandatory to aid refactoring the driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt b/Document=
ation/devicetree/bindings/i2c/i2c-mpc.txt
index 42a390526957..b15acb43d84d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.txt
@@ -7,14 +7,14 @@ Required properties :
    compatible processor, e.g. mpc8313, mpc8543, mpc8544, mpc5121,
    mpc5200 or mpc5200b. For the mpc5121, an additional node
    "fsl,mpc5121-i2c-ctrl" is required as shown in the example below.
-
-Recommended properties :
-
  - interrupts : <a b> where a is the interrupt number and b is a
    field that represents an encoding of the sense and level
    information for the interrupt.  This should be encoded based on
    the information in section 2) depending on the type of interrupt
    controller you have.
+
+Recommended properties :
+
  - fsl,preserve-clocking : boolean; if defined, the clock settings
    from the bootloader are preserved (not touched).
  - clock-frequency : desired I2C bus clock frequency in Hz.
--=20
2.30.2

