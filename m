Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19241FA77
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 15:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfD3Ndc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 09:33:32 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:40568 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfD3Ndc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 09:33:32 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x3UDNK9G032150;
        Tue, 30 Apr 2019 09:23:27 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2s4h8d2csk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 30 Apr 2019 09:23:26 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 30 Apr 2019 09:23:25 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 30 Apr 2019 09:23:25 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
Date:   Tue, 30 Apr 2019 08:23:08 -0500
Message-ID: <20190430132309.12473-7-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-30_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=727
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300086
X-Proofpoint-Spam-Reason: mlx
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The RZ/A2M EVB sub board has 2 Ethernet jacks on it.

Set switch SW6_4	to ON to use Ethernet Ch-0
Set switch SW6_5	to ON to use Ethernet Ch-1

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 42005acb848c..df69746244fe 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -62,6 +62,34 @@
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
 			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
 	};
+
+	eth0_pins: eth0 {
+		pinmux = <RZA2_PINMUX(PORTE, 0, 7)>, /* REF50CK0 */
+			 <RZA2_PINMUX(PORT6, 1, 7)>, /* RMMI0_TXDEN */
+			 <RZA2_PINMUX(PORT6, 2, 7)>, /* RMII0_TXD0 */
+			 <RZA2_PINMUX(PORT6, 3, 7)>, /* RMII0_TXD1 */
+			 <RZA2_PINMUX(PORTE, 4, 7)>, /* RMII0_CRSDV */
+			 <RZA2_PINMUX(PORTE, 1, 7)>, /* RMII0_RXD0 */
+			 <RZA2_PINMUX(PORTE, 2, 7)>, /* RMII0_RXD1 */
+			 <RZA2_PINMUX(PORTE, 3, 7)>, /* RMII0_RXER */
+			 <RZA2_PINMUX(PORTE, 5, 1)>, /* ET0_MDC */
+			 <RZA2_PINMUX(PORTE, 6, 1)>, /* ET0_MDIO */
+			 <RZA2_PINMUX(PORTL, 0, 5)>; /* IRQ4 */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZA2_PINMUX(PORTK, 3, 7)>, /* REF50CK1 */
+			 <RZA2_PINMUX(PORTK, 0, 7)>, /* RMMI1_TXDEN */
+			 <RZA2_PINMUX(PORTK, 1, 7)>, /* RMII1_TXD0 */
+			 <RZA2_PINMUX(PORTK, 2, 7)>, /* RMII1_TXD1 */
+			 <RZA2_PINMUX(PORT3, 2, 7)>, /* RMII1_CRSDV */
+			 <RZA2_PINMUX(PORTK, 4, 7)>, /* RMII1_RXD0 */
+			 <RZA2_PINMUX(PORT3, 5, 7)>, /* RMII1_RXD1 */
+			 <RZA2_PINMUX(PORT3, 1, 7)>, /* RMII1_RXER */
+			 <RZA2_PINMUX(PORT3, 3, 1)>, /* ET1_MDC */
+			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
+			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -80,3 +108,25 @@
 
 	status = "okay";
 };
+
+&ether0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <0>;
+	};
+};
-- 
2.16.1

