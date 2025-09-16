Return-Path: <linux-i2c+bounces-12989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B292EB59B49
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A547527C84
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9074735A28F;
	Tue, 16 Sep 2025 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrxxxJtX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4763570BE
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034819; cv=none; b=gl9jkC4n/FYxEe0JmQXDnT6/YmY9bMEo0klDv0SaZEVyuwn5CmKnuggLppQkGMt8i4cP1qmmQn0BhASCENSxKWOQQ4Q0jnpwNWxKTdGxuU4PWGlEcsl8fzlBd8bIIyZYQzRMfHMosTeGZwOATCvbSVAH18br92Dzp4jpiMsqygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034819; c=relaxed/simple;
	bh=AeQJ+Mvvn8Zchtp2KXj5ziKvJddoHzFNlKss5ip7LDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiZlra3PXp825n+uilTGCo1wyJj/6KfWwXBAgtEe/7iF+cKi0gcb91f/hgPifps78LGi9o+JzhQNflKETBNU/su2WsS+ULY9BLs7XzwoH7wP1GNDaU/Kb9cq/3gcxyS3duKw1Ncp+nof333YVA9/q3socSsT1PJQQ9x+HgEc4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrxxxJtX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAiHna011019
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05d+jNh/czCFv+YIOyVmfzj3aJzSMxM9iGXDQbdqsg=; b=VrxxxJtX3wb6uvTI
	RlmtyTUDMW4FctOt7ox81ZwBZgb8+PR9ljugdi/ATbfkr6eT6qL5v9EnVXs082wB
	G66UZbbh3CBNyee0ApvAJ6T8/oHweTFibb9GIV4rcr9gqGY+542egPuihmTPk9fm
	PdlZUtnMOIbnWHJzhUKP6GeQz+TRfIkueKzEwVTPtOJo0GdAWpJfZMaS+Ak7goWW
	LvLNTYpdiEQGR4noHOvPgjQAAXBeP53A9ym2FeQw/UrIq1xQE4CuR59456oDlqvl
	fbdI17TjfXspVlMmdi2JH1TFlHf3O/fWFYdBmmzFAsjtSv2/nybOT5cmpZUx2R8w
	LJ31Jw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951sns2ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:00:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ced7cfa07so58458115ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034811; x=1758639611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V05d+jNh/czCFv+YIOyVmfzj3aJzSMxM9iGXDQbdqsg=;
        b=D1DzY/Q1CdmAm0tnhBXDowA5iRzsxLUIKoKkB3M/Qvt9cpbeoLf87Nx9tExXd4zEyY
         cIxQdMRrXFufLErqXFQ2sOPZ/oO4PhtSizG0AKOuzItCxMYem702qG2Srxrsz80MDxeg
         hZic9jXkPXced9k9IA8juJJELqQ9xtpR/WcJdu8NAIj/ofJuVv7fZGApirMXt3O5qlQM
         Sxntvmmvf5EcZqSNsJqA3nvF858+MEqRVe1vOrZNMoQUiEQX9bsSmADGOKqP+Q7dVfhy
         yvtr0AtXk9LLQw43fxXhYRXW831sPvtY23G8Z3z+gNi0XEAUVsscjbMWwUaRDH9sn/uG
         JZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWdv4FoeCtg8jprxB8pZ2WJF32EYoqIA7LVFUQm6QXhT0YtOOh30rolBxLCrq79sqzMszIiEcWdZrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs25K1pjCRXc+J+oxD2X/BWUQBxDlT3m4mioqN75X8eP8akh8W
	nUU28hQpXcvvotH9/l4H2zJbp6EoTfKyG/rHVnkiL0bjbfPwyV1MjEpd7ywoLHWu+dUEZEHtYez
	oZTtA53JK5iMN7JcJEXCDAF1/ulin7cLdlqDByGR6fioh7lyPZT6rwIxW1cfKdkI=
X-Gm-Gg: ASbGncuVjka/a79zpl9UnFyNR2tI2TRnYLX9H6W2bvOykOEEBo96jCTtd+0gQo93rQz
	Drbbt+CcMmyLLqdc4Hhey3BRRGWNfDXVt3x3nZrL7VVlw3NajpJYNuqDp79eCCbqJagDGtF3Cfr
	T9EsRjQSkmxjCl3FcMR6FlJ8Tdf30LGUnkWGbFXyhIPk892kQuv1rO9byqfJqpQcOroqgci5JeW
	XstElEcAjecgFPYOqSipI+bFypMsoTtoAY0DrY+8UQOpZ4o6SFDLPE5JHdD8950r3qxnzIDndZO
	aYILMdskLbvF4Jehptx172RDWYKkMf50xmpXoHjrkt5y3zE8+TmOOUL8OocyHRj6PVq/
X-Received: by 2002:a17:903:4405:b0:267:b1d6:9605 with SMTP id d9443c01a7336-267b1d6a44emr61499235ad.10.1758034810087;
        Tue, 16 Sep 2025 08:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXXtzp40M+OnwRPHaBfUHcZY3UBeT0scukJXr7R5AGOJ3BP+3MpI6Pr++mKWkPkvNyQtbiOg==
X-Received: by 2002:a17:903:4405:b0:267:b1d6:9605 with SMTP id d9443c01a7336-267b1d6a44emr61498535ad.10.1758034809413;
        Tue, 16 Sep 2025 08:00:09 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:09 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:28 +0530
Subject: [PATCH v6 06/10] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-6-62e6a9018df4@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=1248;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=AeQJ+Mvvn8Zchtp2KXj5ziKvJddoHzFNlKss5ip7LDQ=;
 b=51Y+c1piLmdWjG+Oa/4O7vIYN1Ktuey9O6ZUx4ctB1uZetUtQKP/MyuV/a+F5d1pJO7w7XhXd
 +nqfT84i1GJAgBIWfF5jT6Royc2uMgA2cLMeKWtsu+5T7rzVdnXu+ke
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c97b80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uxRHuE6yrSyVtnA-QqAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: uxnCJ8pob5s88f1wzyzQ3SEcH9REks60
X-Proofpoint-GUID: uxnCJ8pob5s88f1wzyzQ3SEcH9REks60
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX+vPQEskUh+gS
 zakjPdSyNaftPeChFGpoYYc8dUuW8xIibkaFYBtrW8wAUQu9VqxmkpS3w8qbH07iEMkREi8SF+n
 jYTOZGVZkF/+fIOO5zKCYI/0bz6PEx58XIyQPCPCGBkZ6d0/cqTLB68MF6vKMrwrwaYqwge5/MU
 JtgBMgpdDI26oIlC8Wltmt0HQu5+y+vupc9y7ILoC3vUoPbaoTeocpRbEmPLSLFBMunSLWCaSP3
 LJhLTlByONBII77OFGxuGFJHCjvKrDXjR03Ek/ucbKDqqot5QdhJcujyaYpmmWkVHor+IFf++eW
 u9lCAvxotKVAoTVKf5jIISZ661thTA6pjFzh+vrK5n8k1kjJ8depI//D3Y9dyYYLQRCIPxthqnk
 fNo77HHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

Enable remoteproc subsystems for supported DSPs such as Audio DSP,
Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 99400ff12cfd..d92c089eff39 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -477,6 +477,36 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


