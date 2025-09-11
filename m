Return-Path: <linux-i2c+bounces-12896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 541BEB53D9E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 23:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611AC1895B97
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 21:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FF02DE6EF;
	Thu, 11 Sep 2025 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JooI/OAX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50089229B18
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625670; cv=none; b=dCQjFHt6Et1tUNw+0cQjE4o7hDOLyLVLU0reFYqvEqJevvPzyN7X2wnVX/XksUEvggLknhqZFTW4tAgiUZoX4FX0xlPIXtQIWdmAC5hRArO2l3/C3mGdbX92XqVebQWkQxGNmtitK/RlDfzXFYbovJ7LEJnxZdpolEfwaGUCMBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625670; c=relaxed/simple;
	bh=7HKObMcS0bG/xYgR+s8o/QEbbBnC+A9rwJV1ihYzxO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EimvUj+Ei8kLwCGiH4QTe8mYJuNFWJ7kig/m2w7iLhIcMIjxaRSO3FtxkiIdOz0HFgqog5uBdDk5Lg/OQHcfAj+/3FUu9sbkh60FGp8DalGkVHBpBjvL4SvRvtt8BsiZlrHjEEjwpvZmqC6U5fnd8Nm1rfOftZR3Ce0WNLmksX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JooI/OAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJ4YqN008859
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 21:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=skpxVi02HZrlESlDioFv56nkinK9bp1CNjc
	w1o5RuJk=; b=JooI/OAXMknJIfcjBABD+zZ5hZ9EOmm4NtQO5fr08E0AbOPJ57l
	MJxCknc1H+8zBYTPLk7DraMAw+uVn9rz2SQV6SoMjm7R5/VmXk6Ho3+Q5jz7SakG
	tNkb7UMoxwMPfggdu9j0HniygkdePyeTDummt40dVbsVAU7OmRAlpe3AwL/TJa7T
	2hWk5pShmB/KDMOS0QYUwTJ9CqyUZcHyMyNlgx0YW65Pr2YO1nTPheLHobi5f4EE
	Lhvv1IdjhlpybsOL1W5tPXPIkf0GABICOoSorxHXEbcb0kFjVzUA9WnuFJ6kuRWr
	ccAhXHRypg6wMe1gYB5gN8qO0JU/2cmb/lA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapskeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 21:21:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7671821d5a7so12816886d6.3
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 14:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625666; x=1758230466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skpxVi02HZrlESlDioFv56nkinK9bp1CNjcw1o5RuJk=;
        b=Q8fYUpxY2HA2eieXhH9HGUoxgfbXy2jrAJykT5HABEF9RwCIKp/PUOETengOVEG7yN
         XoUfivLrOur7At7+QtAawn9s836t3ZzSScQcDDIwi7l97NJ26nCXnKRlL6x+yt92U4D3
         EC+at6Omt+o6ojNgco9Gt2wj+dWtuvhSc1/RVTXzwZwZtznuwlOGxrTtXaypzqxR2L3I
         cyry8UNt7HWLMxezkLOUJtO0HL0xfM+NWy0FkrNjqv4iP4VOsiQp6DrN279NTh7p69tV
         h7vD6Mj6Gywxe4LGJ2j+lRVAudnbsY4sYtV9njQ5dcP9iDKOTXsAprrly1VfmWza+Yqd
         UB7Q==
X-Gm-Message-State: AOJu0YwRj8ZpIxnRQ/G4OAbtghXDxO4Crllt+6tSsVwM/hGaZyGil20P
	+Cq6UYNr5d011fDWvfj/S/QQSKKFC24GddewjwtFc04pNmZi9dXemX+AicM4CT2gXvauvez24GA
	DCoUA2e3PXYgeH/jmJrWQUGhdFCv8qpe0YWPcTbI4CwBTVLNdwk+Vsr0H5sFYcu4=
X-Gm-Gg: ASbGnct24uN0VE86c2YNK2tlhIEiB7UEVNf7Y2iKNfLoS1VaOLK4Hmc+WjajaxeXzHM
	nFvFEXUyn01PN/AK8fdYBy5Oz9FmuRpCcwRv5yj5VqlqBmQllFqiaN37RrD7H7nCSnoWAUykd09
	SML/i/5vG4ANC8VwBD6mcaICFDd0ch+7n5OwCgV2RFarbrJSFeJH0WPD29lfHwhy8szDUNgHj5G
	PeSV7TzS7+3Bp3l92MTUn5Qj8r6LZIwtWeQEOQPDvffaOyyUn361fK2Ti5FFiqoMuUcj0YxawB5
	wJaNUodaEauq9A8d5UMr/1+w+bP6URM84C6xfi1zA8AGH2iRGcRHezFmagFdSTbX48CSwg2FH50
	=
X-Received: by 2002:a05:6214:2b09:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-767bd287b56mr10462386d6.8.1757625666222;
        Thu, 11 Sep 2025 14:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHpVcUbJt6w3i2oI9zDeKvQh73YEpqoT8PihoTUvwa9PwTBX7gGMHfKElQYoKWqsZnNP03vA==
X-Received: by 2002:a05:6214:2b09:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-767bd287b56mr10461536d6.8.1757625664925;
        Thu, 11 Sep 2025 14:21:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3c22:d6b4:15f8:475e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm21843935e9.3.2025.09.11.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:21:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Thu, 11 Sep 2025 23:21:01 +0200
Message-Id: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c33d43 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=NlPZ1nVzr820ScHG1asA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NZYNeUnb4CHubF_p8F-3pkQESZfdIAKG
X-Proofpoint-ORIG-GUID: NZYNeUnb4CHubF_p8F-3pkQESZfdIAKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX8efPFZtYPoWy
 YsV0xo5PK7JfNi0ro9MRjvzA6LezpQwL+boUrHLq0pEtudZiYMdAKYZCIkPw9RP4890r+oCeJQy
 pNpqJZwDDPEe4gzIRo8t6zYYyp9wKZ+z8Q2hvY4OLi874KZN5rNUvvHAXzvGKnLWwxux15NPKgN
 4O2fChX/0e8ZkBTbCUzkuq4n0uZIrJGA4Rf1amwnUoVyMInpcX2NxRUJbqW7Vbk6FlozSETh9OX
 Rzt81X2nLO8lXRZKMZtkbTki+WuXUlw5uYcZljXB6F1xC9XbUyLMLB4iPy4lxB3Yd05xmu8/jWt
 /gwX9H7MdBQL6otD4eV2DXrwICXpRaF23olTmZT34adq0MEyHNUNgw3fka5vqxkt+1exT83IKTi
 GHZDAAGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..83b13370ff6c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1


