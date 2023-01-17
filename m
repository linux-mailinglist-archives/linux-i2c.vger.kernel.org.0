Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7DF670D7D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 00:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjAQXap (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 18:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjAQXaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 18:30:15 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB894A22D;
        Tue, 17 Jan 2023 12:47:00 -0800 (PST)
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HKiRoR029198;
        Tue, 17 Jan 2023 20:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=o68Q2hQmVAZhKXRa6IhYs/JexQ8crFCVEyz3phkNAsk=;
 b=mr0QQt8Y3OeXpHregAhMternzO1X5EFtUDi8ORnb0oIixvbZi8lZmtC2ATTQA/yVE3jM
 EtRcKQZ/ODyg1R178u8pXCVJaTfAjBzPiggmBVTr7SM1QYwPe1+QfELGe8AfdNH8zOVE
 TkIwfZol2q9x8Qyiru7D/19PHpPokWJ6blXRx3J6tflqgBiIoFHas0ZXVx2V9hKq3u5D
 xiQFtr6QYHMwm3myv7cfA5wJaZS+n4yhSfB2/FR5qkJQQ9jRAdWew5hnalrDseKaMVcf
 IN/ld83D/N3y22z3mUyfD28maL5goFhoAoH138bCRWG4gUeKTzQUfW/4fg0uV0i1FbeW Bw== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n62ycr0gq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 20:46:39 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 2A5D18085FB;
        Tue, 17 Jan 2023 20:46:38 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id B53C7808048;
        Tue, 17 Jan 2023 20:46:37 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] ARM: dts: hpe: Add I2C Topology
Date:   Tue, 17 Jan 2023 14:44:37 -0600
Message-Id: <20230117204439.76841-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117204439.76841-1-nick.hawkins@hpe.com>
References: <20230117204439.76841-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: qKrX2rdFIk-KFTHVKvASdLWcfNWF_EpH
X-Proofpoint-GUID: qKrX2rdFIk-KFTHVKvASdLWcfNWF_EpH
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=720 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170165
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Add 9 I2C Engines, 2 MUXs, and a EEPROM to the device tree.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---

v2:
 *Made i2cX a generic node name i2c in the dts
 *Added status field to dtsi and dts for i2c bus
---
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts | 109 ++++++++++++++++++++
 arch/arm/boot/dts/hpe-gxp.dtsi           | 125 +++++++++++++++++++++++
 2 files changed, 234 insertions(+)

diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
index 3a7382ce40ef..1f2547fe9ae3 100644
--- a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
+++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
@@ -23,4 +23,113 @@
 		device_type = "memory";
 		reg = <0x40000000 0x20000000>;
 	};
+
+	i2cmux@4 {
+		compatible = "i2c-mux-reg";
+		i2c-parent = <&i2c4>;
+		reg = <0xd1000074 0x1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2cmux@6 {
+		compatible = "i2c-mux-reg";
+		i2c-parent = <&i2c6>;
+		reg = <0xd1000076 0x1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
 };
diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
index cf735b3c4f35..3bc071149bae 100644
--- a/arch/arm/boot/dts/hpe-gxp.dtsi
+++ b/arch/arm/boot/dts/hpe-gxp.dtsi
@@ -122,6 +122,131 @@
 				interrupts = <6>;
 				interrupt-parent = <&vic0>;
 			};
+
+			sysreg_system_controller: syscon@f8 {
+				compatible = "hpe,gxp-sysreg", "syscon";
+				reg = <0xf8 0x8>;
+			};
+
+			i2c0: i2c@2000 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2000 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c1: i2c@2100 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2100 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c2: i2c@2200 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2200 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c3: i2c@2300 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2300 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c4: i2c@2400 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2400 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c5: i2c@2500 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2500 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c6: i2c@2600 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2600 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c7: i2c@2700 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2700 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c8: i2c@2800 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2800 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
+
+			i2c9: i2c@2900 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2900 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+				hpe,sysreg = <&sysreg_system_controller>;
+				clock-frequency = <100000>;
+			};
 		};
 	};
 };
-- 
2.17.1

