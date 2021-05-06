Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31802374CC0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 03:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhEFBL0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 21:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhEFBLY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 21:11:24 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44868C0613ED
        for <linux-i2c@vger.kernel.org>; Wed,  5 May 2021 18:10:27 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0DADF891AE;
        Thu,  6 May 2021 13:10:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620263421;
        bh=NuxtmiB9vBtPJ7+lr2Jkbk+llLCBqpimoEWh66Aw+ZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=whRv0wiUHaMRinca7fFR9t77uCW8Dg5H+5BdgZl+KnW9bHBWMMDmepeWC8gVUHcDC
         5Ei55KmsbVUt14vH26XDJ9vyuK+quP0+R+EAD9NpgRlz/YodS/lNfPiJ9uZgJmmTXd
         FubXuq6jRBb7FrRRNHGR4KvAuI+HbIOffAho/eK+V1Vof0COYLDNlYlRc1N8qK8UkC
         CDHVwD5nGuv09dqtVLxleAordNSyAMydto0zV3PmqFSOWIZsuLlsP/S1Azb43Qm5D1
         iAIiXvGtTvh1o+8AUVddGxjTz6V0i1wQQls/Ck6XHov49DKR5wepZylT+6Zn6wKnDq
         qjuA4QC8Lb0PQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609341fc0002>; Thu, 06 May 2021 13:10:20 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id D624B13ECA6;
        Thu,  6 May 2021 13:10:20 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id D320D283A60; Thu,  6 May 2021 13:10:20 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Subject: [PATCH 2/3] powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
Date:   Thu,  6 May 2021 13:10:13 +1200
Message-Id: <20210506011015.17347-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
References: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=B+jHL9lM c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=CCyhWkR5sz16QRgSDIcA:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c controllers on the P2040/P2041 have an erratum where the
documented scheme for i2c bus recovery will not work (A-004447). A
different mechanism is needed which is documented in the P2040 Chip
Errata Rev Q (latest available at the time of writing).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/p2041si-post.dtsi
index 872e4485dc3f..ddc018d42252 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -371,7 +371,23 @@ sdhc@114000 {
 	};
=20
 /include/ "qoriq-i2c-0.dtsi"
+	i2c@118000 {
+		fsl,i2c-erratum-a004447;
+	};
+
+	i2c@118100 {
+		fsl,i2c-erratum-a004447;
+	};
+
 /include/ "qoriq-i2c-1.dtsi"
+	i2c@119000 {
+		fsl,i2c-erratum-a004447;
+	};
+
+	i2c@119100 {
+		fsl,i2c-erratum-a004447;
+	};
+
 /include/ "qoriq-duart-0.dtsi"
 /include/ "qoriq-duart-1.dtsi"
 /include/ "qoriq-gpio-0.dtsi"
--=20
2.31.1

