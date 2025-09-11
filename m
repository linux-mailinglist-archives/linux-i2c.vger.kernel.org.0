Return-Path: <linux-i2c+bounces-12861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D05B5317F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01F627AE3A1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D52531E0F1;
	Thu, 11 Sep 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiWTq6Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781BF31DDB8;
	Thu, 11 Sep 2025 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591810; cv=none; b=Tb76dVr8ZLgXSkWd7dRE/LhNkR1IJSgHHrYRtNXpcBXYu+EEKXubdZAd56RnN8C6hmJ7WspAssVRx8J42xkwkvCrqPMWDYZP5OJk+DoARTrjnyT6HZHhCv6LLqb8UKzkgyePtp8FlG6OEe6GxWl3mbSGr32CasVZ7mfoC3fv/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591810; c=relaxed/simple;
	bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TN+cZg4fUtIf7ELTrE9ttFp/4PoU0P/dtf6ruVb1dPOhzjMm8Xtju/Gx6T8nJPA3W0CQYfoxFGAcKud517RTVjCkOrjj9fQcSTXGRuvF8dS6f9rwfe67v01kXLc9zfJGj14TFPHn+63EIwBx/4HXmisALQ+pVAVME4m/JZZUnMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwiWTq6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEkHW030862;
	Thu, 11 Sep 2025 11:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRDGYxu/+bJt2MhHiUzaNfQZK0bE6dbbtqEE3qnHVM8=; b=UwiWTq6ZO2WRFPdn
	lLvUwz1S4y3w1v3nympA6Rc8WqaHWSS0nRYJoCTJQma0TmnySQTR84saMoBQDRQB
	DAinQjs2gjTD3tJ+ZTAQ9aQ+PU8Ry3y7IkRy0FMyBVmiLRvItFUf0lQ7ErlF9b2x
	fwSYRbLdh6xotT+oFQVDpHnHHc9s2yJT1Y7mnnf7Xy4WGogll84PO1TUsyMlkQNr
	OlUuqnk99EXIEDHsIEaKAE/M6p+V3DkniHLH7xaQO2Hek5cnLCZH64+DzV2/XrS8
	A3sweAKQqM1N4cCCQ9sDzQgqJBVh2EMpEwz1friQpbpakZv2Rez4+bsEZFLPBD+P
	0u6YXw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg78fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BBui1g007354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:56:44 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 11 Sep 2025 04:56:39 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Thu, 11 Sep 2025 19:55:14 +0800
Subject: [PATCH v5 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-camss_rb8-v5-1-c078e4e22d91@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
In-Reply-To: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
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
	<konradybcio@kernel.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757591794; l=1125;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
 b=hJAMzCNI00UuLv5j0ZZ8xV5IiiXC4ei4cFKELFajGOYcDPidexsg0Obhx3pf1rB+0w0Vvlcz8
 25Zhc/evojSCuRZLh6kKCNL3dWjdVMPS04nLkIL6ACxPN+vF0QPdfdr
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g7T6JtJJ8evkkxpObG9OgLWkLIZpw9ZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXzuyBop9e7BxS
 PSMFbOdq5sxMf2nT/APqjXrq/iPMDtZTOtw35GSt7LyJwDiuHB6ulgaRwAFQsN4NRjU8lb2Ys0P
 ZEriyZHeLobyiS0beRtGihea6E6Ei0v731zGUwvhM/d3xzQVrWSFB8kkWifuz6ZxCQ39k7uuInz
 EwgJt+EMp9Xxx3ZldWjnexfzxWYdvsSuV91pFxddyf+tk9mWzvwqFWeoaQbz1EqAj0KuHOmH0q3
 +vs/OjB+KlLz/T5Lng9/xLa8UsEgbBG2l8HLZ82z8gANON4iUvNLua3WH4iB0FBVd18jGgx4MBn
 d23hbHC/vNTBaFDNkdmymVVttiIGm2MYAwtDkc6+sLN/2uTFxt7Tt8dbF1N+n970a3d4f+VhNYK
 x3ax4eNe
X-Proofpoint-GUID: g7T6JtJJ8evkkxpObG9OgLWkLIZpw9ZW
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2b8fd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

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


