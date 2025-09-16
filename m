Return-Path: <linux-i2c+bounces-12988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED00B59B50
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9977E16AF22
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EED221DA5;
	Tue, 16 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kryeaJq+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7C3568FE
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034817; cv=none; b=hlQcQDZAm1p4BOMf97gNZjd3/thjn6g4oK9hSsQUZu75PG1y4ZFpbDMHb6cMh8CAWtveFoUtXB3Cpo6TfBsteV5NBabUkstJiO0tcW8fdySiWyjw9NhOnQ5m52vNv8DxQ5xFy4Eq77s+eH+2MTd56RaRVnMKNjW8E44aqCXJyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034817; c=relaxed/simple;
	bh=gW0bPo3OkmUFna1ZDaJHjlE8SmA8Fb3vkmArQbP1lQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4YsQXSSvELhgneuR/Po6AznySeymGnna/2Zu1O1qhKhmVNsu3ORo4s8iMSWPEF2CNS8VUAT2JQ4RptL60HrGaKdb7XCq03xm0WQzyaoVozlmz8MjmrxZ8/RIEBUZQZwrUpn//nIEkSBDcF0hSO9mETN1/QIifxazYngE5ZXqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kryeaJq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA9hBs004797
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfmoJCJYMW/3EkyXGndpmyfnXojx9Z+R8xHTgwqc19U=; b=kryeaJq+CAVPVeZs
	5Mnk4BSWozSGC/kzOElFYesnzCnpGRIbdLR1drPh2k8Tg9YzhMPIx5/vJaYypNsn
	weaoHcuibn/K7klHYfbPQ8WxtvBWvcvaC40J9GnL1B1Sg7rRx2PbiqaXTlseyQOx
	fDX+KXRd19i3G1SBa5IrK11qK6Vz8GnKCP/NSAilZySEcj/9yQ+EhK6/hSYW/ioX
	PXHlMW8olP2y+NtepNIJPUxVZO8CCnIZOGNk0zMPkOcgI5IRFhooXxHNvW5IXC/8
	Vg1uAfpbe/8krCOSV2d4jRrGaCt955ZEwb9iLcI0HLvJD+kQtpu5X7oOQF53vxmX
	oFphig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr9hsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24ae30bd2d0so52497105ad.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034805; x=1758639605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfmoJCJYMW/3EkyXGndpmyfnXojx9Z+R8xHTgwqc19U=;
        b=eg1CjBhEca3YqOsRLCWYplmna25ckBBum4YwCTonKwC5jzmvKbuyFGoJ1MEhHR9AU3
         MkDsfUpQCHMe8sb8egsYgSFwTofN1jciSZC9vzwXO70h4+ZAa8wku5UHkl2a07VLYNki
         ahqlniuvdi9YiPT2XEEnyL8XAbJj82rP0E7wO8IsXNzjxqnVaJ8XIiooaP71oYHUyCcM
         x9zXF70v9GMVYpVbNNvtNMmIVtBGWwLsqOsa0UCNszyTe4NpWpJtCETopqdRJee6lnIE
         Z+0bvPBXIzveTBgEhPW3cLXKyTpiTFtRQQZAtsXBs4t1/qSRlf9wgoz4ZsrnyXlrf0LY
         3exw==
X-Forwarded-Encrypted: i=1; AJvYcCXDvLskGIMz8grDVOkDeGFtAaKXuWANzpmfcx5gIEEv2jy1ipxKw/qCevMDcBJ5ePLEyU8UjrEmyvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LC1ftUSZLLC+pQH7VU08Rq6wn+8SVTh505uJtnnmGLWfDQCM
	kUzIiiUapQWaJucwQgS43Rfg2L5mxCH72a12Luujjq0nZ4yKaFQxWJr/HT6+Tcye5//Awa4ehHo
	l64z27mCIQuL7TDYIpfNYPiM3icmBICb25VP6cIX2irHZuQCNwYuLY5SFP23uUJI=
X-Gm-Gg: ASbGncsAyTqo/MoY+U4WFmpvPCiskOByhNrt3OIivSbir7HdgCvb6c9+agyF9sdoY+r
	Gfck36hFGJ892KiBVK4BMm3cPZE7YKxSFcG02yzIBXbY+O2u6vHdbCmfSctKPSlFolvN0Mt5guc
	D+uU48pHDPVAtmIAYQ+nfK7Wsl6kqc2A+mWAbADO4ZqYU7O9fdW61Re0SQOPfO3BsHwRloa80+c
	PGNPnP/s0N3/sTRaJNq4U+Lya83B/qeJw7FPBGyqVJzD7hSGHAtbSnnmbVjUABtx1yCSqMsTtnq
	XrSo52bxTkvmT0/ddtcI4GJj34Z3MLM/8K2hYI2y/dMeYK1haCBgLc0psfOL2yFw1XvV
X-Received: by 2002:a17:903:2411:b0:267:d7f8:405d with SMTP id d9443c01a7336-267d7f84855mr29224535ad.10.1758034804853;
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5eMZ3RiMQThYk5LoeR9kX3JpRxyHtX+/pIEbsAA7FmX7mepRw7fJ9bUWKCBjk6kV7kbNZUw==
X-Received: by 2002:a17:903:2411:b0:267:d7f8:405d with SMTP id d9443c01a7336-267d7f84855mr29224045ad.10.1758034804410;
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:27 +0530
Subject: [PATCH v6 05/10] arm64: dts: qcom: lemans-evk: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-5-62e6a9018df4@oss.qualcomm.com>
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
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=2502;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=3WsuSGjjSbB/JTrN1dwDIFLbf/p0GZwKko6k8n3FmiI=;
 b=sUXfC3dIKKDaw9CiY4EJTvMsBLjNH0VUE/wTCuR3uY8De/EzQ3wzGaIcguY3uTR8iU+6KQKIg
 hA7Zcj65CgxCSmnYgSQg5Zy8MEqKbNZGHovLvxIGtEWXeSrnsvFH3ia
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: 9jQGlIFWLXmMVX488QLzD2wGS5E26BEo
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c97b7e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y_IpLqVBJp9He2uYrA4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX+K6r+tn6/4hF
 JAdtwZDJJLbM6n1v70YBaa9eFABoXODI6EH/enYee06Y5oXHKk2/prs/fJJHzCbAu4UeDwIZGg2
 VVm2cQOj2B3OQ6Wr7CtMVXtZOqVh6ny+nMlzf7HTik3Oss82Y2H2Xed17LOqal4wcdG5GKYcIpq
 tmWMeVJbmjVN+3oz/+TnMxds29LP31VLsvaLUcZztGwIFs0ecIr6o/v4Nv4D0M7yMkYYatH+Mnu
 QeO0ENPKx6F2LFIQyxGeo1SiW4z9q7QZLsE9eSjST8unrUNnWtIPoydy3Vfh43OEWRXkBkODoJ/
 B30OvHHTYrMkJQpXNZCEbtagZAE61JazLT5bjw+OjMMzLk5k0332/GisLgo3Cf1Qsi41mdPFXTK
 PcfXvAB1
X-Proofpoint-GUID: 9jQGlIFWLXmMVX488QLzD2wGS5E26BEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Enable PCIe0 and PCIe1 along with the respective phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 97428d9e3e41..99400ff12cfd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -431,6 +431,40 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -447,6 +481,54 @@ &sleep_clk {
 	clock-frequency = <32768>;
 };
 
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.51.0


