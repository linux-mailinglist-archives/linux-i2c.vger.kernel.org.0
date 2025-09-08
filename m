Return-Path: <linux-i2c+bounces-12756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9BB486D7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EA60340E5F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EED62FE048;
	Mon,  8 Sep 2025 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEVFM4hg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529D2ECEAC
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319680; cv=none; b=MgB5MG0oq54ewQ26dlaMs6fOuDMVDr9ax2ZMzE1SAUDAouyetV8JsL5I8E+6/v0XjI6JNDj6mqWUS+thpzx9fIXzfSioyOKuEwUL21tj9tJmyhOeH7eQsGU1TBrtma1HlmJNQIRe2cCmweUa99se7V5cBClnglvt6u0kYiGAbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319680; c=relaxed/simple;
	bh=/4ZTJGnGR5GHDhrjOUf5bHrQ1cpXckbW9O7yW53a0iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xbo5eElXU5OUayh4XDlzzvXZfmzmnp/INOubm4B+QAyr/F74Lwa8cESubATqVKADBwoyLNJ7juQf4B8hGA8GAwC171pqTHpV/ZI1PkepAoKkFEKLQnBsUQ6GSIEgxq1jp7Zw1Ok7H65PX238gc+Pr8P09CeojrekSPT5GCKNQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEVFM4hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LvpTD027829
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URCNjVbENokOE9jP4TmSk8RRgC/EOlHRv5J0OYYwhW8=; b=MEVFM4hgnWkMuj8o
	NFj1h2i9kxcnrnAhClcXs6uh0qBLs2Q1KaxfuQ2HDTPfD/zzH8kJuCaTzEwSNXuc
	jkfgatBGAa+Ff2Df5zYk+uENLxC43MSB9GzHp3umEmK7YLz/QpLDdb272Tll/fM7
	qUwyeMBrz/UCQH8EjjkPS1ONLOlYZHVX0iquLlBg/SgVLOzFevWqSAuujNgFiU2A
	rSXdQ0S/2FWaMy53msq8sxCy/Ty/ipy2rXtAfNwMLYFby1XCRBYSBHTG+PgWdBsK
	HgpsNd2pSfoh86NFp3DNDBm9VH+ww8dD9Rl49pC8GCh45fveW5/IWhFDyaJrolNQ
	FJzKhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8bt16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:21:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24cc4458e89so94530285ad.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319676; x=1757924476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URCNjVbENokOE9jP4TmSk8RRgC/EOlHRv5J0OYYwhW8=;
        b=Ny6HrWNSxXiJYedNo+E0waJIbpmK7KEMDrdqwy0Wp536SNjOesCh23MMSiRL5bHvUu
         JbuPF0ZyCULQAO2z8kycjScCjBd3ZXl3TA+tNNDVnJSMkEnyYqYbRFDd5Npp0ixcgB/J
         UGVOhjDVCHw3Ay5gf9X+XbsTqjoUKgpIVo2qzm67aIrt5+GMepGY+oYvo6me8Ha7DO75
         hWUEeKnaDMVQymPh5mjyCTOrJAfxZH85AUlHTDTpY8aOFq5zofYjZk9DQfMLE2Co9q5H
         LLmdPBkKWLrDloOsS5mufU7/pjLbDvS26AOzl6qejuJsTHc9dPmdg1HgShEretXuKqeL
         qa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeG2sxcCT7HFhkMU3hMxCxuNL5BVL5MVf2K/+4BQxpstqUS1T2oCJ0BXX6ZrQ2C4lmnTg2mqQ/+Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MMpKKuylhsN+Y8Up09qSvQQcN7upjN5l9CnbHgN0++AeLwmg
	ZDWc4hQFyVJZGobjMgLpVwMe2NgPclDCLf4RtmfKjOwyolMBxuHm0l83kCUxksIl7z+VdeasvuS
	Hw2kbOWAdZx1HCO+IfmIVH5KwKdOBJFhwgR5JD4Y2zPgeLn+a0ULnIsBrnGJwtic=
X-Gm-Gg: ASbGncs9y50kNozhc/cZzuXXNI1dVt+ga2CUX4cIY6sTAiEExWjMfR7lrD4SnOnmD++
	Wp2K+8U53m/ffmv0V4Jb9JKyuaM25AY8jIKTaDk9Vbvyz6sRY2pYPRzckYEmSl13YC0ALapq4MX
	b+XODtXln+cgKPvdk0QwuF8jX9QU68rR0eJyujMJFeXJOZZMBelfA0Cjw+mKx7BxXkplqi2DJzF
	shqItzj7aXLgHACsy4PWPTWgPCIIdoyB8ZDcSfoV4MvgHyrsKywjXzFSYHNVVrgY6xHYha5rhd/
	V8ipuKhwJJkaQbZ7Ywm9rDgXd27W+x98gChnw7M2TDVRC4upDfkl034b3AzpNMhCAjqS
X-Received: by 2002:a17:903:19ce:b0:249:147:95bb with SMTP id d9443c01a7336-2516dfcd7ddmr84033715ad.13.1757319676049;
        Mon, 08 Sep 2025 01:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUVS2mXFhGtkWxSMzeASlmhLdAgvZo3EJP3gdXk7dKlzPA07k/IJbwS1KpZbz7wAZsYMfudg==
X-Received: by 2002:a17:903:19ce:b0:249:147:95bb with SMTP id d9443c01a7336-2516dfcd7ddmr84033485ad.13.1757319675569;
        Mon, 08 Sep 2025 01:21:15 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:15 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:03 +0530
Subject: [PATCH v4 13/14] arm64: dts: qcom: lemans: Add gpr node
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-13-5c319c696a7d@oss.qualcomm.com>
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=2037;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=sJt764nmIn3SiRpMOA7PhBLCauC1Z3J0FkQW3/5alxk=;
 b=2Cs0qSl19IFI5Aem/1KCsrfdDTsyphhbc2bhvoK5i1FcCTq5fwvREsgpZNuGVgOGZALk0gprY
 nvkZwTM7RU2BDgjU+yZJ13HL4Q8KE9tyVZc2YdF17at6TFixvHiLIs2
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXyfgYPL/0tn2Z
 oa151kp4k/nI+1yPbTLuojUz0RrMRlGz3urPsQgoi1Pp8CnY7x4bpHBt7m8YlRLk5FDhsif/jdC
 boN0WyKqR8oSUWbRJYTGAp01aPAsJFQx3XGB/rP54enE/NSG55gfmRHFzfT9+P2K+8Z8UaNNGK7
 e5ZMhPHd6shmHMhzDU1KB4oPPlB1giOJpEuECqWALziC9h0YC8PuYt1X1oZzY7M48cctCcPEgd2
 ydqAS+PnylRoHSfpWoaUwMfvnloKnNkB7CoQomsz5kfaPR4Duf9BxcFP+znecxm8THBucf/pS/a
 MtxcVqyMj8AUy+iEkAit5exfVnLUqdkJ2dgmI7hnywc2E9yXI0lu1iAdoBwn8+3y30vAEnLRt8B
 ECKgYJT9
X-Proofpoint-ORIG-GUID: qsEcekG3kQmL8v3vnLsNwFWPgUjvS8Tm
X-Proofpoint-GUID: qsEcekG3kQmL8v3vnLsNwFWPgUjvS8Tm
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be91fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vHYnVJDjh8PKMNTngWAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 05d5da382bca..068acfa9a705 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -6759,6 +6760,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};

-- 
2.51.0


