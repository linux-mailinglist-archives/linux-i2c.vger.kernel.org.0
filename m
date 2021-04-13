Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F82435D6D6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 07:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242498AbhDMFKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 01:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240996AbhDMFK0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 01:10:26 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95B7C061756
        for <linux-i2c@vger.kernel.org>; Mon, 12 Apr 2021 22:10:07 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C3443891B1;
        Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618290603;
        bh=06bqgRoIKo1bw/WYZTmwcz803si3F00eqbZ0lClVLho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SCmPXAwtCrbeS3jtjMhL17IXanoo7R1rqH4xKEPOl4FWicIFqg+mo9TLnUypW+2PQ
         L57/s3WntlZwFDXM3M8H1//LdapBP0kdY7okkXdZiQyuzSVhTnKMGNtUsBVE/93SgS
         Z3/r852iGZcAhxF/TF22qorNIZ4dcksXfqZVzgGPaQEVEtkeqe+UUMal9iniGX1puw
         bgvtMCBjhllBXqOI5swMabifEVkZHm71AG8xu6W5MF3W5QK4u67gDT8NcZl2r+DqqW
         4G+GlsVGO7bbG9iYJr2BmXHnamIPP6bMDk5tvqQBEhRwHxQrvCDEYLFlFUJympek1o
         ttHKdxewmps5w==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607527ab0004>; Tue, 13 Apr 2021 17:10:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id CCB6013EEED;
        Tue, 13 Apr 2021 17:10:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 94948284083; Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/3] MAINTAINERS: Add Chris Packham as FREESCALE MPC I2C maintainer
Date:   Tue, 13 Apr 2021 17:09:55 +1200
Message-Id: <20210413050956.23264-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=iNMaT824dxZMgvWejbMA:9 a=AjGcO6oz07-iQ99wixmX:22 a=ST-jHhOKWsTCqRlWije3:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Chris Packham as FREESCALE MPC I2C maintainer.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56e9e4d777d8..3bc77ba8cd05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7135,6 +7135,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
 F:	drivers/i2c/busses/i2c-imx-lpi2c.c
=20
+FREESCALE MPC I2C DRIVER
+M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+F:	drivers/i2c/busses/i2c-mpc.c
+
 FREESCALE QORIQ DPAA ETHERNET DRIVER
 M:	Madalin Bucur <madalin.bucur@nxp.com>
 L:	netdev@vger.kernel.org
--=20
2.31.1

