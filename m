Return-Path: <linux-i2c+bounces-13134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF7AB9CC85
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274E74A0EA2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 00:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07035979;
	Thu, 25 Sep 2025 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlYZhEI3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF311D555
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758584; cv=none; b=R5j+95HcaOqm8soANzXZjafxI9c/SNJ759N26esmdE6nrY99T78vXXN6ASmjyxRAYkMtvAJQgPJUQ6U21d5aLSOvgPzyxdIMorC5svOFV79Wi/+50lyhZ7lkyYUwNRtX+vlQmr5JlG4FQjefcE4sZpMvEEM8NJZw7QfLUg4eGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758584; c=relaxed/simple;
	bh=K2mUDJXRZv+9+neVDLWp4StQfNo9IAdiHfJqlB/hRI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRh+w+mlAv1UEppERFpZc8Lx3q/VZuDVChy/4YGHkyTrGfwpmG08pIGcqn4On6kd8fg1rYV5yiMJxzwYy3myyef88jJ/bcq0z95WV2EbS5POtRM7Gz5J9pUcwTX7u94zka+BSlT7ubkKRf3uWBCpxtKknvA296FmeFjB0CCuwuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlYZhEI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODAm0B021499
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4OBEzR87oFsou54VovKNGgttpO9q+7QSRhhR2iSBns=; b=GlYZhEI3/un0+yt6
	3sVafURjzYYKuUyRoCOOxfPU8j6WS2hlJKW+i/xczYuOlLFB3BTY03Z0/eXM2DKJ
	GHl+1/18ff9kLhXvh/baKJzhg3tstqIW9NOQTS+WfXMlxEeosmf+rNUPcHHMIjtl
	cJkQEG/Z2BXOTG+2GcAeRA2N72Bu94ZW4YHdQ0XFOp4k8Cs9Bljlnm7qXG/oNDX2
	rOgjeIU56R/PMLnXubAPCOZ6Iz3yzZCjOw5bfkZehHahe1O/3q6Yx6lqLpVJ0Pc8
	DHFZADrarVnYlkdwzW6IKqZZ+BkKzbmC6JWpIa5l7yJQYhxBMgUPK52ibfxq7VOk
	hLkSRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadnt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:02:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so576231a91.1
        for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 17:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758578; x=1759363378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4OBEzR87oFsou54VovKNGgttpO9q+7QSRhhR2iSBns=;
        b=d9fKW5z6cy7yXl0co4bDqaUZRFcT/L2YXpD38OSf6kC/NO7k4yu5sJ/sIssEpitJny
         bnwamrvi5HXiRrHVs6AOsn4saKybr4T8wQSCGRoo2PPvydIYUALJWHU4vpAUGNCOjxv4
         Uvp2v90VwLsnz6EuXGgoo3aTLGK/Oo3W6OXAYZwId+zNbGZ4gbwT7iKClUBI39wk3ueu
         LBezDaq+wtJA6479H/RAUc1d8FFaW+QsUc02AiqVDUgrRFs96N3HqZNe+FMahfriWY4s
         qx1q3i/MEB+xiSj5xYFe4H3Y/uc/DK1b0FdYcwTeSU1Anx/7IJMi0868suI1DmBILxJk
         jkNw==
X-Gm-Message-State: AOJu0Yx7vCU79ZU5dc1gD0KplB/FFM66gN6/aUpmyU2rESq0S2WnXO+1
	3T3fNc08M9GvpvktJ9iP3AJVkLzeXQDB2pVrsQAMFazuTpRfTD8qeVmgjlcllg5E+25TQyjIVQ2
	czN3WWhZ0dyL+Aras5UbjmVw5oLd93wlS5XMttVRZATY+WD2NMqEdsE2v5R8aGzk=
X-Gm-Gg: ASbGncvfMbCVKPXLbdNl4hsdTHs2nU6MQ2QE9Z6ZsnGHGXzreFQrkYY0Lix3taYOPSJ
	fLr0aHP7HiHAqrXjFoq8r7OJ2/5ygQYJY47aVMS28MF3ozmy/gu6FHEWjvgyOkOYitrsl2120kn
	MNXRWO8Cpbwom4XmFUFVUOy6MyTzcoRZdmg+aMZX+sS0Joe19Lh6XutrdVQijvLNftV9YHD6ARa
	HImeZ2B8+KUoLNLwCL6DSXQN5srFAzXwmWbuSb92IxhdZD84aLNFzCVZwD9ul10SSUhAQZEzVJE
	TKOGMWdPIHGaCV6AOPBJKrxY3XRZKDnUUUoBiq2t/AhXVVIV4GZex+6Xy9zeVSnoU9T7qInbJkj
	4p5IRgPKuXRA3ssA=
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr15084155ad.61.1758758577880;
        Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzjJDR1kYcH4sQH3cYrBVjWXozwj8iO3NzKQVXwBx6AN0+o+X6+UwyN0HdpPfs0t5yyVWI+w==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr15083975ad.61.1758758577445;
        Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:48 -0700
Subject: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=1486;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SnKFLRNYosTxuqZVX+B0aQPl8RyL1Uf+UAocMiXuIuA=;
 b=sygufknQTjfr3CN/gzxxSYpzHqiUEqe2z6cQAJeRpI62jPUmwGqLOqCZ4lU5kQpOX8jV1Zgk6
 I/2lCxstBxCAPrx+cOrLKhy78j8eeMhO4V5GWgSZUOsiJAAUqd+018Q
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: -tsV4FL5NFxMlmIdrW7Qk-t2Gl5WP0Jw
X-Proofpoint-ORIG-GUID: -tsV4FL5NFxMlmIdrW7Qk-t2Gl5WP0Jw
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d486b3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MM0Ubo5ZH5qwHtlmS8kA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXxYZhSsrrgJJJ
 UiEZ0bLZs0YABZEV4KqVtE7b41dE8udAcp9uPVnFWYXItHJgOypmA2I79ZxSmBtanOeB/WDT3pw
 kiDFzRBOqpS/K1ngQXbnhN7W6RBdkLfDhRGlpeFA6VToRosml/1k2nMn5cutz7qRTdibrZxVMAZ
 whwW7tCzpJMAypPEWJ4YLpDv4rraJXNJcYnkOyPgdAGA/WxYR7IdLffc2N6W3yUU53CYuNtUxLY
 I8HPgoQBejtuwQg/clu4cActzZl/MmwH+u0WWCnFxB5NBAuB2VNIGex8Qny1bBhRoMDQa7RdEBR
 PrTcvUgLM779MwxhpOweMSKYHw+hcz9udiKIHq+tw2JfwF84RyJbrGHIhxcK/Zf5pbQUmRS5uAX
 XN8mDOZ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
of clocks for Kaanapali requires its own compat string and definition.
This changes the minimum number of `clocks` and `clock-names`.

- const: cam_top_ahb
- const: cci

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..85a1c9738afe 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -257,6 +258,22 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: cam_top_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.25.1


