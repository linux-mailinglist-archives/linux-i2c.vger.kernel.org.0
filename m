Return-Path: <linux-i2c+bounces-12659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D7B4434A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E150A012A6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED94B30DEDF;
	Thu,  4 Sep 2025 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjiH6mer"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F8321F4A
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004008; cv=none; b=OcMKHAU44rq3rHrVSKiLJffAhqPukkrzvO894sMFl44HoMNMCdDxgwM9v0GBw76qTka0AYp5mt8FrwG9qQu06bmafh5bRiWRx8a+PBY2vKRyLfs8ZQVpxMD+xqoOBGVllxc6ucpx2Py9IKHvA1Mzsv7qDe4Cm4dAwy9oyxWzqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004008; c=relaxed/simple;
	bh=27FWMqFCDTUwpqfJlNc8jFyWyreHhp7HJeUXTzNfhgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mtvy3jHMWvkB7hentYS3GYV11KNGIBk7Q6PM3qOkTEB0GIGTvetVq+3Kd75K5F2K+j/Oafb9PMzMbFS19qpCfvaZ2bcayQ67bdMEUslg4DOuPePSCcvkk/vgY8Xn2hZvoE9B5olFj9vNruF768w6Qv10tmtFkiMGGI3SComxnOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjiH6mer; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUlgq018103
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBnsv8jIHnwgITCzKC089k9TiBqBMjIPeobN0jq972I=; b=CjiH6merx45R7pQw
	E/yXR046uZfUs/pwpo2Tc5v+ssI3QmcYcpwnz7YXR7mhmGKf++mpfXAJAn+/7rxf
	TcRogn7XQZAbpfd3868VtqvPU/Hb4nhk3h8Njt5SUMLjlKpuDC1nwbVsDokj4wYp
	LmAHXkYRzZAoVEylirfVRY+KZFJUrexiBmMJ9O+zXjwRlnKC95791W00q+tB4CBY
	OK+VdmEjRuTmI5VDZ14eEmYwyn1fFz6ppbUUhK7zeonJnPomYRnHykJE4JgAsjoI
	hAhUyXM2/5BK0fm7FjjlzZSBFvsb/xiAKu74cDRHgwSX2c4/hUbYfgxwfifJqny1
	KsfccA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebur17e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso1129307a91.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004005; x=1757608805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBnsv8jIHnwgITCzKC089k9TiBqBMjIPeobN0jq972I=;
        b=qu54jgRNXiOLWLFEmTFrmg7P3y9uYtaHeSxGjutcQW4733FmwWWl/QItG7felY4QGj
         eM4fPj2fXIzY8DkYskOm3JOod+gL+YFFJwX+SYb7hGZroT7WZoHZErrQsgWvkH+4DNzc
         tcZsl9Nq94JHh5P1P0GRN2q6SGNArneNrfkYu2N4wu5lPyCAH7OvtVrAT5pLgWCaY7Ob
         StEENfWaDFBaLtSkpvXk8Yx/SIRE1sNgDmKd+o5UHMSel/FBozKivk/6AzJEvN5x/XX4
         mNiBqYshfm9d67yecrzGD+x+D2VKcac3wtM1NBDXQl/Y9FIuINI473jsgjixGOwKeiP/
         jprw==
X-Forwarded-Encrypted: i=1; AJvYcCVrMVMEP2SIYDMT7QGNw2e+Yb9IjHy85GkoxTZGK6pU+MMab7/VlsHnmPwWNkHY30t3K8/+7XCiNFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqX1TnSZFLk3jhmMRQ52JR/hpfsyDKSTzpCEwHB2/6zbxZn0gR
	ZoiIlnezfc37bxBz4anJdnmm7kG2CeVHre1BrsZJpywe1IQe+lD51kook8d6CGdn4384jqDgsKo
	5mc/47wSAT1GEJJVw+vJDtIKmdwceKOK9Lf1rAHT1PhdHmMI/JEoL7Dt3rJ+h8gg7YRMYzbk=
X-Gm-Gg: ASbGnctA9qvsyZfnrw6gu++kwoV0wNHGdd8sE/oFlrxEVrLokv77bnqzgaCzyBAXIEA
	9CIWfCqqY2yQXUXsPzyBUWAU60x6DAwPCY0pGYTFKUsoEqICZVZ2Jgn+Dy80/RnpBAoXE0CpPqo
	IDb6ODwgqDoQE701WCC0Dhrm+bhNYY9oQ45nwsbhC6rAatVj/lK8t+uGdeCzLunHynOhcofqoxv
	GLY3zkK/dfSYLNk1uwcd4lJyMqdV7w8OEy99KApGifNL7st8yotPYocaT0TElXGrIfa5MrOgnYi
	hdaxw51Q/FYcrUJhNO7IgU73+35Bn6xON5HCQg4/W2HbC2iv75HQzlR0OYNypjt5QNCl
X-Received: by 2002:a17:90b:2790:b0:327:8c05:f89a with SMTP id 98e67ed59e1d1-32815412e9bmr26511473a91.4.1757004004352;
        Thu, 04 Sep 2025 09:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETLbiF5LomcDMPddyH+6eJjA8N15yzTu1sZbM/gaEcwfgyKS7gkdIZOV07jqV2Iqp5IGsQEw==
X-Received: by 2002:a17:90b:2790:b0:327:8c05:f89a with SMTP id 98e67ed59e1d1-32815412e9bmr26511431a91.4.1757004003710;
        Thu, 04 Sep 2025 09:40:03 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:03 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:05 +0530
Subject: [PATCH v3 09/14] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-9-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=865;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=LoxKYvMXT6w2D33TxA4UNVzhnQ1bXXJVAz3sDICoZRg=;
 b=cn9950aoCKHCLBDJ0YQwZZ3VOYSNkIexa6YkQadyz2LdSJ6QJLVSeQY/Et3Cb+sit9kRExVnW
 ja4vkVqHBA6AP1YylmP9vi7DIKXoFyrKl97WqVPitioS8TxvugA4hap
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: UDOy4Zjti1GTCpP8KwJLJG039FMhIo0J
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68b9c0e6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9guL5b7EFFMc6jyTlUkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX3ULh+KK0PEjk
 GQYvL3wDsFsbHrlGcuxF+rgsgYV4UNvzjG1na++Oy1h0zr9V4Fhq+r44umPlB6fHoQYjOqyddqD
 +dTRoPELl3tnKvOMoylu6qgiJTFkaAggRGn1EbuOQdFaX1GVG6EznebEqy2bod9JBq3jtMgVAfa
 EHR6z+j/0U7unTiB4ZLQUwJ1HRDPqstDC8ZQ8ce3Z5myEdWuZ2rZ3U4I98Az2VjlajITW1VhXWp
 y79clFeDnntopWCs/44MKjDU33cHtr6iliazBWoTSNRhy0GABdKbed/g8SSiW93HsENFpZzGxlq
 sR5m33YQJBOEqrlbasqHYwUysJ8ih+I25lCIooEiL7Z+tDycRHtfH0bF8xnlzBSy8i4Cx4qLjEq
 BfDHQ/tJ
X-Proofpoint-ORIG-GUID: UDOy4Zjti1GTCpP8KwJLJG039FMhIo0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

From: Vikash Garodia <quic_vgarodia@quicinc.com>

Enable the Iris video codec accelerator on the Lemans EVK board
and reference the appropriate firmware required for its operation.
This allows hardware-accelerated video encoding and decoding using
the Iris codec engine.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


