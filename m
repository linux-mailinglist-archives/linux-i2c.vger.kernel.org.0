Return-Path: <linux-i2c+bounces-15044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABBD120B7
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D88830FDEE9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EE134CFDD;
	Mon, 12 Jan 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APEHtDhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSPxGJpV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E688346AEC
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214921; cv=none; b=oF7Pmh86Lba9JlwSYGa0Q40/aPLte2HrNJbCRT7075JSgWCocw7FH1qACDFOW2oCgA1oJe1OAWrqyUI9V5OtjJQKiUmTeTgC8vUIWQ6Lg+ZSA3wN7VSoYifiCGfG0DeKcl17e+EUT6fUoG9YZnUfJHRE63DWyPCimHBa0PMhZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214921; c=relaxed/simple;
	bh=dd9jcM7VhtLSe01qVKxg4cqsefq6fIxIf68B+OdANWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwfhBwEvQHreRkuJQGvzaQE5dNWdNK2ch0N7xTVcQZSMmeC8yFD6z2ZwewWWdgRT9/O6N9+WUQxNjduTZ1WaHmesux2dbQefd1tWic7cwxGHl6MvFAgWisNMYvAyScZYnr4FW1LxUf2CxLc1kOjle33nT2nKos8Dcf6GvojlC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APEHtDhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSPxGJpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8s2kf676100
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIBNmtegJx
	j/sp5FwSU/fdzZauMmtoR986IcxrENk0=; b=APEHtDhiRbaCRFcLNGq/lGmYY+I
	rDWnWzMHqXoiAkdcDji0mmzqSYEkodeUTGVXVaSFTP/lAyQxhJk59Kb7qy2sKbsX
	BFYyFQA4mMBQJSpIFAlP1XaFRXyq8sA0/zIhO2ThLMDRoYqncL/S02PcGLhz6PvD
	RL7Ij+QKxK/rT7c8E9EBGcCjnefW4mQp/O31Q12qqnD9+NzGEEiIuukmGIRbAwXv
	GVQCQ9TjH2yMoX0wo0v53HeKt7v07iBGHUJPbsz32bDLnZ3pifwMRuwuixqXmWWO
	vwz4ezXprCgxGwhUl8iYjD5RW/q+xiLkqQGSxizHyfNlOUXxvisypPsSORA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur8bnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f404f4165so1042324b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214918; x=1768819718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=dSPxGJpVVP65n1b3YkvLtJg2yX+Pep3Pq4e9uOB4sfQBR5qRVrNMdcwEFjWjt/MCYP
         vZ4KP7jVyUJz+D7D/tpuwpf9R65QHHWDnB+TjJ1dHmwpNjVuhSQvsGdd34TiVWIp3Yy6
         dJhIZXRAmUBIvJYdDP8q+TGintc87gZa+1UEN7xRdd6Ar3oBPLFvmBqltSKPrDn+E4pU
         RnP2Exi85AKt+rFjYn3If2KhE2qJLuo5j5ZXNPnYWSRnUGkxwUbF2du7DsBoZ/4Ke7O6
         RrJvQNgWQ0qDkJi4g7rN/mPFOlhXAweWXU8xRII9cNmvJ3Uv2xr4FI/ovvvjQjrk8d3+
         0VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214918; x=1768819718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=X1i1C7NGAhlkMA2Y9lJdBcVrvNxkiAfpTWElNzH3eHDR5UZ7DQYNdtCGlBoTmmeDVR
         TP+vIKzyGOytTYVE59rGoa47zmgXdyHvpeQbLOmqwz8Oi4sSvkNj6MK0+09EjquJRsTN
         kalEzUcMPr5suXXbQPnbsOXTuD+D68wUJViTxzVF5g9/tQjIci3vIXDgYJBWBH1Mb5RS
         H3Hy1GFI+F7V97yAqbq3utaC3TDu+/FyzMgamN5eap6Yu+iM74/nQM+TwCLpOYlvDMwa
         pbQ5cJ3sZqw6zpwx3Z+xrdRS+mvsHluO7yqPMhfoWQLwzFaChlGMzoQh+FE0pKZQKrPD
         HysA==
X-Forwarded-Encrypted: i=1; AJvYcCXgZafXUBMZW/pZ5sbE7VVvRuVRMqcftQjpfENSdH7hwey8+r71yh9lwKSHk8rgtMzoJX8l/b0uekE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRz4A10iZrGZ2+NTZ3ATr2hxhc6Iiz/BKTa+ORkldXG74gtEOK
	hFQdPw/8bse6i+37dwJ/mCXtS4jmqL4Ogig/m0ASKgQuDAf1qw04VbjZAyvCAnNzF+sDecsjEf/
	ZSdKyH6L+jmPc7rD77n6+0q1oiaDCDfdMZ2e88u2rqM5fFUMpH8Rrq/3U8iZI1BA=
X-Gm-Gg: AY/fxX4EyCK6bchz05fHtn3WyaxA/EwQmMQJ7twjBDZTAFbGuvuL1+K1RzFlVi1fEzP
	5Ee3xfombpWLC6aOj6+azqq5AcY9+hYemBMXJcNnJUWdlIYtYNYpPovE/rDdpfAs1BHvQbl6OHD
	vG0Hcm0+DfsZFn0byEB41rbKPN3rA+p7WNZCDWK8nDBCCgFHhiEMQLiXtqk2LkWB7RkwyyD6hZn
	gyh2CKkoj47/EHYC44OB359aiYECvlT5NBaZLN9f2yRPMVW9DxTBRTwis8gs8o4JAtXuFW537U/
	80ji9/bdGVAupFCBNs8xBcGGEYPRnbKdYY2WY13DYTBV7zd7p/KVGWUQLzU6jbf55s1dE6uaZLJ
	UfXObjfOXAmdJQmDJEjYIa8V9noG9QbjAFMOD8Bpaer4=
X-Received: by 2002:a05:6a00:ab05:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-81b7e2543afmr15060518b3a.31.1768214917816;
        Mon, 12 Jan 2026 02:48:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEujJSJH1anLHyWKus4uNWOXCEe7xRR9ncKzSbzmm4aGIbe5t1Y+jRjez+8QTuXbWJxFmHvmw==
X-Received: by 2002:a05:6a00:ab05:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-81b7e2543afmr15060501b3a.31.1768214917253;
        Mon, 12 Jan 2026 02:48:37 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:36 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 10/12] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Mon, 12 Jan 2026 16:17:20 +0530
Message-Id: <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX6fDjoa7pPFf9
 s4o4ENAcL6mm03ADkMe7yr6RJJKIVDorsb7bb4Eb+kkJhkE7inrf7jowJ730ztVIhLcUKwMsLXr
 NpI0/xkO1C15jK2cCOWhNcyhs594/U/gdLZZoRw1btt5+WMf/lkyribaoJrc0bQ+J5CJUqtDJ//
 BnFvUIEapvlPLfuScOcFXpoV+XE5Xv7As54pPr66jAKb218Bxh/Mzmk9s0f0WxJCd9vY1auUsNt
 Mon65MSZgDieID0s0vcvsZvi5XtKLBpuyHPQQ5gym6FPXfRUCgZhKGXueLMjobVlOLdzoIYEBco
 N3hDDN6Y+I0dnMhlKZ08cEeLFRqV/MBof5gYOsDwr/MEcBYyolT9UCSsTDyiLMze+k9MqqBINxV
 jA+LzYSB+Vu1t49XkqnzrBBQBkiS/kNtPI2vcakoUhZUVswImdsEtRg+1h4qt0A1wUr7PsG1UIY
 oiWMYw1bMHvqM01rg4w==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964d186 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: M7vKHhdvThiq69_mubDLAQLOfhYsYZSV
X-Proofpoint-ORIG-GUID: M7vKHhdvThiq69_mubDLAQLOfhYsYZSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4b13022e508..b0a18e3d57d9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1179,28 +1176,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


