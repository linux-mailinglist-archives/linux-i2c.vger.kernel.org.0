Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C719534C150
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 03:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhC2Bwj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Mar 2021 21:52:39 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46399 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhC2BwK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Mar 2021 21:52:10 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 31A50891AE;
        Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616982728;
        bh=VocJfShqcXIRhpMjMvHnjWWH51a+SYNvRnciAqETJzs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MN6omN5jE4Empf2TwfVL1U92N7zXkRopCWBvE45b49G7964Kzvc7o5u+jRqCn6YzM
         J3EkoA72vmOpFDWWtAtyMBI8W77wgelN8OqmsYwtBwpbgblCdOjoTjNIXv1T37gR42
         8vscaQDv+GwwpK9Xadjuw2aRI9sV7evTGY8A499RFZuK+V17ZuXVH6e93L7EikIQSP
         wEyycyJm7zByXVgLxRbw08rJtykttLfo3sBK2htc8Lc0jv7RlyUaCRR5tnAPwcQqUJ
         1yRrze+mTuR5dpY2AlWHOqMk+o1H3GQrBvaXPzYfWeS8WKSCqzWds/2E0W9yGJccP7
         hal8pjp5avarw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606132c70001>; Mon, 29 Mar 2021 14:52:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 649D413EED4;
        Mon, 29 Mar 2021 14:52:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 902B1284081; Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/6] dt-bindings: i2c-mpc: Document interrupt property as required
Date:   Mon, 29 Mar 2021 14:52:01 +1300
Message-Id: <20210329015206.17437-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=yq7alYDTZcx5lnFy0mkA:9 a=fCgQI5UlmZDRPDxm0A3o:22
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
2.31.0

