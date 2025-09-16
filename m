Return-Path: <linux-i2c+bounces-12992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF14B59B5F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 260C23A46CC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B2935FC15;
	Tue, 16 Sep 2025 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dn+F4eCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1D3680BD
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034835; cv=none; b=UZ03bbjJI28WuKtziqtA29adw2Gu6WkWFc9n7/b+lYDjv/SeKCkSVu+EEAEIO6sIrw2WQh81qPgmNhfHelSlHQ5WYnYlWvbnjgzMjngGm6UXTAd0RSkgNKMB3eK7x267KOCi9Wnw2aZ/3ex8PyT95uiQ49EuMn3ZFPebyOSecx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034835; c=relaxed/simple;
	bh=D+MI1yBSPD0wfaK64wdrIx16i0xhge1W8zq7BamNICI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjVLlW25C7DUvzB9E3T9jwqIIzBEo9R/gw9rojU9mR6w2mrro/XoV9O+gJdhQ0nCl3PSfpSdaUfsPcSO7KNdCw3+rUPP5O4E5X6m6eS+WiRZmy1IMzq6vSTeeUgjM2Z4o8NVHlCOfY7yEdlZ+BOz2if9jnvhmy6KSjYEG6+nex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dn+F4eCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA56ps005286
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2Wl9Ei/DIdqaCb3FT29b9bLmkPceZ9goQF1SjIPoN8=; b=Dn+F4eCw6jihG5yr
	pMwLMbSQkJ2EoH4uunNiOUHS7/ns8U/ttw0h0VsHsXDxIpJc05bxDMEWL/R7CQkV
	lAYGz3FWgwTmFasHMhppKtHrN+d6+bIcLoEMhrF8KcDNL4agkOa0BRVHjOja4d/j
	hXdUTU5rx3/6VjHUkEntJaopwOr5ITtV8BFfXVJANvBrl1bX1BzwMnaE6XXiZJTi
	QsdaGOqicNAIjSlTt2upu6MiAPdUIwiBKJn3ePeYvaREmcWMK5xg3n1hTUQNV9MI
	enn6G0oSDws+h2B3r6GmtTpPGKkAstpJNFzlKdGLdYb8FNQ06RCQjZj+Y0TvuIBl
	1wP+FA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4x3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25bdf8126ceso97521035ad.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034827; x=1758639627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2Wl9Ei/DIdqaCb3FT29b9bLmkPceZ9goQF1SjIPoN8=;
        b=vejgkkxyWBnWF6HiQuPRRIzDDH5CmbyYSDB0ixsxRinETkIaOeUQA5+G5ilbV9dISw
         TgrPtyQY6wRXLKYn5W8yAYZnbp8vhOqeJ5JHLEUxj+SpdSaOXw77cLZCPU+6SVkdLJ3o
         vm+repTp1AVy2DWRbx9FukxyC2cAotbPXLcHGWEpcROP4kTJAOenC1t+one/vZ55fA4+
         xVSFh0VEtPUv4OQQ/5K8UYE5u3mVXuS2kfk1j6s0s4uYT2sUALb/W7crtp60bwRY2i1+
         zXoxNGB+5N7IvmMWPV1sntRscephcUxKvP1D2x4Cf3kaCMK70yenZzd60rJj38Wxs3DL
         su5g==
X-Forwarded-Encrypted: i=1; AJvYcCV2sNbAOrD1Z9Kx/6VQ41XWV3nw8x8w2C3XznlvUmkuoYY/9g1d900bZAo3fkdGrOU3SStSPJSCZgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXKhXwkZYNrj/1qiKUgHIaWtmou+8wOh4cksINTFfwgF7Pu+f
	vUPwlrtqjRN0rmWFilL55mg4z8zQIEvS8aIchr+fG3FYV/61mY6BAx9TTOm8iDM+3G8MjFr9qo3
	87R7Jdu6Gc9kjVW2h9OT8jWA7UeyOknL+47iyquPAXA3ElGIRwwTCODbZyTHT0zlzGtwWzZM=
X-Gm-Gg: ASbGnctCmhmWeNs38WbsuCVwPo1lsSReTgcdJDreZlZ3FBsGu+Vy/CecECT6u6gizMd
	CWNZdk3klwVmVMeC0bC+NxGDKNmHVhMeIgvHR6Cr8PY4OAAAbJy+c9VP93K9WDjwooxOwk2yb8l
	Ytf8H9hFOnOVKkH7HGUa+4VTdxeDBnNVoc78QKR+VRZhNU0fPKOp+NKV7Wf+UckRQ9cLF2+2lVn
	jJG5dhzBmqSjWMO2op98KpjPvANCZPA7NL0S97CbFmPKTSuxN+ezPDP8XVTA3suDP4/O19TZCFP
	Ee3GzsEZcoRO2rsa+zp/O3vfXLqt/PyY1xjNOZ3xQbb/20gkOpudV6ZAOTT6tdTv5E2+
X-Received: by 2002:a17:903:240d:b0:267:ba92:4d3a with SMTP id d9443c01a7336-267ba924f53mr55751975ad.6.1758034826290;
        Tue, 16 Sep 2025 08:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzVwiO2rpg+4Oduh271gIE5EJgVxIPETHc/7YFjqcVMjYk69yT8M6FE0sDePh7YrEWkPJSxg==
X-Received: by 2002:a17:903:240d:b0:267:ba92:4d3a with SMTP id d9443c01a7336-267ba924f53mr55750955ad.6.1758034825496;
        Tue, 16 Sep 2025 08:00:25 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:25 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:31 +0530
Subject: [PATCH v6 09/10] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-9-62e6a9018df4@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=2151;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=wTUKv5iuUm44oYSXkoHnDdPei2RDohsGfjquUCYOO7w=;
 b=1NB1AhnzEB/9+2GIL0JUL6Q8Ie0ZvVJAQ//XKFFLSSQ4J0ZdEwVGBVLskYVRXlR8Q9J5Q/0YP
 nJfTAVZr+x1DdWQr7wl7aqjhYCYat5eQOrhBeh7tdXNL83zicUM8UKG
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 4PmfrW3MYTu9Km7jOhyQLNkirKAPdSAZ
X-Proofpoint-ORIG-GUID: 4PmfrW3MYTu9Km7jOhyQLNkirKAPdSAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfXyvzQcqkPe5y1
 WoZPU0n3Z4qoPhRw9tzefrVTFn+Y0vy9A8Ihu4H1MnJKbxCU0HRD5FL6CkRUn8hocYM6BSYVKyf
 b0mPozHShTtFSrFsC3nrlKggW7aaZ+MBpEUpI5iKps3dmwe1qGkSj3ldIxCEWb0qQdSz9WbBCUX
 +93WwFR2KVi11kTgQYhcgPi7jIC2RWw6fdMURsl9ZP52u+zV+3tQ/bABp9AKOu1IdsfQwnSzDUw
 O1xiJLI1OnPKQmxkdGNwnNjhSaMIo1jp0yCLlfPsGxN8lFbSSAHG+XqPZ4RJrsHw9Fwb2B5HC5i
 dbBabWO4ykpaBHNDLJD
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c97b8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZiJiVGjlRZjjTBZS6bkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509150087

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 3a0376f399e0..0170da9362ae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
 
@@ -98,6 +99,28 @@ platform {
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
@@ -513,6 +536,22 @@ &remoteproc_gpdsp1 {
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
+	bus-width = <4>;
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
@@ -563,6 +602,12 @@ wake-pins {
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


