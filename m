Return-Path: <linux-i2c+bounces-12993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BCB59B65
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA99F5809D8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19FE369348;
	Tue, 16 Sep 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYXPikbr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB381369322
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034837; cv=none; b=NlujURcU+8xhvBr6etq6oa24CPistubeMQ9Iv6CZxkPMXAR+VmJhMd4/0KquL7rx8MlwUj5vAJGjyG3ZDjHiGnesne5vOKUzbtxxi7wO1qEYLBDn/Dbl2aMiuSzFY8kzn6Bx1mZmXlVhALb3cCGNU0pKMc381v4aOOdXMPTYyaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034837; c=relaxed/simple;
	bh=EVxv7pTuTXtbJBbTq1cFIyCcb5+PnMhD77kH76TEvKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcQwiUTgj8esNNE2S4ILAdjCorBgGNbVRMHn98GsATTgjJraWV0akn7n1/9c9xc3XmsEIT3YAyV30Vv6X2Nmsr6QqFou7hYOhl0avo5GJ8T6WmOtZMAXMJ99yj5vy3KOqRtD/gsxlZT6YBRo1v7gcy8cy5OKRXrlyHgObMq7N3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYXPikbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GEGICL007118
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=; b=RYXPikbrLDGlEhvD
	aVn9+vYOfZluHjfcYh7dop1N5HQXItlx7J6vIlux9taW3Ksr0o0IFBiwPtp04y8z
	XdzMId+eKnYMG3w4fG5L9BkgFmq2ieC+YdcZsXVbqKDx2+pPxfgBULQ/Kci7hPSJ
	5bKX6JulQfDINT3Pc0jSZ2wbjUOGdIjDiLGwoy6VmFP0tZiMTvJSwf0uNjrUyqns
	0t8ftDLBb4VB4SC6OmsNgZeIXnAyrW/5t6G4x3aPLOl2ShEx+stZ8LbIru2iK39d
	fRDf+wQ7W2CIfRQyvDzH5ple0UZIdf69lHFubwY8M+020xOX74m6pK/6R2UJDojP
	7eCBEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma986c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2649a245f3fso21148345ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034832; x=1758639632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=;
        b=eFD+coUyY3ALvWV++2EP5qOOjBKPi3LVa9dAa5wnjbXrmyK5QqYpuz6Xo+pPTpS+KI
         P0LJGP5LK+a1ybbKtpX+gpFsGrxD1NlnsZj8N0tyTFkOBttkuC04H31MW/b05IcIV8aS
         7j3A6lKTScyGgFuC5RlINmkSTRdZzOtxAgB9cQx3CyTUO7hCvG4u0vHqyxcVDJAzRsfd
         XHlp3xNh5rqD8n9CjfR3fi3X0rCLYfe3202kU2tPvgD7jm4pdgfTz7RcsbR2/5ezuMWQ
         Wfaqs/3hAfkRilLwGFpFWhilV7YoNqzTd19rjPFpj0m/xU0AyrwmIFjLzjhR4W8jPXE8
         xZLw==
X-Forwarded-Encrypted: i=1; AJvYcCUZqY9UBjjJB1UfD+yF5PkMqGfyTv/XoMgiPshN47aVCSULMUDgxJAr5UVk391RjWo5qnyYAKE4Jgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIo/MzIzSJ64jLZ1GYbmwVh7NI2zOobRhKBbsDr5fgmYkbwuEY
	SExnjTCoIQeyUNA//g6Lki12uEGhmsBivilxAExYnsxrVLO+aOgdoBEiSvmo6ewRWvBtL1L4m0q
	WcA9mio1TRP1F/vEuqsHRAi86Lu9qIPJC2HLE3Kq8d0w0Xg8Uumz+W7R1z9yXq8E=
X-Gm-Gg: ASbGncsaINXFMNzffb9hDarVepr7ArKFTQ4Al4YuevaYd8DZ2QXl9Q3A2dLIpVtKWeV
	hqc3RaVugkqN9jeKPUgJ72LxgrbLMycBBK09u4SF/9dhs9MdkywEtNgXGhPhfWaKsVnDTzArq7B
	1BX46ucfmsKNErBjwqsFiUoqt3JMB32tNZ0TmnfppNcghYxJBnoZwjV6koeGGWQfH1h4d7r5J0Z
	MIhYYsy5rR4p/eUvcQNyJ/YXjTQG6OykkMkszTtGz+qQkhdxLLSt3FBxcG8IsoIQuXp+ZzhAmiJ
	7Xv9qfUkFf9JgYI7g0ppRKncBV9d4q/vQ81eNV8/57IJJl0+o8FZVduItVPUGrWBldC1
X-Received: by 2002:a17:903:2451:b0:267:b697:4ea with SMTP id d9443c01a7336-267b69714demr78103055ad.54.1758034832019;
        Tue, 16 Sep 2025 08:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPBKc4oG1+F9yCdpRJby4Lh3p3lSPbZUVoBQDNJrpw1NiMFGEm/RzOKKvH0qJ3DfP5gn/i5w==
X-Received: by 2002:a17:903:2451:b0:267:b697:4ea with SMTP id d9443c01a7336-267b69714demr78101405ad.54.1758034831075;
        Tue, 16 Sep 2025 08:00:31 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:30 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:32 +0530
Subject: [PATCH v6 10/10] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-10-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=d0901W5oS2IB+UAGgSU2EHYZ0jt+yeCd47Ja4xYspro=;
 b=ypJXIiKLDhluYwEsejhys+yKyfuxi1sg+qQaO1HJXdGZ4WTiJYwLq4HfkEfkd5s4xzJmLRF21
 UODc1p62681BMPylr/ac7aKK2O4W6/rrLTzhx/ct6Z0igfDR2CJ1oM1
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX8apLNfcs13pd
 QMnyVeG4Mswp4MnQ+OTXvlA6OORSN687fbiQa3FFMQV9OnDzUdzCEIoh0OK009FQ/6Q2TMhUvTK
 Fh1MfHmnz2aZ6mcL72oPDVwiKfbOm+Di2x/RQLCMjyHK3rZffb17lVrrD4vD8pLGOYd6pr6z+AB
 PFVtBQaOZ7mJrUo+hd9pGOGW/JQJw305uonJK+xkMGohRFjQug47tWx6Kjbrt2WRqfWwRUGtDiU
 zig/HJH9haFjiXdUksgOLerX+XPHPrNAMNvMXkZiwZsX5kV8zXI4UN4Kg2NWH3RmDPsVkllpZ4u
 X2X/5xZrIEz/LCSDAnfGzfaBuTubN1EJabI78ZaNwyp9G6+fRT/aP8oliWF2jW7d31bMVeBoL9Z
 v67yzwnf
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c97b91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mmPTmQ-DpKkoTenKKc7I7gj4FhbsSoVT
X-Proofpoint-GUID: mmPTmQ-DpKkoTenKKc7I7gj4FhbsSoVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

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


