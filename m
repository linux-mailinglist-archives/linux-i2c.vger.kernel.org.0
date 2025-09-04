Return-Path: <linux-i2c+bounces-12662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C6AB44362
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E181CC368D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E1433A03C;
	Thu,  4 Sep 2025 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gq/d+ta1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99E338F41
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004027; cv=none; b=dIBKh7q1XtInKZG+8hM9FZgZgVo1RG4+JEN9QiGf2HMK8nAgxAo7IWOPEKKh0//w80zzVHoH9stdustthzoyncCwQvDO6trknm853Zoc+gkzq7vAvI9dlkZpdfukdxq99sQ9sfckCyR3HLmxnSk9+LF6fTSAeWvjLHNbCW00qE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004027; c=relaxed/simple;
	bh=7mhTBB4svXSgzedxS2sKUinK/GsrJ13ZbXexdU6hXAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWVyKO1aFa/kxFyuZKVCyp+oCGbSlsy2g02J7sBbqwKvM/lt9dqjEKiFguuAUWkg3G/Bp8+FlvlCq4lP8c9x8av7C0eQ39ZLH0y74eZHCaRV4IraG8ZTtwchSAk6jKi85U1zXntpjSG5qz29Co8hDaAD7eBTTZzUvvxOcLCcyHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gq/d+ta1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XJOm008316
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLLFa1vgqgzhTWyXHQNG3xljguUOpM2dwOXSKlCIgOw=; b=Gq/d+ta1LGKa7X8f
	xgVG/lmshqku4IWctLWgQh1eVSo2aOK9Ho/jqc576HSFFWNr0GUH4sW/Zs7DCc62
	5UTMgDyqPITIv88aCIGv3SgJvwFcY1J0/Wbhe2BjQ8Zh4wBlQnbu2gsoi79YvGEx
	Gi8fP6ey9zkb4WahA+fg+ClaWtBYs3fR5DbkD2hp3CZBcadmGBi3HsU/CJsFsrz5
	1r/LRLFnqiJZaNXiOSLlLRuFt2DGnnjvbeEgipNkTWMXVP1Ng1HwgmJjMoiqOdNx
	zt4DdpqdADu6GUIIsYduTIBlJAhnY5zlnvDT8O/H6LyWXtDpmbIWfRK54K3lDB19
	BN3OtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjr5sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e55665b05so1098690b3a.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004023; x=1757608823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLLFa1vgqgzhTWyXHQNG3xljguUOpM2dwOXSKlCIgOw=;
        b=TGQh/4Sucdv8tNBI3iAIPXfzIlCTs3mweISjX6YIdo+AygS8nC+OEmf/OdPrDc5CpW
         ifcld+2TclcuX6RTz+ocHEI5pmE7xVcSdFZNL3/hD1UvMnA8F7J+ZpPSlGgKsLyPCeFy
         5ID9WcfBsJs0C4QOCH5ozaOVyGUy+hcuebN8kQMJPQzASXFTssqpWrgy+X/aGLBOpnhp
         g/HTNrkQ+Nn3MA+8zYPW0B8t5h0lIF2bnl00KLAR9fsSSmSXZ006uOUUDf+K4bELu7rv
         0U0Csg9+JPV30GjHz4Q+u97GqsRtuCem5ZSIgxmJZxLl7wxheENR3hmRxVNI5a+7bF64
         ztNg==
X-Forwarded-Encrypted: i=1; AJvYcCUWlbpTHYrL8nL7Mldrpv5JHaGJc7WKaBXKqsHAzfW9fa40IB2qN86ddzAAih3eGRIYZ3+I42MTcck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXcxoP3bA7/ZbkYwPwRdOV9Ts8GK6mnuv6r5ss3VkmtwnnEDu
	Mp7LOIi/e4v+La0Sm6bhCHv2rs3GZWNeAbUUlZ0MLVE6fPNNXjymx3mGASAA37qORKUtFG2kLIN
	W4Wbtsuaz/2RnDHVfzixuVFKtOHzZ67Csx/gIGgldjysKlb3L2DOMhfg2FPI4MQvNoiq1CPI=
X-Gm-Gg: ASbGncub7zh7H6d9xSoAmUBVBEC3VSLuBPLZsw/0fT81pKBanGvbjJWmTGbh5u1B3ky
	0klsqmtCR0aafIrsEtdHdxvqDGN8W4JzEXFdj8WKHiHjD3bkMYetUtDb67hrgKuvbeO7WAqvei1
	UaOgcMk1xkgGNoYeI8akQxTd44EAdI7QthsZYHEDYH0rQBPvPHKZd7W6DnZITWcWBiBzrXSvAlP
	NjaMEQdbAmH2YyP+rOFlcbLZvWDl0BCMAY2i/iR4BgrlTWHvOep/DwLK2uCHPhjKEsNiUlFnvNw
	HcCcmqCsUSnlYS200yad+fDAZz/SEE0VXl3Hlu+aZlWxsxqOkSxAfgFJswQLYZSo5SKR
X-Received: by 2002:a05:6a21:6daa:b0:243:95c4:e681 with SMTP id adf61e73a8af0-243d6dd5ab3mr28357435637.2.1757004023345;
        Thu, 04 Sep 2025 09:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuNo1sZ5orbQxvhguCAh0osRzXm3m+81fnaQsPma3tdpJgpVRtibJ9Oeu8EQ6S/Y+S0RnwVA==
X-Received: by 2002:a05:6a21:6daa:b0:243:95c4:e681 with SMTP id adf61e73a8af0-243d6dd5ab3mr28357385637.2.1757004022822;
        Thu, 04 Sep 2025 09:40:22 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:22 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:08 +0530
Subject: [PATCH v3 12/14] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-12-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=3602;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=bKUautJj8bbERUSto/29GMUNDvM8H52kZaOY4JPKqO8=;
 b=Lfmp9xIvwkHZb/i/QoksB+5bNmIUT/8hdNBJ0Yl7G9Wbyagc52ldUwgblEf9DbYHLrbrLa0MN
 tmDM7D1ppkcBpVZylKyQ9RnoWM5xls/VyFtLh8/MSBRpBIDUVbnxCYn
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b9c0f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9fAREOgmFqbMQRINBLEFflh3K8k7e5Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX7p8kjB5mgGyf
 KI5br6p1ffizJ5jqlVdpNBj1zxnollA5eis0V23/dvwXOF6vvZotW/2085EwMMEOzlhjcWPJKy2
 Z1sbGxoteTN+da+pbFaEWzHULOn7dOzjoCI0kHtwYySxZDGRZyPf5Ii9VSd07Dlve1bACx+4MeA
 8Klv3aowKIC4kqB3A4FOI4DLAHX7el1XlwHZQG+5GnZxoo7aj07z17V7PfGfI2ftiIjKXBJSzDV
 +6ucSiZhCpvFZwDeZ+Ii75VAAYx3Iq8niFR+oXiqpHro/nFrZnHLyL60Zj1zxtUb7ud9QyPVT9w
 neOxRiXVWA9MltIhWvpKzXLW8UwMIflO8ypC+QRO9dqv9anpiFD9NzS1C9XomRX1yP+72TsHC10
 w17HA5/9
X-Proofpoint-ORIG-GUID: 9fAREOgmFqbMQRINBLEFflh3K8k7e5Mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>

Enable the QCA8081 2.5G Ethernet PHY on port 0. Add MDC and MDIO pin
functions for ethernet0, and enable the internal SGMII/SerDes PHY node.
Additionally, support fetching the MAC address from EEPROM via an nvmem
cell.

Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 7a85ba044ed4..9abdc8c9f2e9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -16,6 +16,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
@@ -300,6 +301,94 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -352,6 +441,10 @@ nvmem-layout {
 			compatible = "fixed-layout";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
 		};
 	};
 };
@@ -499,11 +592,33 @@ &sdhc {
 	status = "okay";
 };
 
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";

-- 
2.51.0


