Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F1CFA7B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 15:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfD3Ndd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 09:33:33 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:40564 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfD3Ndc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 09:33:32 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x3UDNK9C032150;
        Tue, 30 Apr 2019 09:23:21 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2s4h8d2csd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 30 Apr 2019 09:23:21 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 30 Apr 2019 09:23:19 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 30 Apr 2019 09:23:19 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/7] ARM: dts: r7s9210: Add Ethernet support
Date:   Tue, 30 Apr 2019 08:23:04 -0500
Message-ID: <20190430132309.12473-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-30_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=834
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300086
X-Proofpoint-Spam-Reason: mlx
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Ethernet support for the RZ/A2 SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 8423004bb4b7..8e9738467bfa 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -191,6 +191,31 @@
 			status = "disabled";
 		};
 
+		ether0: ethernet@e8204000 {
+			compatible = "renesas,ether-r7s9210";
+			reg = <0xe8204000 0x200>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 65>;
+			power-domains = <&cpg>;
+
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ether1: ethernet@e8204200 {
+			compatible = "renesas,ether-r7s9210";
+			reg = <0xe8204200 0x200>;
+			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 64>;
+			power-domains = <&cpg>;
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ostm0: timer@e803b000 {
 			compatible = "renesas,r7s9210-ostm", "renesas,ostm";
 			reg = <0xe803b000 0x30>;
-- 
2.16.1

