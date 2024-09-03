Return-Path: <linux-i2c+bounces-6074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4696AB3E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2837B1C21529
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101FC1DA31A;
	Tue,  3 Sep 2024 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9WOIsVW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480381D54ED;
	Tue,  3 Sep 2024 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401020; cv=none; b=H23oDBy6y1kdPlofkWHWMyPRLPzN2F/do1OdU8GNpRMvv8eydCVIAp5uvAPmMHpOV7yOT/dI84zn0+VrL/UJpTLyT2bEqkkniCbRuiqlCMWCP99DgQahZDiloLeA1wVErgWcV8qYAXGbNzIRsZMHCOjClsv0fVifOyi0w9mqpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401020; c=relaxed/simple;
	bh=Vv1l3JwU2m1l5qqaqDlG9EbiK1CO0sZEtkpknoEenSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AODlN0BkTyVgaQl2gfYZQUz06c5lwv0ju2Pvtvxs4ya4DDBoa0ZQuJHx5uPieRieD0xw57wHRNK/kctzzWB092lyZpq+IYCMSg0+udwZ6cKjNNcoWiQdzZm7doSLKTrkcMQL10UkIzvUhBOlqodxqmcolTvZWbQM7WYcNHmm664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9WOIsVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BUQPg003275;
	Tue, 3 Sep 2024 22:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kv5alMWxBJMXEJ7i6FIgHWdlQWXFtVM/SMPdMyBXwaA=; b=M9WOIsVW9mc2LP6S
	OSPt/ITD2HTAeWxlS3ghd+NObbdTvClrz/MET2bhsAvyUhmmeE5E1QaIavJRPHEC
	C/L2DTYmeNSnZFRgHjYvnGBnPoTzTItHl99qaETt2aKdY7JsCH53s5wqWulPsXar
	+zTrdcqzbBvYAYkb9meRFboVR6NaVzuva5eBwPeYB2ME0d3whHyNLAuSK2pR4Pm5
	XteQvHQ6QQjfFETlgp5xwZ8MDyOENS/SY4oQwVW4QBXKfJvCd0hPjTZZh8qjLsNX
	eko2BFglhm5X5pAWRwfog+y7so9OxCtnHR3TIrLIIVUzo5EcbRpGZfBOGvhIH7+e
	TBnGOA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brvf11uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M39Dj020328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:09 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:06 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>
Subject: [PATCH v2 13/21] dt-bindings: pinctrl: Add SA8255p TLMM
Date: Tue, 3 Sep 2024 15:02:32 -0700
Message-ID: <20240903220240.2594102-14-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o0vOtmtLWIPxqx1UnOGh7-L-LkO8oOUe
X-Proofpoint-ORIG-GUID: o0vOtmtLWIPxqx1UnOGh7-L-LkO8oOUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030177

Add compatible for TLMM block representing support on SA8255p.

SA8255p uses the same TLMM block as SA8775p however the ownership
of pins are split between Firmware VM and Linux VM on SA8255p. For
example, pins used by UART are owned and configured by Firmware VM
while pins used by ethernet are owned and configured by Linux VM.
Therefore, adding a sa8255p specific compatible to mark the difference.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index e9abbf2c0689..b36b29dd3128 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -17,7 +17,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sa8775p-tlmm
+    oneOf:
+      - items:
+        - enum:
+          - qcom,sa8255p-tlmm
+        - const: qcom,sa8775p-tlmm
+      - items:
+        - const: qcom,sa8775p-tlmm
 
   reg:
     maxItems: 1
-- 
2.34.1


