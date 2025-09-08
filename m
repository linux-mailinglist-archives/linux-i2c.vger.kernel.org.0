Return-Path: <linux-i2c+bounces-12755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F07B486CC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9933C3EBE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE092FC028;
	Mon,  8 Sep 2025 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghv8pI1J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3212FC012
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319673; cv=none; b=OGoX0mUpKeXPUtTSSa+Hh8FYkJ2w6qUdPPPi9BpB0+ndaEjyBWRmr0pmnKoGssSbpuKXgc5ZGAPK4x07q0nrCsvT32RndKQXm+x6AlxCrj0/K3388Uh1fitraHBDXnOQ4/hzz+345ZLBmP2EeunqdrkOiOsrcP8JtMBizGXHfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319673; c=relaxed/simple;
	bh=ynWWfmuOZH738K5h1hVDK+fLyCGdjyFsLL3ly6nUHqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoSgmgh76KE1GuJDBFC7rK4ePrXvKqeY7BINkcczQn7h3NX/L5Ix5cB48J9iDhvVzHUQfXVDXAuT8oMc9CUNA6qLK1rTxI5k125yzAxEZRJ6sQGKB+yx28LM0Vm1jDtxtF99A+nIc1WLfADh1jT/w3OWWO1Mz8rFhcaTGWacaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghv8pI1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fKO4004725
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUehLoxPYFguIke0YZr7WflOvoeqoE8uy3ntTtXR3EY=; b=Ghv8pI1J01x6qXlw
	EDFuRbumT1PoHo+5KtQGm86gkFXXo66O9ee6HrQNcwLjLIaVUU1v1lEdZeLDNU9M
	b7vCz2hsWH573BT+aBipWZYL3e1WccaB+kOyRitLKR0pT6Qk422BG4M6F+QsLha1
	pVFwVmmVPsiVdmiTCljagLT3vMbWSG2lEPPeObUDOucaYgfwpNPv61qLjnUAYvr8
	neR2DO2tu6asW5qJBHLVw9Biy49s6UDyvnaJFDwwRSEpXMHhOMei5a0p3kuLV6Fy
	r2NY5BwpYEL4EigavpcrkqZuBpoajtCITuwJN3r/BhS1scKN45ewzrFtg//nbObx
	3reN9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r962-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:21:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582bc5e4so50252115ad.2
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319671; x=1757924471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUehLoxPYFguIke0YZr7WflOvoeqoE8uy3ntTtXR3EY=;
        b=efHOXVMCSEiTeF01UlAIlGe/FwTzzhz03Hoc5FsidRwTCUwpLan0pPo3s+0AEg/4jv
         ljxAx+aWP6A8Q4gvf41/vYpaQTsilJ48I9YSa4vfv0BDYiHPqzgwVZ3ARZEJVFpflsze
         m41nMJ/GpPZW/+QZVKvr9XQORqNR9rNumdeASFIG6kZMKIuRopp/sPsw74cp2k0gYkkc
         YH4FPP+3WiRyvyk9lYzC0rCwgRuDqSMuCaTiLocOjaFAvUpQACGhD8v/Wv8q9/iK0ejk
         2kiszsztzLriqhXhwcsHXNdtS+3cog85CT9if0yBePnQL1m8RtEHCHSV56GLCcU5V2EP
         hOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOJccYhbtFK0SEhmT7KhPWo6lIOLh4W9BWKzIZTiHIWEYTWKAfF+QVQBNMs889qgFzuJbtscNuLDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAqSjtGQPOLCxrgdk5FMDIsy3rhgLNDty+zhBbtjydtW5PRIYO
	jbn8LZnPOlFBJl7F/l1zYrYpsVcKGlSyC9bRJR01FDbI5wnJYRzZDck2IeLoyijFc4tYpmR/0Zr
	B/wDzT0OzAkXTU/SEjWnxv/EiyDTQ58BSjVoYg7KWnj6lDYmJSUxS+GL9aQrjUxE=
X-Gm-Gg: ASbGncsSMYjYYG4QjjGNEHLz9hFBnogRMUtaNluoB4F6j08rH8LY1NPaXpJOwplkIGa
	727PvATA02tkLSWsUw0R5ybSHGjamepxeFdq4w5nqJbAsnxH1NXR3KvIlNoUk9R6vjJoppXtI+k
	RkQ7KxVQwsjYkJbfI6OX88Y7X9zLvI4bbgGUwrgRPi/SJWbUdg79RMiTLbs8THhfYLp4ARdrqS0
	GFRLr5LzSaIh/hD3L30ZWIZCOzdM+pLTYV9e4PXExMHRbxHYNvq3/8zF+7lDFGVu0z1TcYrQgT7
	K8Kz6jZrjbqRodASr+/pETZf/LU3VoAXgFmQbNURYnwO6TJbFNUfETBhxpGktgpR0ugu
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr90918775ad.29.1757319670786;
        Mon, 08 Sep 2025 01:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUtcSUkOkO+dTfuatcYwsPYrubU+qI8Lp/5D/7A6MAMWz8SmZSETwtGcwyZVbO8TqpPMEBRw==
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr90918415ad.29.1757319670296;
        Mon, 08 Sep 2025 01:21:10 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:09 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:02 +0530
Subject: [PATCH v4 12/14] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-12-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=T8ZZhZAuKSNtjHcghH+T9PxS/Yw/QtH5Z1v/0Byz0pg=;
 b=Me+SBvge5FuSQ1h8JklnOvj+EWfveHntHOtpm/71ellh1kiesdCWibSliFZA3LDIZIkIId9KS
 GCSUJXHdIjIDvfCH1de1UK++8Mbfu+gi1CF2V632Znhm1E0jw896p39
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: zsBWBwi2aT4MSnNptaXrkBQDgIBVGVcL
X-Proofpoint-GUID: zsBWBwi2aT4MSnNptaXrkBQDgIBVGVcL
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be91f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX28F9frmeRQFS
 zQkmMkGmvPT3IGruqFF+sRdgv6O17KCuh7785N3H694lELxfqCdv0SXsZLoZy7URpf4cDokI4us
 n6r7MYK4LFMwJIQICL5ygaXAxjjhzla7BcEjwPbgebXImsAv8HSsngCdD2Gy9oopX3vKTKjFj+u
 ILMnMhFtaml8LEx05+0xaixPxSIdWn6EhWCDlH/xYbLr0FPe0kaGngP+Emc3eZeLZlvePcPX7Cf
 WlViNULvHgKp6+eTG0EDfoAqs/8uT8k4I7B1nFL9AphxDJ+T7zXwwY+LvZgfh+t2+pKy4ED5WFB
 RoMnAvyL6KTJdewU807hHsMj5DSV7qQIjjP2vIHDVum7JZ6D5Txz/uKuA4GcVglLp+HTywUrZkH
 7m5JSQtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

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
index 60e365a13da3..3e91ac928fa5 100644
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
@@ -500,11 +593,33 @@ &sdhc {
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


