Return-Path: <linux-i2c+bounces-12653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FEFB44326
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66E51CC30FC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497830DECC;
	Thu,  4 Sep 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wb8Y91Wz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C930CDBE
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003979; cv=none; b=HrzimcR9tVquCzsvILqCtCNEpZXKtmRrZCly5mJw0OR2r1RPIX/3hOPWcOkakPG8hMIKDaNGBz0tG3UT7g78Eew3KGlgHbIN/ZxRjyFScnqR6DQIZAuPWcYe6kol8036hs9yNaNzsTOl2n2fbZIFry7C0kqgE8uERwOEXajs53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003979; c=relaxed/simple;
	bh=gBYL50YC1XDuPqvactY/HGpJkmgy7jZJJarlpKpBrwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Grjog9cB7DuuDn3TCuv9039N45AGY0culw9be0adGGJJgmoJspDN5dBn4i+OQx0cQ6k/++s5P9tC3wqf7ow5c7bECvx7b+WgDJ23hQJk8yUIrm4Sgq0zDGZmT2r3F9N6u7Kgv1xbZBYcdP6Rseow2soHEJ1kDsY90K4QGZj/oDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wb8Y91Wz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8EA022162
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=; b=Wb8Y91Wz94F4B2Zp
	pzL+R7MzK4O+WyNMjkd0Iq8BrlPc43xcrjGpakz8ULnOpxsW11Xnn8+fL4o2bZum
	+oAbiSeNx9ZdYLSErohC8p4rS1zBmUOW50rqnqN2ljwMbYuLMRQauUv4sOCbr7lo
	Ck1S9ksmYtfd+xe7QE2xrua+xEDLB4YuQChScON1Rt0loZEhKA3HNP6RB4cFmVv2
	oi/JDm2CxpAirEeSnzTfyrX1wr5VxithPduSxRxTneLe52SCpVO4bWFur5jNnBJU
	deCaQck/c1puOkpeePgCbcm7OakVDn5q9Yai6SVdea0ynrgaG0LslpsT7XnStjYj
	T0RtFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk981e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329e3db861eso1172144a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003975; x=1757608775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=;
        b=vE1gJ4YfY9ncmZqMXP2hpY241fgHwVWbpGUTqSdQN0B/gKkzXXjFKYoh6l54hb7bL4
         NlbJJyfe2XNvXiz+eb+/LtnV+FCCXEn00uRmCVKvsy+c6o6kD52PIP0Il7pe7yE+2JMU
         oqEFducJk+QB9EK3JbqhjlBl3RXo1MUWCPYBIDsZjN+rLUjrHi5CzZxYBQQ4iQVcAWKS
         VvDa0fqLN7246zoqgFOW7qTMspZDMryKc2oCC9z48Vdc6UJBkB2Pfjty1FvQcU6Trcht
         deRcSFq+QovnDN9YA4HLrF5w/IdRNNhUQTIm19JHUu1taIQTgkaneds/GenTZdjY0J4d
         WDpg==
X-Forwarded-Encrypted: i=1; AJvYcCWcKM/XTJtBQsVsSvGzPHYQ3XU0JBSUC7caVHZSmFAnV/BkhhZF5kgBfPrf9iQSMFQqf9Txumhj8Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Pt9cZ0/GR0F/ZDeqJLvrAJNo9ni0kVNOTvPjk2eDn7rdS+vg
	3Eg0Ujjhi3gmp6A28TPRSZ0Z11SRuUzKH74+ylOTGLqQWHZIjxbS4cAJvGCxDdQB2duH/899ZVg
	aj2/SzkZdG7wcVcPJFsMx5EvAeHN7b48HYrZp0kpttLfG7/EEXzHlSMBtfaxK0pCMd7Nod5s=
X-Gm-Gg: ASbGncuhIRWNt4iiBCIElcmaly5kVmh8udWB1cxZuxo2FVICzNlK5x9Jrkq//X/Epd6
	+yPKg1LiY+66MNuxqcoNfulrTEg7J+50TIOTUd7SRF1FYXUT8MxSzyf3yrST/k8ZTHTvN/v2Woe
	oPnY1OIX2r+roweAQL/FBr7qC4LD9l2HLGWbbGkYegfwtVyZRo32BricebH5Vx/zfwQBpO6I6bS
	rQgd/WzORAzHLT8PzSufpoRrJDDEM4fK+ZZL3t/+u7dhTUHR6kNZdEiTED+VtyfmAYV1/Wo608e
	SGLTJhiCXY+UgnlXRyeaDsfp86UN0kze6HvwEPkU8VHexbEbI9uM7iunISy96Y9dMdsc
X-Received: by 2002:a17:90b:4a91:b0:32b:6ac0:863f with SMTP id 98e67ed59e1d1-32b6ac08933mr8239238a91.18.1757003975487;
        Thu, 04 Sep 2025 09:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7nofFV+wfimTfWOGY7Z6T0ProffuK3bldt1eocUGgRt88vfTcLxAfprbv1of4R3zm4TMTg==
X-Received: by 2002:a17:90b:4a91:b0:32b:6ac0:863f with SMTP id 98e67ed59e1d1-32b6ac08933mr8239202a91.18.1757003975016;
        Thu, 04 Sep 2025 09:39:35 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:34 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:08:59 +0530
Subject: [PATCH v3 03/14] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-3-8bbaac1f25e8@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1269;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=X+CejMSc/iURyNBdtIHd2b0fknWkLUOZo2knn9rM+7I=;
 b=B0ZC3gu+mtOedmT0tGm0gYiwIQI00Jep2hD+NjWSt7AaI3xEHGf7l6shbcaOVXZE5sHn6N6JY
 d0/KRtj88nOCc9VKZN67PTINy3iNSYFysTRiSSUhvbVD0jX0zygqbBM
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: Fnm1bmRmm3wgVpMjZRUxUvsC4C6L7FiJ
X-Proofpoint-ORIG-GUID: Fnm1bmRmm3wgVpMjZRUxUvsC4C6L7FiJ
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b9c0c8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hGGMonP7TOO80wKNN9QA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXy04o2vtngKEC
 V4z04KeeSv+MV8QAauDLZEo8X1YyT1Dn55a0cjj+0fthxy0f0lcQp+JxCRxdtoDa8gOThtW4QaU
 YiNLbC6TMbK2nCNplwUpg0291czOQU3vwqWhO3CtwRSXA17eqNtRuRs8A4Xoj5fzCfSkxK83N6/
 eWH6MjSUIkDOvzJsh+P6xPOviJAO1ycWec/CIh1b+Ah8yMb7SBo+yEbp7A21i0e3G38v+4O+NcL
 5gM+ye/jvn6P5HoRt1C13KS5WjBfm8irJEGM9EpotHI92RM7TPCzpzkQm6zNVWcDKV+3wpjGo+Y
 KYzC54oQ4PBjAbCwUr6eHqGArWjyRQMKN6Bugg+Sllbsitt+NdSYqtEmn0NA4TdC038RxwkFaPe
 MNgl1XHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9e415012140b..56aaad39bb59 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -323,10 +335,18 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


