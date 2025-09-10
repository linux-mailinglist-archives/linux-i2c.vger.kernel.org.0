Return-Path: <linux-i2c+bounces-12822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B09B514D7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE43A5467C0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 11:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E77731985B;
	Wed, 10 Sep 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYXbMs2m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34C31815E;
	Wed, 10 Sep 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502418; cv=none; b=j8Kn5FXDu5LxIicglyLe3LEDD9EuSUSIrMxNxZt27GtUvGKIeCh/9EdaFa6ujhAUlbGyHG5+bzcxeHLhApeKlnmXppU+6nBvshlJhVlHxUIy5dUSRkV1c1G1ALG2BG/KMaeA/vdIqyU40ymR3leiVjA1kdmv0H7+DPDSrUYPmGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502418; c=relaxed/simple;
	bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QVUcE6mzoq+dEpYsAE/Rr/VaSxKYOIOPNeKOIRMZbYSbTx7DojE2ctYjB0+Iw30plSrIUdQhkMehPihF839KOXtzlxQzSFf3rmuvnKfapsK1wpFVGWGvDDqS6oo6hWMYD4NdxV9TNZyKlgyXxIysSzuOTYQV/d0XPymlwULGZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYXbMs2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFGBV011757;
	Wed, 10 Sep 2025 11:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRDGYxu/+bJt2MhHiUzaNfQZK0bE6dbbtqEE3qnHVM8=; b=IYXbMs2m5mtNKFf4
	GQqjcoSmLliLI7+VjXecJ/9DNL9ISG0oo0X7AZFAFA9zYBuzjRzKOqL4Puf0BG+Z
	8LpXJA8mQHw5AiGrF8oml9zMCIlU4/2TC57hZF/I6T4tkaOLIlVcRqnLcEXYPuDC
	Ek2u3TlTimkzo/OTD+441Ireup94MVgEeI2Gb5NhGrwmhbTwN0NxQ0htFTL+ody1
	S5qdWpApwqeJsktXnSgYlz3bo0Jp135XB9wdCfC6VHmhb8h/KjVWD6G4jXfnmmE+
	/ljVNXQ2N5AhKvxEB9iSe2s/k+y7DsUybUkafhZVTs53ifQS2S+mKS/Jc0VQ+VgL
	ji85lA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhe0ctj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:06:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AB6qlR030720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 11:06:52 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 04:06:47 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Wed, 10 Sep 2025 19:06:21 +0800
Subject: [PATCH v4 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250910-camss_rb8-v4-1-28f44e1880b8@oss.qualcomm.com>
References: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
In-Reply-To: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
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
	<konradybcio@kernel.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757502402; l=1125;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
 b=qAmTQUBWl+MPpr7tZez5rUKxkjM6MgI0/Y+XkxxkPYQxQDyc6P1F+bv1/g7Z65eIURUofVvs9
 KlrkDkgKm9aDTU2dZyGdm59HIuTzsv/GgaNinl2S6hHSbj34+qIKk4a
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1o9jeER03nPEDQtfdEqEvOjfOn4QJYbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX6mHz6n71ybES
 AkHcw/sg5sy90gYRJp2ANfKhGXSFRRPujDcunwplwfC/AlqHh2U9EBloo6M2FlZm/A8L5gpOZss
 WCiWH3OxDsErsBQHaF0AvZA5pRM+gh5js0EjUZgVfCrGScGjnCp588YzQ9Jv1atvf4If71zxdLf
 J6Nz6/4EhM+HsMIA7fHqVvXV1Nn6bsiIMUhZy1vRGnW3kUs/mvWe6kck5Ks909d23waehZD/ekO
 K8aGwQ6g1Br/WvBa+B9CRFNCrZo9lJlk8j9Vvcgxc8Mp7jkla3+EnDOmwtuvb+ToVJ2gUgyTsGq
 Y5eagKpD+FEonUpUPJgU+hf/tzk2gtnySg9anapPJzy65S6u7rwn1ciSsTFzv5hKhUVt0TPkQF4
 sIYnjGeE
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c15bcc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1o9jeER03nPEDQtfdEqEvOjfOn4QJYbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

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


