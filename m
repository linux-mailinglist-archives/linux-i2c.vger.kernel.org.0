Return-Path: <linux-i2c+bounces-14826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E8CE5F49
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 06:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 082D830136F5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240E5299A8F;
	Mon, 29 Dec 2025 04:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs1FFbJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJScILJv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916028D8D1
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984173; cv=none; b=of8v7J//X2r52yMJrMLCuJazDs04p0nSuScGjvV0K5pwfd9WCs5FPicPUkWwY96Q+Hop3MEOGFrpX8yc0RK6pnJ/XDEf8YX7DOjms1cfYR1I92huRODQbKfQa/3vlgXDXXnyPUo01IaPOHk4SL7ETJH/eyQKE/73Zw+4e29szOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984173; c=relaxed/simple;
	bh=dd9jcM7VhtLSe01qVKxg4cqsefq6fIxIf68B+OdANWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JcD4Kvm2XpQ1qd+ULxtgFLSY6h1nELXZdrTxCvpnEpjL9kMEz6u8fhOfHMbOOBnMyl46+94nfhZRGmgKkQEKgRs9ZYuuZUVscbSvbcZ7jny+0xBRMjGR2hy5jDVKs0L+R0OMogv3hYwj54jAOLf6xt8Bp3k03jsVSyFdgdKb5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs1FFbJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJScILJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMQfOS4149030
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIBNmtegJx
	j/sp5FwSU/fdzZauMmtoR986IcxrENk0=; b=fs1FFbJghCYmmqmmhZq0mGC67mi
	JycZwI2vrl64SdhvOG1vWGw3ZbkchnhXmRY49fJmPoouHURZYxTchUpSmvdMIApj
	27eLTrs4kuDZN4oHvFwN1JHspQLBJfOrxGzB68upTFYGsJyMGBhsvUad9g/vCgzD
	QBSyJx5B9m1O2IPAM/hVPO+S/7sJc8Ru6t760DWlaFHZg6ptE/59VxRNnyl96Od7
	75SnMGkPeYQ+t72LRMIcPfotk1duJAJB/TX1rxacTeNDEteKNczvYFtbqYXXdCYr
	9Zv85Np9lC1PNMzbDBcqFJzzZED9VE2kKI3ob0kGFmaeknLeJ5bH2XtWaxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5kbcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:56:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso18282340b3a.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984169; x=1767588969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=BJScILJvzWKrrF9RjND62tzPn9QUkZtkykuep6tyLXgjO6wc4wnrO7NT65qW24cvrY
         IccMqEhVeC5bFr8SITKvdYNobnDI+YMu4etXspcLTj9bS14+1YOLSVee0Dth67+t22Cc
         RU+t1hfiwp+LP3ccnsW5h5JSnXW0adkqgBwT4DIeE4HPzFW7S9/xEFc67q7bHpyPsD/W
         xWkIB0Ozrk4r6LZiTKY6KlA2mcfN0M0zQ4qDpCmae6hRFq72W/LukUmXO6f9gZC7vKzc
         mt6KUkO3M3NTpOcgCokro0QyDKWuljorQ43fk+x3iYRzDHA2HzRPPHF3Weoia7HNYgZK
         e6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984169; x=1767588969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=kc2ceZxU9eWHTe77UmUMAuT4mRzYgcPHAsMota1CaiSPbUZrAuvNSyQpFnvdjRqON7
         cTLRYPYR8jOMx1ZZ6kW5DJZfcV8cdN9KoBrYf2EcQSgeazaK/b7yrokH32jYBA5qTnQN
         ctsH73Y8QmmMUiMNsdvnV0Or691fdjFTktT9k/YrtTYNAn+Ics86Zn0QxuvD+fOOaESM
         FxePCi73r781ZeKTIGJyCSmQSpo3BCLZ0QsQMdFdGafkdBKNXBsbQCSHyJqDO0kT/0ol
         58d971PSRdJxSRnyyfsF+WwR9+X7sOJUaXQNw4AhrVJg8nTsjcEDxUEpx+3La4WMRk0e
         rb5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDef+Bk1moJrQCp3g/wOyE4lxPNv75c8UkYxXzK4/4AiWWcF1V9EYrx4W8tpk0fT4CcxOYy7qblos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFG2B8QYCnAUJj7j9CVmyhZ38YhAX5BMY/POYPz8IjnOzUU1R7
	CRJNe98wEvAmvlL8BXI9QDutsl8Nz1DCjMVo3087AdY4eAKTrGpZJmqmgfUM51IavjLTMMZk3WQ
	66lZY0IZfDey+pkc8SftkNDEnzkQOvTF5fWSxMltkDHZDBXVO1GpYq1Vi6FEjYeA=
X-Gm-Gg: AY/fxX4sG8ZqMOF3LF61zzBbWoXLEatT1FhMGA7M8ywlqvHaVHp7pkjyyLRKqC66d6B
	87hOH8BfMecBlYUkeq4IzCcsje4SjaG3OEl8tZi8+RZZCmudnCj0TidqJ4MCT53HOqDKaNSccTr
	a82fOsN/aXTDBx+UG9VwW4tTLxakiuGHN/9ypMUWG+tZnoRdnxhyTFNHvbZZA/HoBnxS5ISgpV3
	T8vdXpwQ1D30qfIazeOScmmdOSXsD6RhOI/Sph12ES/OXrcaqvOicHa7jxtjz8+Jojnss61XPG+
	nci/2OvD+YLZRuTSRCh9t9T+cPFVyQoy0ny0eA1P93g2eSmu07tbPU3JRXLJhaqclfl+7QVY38d
	1DwIaLUDkZHmeB9QBHR1misfc/N9MY+yqOrdGP6nrguo=
X-Received: by 2002:a05:6a00:3386:b0:7f2:1951:c130 with SMTP id d2e1a72fcca58-7ff66d5ff66mr27353199b3a.68.1766984169012;
        Sun, 28 Dec 2025 20:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR7M1yhRS750JdicCCmdoq4t+9wBUNIGOHfOwPohqIVn6OoIL6o7IqcuPL0ykrZIuELU6Xjw==
X-Received: by 2002:a05:6a00:3386:b0:7f2:1951:c130 with SMTP id d2e1a72fcca58-7ff66d5ff66mr27353156b3a.68.1766984168483;
        Sun, 28 Dec 2025 20:56:08 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:56:08 -0800 (PST)
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
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 10/12] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Mon, 29 Dec 2025 10:24:44 +0530
Message-Id: <20251229045446.3227667-11-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sY1UOkkFLswrVE7QR1rSP8PxPmx4w7JZ
X-Proofpoint-ORIG-GUID: sY1UOkkFLswrVE7QR1rSP8PxPmx4w7JZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX/fY9rVudIKy+
 qh7xyl1V2G8ndTk+CxfTu8IcEWHAe0q4V5CooceUgAC1bfnFAiyfjebueqyGT8nnwGN/jsLdzk1
 JlhUQ323wu4GKgS0JNnvwWzPCJfZ20WdMzUBbe+LHCROag6hyyh3hg93gzENQiTUTAVnmMhi5GF
 4rH5DupmZ1iZZ6K+YT8DvmLELaTh6Cnu9XZZgV+kI3UYA3LpUuoY9q5bdqUu5iqUTHan7V9N5lL
 EU5Aq1gmimKhxFYXPNOHks9YHYnkNAId0f58QSBt4JuBc55aLosgiMFxrmQJi99fpgjxFQ+vwEB
 VJhLr10o+iHAX2Xf425B2HN7toZ+kGPzr8bqieO18UhWv9i5N4vS87xF4A6Pok2bBTTKZl6CxpR
 p1NxjDNwI9XNxA1HBFueY0xTRuTLo/UyrL9OH9dOlpWMI4jR4I5FjKshasoh8fXfS/ZFAXjnrhQ
 JsKF4XxJzLPXtdzoTww==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=695209e9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

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


