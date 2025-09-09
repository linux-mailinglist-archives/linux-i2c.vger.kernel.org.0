Return-Path: <linux-i2c+bounces-12801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A4B4AA67
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 12:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03BBF1769C4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A5F31B132;
	Tue,  9 Sep 2025 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVDEghpF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41131B111;
	Tue,  9 Sep 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413362; cv=none; b=C1kOvur2RfVq+09ZNwgQTGnhZqTRaw3q/0jgo8QBRxd0JayjZ94qrMaIMRD8d9JCAxCvlH0aBF6yUPoYEXuJ4aHKK3WtyzxVZH86AfbGyN7Gij3TcFK6mFbX91K+08x8BofkV2+62IFuIYP4c98wXtaAGin/gV66zbSGAzlGLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413362; c=relaxed/simple;
	bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=P95ryAzHI67XwK+HqLZPZSnA6wWECqdH7v1QOMptK8oGHouHlaCsEOZMPHzbeE1n96aj5JgYnQjBVaOl9MldITNoR/swkdl5S9gZpvO0sCmxKnbaQdnrRthQvx+cyxUjRvfGCI4NCJJUs7HtrVpaTeiEaQGVWcDPhROewzNmFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVDEghpF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LaZg011095;
	Tue, 9 Sep 2025 10:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRDGYxu/+bJt2MhHiUzaNfQZK0bE6dbbtqEE3qnHVM8=; b=QVDEghpFv2EPQwyx
	aSK9vMWWYeG+qyR/tvhEEpahzUlL9szs4iA+JU+B+b45uLQBmPyzXsYjAF5IHNtb
	jJz/ZPI2QTOKBkAKHF53i6r6iXQsRHAZ6C9t9MhEZROUBIRFGWayAlEceU2DPvDP
	JEvF0Pv+v8SRA8lXsIMkbOBGF0nGCl6JmXysKdPwKFfs8Pne9WU2V1s+kpj3Yu87
	YoQ+IJaaMgPiIUs6n7ULksko2xIOZJYXX8AXcuq+sqzQ2Ul8gLuuP1iy150R0d4+
	B5FRh9i3MLXS8i5iJtojCVltNQVKGVRHawsj1TGjAmi4o56CLDgn/kp2BXoWc+Q+
	10aqtg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0quym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 10:22:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589AMZi2019974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 10:22:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 03:22:31 -0700
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Date: Tue, 9 Sep 2025 18:21:56 +0800
Subject: [PATCH v3 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250909-camss_rb8-v3-1-c7c8df385f9a@oss.qualcomm.com>
References: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
In-Reply-To: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
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
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <vladimir.zapolskiy@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757413345; l=1125;
 i=wenmeng.liu@oss.qualcomm.com; s=20250211; h=from:subject:message-id;
 bh=PPvQswfv1qdhCjB6MEIyVjCke2cJxHLG29LrkfkdGFQ=;
 b=PkrDLkuDw5cj2JAJdIGiQONUWze0mnDLVMVAsoJAEcSvdk6DgPJNESflJiZk7TIyn9pjRjNtE
 iIfRanHQWwmDwL7jKPggZXB6ivQV3fviXV6XMvcqqqhTVNyNEcTSaYb
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xotwPOaCnYn8QuY34_0XQAbD_cixBHN3
X-Proofpoint-GUID: xotwPOaCnYn8QuY34_0XQAbD_cixBHN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX10Ie41WM0n0P
 2Cyd3Ft3rl9Ud3sbFE60Y4JGE4ZhJzdXiUj9WXBYIjcMhO4lo2eA2tvdn4X2TlXK51U4J2K2G7z
 ZU5YsY+t7wI4TQb9S+13GPS3RKCSs7VJiquDST9SjIqVErG8F2u1dNYD1k6DFVxY2DdZbKZGbM1
 EdolQNUnafADzzo+op2QAuMaMTpC7JRiDsyoBiEh7Jqe8ld6OA1yuiaUAwH35cEmRAfzYZ1ZKri
 YBO5Kna7TK/kXl9cLaaDAQNFznclACc3kCCJnnSKr71lGBTPEUh+IWIiK5G8Za3UF5iIF7fw17n
 jMFjGWp6UokSddH7Fa4O1txUjYgYR6tum4fydCsyJT2CBfNDz3TQoSA9+gCU5SrugmnC1hF5act
 yRirlnp6
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bfffec cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

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


