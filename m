Return-Path: <linux-i2c+bounces-12923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF800B5531C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 17:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F027176905
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 15:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27AA27E045;
	Fri, 12 Sep 2025 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e5AzChtf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D5221F09;
	Fri, 12 Sep 2025 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690448; cv=none; b=bMMhlW+rhAB85Kn07w4kp6Oo5KNvLXi/6BEsjkW2MGpLmqzgP9Mv5dMlJpFLl5wVjDQlPWf9BPm69Owk9q+d24Eo8ZYEHjemUB7rhtwFwrR7AbrVGxyeb3pcjFAcruauVImeBVtIl9y48FKuJCL78F5QgFy2K+GyRcU2GmiiYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690448; c=relaxed/simple;
	bh=EowueBH13afyhHw0x35ZaBsQnVFwIQtLnlxE2AUV2QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A1ib6QY+Fq2YGTLPJ0NnydjEXhOiMMfDWwihutvVpmVzlO+CJ6ZXfGdBPn1Er1dZDBNXko0YM6wGSgpL6eiM/RtP4tZ590QZGS+ukYzvItxl9S3EPMP1Cs4h5TAYG85uhR7NLwZhY2pKI3BlK3m8s8IEhgMVrTSkFSj5aXwOQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e5AzChtf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBIMd017441;
	Fri, 12 Sep 2025 15:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPH6z//bhBcwko48CLC/GzX4ytWo/uGOLEs1WXQBAw0=; b=e5AzChtf709cOwXf
	mhvQj0zZs8gWUj0Mqlk2lW1+4hI0+QPBHJKQFNSUvQX7q6xbUiCxuvssbXQu+as3
	AExs5ZhcmmlQgvb6SHrwyT7YZ6u8r2HlLG4IwipvY0LalGF9g95ZgS7sqstEQVx7
	eFkihtdmphadLcMFTb8EZUkU3x9+KQfZVo01N4IblFlO8JQdzL2JGizBmQQmAoOG
	R6+668wlEIVXWPCWBMtLzxhr3BvDzNKwY/KX8nQCSkj0RawrFRTrtEfxVH8DRLNC
	AcJ83lmWEI/6RjfPBTd5HL2i44LaCiT0g6tzoMrgwlJIv9Qa6gpGoL1c5RISxc+9
	d9RPzw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx0kyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CFKgb4022109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 15:20:42 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 08:20:38 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Fri, 12 Sep 2025 23:19:25 +0800
Subject: [PATCH v6 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-camss_rb8-v6-1-c9a6c3d67392@oss.qualcomm.com>
References: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
In-Reply-To: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757690432; l=1125;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
 b=oz0xg+AOfdxxEINe5uhFoA9XWDTtNlYjbaCr7zinhjKU9C/wArVLnb8jidHBn1Ecm4GceqJhR
 pGgxh3qrZqEBRgXEoyuzY/issl5utQ21u6R1OLzGwKcgFZzQJBrjp8S
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX8eO0nU9tz6kQ
 bKLLroBUzY4t/q8zgO6zcGDsCM0iCOAZX4dKi7+K7QcWMH7+Ulh59h0SmpqmqoFvK7FkA6Ozwmm
 EPSgW0DyF9jKYjqBTawuTHH4ijNtxS8qlceqpNKL3detBLZWUtQ/rwbCo4Zsa45xMYjQrIty7Tf
 nurIRXSG2viVHR3M+Eeh6AOtGJhXwx4UxsNqJy1ZeMmC72T49SkKS6BMpIrIA6Z3BhVDYt1eHFW
 JOHroa+o8aPv7NadOBTpL+KFGQ14gBwHD3QPidV63fA5BZeNucFANFWv+plvpqiooS9fwIuKpaP
 EhAsBS2zSJQ7HYw4VipxQxS7xokFwVcEOq7RHgwK+saBb/wjJN3MvWYDcvLRd7OIpi5bmSyeR08
 piUCYEO5
X-Proofpoint-GUID: sGHpxvwN_WNMMaCZ5709nMPdb-pK4IZN
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c43a4b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sGHpxvwN_WNMMaCZ5709nMPdb-pK4IZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106

From: Wenmeng Liu <quic_wenmliu@qualcomm.com>

Add the sa8775p CCI device string compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b24e574bfc6bd7d8908f2f3895e087..54441a638da2b7feb44741264810d7a0de319858 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -223,6 +224,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sa8775p-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


