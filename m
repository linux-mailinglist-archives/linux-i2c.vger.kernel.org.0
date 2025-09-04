Return-Path: <linux-i2c+bounces-12664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C6B4436D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79401CC3F0E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24E5341AAA;
	Thu,  4 Sep 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jw1wpIEy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB733EAF3
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004038; cv=none; b=jmfMgFqEqwmd8SHhG43qbL7TJIEh9IooEoahW0NrERQCSEU62uymyxLtXLgCr1pcPxhEzRYdgWDbl+G3JGyaReCRE94brnceSuG10w7Q4lJ5aG9PlgmDS2ZMDn50QpqOzd0jnBro96po6/6TCKqfMKHI4WbSAB57gTHz1Mb77oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004038; c=relaxed/simple;
	bh=5nL+OYF0Sx59okl+bF2CZ10eU3EdgP0WxoB+Um7eJG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxTbO+or/nBgOXgQ2Me8TxC2Rr7VUb3jjhqMnDM7qgQPq7BIDai16a6jUWh/ADNwR0AwUOq6dHMNEtin9MkDgpRztN4NeDxLWqGlnECmVAELt9g3rqpGThJxOarbG2GNd8zOm+AXH5zOMcbxd4+iikjqckIequ8iI/45iphPahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jw1wpIEy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XKeT023173
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iUt4qPcCisGUFMMbH7XSVXi/o4ocrCKh/ulIa/4zgU=; b=jw1wpIEy7C1n7Rnb
	146BwIzAZuP34RxdzUF96RDgEw7w452ii+cJZynq+Hn9W6gpNxdkCfzJdYV+9XNg
	4bGVUuJH8GYKDL5RVs03lcB2FFw9jIPKypjs5iQs1Y2qo3VmDM4UiEUpYfDkCSsf
	q8n1lvaE0/t2/WFEYs5FABEiRSYqRS06mD8e3Pj46+FHq1x/OTE0w1Pbh8J+GqfY
	6QS47/jKC+22/7VRzWUi7qrD3xTUbgZfM31v8uMpdCwQtlHU7JBAm6VMRPTFZH8E
	AAIhRG1NRzIadEpkqyy5mCi9kHC9qtSCdTwNt7z4gKgVilYt17Bhlcd9Onul5rEy
	G3cwbQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eraxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso1366327b3a.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004035; x=1757608835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iUt4qPcCisGUFMMbH7XSVXi/o4ocrCKh/ulIa/4zgU=;
        b=iOCCjfgbJDdcqoi3mFGnZcb0qzk8snnaOIJeZty5Z3snlsjcF0Ko9chUX1B6FoP8tT
         lXr/0BiLyYH3Y1agAdQbSZ20h7wXj4ldNbRWvpY6vz/IGjjZP6guxFn3X8qnv5auY/qN
         OOQxZ87y+/5i0y9C2Tfn2tWF5T2HrvAGm9vHvoW+3+xd834Ge8BdcG1LlGWrAWyy7Vmf
         SiazIKxl/XhU8ykmw5l9vDMNKZK9nXJS4FJ7pVrNVyvpwOiudUsxJuF70H26p70WYxB0
         01O3ZlJTDr3uywB9by9WJHxEoHEm/DLvSsntSPlq+Ke8bGgtS5dAHYn8ueuVB7fwDWgZ
         FI1g==
X-Forwarded-Encrypted: i=1; AJvYcCV4nBNzfJK15bNM2gkLNtq9LLHe5EEhJ9Y80hEEmiBZlmCX+x5EewdOGnV8gkL1aIuET5g79m44Krs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUe8/TozQFtgRPpLU7ZyDtc6hRFbk0LSQLrfegt78vwQ19SbYE
	vU0AUSdvlE75iakAN1D5ZSa3yHc3PT86qKFzBU4/focBPjWDIqsVhqWNSUJpNj8f8jqBxGLnGFv
	ylDAM5S2QEPY2zGR8gBcvlAIhrms2h/3Zg9kASflo/Jq8giAHg1rI5ccdOzzgnqAxFj7saqc=
X-Gm-Gg: ASbGnctuNDg6DiygjvAsKtGIad6TO/krfOXh2OgEf9YQywWu1cGhw4p/pKHRERrRkQ1
	+rKX7n2s6ZBD/SbsT/dD8WGH2+CQSrNy3+VymzrcaFkNQBfdMpyeVfnfvBI2Cs8CTM8y7a7ttn1
	DgwN0d0Hb77rc0YKeEp8HLDTw+7y/ze5IuR9Q2L5mLvInTyRvcGIZEywKO82SAiI7yGImo2hux/
	GqDA5HFN8GSaUWWe1FRGf8ck5/Ii6z648q8Npr5/xoOFvNzBgrQE5t0HBNtGlWmLf0PkD9A1TsS
	lV8VVaqc9DgirYYwdW1ICo4om/PkL17jPdbCt6S4FkyWoQlNjVgvqIK13C2HDqCpdXhT
X-Received: by 2002:a05:6a20:a126:b0:24a:6bef:bdd5 with SMTP id adf61e73a8af0-24a6befc008mr6136282637.41.1757004034490;
        Thu, 04 Sep 2025 09:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmo+ugvp1lemWmsL32dxfoUlxaq9NEcSMR/oo8aSYbaa/wv+gnrkssQj+zSbLAEQvSe2fdKw==
X-Received: by 2002:a05:6a20:a126:b0:24a:6bef:bdd5 with SMTP id adf61e73a8af0-24a6befc008mr6136242637.41.1757004033976;
        Thu, 04 Sep 2025 09:40:33 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:33 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:10 +0530
Subject: [PATCH v3 14/14] arm64: dts: qcom: lemans-evk: Add sound card
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-14-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=3176;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=SujxAbkN8XScTDon5muk4g4z+SXLxLTTm/h2xnMnz+Q=;
 b=+uMJ8s2h7Nlka1B2j3+N5dq2JFMljzN/8FyDN+am0P0sNAoqJ4+DY/9Gga9TA9J+3+6RlBnee
 c2oP8Sf1QXGASjHVyK8vxgh+4YwJlXhRRtyYSTp2jpL+RQ+p3+saniK
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: lu5rZhSG6TkN-6jJmQBlbe2qL09zo4QN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5iATAhHXn+2u
 D1nB23igBTF/QTk1AaNn1Lmytt0WcRuJgLdhxtSSagUb5gT5lkgzEHbZZsm17SxNQskWdMUUC4r
 mVCwOIYtRPp6J8z7B7cjvHmgZoksVGeawkDmrJUO3RlbijMnCWyQxLtNQJ2enEzslPVSIu6mVYR
 os0LgAxOhCPmrWO0HlAcYAFqf3VlqDHUD3Nttzzq3va1KDKTsJyruqt9DGb0F0Q92SBd/2SxTN/
 4pj7SVTt0fJXplPPZ4DHCNxTFPfOV0TsK59TyLrFBGHQlpcvC3zzPJ7qAg6feDzlw+/a7JUDH75
 VWvjQeYWIJ72SOr5JlAnpIlOkboOAptJIB8hw3xwls85bowe8D43o3Wy6buMGaQUC17Fmivi3/w
 lsWphvP9
X-Proofpoint-ORIG-GUID: lu5rZhSG6TkN-6jJmQBlbe2qL09zo4QN
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9c104 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=WTMWP25ZRELiBA-utRQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the sound card for Lemans-Evk board and verified playback
functionality using the max98357a I2S speaker amplifier and I2S
microphones. The max98357a speaker amplifier is connected via
High-Speed MI2S HS0 interface, while the microphones utilize the
HS2 interface. This patch also introduces pin control support
for the High-Speed I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9abdc8c9f2e9..e87afe0144f8 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "lemans.dtsi"
 #include "lemans-pmics.dtsi"
@@ -25,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -70,6 +82,46 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	sound {
+		compatible = "qcom,qcs9100-sndcard";
+		model = "LEMANS-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs2-mi2s-capture-dai-link {
+			link-name = "HS2 MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f3a4deee383d..3cb251a96898 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5070,6 +5070,20 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			hs2_mi2s_active: hs2-mi2s-active-state {
+				pins = "gpio122", "gpio123", "gpio124", "gpio125";
+				function = "hs2_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";

-- 
2.51.0


