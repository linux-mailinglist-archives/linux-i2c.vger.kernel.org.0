Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB46C37B0AE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 23:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhEKVWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 17:22:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48243 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhEKVWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 17:22:05 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A15F4891AD;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620768055;
        bh=NuxtmiB9vBtPJ7+lr2Jkbk+llLCBqpimoEWh66Aw+ZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=fTiG4o8jYm31vmd7bCG8oEeTmrJtwWArdupFwEcUK21zMu/yU/AUT4WYTNaYHUesz
         WadDVszJW83O1laIrGmQqbwxw/QNHgRPLH7wMK9V1JFh6Q6+EWjAOkU9CO8WAaRaEn
         LRqfsksu5c8mVcMAVE9h6o2bwqF2XzLkpVVdCHlciS25SlBDBP3VfQOZt6xSP6QbT1
         g8lqwBj3xvpcPejoB9RVIqzjATUuy3m+UMf0n4Bag1/tSBZigA3U922X5QufnCPAv/
         LUhAzt3Ke+iJt1HBeLagEKnAhu8uk+oZ4dXnxK8ARZ0VFt8ZivdOh5iDSVFRCzIHbb
         fP0+1Q8mOmt6A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609af5370002>; Wed, 12 May 2021 09:20:55 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 8079013ECA6;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 7D10D283A61; Wed, 12 May 2021 09:20:55 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Subject: [PATCH v3 2/4] powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
Date:   Wed, 12 May 2021 09:20:50 +1200
Message-Id: <20210511212052.27242-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=CCyhWkR5sz16QRgSDIcA:9
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

