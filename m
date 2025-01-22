Return-Path: <linux-i2c+bounces-9147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE83A18C45
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 07:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D121D3A7802
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 06:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E86719C56C;
	Wed, 22 Jan 2025 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mi0mQVDF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154D199384;
	Wed, 22 Jan 2025 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528434; cv=none; b=rCKgHmi8E0Qlb8PuQb6cvO3HH11MXTbpqt0Oqb27x1KsSwHazqpc20POSKDIYVIrmPyui7ombr6u4twBl6OiWsqsiaYBu9Mwx+yJEceaC1vCvNnImflug122yLR1V03uTi5uOw7RIfsBOzYdyzQx/I5i6i21gw9Czhj5oWlR9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528434; c=relaxed/simple;
	bh=JLHY4rnuggNTEK2QGWkaQ3m7sVers72Ws4/W0DUPkN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jT6pwnZZrfC8IH15Fa8LJ47Uzod0g0HjFvjiWh0HRtI55bg5cJxAMZOMnB2ZmVkk2TpY1Ebr8Jo125VkPSOgSpgT1GBFIHdk/RA++PprfSR8cYyC+ZK0E9T6cGWuWxGKuFPDjlwhmH2eU89qW5mgfY6tl34Fk0yORw0NQpVFm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mi0mQVDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M45KZe027023;
	Wed, 22 Jan 2025 06:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iJnUutolXGy7sPzaMxKOI2
	+AmHLyRXoRjhbohBOxg08=; b=mi0mQVDFEgkfcKpIMHf3A9ItTuYFiujwLiQEuq
	3LDdUEKi0Iwb2rtFEbgrxKcie5nTItAINmxtdeuTzrHjVMNEW5IWw7mEjRMz3LlB
	uMH7dhquzJbtrA/aW8+lUgjUxWoafHJnraw2sxguP5NtIYn0OGm1ZAEZZVJs9r7V
	TxuD9phKRK9OY+kxNtncLKuPNM4FQUAKwwXZm02mlJ7qlZZFijIg9IrjkJ7N6e3W
	G0F404JuEOMUcVxN3DUP3eMDIKjHqBw9cQUnWeL3CK1mCQRw7Tw5auSqEsSU4667
	EFmLlQiUplzbCpvBebYKZyIj1C4qG+QEKHvBtR6fczYrSNzw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44asbf8abx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 06:47:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6l1Vm028937;
	Wed, 22 Jan 2025 06:47:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckvx6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 06:47:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50M6l1Ar028932;
	Wed, 22 Jan 2025 06:47:01 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50M6l0nK028931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 06:47:01 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 229C7242E7; Wed, 22 Jan 2025 12:17:00 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1] i2c: qcom-geni: Update i2c frequency table to match hardware guidance
Date: Wed, 22 Jan 2025 12:16:34 +0530
Message-Id: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P8NawMUnUwi7Y4maUbBMKFYtcqxKKseA
X-Proofpoint-GUID: P8NawMUnUwi7Y4maUbBMKFYtcqxKKseA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220047

With the current settings, the I2C buses are achieving around 370KHz
instead of the expected 400KHz. For 100KHz and 1MHz, the settings are
now more compliant and adhere to the Qualcomm’s internal programming
guide.

Update the I2C frequency table to align with the recommended values
outlined in the I2C hardware programming guide, ensuring proper
communication and performance.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..cc0c683febbb 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -148,9 +148,9 @@ struct geni_i2c_clk_fld {
  * source_clock = 19.2 MHz
  */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
-	{KHZ(100), 7, 10, 11, 26},
-	{KHZ(400), 2,  5, 12, 24},
-	{KHZ(1000), 1, 3,  9, 18},
+	{KHZ(100), 7, 10, 12, 26},
+	{KHZ(400), 2,  5, 11, 22},
+	{KHZ(1000), 1, 2,  8, 18},
 	{},
 };
 
-- 
2.25.1


