Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FF16257C6
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbiKKKQV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbiKKKQL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:11 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AB8748CE;
        Fri, 11 Nov 2022 02:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeRIhn3knE6aweMvJe6rFWK4y9fkY0+FjNQg3Y2kxoi+IYqQDX0SIfR8438wFe5B8c4TgRlOxkqjh5YWNm/m2rgpSwt3B3rshrmASRaIukxTfDG/p/dQJ2a0dTAc3fwEGMvZH2HpqdRx7tLDHGPPplKdDu8z+ruJPxQOFs0hswuphmiEFi1Av6thgBKNZFBHnn/d73lFdd3jc5sqEEfWjX6lTTVa4AkrSEn7yfziBM1KmKNP8R7ZRk6x0Dcc3TsmaZ4SUso35ZbCXat9Xfj6q1QaUk5F1Y/douTLGUwYlx2VovsKUhuTgVNkLrurZjfXWA3RuThfLkdR/xxWKcxv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bccZqGIdVeolneIXbEyHaMM9yMo+LF4Ai8UTW1oRA9k=;
 b=Lgue1MOgOiaID9VvkFDYcOlToOvR7beROQ5Pry0U/YIbox0S9D2CQ7ZXXmGfJn1UZR/t4vVyudd1x/l4hnbIS9I7vKTcjKFUmR8aCi06QtRNMDZ4a9SsOzDwcDnyFsthgCqC7zYovkzRDw6n1Ppem3yuO4CDOGkCqaa+0TEJ0GFwTb8HGpmOMaHHJAV9mwjbLB5XCIV+61LZFTuIKtIoca1h/U+l2FYDqNnb7SVLRH7+jgUX16/XHhvaBfTYm+guRkaKMjh+DRtXK0gawEoBQm7v/MEwDBTFQ8TudzMmj9kHqzBckfipu4sk6q1/peGEzayv7OZakFwYjVm21wCfcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bccZqGIdVeolneIXbEyHaMM9yMo+LF4Ai8UTW1oRA9k=;
 b=LL5vSKP2Wgc9D2RDs0QlBW923knhqW0+4cz05rhI6XUFRuhy4+DJx63SkAObrogVMglz4lio8z/C6IV6tLY1Tv3kzLdNPeAb2SEgeC7JLfEq4VawOw/jnNM2BwcRF8xgU0T/R2tDhtPUVYBgvLyHeCLim9HC7bnZmPJd5vNBGFz0v3HNWBy+8CL13JOsqqYG3p0I5eVkT+taUh1/L9bZNwRBzZZecN+/8IjH7XUVz+J7um95TVVR8jX/Xa2N0Z4itX1uvXCUygkft+iLu7XW1LVTFD8HBiL46FqY6vmnUip1MPbQRMh6IpdEQwprt9tUJbLUh22EGsVjkiAOv27RzA==
Received: from CY8PR22CA0001.namprd22.prod.outlook.com (2603:10b6:930:45::6)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 10:16:08 +0000
Received: from CY4PEPF0000B8EA.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::9c) by CY8PR22CA0001.outlook.office365.com
 (2603:10b6:930:45::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EA.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:15:58 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:15:58 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:54 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 04/13] arm64: tegra: Enable XUSB host and device on Jetson AGX Orin
Date:   Fri, 11 Nov 2022 18:15:00 +0800
Message-ID: <20221111101509.999589-5-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EA:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 065eee53-733f-4f40-22cd-08dac3cdc000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpdpVJL3czoT+FF3D1fB5TmzBHQ8Rnmo5f4Mo8numEEckrdpJWs/SQH0OMz3bZK81vBuEmVZmxEWY2tKmY/m1IeLBja+R8Dg4ZFkSDK87E13turj8Refro2cdqmtJ8zmN1wOqJDfiNanZ+iG/YR0QCQOF7IneL2wvtzuxHrKkEfgwTvqEDxerOsL8yiJJlnLeOnsZQf2sgugke/6SMQNp59LS+bKjMkzGN9ZOwX+w+buleXLk87JAFVNsd5s/Z+MRxZxHLqWyNyxAawHJitqMezj9gml2P1dHzZOOfc+sD1etqbfZ8vatcETfC5Cm2b9vcWf221aKH7PYZMtCPu4DgUGdOxh/QRnl17YqE7iw5JWgYwoPa0boXhYT2Rzu+DMqGpi/aJ4dFKHRsZoXYC6L1mwad8v6J/6R2UveQrDDeNDACKSmfGy9svN9oLArQRJNjkjrNVXJ9rQTU+DeP4QOTSC5bveMQRgTVesLhAEJVtnw112YqDVSH2IoxWdCTQegDv//rJZxfKu0QXHYldheSoNgjuuLGHliUulF7FRHu61gV+9TSem8EV+hMt+YayfHRVyThwde/DHWCPhgbnn+PrWRup182vBOGJeYJAIz/p/q0xQj/+/VaVyYyhqdxdaouWUTBdNvHt1xRjCKFWX+FK1Tp0dcsVPS/XT7SQNkaSVBJo3tQ6nniX3/Eur54OF/A17qKzkq2PpBEUyplFiyc/U6OXV6Pq3uHr3mY+Rp1fodqJp7LnK3aGk/XcqyUeGLW99X+cxDCMmbHiYfFYgA8IZuhQd/2N+CfSG4SYcXuY=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2616005)(6666004)(478600001)(26005)(40480700001)(7696005)(426003)(1076003)(8676002)(4326008)(47076005)(5660300002)(6636002)(316002)(70586007)(7416002)(41300700001)(54906003)(110136005)(8936002)(36756003)(186003)(40460700003)(83380400001)(36860700001)(921005)(86362001)(2906002)(70206006)(356005)(7636003)(82740400003)(336012)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:08.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065eee53-733f-4f40-22cd-08dac3cdc000
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This commit enables XUSB host, device, and pad controller on
Jetson AGX Orin.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2:removed the redundant cells and status in ucsi-ccg.
Using dash instead of underscore in the ucsi-ccg node name.
Using representive name in cypress,firmware-build property.
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 +++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 175 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 +++++++++++++++++
 3 files changed, 393 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 9e4d72cfa69f..8acef87a5398 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -61,6 +61,29 @@ mmc@3460000 {
 			non-removable;
 		};
 
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_ao_1v8>;
+			avdd-usb-supply = <&vdd_ao_3v3>;
+
+			ports {
+				usb2-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
 		rtc@c2a0000 {
 			status = "okay";
 		};
@@ -69,4 +92,29 @@ pmc@c360000 {
 			nvidia,invert-interrupt;
 		};
 	};
+
+	vdd_5v0_sys: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_ao_1v8: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_ao_3v3: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 57ab75328814..58baedbd0f93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2011,6 +2011,181 @@ hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
 		};
+
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							status = "okay";
+						};
+
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+
+						usb2-3 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							status = "okay";
+						};
+
+						usb3-1 {
+							status = "okay";
+						};
+
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					mode = "otg";
+					usb-role-switch;
+					status = "okay";
+					port {
+						hs_typec_p1: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb2-2 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+					port {
+						ss_typec_p0: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+					port {
+						ss_typec_p1: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <3>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-1";
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
+				"usb3-0", "usb3-1", "usb3-2";
+		};
+
+		i2c@c240000 {
+			status = "okay";
+			ucsi-ccg@8 {
+				compatible = "cypress,cypd4226";
+				cypress,firmware-build = "nvidia,jetson-agx-xavier";
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				reg = <0x08>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "host";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						hs_ucsi_ccg_p0: endpoint {
+							remote-endpoint = <&hs_typec_p0>;
+						};
+					};
+					port@1 {
+						reg = <1>;
+						ss_ucsi_ccg_p0: endpoint {
+							remote-endpoint = <&ss_typec_p0>;
+						};
+					};
+				};
+				ccg_typec_con1: connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB-C";
+					data-role = "dual";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						hs_ucsi_ccg_p1: endpoint {
+							remote-endpoint = <&hs_typec_p1>;
+						};
+					};
+					port@1 {
+						reg = <1>;
+						ss_ucsi_ccg_p1: endpoint {
+							remote-endpoint = <&ss_typec_p1>;
+						};
+					};
+				};
+			};
+		};
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 0170bfa8a467..27635d459e4c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -942,6 +942,174 @@ hda@3510000 {
 			status = "disabled";
 		};
 
+		xusb_padctl: padctl@3520000 {
+			compatible = "nvidia,tegra234-xusb-padctl";
+			reg = <0x03520000 0x20000>,
+			      <0x03540000 0x10000>;
+			reg-names = "padctl", "ao";
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&bpmp TEGRA234_RESET_XUSB_PADCTL>;
+			reset-names = "padctl";
+
+			status = "disabled";
+
+			pads {
+				usb2 {
+					clocks = <&bpmp TEGRA234_CLK_USB2_TRK>;
+					clock-names = "trk";
+
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					status = "disabled";
+				};
+
+				usb2-1 {
+					status = "disabled";
+				};
+
+				usb2-2 {
+					status = "disabled";
+				};
+
+				usb2-3 {
+					status = "disabled";
+				};
+
+				usb3-0 {
+					status = "disabled";
+				};
+
+				usb3-1 {
+					status = "disabled";
+				};
+
+				usb3-2 {
+					status = "disabled";
+				};
+
+				usb3-3 {
+					status = "disabled";
+				};
+			};
+		};
+
+		usb@3550000 {
+			compatible = "nvidia,tegra234-xudc";
+			reg = <0x03550000 0x8000>,
+			      <0x03558000 0x8000>;
+			reg-names = "base", "fpci";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_DEV>,
+				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_FS>;
+			clock-names = "dev", "ss", "ss_src", "fs_src";
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVR &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_DEV>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBB>,
+					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "dev", "ss";
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		usb@3610000 {
+			compatible = "nvidia,tegra234-xusb";
+			reg = <0x03610000 0x40000>,
+			      <0x03600000 0x10000>,
+			      <0x03650000 0x10000>;
+			reg-names = "hcd", "fpci", "bar2";
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
+				 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
+				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA234_CLK_XUSB_SS>,
+				 <&bpmp TEGRA234_CLK_CLK_M>,
+				 <&bpmp TEGRA234_CLK_XUSB_FS>,
+				 <&bpmp TEGRA234_CLK_UTMIP_PLL>,
+				 <&bpmp TEGRA234_CLK_CLK_M>,
+				 <&bpmp TEGRA234_CLK_PLLE>;
+			clock-names = "xusb_host", "xusb_falcon_src",
+				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+				      "xusb_fs_src", "pll_u_480m", "clk_m",
+				      "pll_e";
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
+
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
+					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "xusb_host", "xusb_ss";
+
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		fuse@3810000 {
 			compatible = "nvidia,tegra234-efuse";
 			reg = <0x03810000 0x10000>;
@@ -1470,6 +1638,8 @@ gen2_i2c: i2c@c240000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0xc240000 0x100>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C2
-- 
2.25.1

