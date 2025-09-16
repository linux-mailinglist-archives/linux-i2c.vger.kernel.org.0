Return-Path: <linux-i2c+bounces-12969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972BB59439
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46C324E2D99
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA76B305E10;
	Tue, 16 Sep 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfFCn4Zz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACB305E29
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019669; cv=none; b=spm96xF3i2ilrIbQ9W7EJ+3mO8DtD1BIOqFck9DdQrVvn2pRWx67x86MWiMNReu/BrC1tsT99Lt42lWNyJhHcbUXAcvvg9P3zuSnI1qdiR7uX64UI4IQTGbSX46cDl0+WksyASBQckYN/OTE8FW62mmYY81wOmLve/QfFRMfOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019669; c=relaxed/simple;
	bh=Xh3bCDxRPGdeUMg7ftYORU7Dc0rcHwejwIfGZEV/a1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6JB+8jo9USQ66f74HD3kWbQgdrB47+sZC9wr4qZugX0TUrfKwTXi7bHB5ducW6YRVrCU4L0vffMZz3L+P/wIk2ZU/MviJTc20NtOt/rLse6zZ+xSmpgjOEmHbkizlFfPHlkQ4IwPsS9m6ApewlvHTQ3GBENN+VvFWkJdlTcZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfFCn4Zz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA6CNl013393
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODqQ/K/dAfyPRXOmmZNlsOn5jkquIIDh1zp616ZCCw8=; b=DfFCn4ZzI/aPlBSy
	NIUEkWrOQ493AvFLqjo96+4cFQ7Kyoc8fBJr0K2BjMQFPkEq4th7CLFzN3A2jce+
	NaxMwYI0cEBIbBNuvV1SAZT7bTA7/AQtJGoH0hv6rBR589geAwoyvtMKn/cOl1Wy
	SoKFkF41ihmQaWL3RPkUyJYPECmMQSx1PlLS2EjrbyAQ8cpmTEDY4vCwc0J1buxo
	BxWkV2vU4G8CLm9anDGYPExp9Bd0V6W/EfWfBoZM0co4Fs8IPgoVj5wutl+NWI/Q
	DkiVnk3yQQPlBtBXoKxFskt9rS1YJwc+3EyUG2y1SNPZkWpOJyfD4Dlv7wT/FnVZ
	L0Ysbw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5aspnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:47:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54d1ae6fb3so1371387a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 03:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019665; x=1758624465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODqQ/K/dAfyPRXOmmZNlsOn5jkquIIDh1zp616ZCCw8=;
        b=uyi6/MGZy2XT6bnsMAb2vf7MDNbO/TKczc/fwUzcnd8cryycj4tCVuTZKuJqqgSbt0
         BzCwX4rC6L3k7wU7RKYtTRzvWkGr/TJX5nMHCDvHp78RdH6ImzKLKki/LpbLAb+ZVa24
         6yVrjHB3Lb/ugX8LPGpYoDsxskealzhrShisoTyaqqboeyhuXLtQY3x7pX6/vd0CcGem
         6LONrlobTC8w9gGxw0YO+gAza7KhT0ps0dUFlzKN44s10Ih56gApESxfmgb0PGDEQ9Y7
         3zESpHWDBdrl+MnOCPMIJXdllgt4NJ+bolvPm92N44/iahFEUor2m0jbhbG5eFLVfSn6
         kR3w==
X-Forwarded-Encrypted: i=1; AJvYcCVeNjtm3SbWkpEz8LSkUeVNt//7/5P8MO73m2caHYNiYG7DQmlsWIRkek/ZB4E4KuAItNa/o315D+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSYiIv8asX3t+aQnhHi8LpPvSnX/uxidg7VqwhRk7n8OPgBKe
	IhxTmOngJK8oEDvyj8/eAiyIq5HJwfo4M20T2gzgja9Qmg3VfzxusCjyazAypXmnwDhnQ0Z1GBp
	ZRIE5FXwqZGxYwKlTL1ri6QBCerR7Z9mE8yls5Z8SW+iCDfpdmnAlVrEzZl4x49w=
X-Gm-Gg: ASbGncu/HdcaTTwBHHtfQFqGkSL741zPImG9M4mKGXuC+dv2ewUfq5x2ehsvdXkQ2QI
	VKnCZwBS0FrGYocPJkfQUzBuV9MApe8VvgtpsOIBdmCoDVKmhOdm7Ga/+gSgOpWhA0vFtaSLrTu
	B7LMPDruB+lPfiWInTGsIoLzykFPJObbs6FAA85c+dH9grntkpkvMBwVNADBQ6a6TKoQ9h20xX0
	Fyeyzl13JIDYC7eoHoCP4NSrCwhLo8E/LFLSCcvVeo6aTBWWNPVd+k0gm0+4JyEJujlQdYp9+IC
	9HsyZoU//9W2V9pCp4V2NgIJ3ml+BcLIFhtK8b3Moi2eu04ojfH6xcC5YcfDME9quY/b
X-Received: by 2002:a17:903:3804:b0:25c:ae94:f49e with SMTP id d9443c01a7336-25d268649femr185579025ad.37.1758019665516;
        Tue, 16 Sep 2025 03:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE0fGMtJfLYMIEVM/pgumrWhRmlKjg0nqmbiYh0SPSOapIziq1XpGKk2RRaGMyMzlA8c++xg==
X-Received: by 2002:a17:903:3804:b0:25c:ae94:f49e with SMTP id d9443c01a7336-25d268649femr185578685ad.37.1758019665030;
        Tue, 16 Sep 2025 03:47:45 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:44 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:56 +0530
Subject: [PATCH v5 08/10] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-8-53d7d206669d@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=2173;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=DQii6EbbvglNpSD+FTgSUwcIcTsfuxbUAV8xpnYrhRE=;
 b=YcdxLv8Jxf5tw1xDuKv+Gv+kgAh9vtH5chpvn8bb5L5rb/KxA1L0De5TH9AERkBzj3ER0pVKu
 MtudbAK1kIpA7BAiqaB3wZJfpHazpoJ8aFKkBfV6cENd7RUNiEeRUA6
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: rV8eidhp7OS3Q27b7BWyhI5uWoTNzTyw
X-Proofpoint-ORIG-GUID: rV8eidhp7OS3Q27b7BWyhI5uWoTNzTyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX4RvDrek0ArA4
 tBYWYgTdq7dSm988RzyOVOh7N+JoT+TOR1K81Ogi/fs/uWBS6vmvoVKKeHrobeSzZF8rEuvWgZI
 YX04apP71CSsJDTichchU+NbUbSLjrsHVLkc4aUsCuThOdMbfXPm0KVUB0g0aAuHHLOl8BLKJz0
 wB7BwIXtPPPqMa57B9enPFBNo2HSeQUThWl0vbR/do5zhIXG+U1si+LLSJuvQ7UoTCOfkuwPOsI
 S1C6n/wMYKvVOCMD5wpoTqkWwwlHcA6dpTBQ/jaIgGPHLfdrPin5jBSKq43PvwpIMuOyV9IOnNU
 nmXDvVcddVG6GsNmCdQe+2AadU6VIxu4cIQfKFDot4g+prJ5ujPYFDFFTprnwL3bKgtcb+0wwcW
 pX7ks9oW
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c94052 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Nk2SLWWF8xhsZ517u1EA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable the first USB controller in device mode on the Lemans EVK
board and configure the associated LDO regulators to power
the PHYs accordingly.

The USB port is a Type-C port controlled by HD3SS3320 port controller.
The role switch notifications would need to be routed to glue driver by
adding an appropriate usb-c-connector node in DT. However in the design,
the vbus supply that is to be provided to connected peripherals when
port is configured as an DFP, is controlled by a GPIO.

There is also one ID line going from Port controller chip to GPIO-50 of
the SoC. As per the datasheet of HD3SS3320:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
pin low. This is done to enforce Type-C requirement that VBUS must be
at VSafe0V before re-enabling VBUS."

The current HD3SS3220 driver doesn't have this functionality present. So,
putting the first USB controller in device mode for now. Once the vbus
control based on ID pin is implemented in hd3ss3220.c, the
usb-c-connector will be implemented and dr mode would be made OTG.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 5e720074d48f..3a0376f399e0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -590,6 +590,29 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };

-- 
2.51.0


