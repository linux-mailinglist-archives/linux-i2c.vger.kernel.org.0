Return-Path: <linux-i2c+bounces-12661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218AB4435C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE925C13E7
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BB93375DA;
	Thu,  4 Sep 2025 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJ5F8iSD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CEB335BA5
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004022; cv=none; b=GapeEcJxu2XVRLU2jTYBs1jVtnwvPLyaSAUVKALdobcx43/f+AvXEebquJ4e+rkgNdsySdbB9b7wRjMy7EqTvAQ2tTpk2mJD3cZjqDlV57OVyTYn88XS2oXxtoFSfoAApomJ3YQz6MbnYwxmCAvbwZWbs7w+P1x5RJZhaNl2Yxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004022; c=relaxed/simple;
	bh=37H1xMtSIIFaomL+56Isf4j9FIno96UEZs0f3vwqssw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvNMVjKHKub6U32/McxD1GhMGoERuSwfLca/Q0zYeY5E4rhJYz13A4xNQEEXSZKmY5jRbE7r2wrzYGvszBrspwnGpCHJhwymmjY7H1maSPV/5EtCIlAkGR9HMZoMp6lUy9aljLbQ3HvyD8FFFMLoDLLXc8I2PBedJ2eyJ/n4Cu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJ5F8iSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XCQa031853
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pi8mfgHfMnKup1+xYHuBVu4AKpWd2gFfcTTKk7r1KGs=; b=GJ5F8iSDpX5t9FTB
	BKor2gvLEUtjRl7YxzFY9XVh1S0VE0c34M2BeWqyW7zKYwlWiLsxV5UEkkEgkIzg
	Er93+9k9KMTHPw7Kc50MOt/hnaD31xDahaJhBm0s1dO+kcOId1QNx0azZ/p0LoLR
	2kpS0J3A1xicXUG/xddyxcztRsZTR9Fa3NP0uGklnk0593Ctg9iMbqLIrBtPCWov
	KJfzmftI2NBiKwWm/zZl+00Cl6sUh/62E57kLpxgddnyYrF5zeaIvK73oj5KpWIA
	MvwiAgUKo1h8vi2uaXGHyjNddvAn0z1m1+ceTbc5GRLP16BdfXeeS/wt3Mz24vNZ
	5HXgCw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw088s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e55665b05so1098660b3a.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004018; x=1757608818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi8mfgHfMnKup1+xYHuBVu4AKpWd2gFfcTTKk7r1KGs=;
        b=KKFWlfUOdvAXVvTl7y/ydbaBzYM8gsB5cp/sjFNVy/mO9n1ahFJVJuYi2EaPFWJIPw
         chn4HQMXAP6VgkoihS0RcYWuCfbz7yy1GClGJgKhwxKD5IVuwkPK6okhigkGEagw7hUu
         HCYOiHI9fN0OobKGHxcQh20MACytlYJ3h4OTGCZ743UjyHovFS8N0ceD2n+0OJVPpeVO
         ozSZOFYxkZj+wH7ubdtFd8lUIrY9F4OGNtrSpJUVge8U/gEmiml+NZcLBa0SfRDAw5/O
         NII68OYYJThmULJqxmde/rtCqDmbTLgVXZcFtQzJKfxag3RasNGDkxQ4I2lu4hgaMHP0
         Kj2w==
X-Forwarded-Encrypted: i=1; AJvYcCVLgPptN2EM0wYrodOthXTZiZJnMPsqIN5hffUYRJOlcinICRlR+5t9pvU3G6eDX2V12Y3VAmCsfuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0EiRmJOr7vrHjfdFsdICStChDmwqNV7jaJ9ZjzVk4sd0a8lJ
	TdkE5UJWPxIsD8dkyoUykHYT4Yz8I8BeFRXf0tAtflDoIKmR1hPTKXfUgGm/T5Qj0xL+aqb12t7
	oE2XiEwOT2/a1ASG83xNmYfmjjBX3iICVa04tikzTgLePxNVooUDQV+++FD7xtxlxxIDCF04=
X-Gm-Gg: ASbGncuJfaJtytKTN4JvxANu1KHVYjWoVZTTGCzQyXM46pxWdMdcCtSIlTT82T4Phep
	Uf6N5msIpJ5HlMSmLDF8j54F9kJcZgy/PvZHbrZZulaWYPCay12Tif0JqhkH6EMHyRMOo0Pz7iO
	LPYBcDyjmDMzS2frWCyTgI+ADDRrCTvF1ORs1GzPFA7zDY2/VVePpnMKEQoLlxov1+EX3r+moBM
	1HJ+36AOXgCPmAxibvYKy1SmOR6HmIF2VIkPhuLlnGSya3rkIPIakoHdFizeT1a4qDssqw3Tk/4
	ico4FYjIYOo1xE2vQjxCaEb79PJR0rBdaNqBUFjlDDTRM8NpnQqF8YqvvPZHn2htn3eH
X-Received: by 2002:a05:6a20:1611:b0:24e:9d94:7b10 with SMTP id adf61e73a8af0-24e9d94816cmr247284637.51.1757004018381;
        Thu, 04 Sep 2025 09:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlzDoVe/ok6bgJxtH9oYRrIlnY9HX5pm5FSQGgaZcab7BxYMmeLwqre3zAaqeD/COLWeIl+w==
X-Received: by 2002:a05:6a20:1611:b0:24e:9d94:7b10 with SMTP id adf61e73a8af0-24e9d94816cmr247235637.51.1757004017868;
        Thu, 04 Sep 2025 09:40:17 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:16 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:07 +0530
Subject: [PATCH v3 11/14] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=2022;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=yUijNRhoZ6rLmjbWk0JNkSUbsDS+vVSGs2OkDCpSUoA=;
 b=VF5Y+giUrn7zCiKABQLHLV66iugc/RqwOrYs5ljNeevW6xirtb1lVNZdf+nmHztLAvSfsPBMh
 7s9LHG/3xGnD++W296n1i0MWvwNS1mqR8pmlQ9CdE7IoXWBFXNoTZBL
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: DQJ1Ugl9A2yN0MoxFkNA_8iJyQkUbpm5
X-Proofpoint-ORIG-GUID: DQJ1Ugl9A2yN0MoxFkNA_8iJyQkUbpm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXyAc11P51xSlN
 +7v2ed0Teu43v4s1axUFEKtJ3B0uP2P3sSLiPn2fuY1vDhQ+InZtijNqMifHH+Jx8YqL2vknQuT
 1WyDFMqEaTqqAnkqap4Qa05vD8XafdXskislmFMPuQ/Cq8NQdN1diJ3fCjUsiP/ry+O4W6pX5Nk
 6SV+RZA9kxHJJtypGSV5VrJLaNu6OVPWVEok8kRmv9qUF6Fmqv8ETcLPQGuY4sHZ7lZesdMWm44
 7J7CsdyLf5PzygymvIMa9QgjaMnyrS+EGjG+ddpHM7hBWPRBASaJ8aKKa+9RZnFBVRRDH4fEF1O
 n6tdCxV5l7ZgCYTGcDBpKfttPOWzyNkRjY5ZTBQKgB+gx8i5CO6EFz/1BvdNFoK+6jKJyHEDIzP
 3jN6rCoS
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9c0f3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5BVB-bh7LpO0klZGoUQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 6ec6f9ed1ec9..7a85ba044ed4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -16,6 +16,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
 
@@ -46,6 +47,28 @@ edp1_connector_in: endpoint {
 			};
 		};
 	};
+
+	vmmc_sdc: regulator-vmmc-sdc {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vmmc_sdc";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+	};
+
+	vreg_sdc: regulator-vreg-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +484,21 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
@@ -511,6 +549,12 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	sd_cd: sd-cd-state {
+		pins = "gpio36";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {

-- 
2.51.0


