Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4571764F116
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 19:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiLPShe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 13:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiLPSha (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 13:37:30 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17732DA9E;
        Fri, 16 Dec 2022 10:37:29 -0800 (PST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGDoR2n016164;
        Fri, 16 Dec 2022 18:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=oTeqjjiAHpLtb9RUFB/rzYZ1JdnjrblaJ1j/wIeCiIU=;
 b=AjrXYU/tBOnbaHUtXvmkZyCEw7y6gntvwDqGHIn8bG61KAYJPADZP0UVSpasZBfc/hF3
 1TGM0hd1s1Rf5oClRG1bE2xHDH2pwVnQArBcfR2coNFOIC4+DIBdGlQzDBBifoIs6Vbx
 ncoA+h0q4iGnjCD5wK/t0+ydadF3GJu58/MPH6qVARViKX2QDtcdS09bhbkwfzufc67g
 TtXVrtxVKI5knCROZIznVoQF5/JZ3nm/qft8mD7+VcfnhlvCEe4vsij/IwYJ4/JN9j6B
 tQZmfzA8xqf3Nm6KKZfLaIVHrOlzBblvKrvT5XkDUP6cdHae+CCwaywTQ9UpPSHkmTRn 5w== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3mgpjuk7f9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 18:37:08 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id D3DD43DE01;
        Fri, 16 Dec 2022 18:37:07 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 4D027808993;
        Fri, 16 Dec 2022 18:37:07 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/6] ARM: dts: hpe: Add I2C Topology
Date:   Fri, 16 Dec 2022 12:35:30 -0600
Message-Id: <20221216183532.78933-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216183532.78933-1-nick.hawkins@hpe.com>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: Q28Lt7dKPU3svft99C5DAVIETqGVGgGc
X-Proofpoint-GUID: Q28Lt7dKPU3svft99C5DAVIETqGVGgGc
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=695 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160162
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
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts |  72 ++++++++++++++
 arch/arm/boot/dts/hpe-gxp.dtsi           | 115 +++++++++++++++++++++++
 2 files changed, 187 insertions(+)

diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
index 3a7382ce40ef..d9008e2cfed3 100644
--- a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
+++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
@@ -23,4 +23,76 @@
 		device_type = "memory";
 		reg = <0x40000000 0x20000000>;
 	};
+
+	i2cmux@4 {
+		compatible = "i2c-mux-reg";
+		i2c-parent = <&i2c4>;
+		reg = <0xd1000074 1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c4@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2cmux@6 {
+		compatible = "i2c-mux-reg";
+		i2c-parent = <&i2c6>;
+		reg = <0xd1000076 1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c6@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c6@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c6@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c6@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c6@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c2 {
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+	};
 };
diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
index cf735b3c4f35..27e68932021c 100644
--- a/arch/arm/boot/dts/hpe-gxp.dtsi
+++ b/arch/arm/boot/dts/hpe-gxp.dtsi
@@ -122,6 +122,121 @@
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
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c1: i2c@2100 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2100 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c2: i2c@2200 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2200 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c3: i2c@2300 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2300 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c4: i2c@2400 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2400 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c5: i2c@2500 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2500 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c6: i2c@2600 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2600 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c7: i2c@2700 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2700 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c8: i2c@2800 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2800 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
+
+			i2c9: i2c@2900 {
+				compatible = "hpe,gxp-i2c";
+				reg = <0x2900 0x70>;
+				interrupts = <9>;
+				interrupt-parent = <&vic0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hpe,sysreg-phandle = <&sysreg_system_controller>;
+				hpe,i2c-max-bus-freq = <100000>;
+			};
 		};
 	};
 };
-- 
2.17.1

