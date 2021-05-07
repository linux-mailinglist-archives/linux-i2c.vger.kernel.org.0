Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C0F375DFC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 02:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbhEGAly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 20:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbhEGAly (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 20:41:54 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CD5C061763
        for <linux-i2c@vger.kernel.org>; Thu,  6 May 2021 17:40:54 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BBEFE806B6;
        Fri,  7 May 2021 12:40:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620348048;
        bh=NBfj0fou0eb1FfgUBAqlkdxQ4abm0MgkKikiT7Vjsjs=;
        h=From:To:Cc:Subject:Date;
        b=sSLtkZJUo6ZPEtmCRaiR269hB9xNZEsYLDLEV40ITi2IS+a3bnypK1YwbUzFjGMqc
         cvamHHWvoMNPCUwkSxh4piGKFmNomj8jWRc/qSdzd25GXVA2aVwm1gdnOyu8/qz+PB
         exPpkvt677QEoI7wsqoXcAJIesCc7uBxEYzpD6kAW+PEWmO+bREG35z+rHD+BSTySt
         LgnUwvzqQe4VqWbyiVAflD9/0wBH57psvgHQVE9r5/jCE0Kp9XtwKFczBn5aDMXoRJ
         tte3KYCPQqIZKhy9M4bRSPENHR324mvjpBkwBR2t7tCIovf2J53bjdhJdJeO/WWz3E
         EFbp/UZbQTq8A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60948c900000>; Fri, 07 May 2021 12:40:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 992E713ECA5;
        Fri,  7 May 2021 12:40:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 928D9283A61; Fri,  7 May 2021 12:40:48 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/3] P2040/P2041 i2c recovery erratum
Date:   Fri,  7 May 2021 12:40:44 +1200
Message-Id: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=LMdnaIF9TloyW3KOcEsA:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The P2040/P2041 has an erratum where the i2c recovery scheme
documented in the reference manual (and currently implemented
in the i2c-mpc.c driver) does not work. The errata document
provides an alternative that does work. This series implements
that alternative and uses a property in the devicetree to
decide when the alternative mechanism is needed.

Chris Packham (3):
  dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
  powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c
    controllers
  i2c: mpc: implement erratum A-004447 workaround

 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  7 ++
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi   | 16 ++++
 drivers/i2c/busses/i2c-mpc.c                  | 84 ++++++++++++++++++-
 3 files changed, 105 insertions(+), 2 deletions(-)

--=20
2.31.1

