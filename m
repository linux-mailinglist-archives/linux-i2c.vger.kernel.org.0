Return-Path: <linux-i2c+bounces-12752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26794B486BD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F1B8173EA8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5478E2EBDD9;
	Mon,  8 Sep 2025 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2jwmYEW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22242EBDCF
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319658; cv=none; b=QkBJt573TW/iwx1LA8nPI/RpLg86EPEyBrdycHL44TSpLCv38YJTMLvsdXD6xM0ugUe9U3LAHeAXJ2ojnRWKNwTsRhU8FYJ40tU9mlZobFDxUUXTG2jNkjwrg4eySWlqVXI3VkORfQpyAdR4kp/S7kBI5owqFswSQ7PZvwb6b08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319658; c=relaxed/simple;
	bh=cotqZe/TypYCRpLbOPE/9IjMIc2Y2Wh9oNHbNZUjKPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/A6ybkLYX5AH5eTLtKTLKNXrFHcu12hJOPnT6+EjRGSp7/I7OKKMpCBiV3PJ1Iv4a5yRlokKhkML3U9V5xtWaUdiNPcQahWwswK7v7mMsFcHRuh7f+cPCRXmXNReBsNNQmmR16ZnMQdKqQRFXA9zGIYUW6sR3izUaGR16qXeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2jwmYEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fGAo004649
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4bmDMlAr83kjarbdQPNXRMSEkAQzuB9YOir31juD80=; b=H2jwmYEW+6r92U+c
	GmPIboeDPPjxrUppFgloJAfbhyVZPseVy8v4n1DCdAVUpIg9f/9DDA9+VPyns2Ze
	WEsBsvYViq4rE5Y94rdN0lcFaT7RDt532FaVds55186NQSRityBvQsMGsSofxxE7
	hb9yxAql7OsfAg/6AGeabhwUhS76weTuqVS6ibLA7xIC9HCsx7Vs2Jv3ANveh62+
	hMr+/MKHuko4Vhb8Ymw78JivIMkJe1AinqgiE1YyCDiXd4Coq2w0eU3r+Aj6Hojq
	zpyZhGTyr4tss9hLA+8zp9jBrR0cL9CYASrhTkHdXfPNLk4cBvLoeBdGICbV6xFR
	e+w6ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r94s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:20:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b2336e513so64546485ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319655; x=1757924455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4bmDMlAr83kjarbdQPNXRMSEkAQzuB9YOir31juD80=;
        b=VFB+BttYBCGzrLBJuK/pviGlzNEyqBXoHVu7TTEWu4bzzjgFVVNDNyShP2MLxznfIx
         OLm3cTsbqa6er/qM+H/7wN4Pay07KOiXc7NTNWTN7wtj+DwHPV5wSsMC4HuxF3ulTWLj
         /+2r1XLe/DcrA/3GR8t3YYzu/1Mp6wCwOsWkF+5uJ1mdTbfkP7nY+xIqwm5nj4oHEZFb
         LfofTdDDW07xzH1ACaXNO3Y2q227oyMzA8PENoUbcfzEoEqtBc7DrhlSIu+ROtPPHWAt
         ypOdJLnLMyA5O0SR89sSTPLXP/f32XG8KDQ/mSDBlKaEY4txx7/xg2fQYL86zxNujyOq
         lJcA==
X-Forwarded-Encrypted: i=1; AJvYcCWdYOBAvVg1I37LPgsgAFzCNNmH8Y34LksMAjlHLlwF47ty/lf13OyH//CDCMNfls+fjKDw9QoproE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10CuZhYPTPhKSfSI64sz5fIyslR/bARQ4ZQFy9UAR5u3Z+IEW
	MvZEmmrRSinyYYcSUdHr1MNvayR6g4w/m31gda4/jD2cuduSiniiZBnKWdCACgn1gI98AXrY9X5
	8XGuGVNgPC3CGKyWkApLmB9YPJS4tLdQawHuBB7Mqma9JOVUBY4uatSRI9IUo3dE=
X-Gm-Gg: ASbGncvDxjcg8J6ESFwc7Jsu4zyO/QQdlELwyAgr210+R+a5nS0xFkoWQWE7kj7bmZg
	+UG1HRGmo7RsQLxPwjSzChDGK1rgZ41twsFf0f41mez2pCKsXFIS99dwss0GcbSV2MBgszfFzOY
	9/YmfR7gZC2SPwmSRJ9igz835W+X41Sc6pGhp+uGHHfhril4rffm7VVARf/c+wv6pTXcDZG+7M9
	Tfie7X2bXQM12tEb0fmDZJfwx0ap88Ho57PYK4wku8pAeJ90IJCEl3cXTaA3GspJplGvE/044r5
	bPY9wJCVodunZQbu7qXlQMqrJwrQ5H+/T9Bc5tCVKpf3XPftytOFemOpSmw2Y4EVEQHO
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115481835ad.11.1757319654859;
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyKAv1bm1x/8ViIApnewyx6A0HUi/joPZbuM8m6VoLS1sL3/lRwAVXdrizwiz8S6y8u+V/jA==
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115481485ad.11.1757319654435;
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:59 +0530
Subject: [PATCH v4 09/14] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-9-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=926;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=enf8ibRVGnvRD27V5ouRqt4BCtLlEPGBzdF16+U0RIU=;
 b=siHIL7dGkdoLax4tSZ1agBwc5p8Bm6n1mgWA8Fz6wVawE1GVJ/QdPpLOpJ3pOZ8rv8wJrb+DV
 Dn0nCGS0NTQAO5Y3DF8sc22/5YO/7sMSWAgbZM8dKx2sO+6KSU1sPxV
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: 0_7AwQRTD-vlJkdfye2QAfdZ8ClnfJ_i
X-Proofpoint-GUID: 0_7AwQRTD-vlJkdfye2QAfdZ8ClnfJ_i
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be91e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9guL5b7EFFMc6jyTlUkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX2VetTTsSR3N4
 QfHoUGegLaHQofC/WurCCpubLiZlpqp2t6vU+EK9YrkcycG9f7I/2nllraXtyOvxaDyDhIjWHYD
 wNUg8GgDR0VanfdEfh6fTK2W9SeFjVg8JTRtBAmrCb8ndfdpqzl2AgID0bZ7UCwHcFirZePzkx+
 agrB7h+iwe1yRNCO+pDqLHagjTxQLaxk2JSjebdwZeFMAr7rQ6q76C+jwQaI/O2hsIUaBVM9/8P
 DQ+XE0go/OP7EjF9u2yP0xQWaFV4hbKXjz9j68UTPvcrJ1n+D2cAeVR/ZqXWGXNypIszslUhERJ
 ZL9SLrJnLgvR0xVR+tY99paWw/HSX+Z+90IiFNdYR6aCeG+DTwOUWR254WOATIsP7l1uJQZG9di
 n4lKF0G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

From: Vikash Garodia <quic_vgarodia@quicinc.com>

Enable the Iris video codec accelerator on the Lemans EVK board
and reference the appropriate firmware required for its operation.
This allows hardware-accelerated video encoding and decoding using
the Iris codec engine.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 1ae3a2a0f6d9..d065528404c0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -333,6 +333,12 @@ nvmem-layout {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


