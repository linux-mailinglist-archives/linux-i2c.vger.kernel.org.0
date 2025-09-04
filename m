Return-Path: <linux-i2c+bounces-12652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1EB4431B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764A217D739
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8112D30C620;
	Thu,  4 Sep 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLVbaUjf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8E3009D2
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003975; cv=none; b=qr8FFq39Q2wQeWueg5Lj/sVLvk78vKZ4tNCGa8jw068mIyKMNefQi1flBVROSY9I1MDbrhhBQu/GKZhp9mlNbgMEEHbIJaVnzewwKCr2H/FYBehxQPybzzsJqFfCTaV56b8EfV9WjlnCqvk1EBgi1TKRt2MkYCeZRCKHZKREKcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003975; c=relaxed/simple;
	bh=tnjwoYFOxB8Z3hS73lw33WNffBxGOTtiL39sgx1IMKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAM5Kle2w+X0t+ZvRBs4jilVmg80PQlRPslQBQ3sTqql20rqUakyoLJxHHhyGSKrM0bQr0EelyZBfvkemxoL6IB3AmRHA01cPywwAMvKZwks+VKhsG5imEJNXgOfVbpRtmTkVODkOkJELpnW8UAkGOk45nrupqCcXrT/075s8II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLVbaUjf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XHvg007841
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNhN2lvtb0HZlQVBeI4DEhPDS0dLO1GoNzry2xznyxw=; b=QLVbaUjfSoekQrRq
	ufUDrA7vp3Y9fL+b6xJ+LEs8jRjwdsKKI0lnvHX5w/k3bMi3K5bN9H8lM7uvZCcF
	6Nb1AbWho4SddLiAT+THLJ87tzQLo+EPQPnZmFNEuhuJrDz0Gxd2DyCCuJ1y8ubc
	TfJA9uCWp+9wN2tLeyfrFDjiKwcUMJ7BcUxuboPTFn1geTZDmSlE8/sVEAc29sW2
	DKUIit2V5I/OJ5OxyBuihBwXyc2k92x1ZZApCYnVNGdUcCArMivT5XgWk4JToIFN
	NuxcregA47mNlsBlIyH8AL9Nf9xBtn2bVuErhxQKzUqgbWmoZElREmolHl5zn1sT
	CK3jQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura903w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ce3e62946so5100115ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003971; x=1757608771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNhN2lvtb0HZlQVBeI4DEhPDS0dLO1GoNzry2xznyxw=;
        b=Y8KiU8Z8TuB7YbpwoBTstZ5skuWskr3/g52tmugPQIqq3AaPP7EjUw8YGJysdbu/bv
         uBLExr08qlj0GrushUPLxIkMxfCX4SixpmEKkMNEkyOEfoU2T+sMzBANoYMzFXaW9OCE
         dfp1fwHehz8hrPKCy1t9eBe8QQOCphskbYHTw0y4ox/VSOdNroVbwVOskHbTns6IoE0C
         Eb1uTm3vpmeW05YpX3vVXQjqGeW2Lke3D04TRmcot2Fy1LC4Yt1HvrcljgP9ZMjAQYiB
         bcqwW2LFNC9D397xo3fa1Jd7shhoWY/6qXNYBwtl6qSRWkH6xuKQaJlJTSGnz2rRub15
         K3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw5/nABGzJQfTUguo2xXAZ1mOjNcZM22qiPlB7Z4Lr3RlEpdZHL5Hdds1UaXKCWjPGPSkK9UyfRZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIjs9XSMsePkf0xYzs4TN+TFuoiIDiCC1sBufcQeYFygfW7IW
	0n+g/XDDVgQjZw7wtQFrTFlBZQob3jOuyBzSRdc1RpE1oLRQccNJi2867+iV8E0bRIFHXZhuxEt
	4VWjIgCMPCswtRx9JOhHD0mAE/9ZBNWRVghBoRtS1f56qZwJUyEMZ/5nEQUyArdemnrbr8U4=
X-Gm-Gg: ASbGncv2OAI7kak+m5i9KzGAXYl5vDeAk89qnXcPdAKNEomEYLE3CLfJ9qyPTUjzkBr
	IVxkcTY488HJlHw63NzyhBi2gfdtVKYrvFbU0qRUGl7NJdLOWZAGzjo33FzrazEkRhiNFBp3f7L
	iQdFi4/kJBgPwEQ/XmQs4HyGtyjrLkoRQt3Co44N44ukB3mBI3dpiwCfweFTFXH+7nR2jNV8dKh
	DMNMY4nSvggMdzz2NUa1a87g8Do6VA1EXShZMSzy8zY5csu5R4kstEnEdPwTyiHnWvY6UAa/zFl
	GndYkcYi4M2+VbUgZcsOpQsJAkL6i+c5BJwfRjnn/TTdqAaPfsNhdgXkzysBL1O9dKhI
X-Received: by 2002:a17:902:ce11:b0:249:2ba0:7f7f with SMTP id d9443c01a7336-2494486ec6amr248523055ad.9.1757003970994;
        Thu, 04 Sep 2025 09:39:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECVzts0UmlOqZ3zmzTeZl0b2myxnYG4xhwfjA8NKD4MvThRrDtNbTos8PH8v2GUOQazWFW4Q==
X-Received: by 2002:a17:902:ce11:b0:249:2ba0:7f7f with SMTP id d9443c01a7336-2494486ec6amr248522735ad.9.1757003970505;
        Thu, 04 Sep 2025 09:39:30 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:30 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:08:58 +0530
Subject: [PATCH v3 02/14] arm64: dts: qcom: lemans: Add SDHC controller and
 SDC pin configuration
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-2-8bbaac1f25e8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=3458;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=ABkLWC+KfeCB98/nh4FW4v5sUxC/yCussNpVQMtgYnw=;
 b=GYMHpQRGE6zo8AF3jPIe+vAVJ2R8wEHg5JhtgDSqbTu7gJ/qiN0+2piCyVHOpdlB37OuK/ZFs
 1BI73WHx+EdBxguAs6o2QvHNN0zK4lIY58U/97XJIOIKRXHUjn0G1a3
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: bhEyVftuXIRWmRAjrfxmflrgG44_dYNF
X-Proofpoint-GUID: bhEyVftuXIRWmRAjrfxmflrgG44_dYNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXyLatt7xgg/73
 3IeK2aQDZUGn+o1zTLiaIyaZpSTmFW7/hoky+vrHsl78BOuE46sorEW1bLDVc1rxA7EGwMApgtF
 ZwQ+Ir31s8eSgWxGGoG55ouCFonQvISbbwU2EroDAaEMfzlU9O05GuFp1/uTcO68eMwZ3If2HUy
 9XVpCuGxnp0j3gPrLHIrCyhpSGKjqkYd8ZqUORyQP0adKQrjwj7+RS3QhH67MIC5KTjjlGG4KBw
 CEtyF2mnGOgZML3L37a0xqQlH2s0hUiUWJBByFuaF0Ix4pEbs8kuhSgHFIC616xgMCVwmx9/S/x
 Sa0qVE/4b6OmRtcGXtio8n8sb2qX/uBSqJfvAi8ZgU5t9zr8S9qCJaVZ4QlNEpLTH6BRxbB9uEs
 EX72hFxU
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b9c0c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=X8p_deJK1ww8tEnDWQsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

From: Monish Chunara <quic_mchunara@quicinc.com>

Introduce the SDHC v5 controller node for the Lemans platform.
This controller supports either eMMC or SD-card, but only one
can be active at a time. SD-card is the preferred configuration
on Lemans targets, so describe this controller.

Define the SDC interface pins including clk, cmd, and data lines
to enable proper communication with the SDHC controller.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 93 ++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f5ec60086d60..a34f902c1358 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3834,6 +3834,59 @@ apss_tpdm2_out: endpoint {
 			};
 		};
 
+		sdhc: mmc@87c4000 {
+			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x087c4000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			iommus = <&apps_smmu 0x0 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+			operating-points-v2 = <&sdhc_opp_table>;
+			power-domains = <&rpmhpd SA8775P_CX>;
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			status = "disabled";
+
+			sdhc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1800000 400000>;
+					opp-avg-kBps = <100000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <390000 0>;
+				};
+			};
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -5643,6 +5696,46 @@ qup_uart21_rx: qup-uart21-rx-pins {
 					function = "qup3_se0";
 				};
 			};
+
+			sdc_default: sdc-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc_sleep: sdc-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		sram: sram@146d8000 {

-- 
2.51.0


