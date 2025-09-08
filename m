Return-Path: <linux-i2c+bounces-12750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B4B486A5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38A707AB3B9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB232EAB6D;
	Mon,  8 Sep 2025 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vh7gX1uH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5892F60AD
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319648; cv=none; b=TTwXu9rv82FeQtnDM4CoFe3c0HecQwbninqZBsjcLUOkxxY86fIY0D4XPxU3SkffG93TnTAHGJNpLnCLf1Vuqd4RYEN8uAnBi3KXgzEp3aVtSRBdL0PcjWw24p1Xvc4uDW/BWibeqMKRaUVTsp87cywLlBoqVVZjzRMnW+xwfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319648; c=relaxed/simple;
	bh=fDkqRvGyaFinSWWq2t1lwFf0RsUH7vJwveAVvT94bTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqrUT39VGT7oMm2Vpue/BOCH+x1Bpkt4iD+FSoczxI6/713hRfBMS2fcwrSKdFVz+R14Ks+FRSRfx2OXI/mrJ//DipLJ+JPwytfYn2pyV9e/9HzxQm/4DSI6cvId6d2qf632eFRROFwl3Zp3fg9mv1cSCRxVJrniDmWlwh8Gc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vh7gX1uH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Je12H009012
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=; b=Vh7gX1uHGHsRkzn1
	b/Ol4/6CO7pV5Hk1TR0+oZSxzugDzOxfMw34vo7LfGV8Bf5ahQYgn/K6SO47K2t/
	hVeJ0C6qeuQzqHyjX5YiiWtPHs62dh7Ehit+ziitdajP05F1uG2D7wK2itSkMQmF
	rbzvMyczqICbEwIBjNcRMPptOYVlmxuQ8fwdSGi+0wTmE89wlyIujLw9ia+4jyEd
	DrrlU5E7PIxGMjRuRtvH9V21tHtwBTOXyeqqnzxuAHfOTCcHtWYgGMu02+befD6U
	BwmZcYdUaGb9cCscW1/HtdCteRYlBbxb9Ydc0461DqBCkD053oJI91WFp9MBvMqp
	QAMs2Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a3p9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:20:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so8258840a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319645; x=1757924445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=;
        b=b2o0T2LgL+BaihfkSaTF43P9ohjgmLiUnPh5GFZk+3+hIdF5JzRLzREI4nOi3l+/7i
         lo6KygouBgOzwH7btkJe/2Wjoum0rmBRoj4XWVuoEQJRDlliFsxohOUwRlYnmVKOzRwJ
         Erj4toGeDz9mWf9u7qw0xsIiIaUNmoh2m8acD2+7+9JPeEaG7M8iT75+6p/5yl6ZrUHq
         qNBd3njHJCLjfL8SC2UDYaX4YXhGs9WttoV7BVcmZEdFUcjc0CIrWnQR5QzbzIFhs/SF
         ocSVtVLtlY03KaJJiahcdnMkndGuWd7YHe7jUVmAhb5ZCCmYa4w3ukHRvAwG1u0EYKRi
         RNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoxygphqMlx8BJml7iey0KWywHOZZhu7XUeMlj6GVaCKFAfWjuduk8I5qd0BRsO90xgr/LT2qWZwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLJw4cmvpJwXfWu1oIsgQVjU30APf5dCiEwBlwam63LvoZrOJ
	8D46OqYOre5t0nH+wbUo0ZlIdNgiTkJ7KwbSobL4NixKa8T7UR9CfEQyZDos95M8mxxN1RYQe7U
	vY+9sQRIajixtVgFL2d0Cx7kSDQ6t2t+8T5kvS4w4k7KquWzZERWj7jOVVoFpMI8=
X-Gm-Gg: ASbGncuw79kLqM/3xSoCF5UGi7MHdor5Xb+M8rUgn8BklMINX4g27Ny0lo/Ch3EwUqF
	k8BBmR9ApzJ9BJXyKrENUu0G3newhdo12KTk66+4jaU+Tf1cNCFVZoJCN3RTqa0t8lSsI5Z2Rbo
	kQC4NeotFZM9a+rHHDV6n9xtWCYg0mNoN3n2QQo4n/8uNT4lQMxgIdYw05YKSo1CYsR7CD9RKaK
	FgSothCBvG6gCbrhdLLCjVc5Xs1ub77WE8GBGKZ996PuIaK/DMzicFjf66mekxvvmrSQpy+4uZc
	F9oHYsG+sX9/sCPzCWclyJw2InpDCF+kXyY5tmS7aPjNzt8+SOfHw+NhDelGdECk8gc+
X-Received: by 2002:a17:902:ce89:b0:24d:4d8b:a17 with SMTP id d9443c01a7336-25173ea168amr120337775ad.56.1757319645163;
        Mon, 08 Sep 2025 01:20:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyrJ64S6TkX/uqN7sX7Hlo6iMbu/p9cB2j6aaDfYSffA3N9GPGAMWvlK+OfaMiJADqjo9qoQ==
X-Received: by 2002:a17:902:ce89:b0:24d:4d8b:a17 with SMTP id d9443c01a7336-25173ea168amr120337245ad.56.1757319644571;
        Mon, 08 Sep 2025 01:20:44 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:44 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:57 +0530
Subject: [PATCH v4 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
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
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=2445;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=AqtBG6UZAsfussB7MJK1QEtygnY7f30ULmObk2D0omU=;
 b=FraxAZzQHKYtGQJWuV+0g3smavzDaC8lFKGIFeDPv2fY/3rrs6srhIoM1kyTbGtBsYOs8XIrN
 xo9s9J/ky8YAkwz3lW9YUhfXSAdsuXNYufD7/Fr+xIv0g0smu0dMisZ
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be91de cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RIgN3AgQjrtB0c6oJ0UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: y1c3iv7pszUH8HrhYXyfU3zaUECNOLAr
X-Proofpoint-ORIG-GUID: y1c3iv7pszUH8HrhYXyfU3zaUECNOLAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX9UUlav4g8VAd
 XK6JLKulDJOi+MVbw8nu3HXZ8hwIf9vNu0yG+H/Lao8wL2/brlb/mPZDIhIcyLrAlc3ZxJcrugo
 Zbqf/YCQ9p0+rxIX6UUvZWgIldHCMUww5TaRglJD+aEugv3fZkZu1vUUbAggkxML7qOElmPbr96
 HmfzAVKzJMxDFXgEko7+Qsw+I4eG9PEsWNdRomXVfD8r0sB3YrDllau7S1RY9ruUQaZ88+M42NT
 bOQDKbPysh67+M8imvBsBbfYeOy3MduyGoEgdgUr2wPtefCuUEewUzRalQa0lBSX8EmbpeG+UBq
 OyMTalcsyxmDS3bD8fkOaaKawdW1MHvUsHdsyQjRGe+ZN8GjAl+KIKxQLkXYzaPtsGLLUHagMbG
 +BMviIBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Enable PCIe0 and PCIe1 along with the respective phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 30c3e5bead07..17ba3ee99494 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -379,6 +379,40 @@ &mdss0_dp1_phy {
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
@@ -395,6 +429,54 @@ &sleep_clk {
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
+			bias-pull-down;
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
+			bias-pull-down;
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


