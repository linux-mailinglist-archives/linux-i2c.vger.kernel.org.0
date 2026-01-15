Return-Path: <linux-i2c+bounces-15180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E7D23DDC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CC313021978
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795FD36164F;
	Thu, 15 Jan 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJSH0icB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjpcitDX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7530C360
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472011; cv=none; b=CrVkB67zPtVF78MpU813Tl04gBbG4fkE+/aJOq8t9MQ831qATHO05RWrskquBJSrLEg69C1AwMFD86S9DYMYfTa2FizMtUEilPKbbN0xoEbVJn+V/Qed9wQP73k8xcEzt4JIppQkVEIhsRDJijO1iXn+FgV9xIHXMi7MGa/vCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472011; c=relaxed/simple;
	bh=IAlQ9wjSqjHi2sXh9LPkom3twHwIndc2QkvvmikUsaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVCroA7IQ5LKtzwAoITPgzpJ5Izc3Osqv058rSPCGHpwbf8xIIQC8YGr9hD8VgYNvUvN3u7AYmVv4C/C+ZLwfDSw2O/6kZV4wk25Ud73MBJZn9NAWkot4RwjEyJ7gmC8HGV64iYlRJ+Wb8luq8OYJ0mb6d7PkvsOquuo6w/aymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJSH0icB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjpcitDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flQh1850921
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=; b=UJSH0icBZG4JWex9
	IT6fMWUNjjDkVEGAU3dtiD/+ldFsmwWkdcV0JJ9MwrhxGqgH8xWCq2D/cBCeWYM0
	N1JsBfpn3p3WOi1ITzoRHewgHFfDQCXxfSgWDJ3BbLWQpDHfvNy18E1V9+ZXHXkh
	aTKTkHv9PTuX2IUhEdFymJ6fz6ub21towKGOd63vJ2hkaYRMnWj2QsJw/dlDTMHx
	woNEOYYyZKWNpzQrv0cei9oE7d67Kk4sTKqff85V03j/GQciSjfcuH40P4rlAbbD
	C35xArHk0HTX3h/qxI1aRwgDmwHfi/EuKDVIfMQEa2IExqeay3jZOi+TNS0nu2T+
	PT2CIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890586c53e0so18585556d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472008; x=1769076808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=OjpcitDX9J7FKkhTT25gKqOUSMtDtuintEIvSunHttPWyDdtuUyJa0Nrwv7DnwJyO8
         jzuAxuPnXqoqg2VAzvBa+TV7VuDL2oLH0icikvNDd1rRokeqK0JpufTAfGUXXl17F/Ea
         /6eI3FYMZ8QvCpyMM9IrH2SIXi3RRox6EsLKjCxsYLf1aK9JpXusq6DI2bduJeCO3v/f
         bebKIZ/W2e08frbC4Z+FaLUd4n3IOEFO2lF3KOL1aigCRIpVtm8NyNMdfPKUNZo7Bt1h
         v2HLbttiRZfuJj3isz27RDCdsJyyiNAoJm/0NQLCf+kklClLd69CO3UYiPH8s4j5bFJt
         9R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472008; x=1769076808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=hcoyHK9G0XoOJTKmjwRgKHi2Ev70yBA5QwfFF5e+ZVvceyBOwsjLnB6f9n51njkR2q
         xX8fQSrh+o/8Mk0b4wC0jojI1NNXCYGnJ8p+OPIAO6Trlm1SONl0hTqs/XnOYqL6gBpn
         rs5D9Xf+FWnlIvAAz1uU0tirF7K4/47uX3VVgwObpbfqJfSESozCDC4HBsdqbgXA7Uhc
         V2WNWGx+evMl+Q/EGm8PepaWHLvpL131CC61edV8uvpKac0JlRTguNbokd0ggxKBGzxF
         iabXfhrr5bz+6K7P57/OGe6e160gKlonlnPH6kOcwIGxB3TWh44Ozd9nDivt+XiIsKYx
         pYUw==
X-Gm-Message-State: AOJu0Yx5yiUHpD0D8ETGFG5g94I3dgXxUH/U4SW5KmM2vj94F8rjf5m5
	jMHGigjYyv7CRwiHn64J2BlixzGgW08xDy+nmPbpaBaZB+kmjh94KCjbznH+OwNcWUjRC0/fUch
	DKf5p6YoJ7v0dcOT1mkoFFyubisERmpLmBCKDl0poY2nxPpUdhxQv4z2rH/yyLHs=
X-Gm-Gg: AY/fxX6RgezO2WnYhWfOMOTnqD/KwdiywPHNhF11eM0j4Spk6cHl39ouX/chQbGYAth
	I7rw1c/yr7zOF8jd4XFaJAoM3fBtCMbKgd+jddtCMq7MlySx4uJtn9GUzgJKAU3rFX7wxAYT6DA
	GgMGFS1RJSrcRwDBJJPoydEgD1/c4gL+Cwcxj4qJg+o2ggy75dgI84632O9hW6ZrZ79dY64Ocv/
	fuYmDwz6hsMVRF2Qt6HVU2pjEd72ikfONItFTUB3/52GYsUL5GdJIBS93cmZMeu8dct3p0hWhvU
	B0/KP2XY9/Y/M5uT9KpQOlbleo7SAOdS+K93L8eXz55Q7kBpBQDzVLUH1/9vIgbB3AqUiF5YsmQ
	Y6P6Xct2l/P3hyo2BQdH7TnUHkIdey2nZ+feFoduNOBYreKhyPZYcMlXtAp4YDbWru2aQ2d3yOm
	eT
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524466d6.10.1768472007736;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524156d6.10.1768472007315;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:39 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-3-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2240;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IAlQ9wjSqjHi2sXh9LPkom3twHwIndc2QkvvmikUsaw=;
 b=BRX2gKz6e8V0TWE0Qdo7jEe8nKdfVoDB1q0PAiVCcYJ53QlRwT4om8ubdmD3nmrj8eDbHrTdy
 Ui6NFJL5ESiBpewiWXg88g6rQbTsH0wl+pzV2SHQuyQA4lBIYCzWsTl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX6F3FtpwZVi37
 Sw5pFfwe9rISo530nH3A4BIg6QHE7Xi2qjT8gSKZdX6mNShIqsNq1QuTrmtsvwxIhoMRWginIaE
 PUK87LwN0eHZUBIaJAe/6LquGykZ/G+aXvDkhTMqhqAXCnEAJrR4YR+rReUQmiLk8yGN2EQ8sLP
 p9YWtqjmlcGKrEyGQRXxhUKfhOhrzTXyfbHGftKPSNO9flTwMZQODKSkIzX8VZ3WIYuX3uqMRZL
 IaxyDrk3ELdjzwMGhDXcIeLt4irM9id8fxN9AXXSr0AruGlEaLyPEyo5a1cBDBAF33oEoBuIBU6
 wAcvrbRcT3Z9WEvVwqSjn5Y9icP0AyAzqMoRTWHWQPqJkL8HoveIZO8iqInSxchcMjgrVEL18YT
 b0Dzk+JR5HCM/PwhUvQJj8yFMmlxak/Iy0HsjSOtili/f1M5T/IpfLEdn15ZUDV0oYXMvyMJxRB
 zaxe5KwPVXkpcEgCikw==
X-Proofpoint-ORIG-GUID: LlXHQkIMeKngoIFVm4tSY5_EIhRhu6tA
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdc9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RMWakvN5gFyazINGlFsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LlXHQkIMeKngoIFVm4tSY5_EIhRhu6tA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fe59975d56d6e65163dc7fcce8e08c50fadc3786..162bbe353b62342478885f22972a816f1b60d820 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3790,6 +3806,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "bus",
+				      "iface",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


