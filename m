Return-Path: <linux-i2c+bounces-12971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63AB59445
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E576C2A7D18
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139DA3090C4;
	Tue, 16 Sep 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DImXAdby"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215453081BB
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019680; cv=none; b=ILPvSRsrpEKUlEG5Z6gNW/nG8tjR8VOBYi5E7dU7EFi9IhqrIUtfsBLr7U8wvJA1FGaFotlSP2OoKdoO9A6lqNO7FM84/RG6rUid7phxhFoIiI17mSzfyBzMkPQXHSm5j0rdFUm1TbYi+8tuWnsJC7YqyjiBz6qJjIttILJvsY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019680; c=relaxed/simple;
	bh=EVxv7pTuTXtbJBbTq1cFIyCcb5+PnMhD77kH76TEvKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNZ2sr228sLFtuh2YjhmTLSb2YbKKr+c28SoncIvRSrAoSaO1uaahOH8TIYtG9hTgOqJ1ZjtRs1KwDP9MbJKvZRN2TbiJFcr7Gyug0z7cdh4iBrAO7reJIMLVNqpwOgHbHAxSqkCWHJPzwHtR3hQyfsymO2Qgl30kta8svdANGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DImXAdby; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA37Mv014090
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=; b=DImXAdby+60nerr4
	Dzmp+kxlH5hu7V/UUx7cNOaGy4IpVMbvDPpX6nLvLVBRuTqpMdj7KtzLFF20lKe1
	h8jdrKqgHs43vf70Duy77C/ZC3FDGSwkK9bR7ayq4d1GA6WaKVAWk+lvKJtAYc2J
	KEB/qPMpzZzVtRdwwDPj1VqIiXMVx5IOSp/rQS3wKhWtoLtwksIYvBlgyXDF3bYE
	F22adXU3/lQQAG/m1uiA8nLHx+M6/A1ZGkLaqvdF4TPZWE4xgwoXa1v8HZbCqpRF
	BTa3mbsLRK7vzbCaGnECQUPYuI8xFIrK+pm0aSTYdDoLjCX5dkFgQ3F/40z8/0RC
	d2BEtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5asppc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25d7c72e163so81527265ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 03:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019676; x=1758624476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=;
        b=WKmRQ/m1UMhIpRk/CpTB/OR65DnMUdpbeoWulCO9RmbI3RiUYt6gHY7yVCyn7VeYM3
         wnpBlWWzsd9JxUD+wqDwJPBag9z0RifTbPSY0lkf5XRSLNOxiRTKvyzt360ExWnQ/AjI
         IF0YxsV8vR/6jF9umgAYQAcKA9u7ji/KpIp+WtzH9wAK9QNUixmUvNwlWJ7HC/Mj9cQB
         V/70XAPiz54sY2RaGG4CrwlseVH06c/x5wDOL3Pv1XrZyrHBVhPAi0Kf8YnHOML+G0Ua
         z1HDaZdoiamPfZ6nnSqoHv9VgFCEx5sV9x10EMStZPNXpI3agB8zinNutrVE6hdq9SE0
         DPEg==
X-Forwarded-Encrypted: i=1; AJvYcCUXYQ8JU+0S+UtD/MPyIaQEnNuNno5dg759LORukMjTh/rl54aCTsNQj2x9h1MWFq/ErrlH0ILM5+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfMmuhiZ+NqO5GT7Hq4N/B8kcH+TTvwZaDBdKQbCseL1q7DU4
	t1Akd6z3LH35x36ey7R7+0n+8pAh1aBcfeTXi8tqMLGGIQmiKujx/dCKj92MqUnZpM6Ai/Vhh5v
	WArJa31OyEKQ4NfJrWUla9SswguFzQHiHg20c2mvBPcDhI6G3tRwdIAu2IUrnTzc=
X-Gm-Gg: ASbGncs3q4GB53OzhVnqT1VliFwUo2D9bRSHz9YsQfBrSjtoe2xUCI6S2XX0tflfEoc
	iBt1Qt3k0MAUe2+J0EK3s46+gyzTMCM9VaWLVfOncssLjt9QYDLVUcHN8/hT+TLPO8tH0S6c1vc
	s81pyxMG6ftDn2xStGH1DFux4SkkBL+DUDQg+NaP6BAT0afwkgovEBLKvwf/TajY/sdvJtNQ0+Y
	vYy1eUt33uZ2Co9msx5jGOLjA9P93IRKuVh/dgS/HHprZybNN2nAUWNcEGM1m/r2ogOZtcUOEnC
	D7mP+YXnxipTYrzk8THeiBGyL1D70lEZKWji8D8j/TYz9axf/f9nSm/S/oMFJ0WV+SgB
X-Received: by 2002:a17:902:d2c2:b0:248:96af:51e with SMTP id d9443c01a7336-25d27d20531mr220848415ad.45.1758019675677;
        Tue, 16 Sep 2025 03:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhaMhuKnR3pAjBpv8t60tJ004Bz9yN6AtGwrZpjJVtA5m9XzDgoW9T0S6/ba9fgL6bzap8Ag==
X-Received: by 2002:a17:902:d2c2:b0:248:96af:51e with SMTP id d9443c01a7336-25d27d20531mr220847945ad.45.1758019675200;
        Tue, 16 Sep 2025 03:47:55 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:58 +0530
Subject: [PATCH v5 10/10] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-10-53d7d206669d@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=d0901W5oS2IB+UAGgSU2EHYZ0jt+yeCd47Ja4xYspro=;
 b=rvMKyY9l1x9ja3pS3CXgVRZG9ysWFnYa7CyFQpUDBx1Xank5T/Mc5hl5+Q+cC0Vj5HTIOF0R3
 kuFZqw2/MK9AoDamBj2yds0dWyb3VbObnvctRJl/8IsH3rpc0UXcQJC
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: iSTCeedf5TS6lbdKjDCVF4U5w7otk_-G
X-Proofpoint-ORIG-GUID: iSTCeedf5TS6lbdKjDCVF4U5w7otk_-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX8tNQJ5yODP7h
 OmRcbhL4Z2/sZSUZYUboo9BKYHFn7BN/ZybJzXpG5VYAQOhaZu5eKZxMPrQVvubbGSH/CN8jgqE
 wbOvd62K2qxCP7lVdsK3ae0wvCpCKvXZMsdi0O4fJ5xb++T13pWWSzbdvp6NgvlZfJfCQKMEZ0u
 u/zXGxz1yI/4rlKsTXAC9582etGbMFjoORAr/sSdl6/whct1D4a2LIy4vlfrYZjudHlLkxPqXgY
 QR6d57RmKx/AoqXm3HkvrcHf/A4XAgaRUZ+NoOW4yLNK4wA8ZFdhsjb+hUiCLDFpUAC0AqU5OaH
 BdBr/W1EpfpqvnbkYc8XGLCA7FOjgOWQTHZ2C1A6nxgydVe9+DSae1KA2Xe4SOn5wiBicwt5h27
 l5McBHHh
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c9405d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010

From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>

Enable the QCA8081 2.5G Ethernet PHY on port 0. Add MDC and MDIO pin
functions for ethernet0, and enable the internal SGMII/SerDes PHY node.
Additionally, support fetching the MAC address from EEPROM via an nvmem
cell.

Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0170da9362ae..d5dbcbd86171 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
@@ -352,6 +353,94 @@ vreg_l8e: ldo8 {
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
@@ -404,6 +493,10 @@ nvmem-layout {
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
@@ -552,11 +645,33 @@ &sdhc {
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


