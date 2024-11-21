Return-Path: <linux-i2c+bounces-8123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEB9D4D67
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 14:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EAFDB26284
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 13:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EE01DAC95;
	Thu, 21 Nov 2024 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ByfvWtlA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1EC1DA2F1;
	Thu, 21 Nov 2024 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732194135; cv=none; b=SWi0EPHWrlGnFe5pyR7ArL+YFFzoHQQ5cgsvhMgyC6bB6E1oF+etUbs/xRxUApGb4+mu+EIPTx0tHWOKkxRoutCSdidsh/JNh6OJGtjHuFf5HrTtAiTKy/tmebwc2qzuMJuBA9n/npITXVedNfHXDR7GISryaVgYHko45q6lC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732194135; c=relaxed/simple;
	bh=Q+YgNj7yCTjvS2aUQtP7zHOve6t3ng8iGCrn9MR0YKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6J0tLVY6OiL9gI+uqGhfD7JGrPnLZk8ZLbHUb/7WJxRQOk99/5yCLxmzIGfv0+GX96TCyAHoS49Fx6lKmkoVZqds/wXaXdB7VUuqPNB6Fqo5LBkHEFcDD5FiVvmHQ5f4nNu/ykuaicCVG0k30Cr9Xx5OhAfnuTcTVmPtcim3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ByfvWtlA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAb2rF004466;
	Thu, 21 Nov 2024 13:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBGeM6vuRogPGAF8P1BzmJ83
	U0RJOxSb3xjUKacSltM=; b=ByfvWtlA7t7DPuX4kQsCTGmY51s6GRDWR92P//Bq
	WfbqGWilCTW3J78/zaCqSbGJ5l7vDIysbv4gzWat2l34MzKBtoZo3ttTt+58zhWW
	q66jwU5nNtR7daBQOY+PSnLR3I266JRtmVVTy0IjxwquLnlDZVRqOPBYCuRMTve0
	BZwBVPNtSLAYR9HAKsfvw4XWF3SqmgiDvxsp7nO6KAOVdO+cpGmfLzyioopYwPe8
	6Riy8Oubq+x2mP4nXSXed+Of6Kk4pNojovl4cxot+v+LaANE/zosC/m9UHWNHFm7
	LxvXuCxghVPNT1FvNeXCDuiTRRSuWPHI2ol7sZOVShcMfg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea73qs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 13:02:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALD27bV011694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 13:02:07 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 05:02:02 -0800
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v3 3/3] i2c: i2c-qcom-geni: Update compile dependenices for I2C GENI driver
Date: Thu, 21 Nov 2024 18:31:34 +0530
Message-ID: <20241121130134.29408-4-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aPYn11NHq_NjbRDSyoA7m7bcQ01cmrop
X-Proofpoint-ORIG-GUID: aPYn11NHq_NjbRDSyoA7m7bcQ01cmrop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210102

I2C functionality has dependencies on the GPI driver.
Ensure that the GPI driver is enabled when using the I2C
driver functionality.
Therefore, update the I2C GENI driver to depend on the GPI driver.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
v2 -> v3:
   - Moved this change to patch3.
   - Updated commit description.

v1 -> v2:
   -  This patch is added in v2 to address the kernel test robot
      reported compilation error.
      ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!

 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0aa948014008..87634a682855 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
 	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_GENI_SE
+	depends on QCOM_GPI_DMA
 	help
 	  This driver supports GENI serial engine based I2C controller in
 	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
-- 
2.17.1


