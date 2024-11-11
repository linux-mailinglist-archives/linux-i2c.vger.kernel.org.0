Return-Path: <linux-i2c+bounces-7925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D89C403E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 15:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BD801C21C45
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A8F1A070E;
	Mon, 11 Nov 2024 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W2SferVr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687081A01CD;
	Mon, 11 Nov 2024 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333809; cv=none; b=ebc+dBh8q8uS1JPZfHusT2Fj3Yna3uLzIcSgNMCzQmGfFuUFCkM9ux9nTr7N/tzk0uD2879Gvx1wLZ1SfqWtRHzWMHPuhrh1Tc7XC4MAgiJF82HyQnIxP49bpdT0aUzm3RjsgpCZIA/v72OYt+GpTxmDKpFcqs6Pr4BQE6R02vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333809; c=relaxed/simple;
	bh=cFRIS7JRLucwHT6mgPvTK/dvlbTiUKQXj40jaViXIEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MFkUxOnuhWHLf2LPlwGKAZV5Hkbfw+RX2+OtG69PUGuax3EZrYpZwltHGUb4KlbfJUuYG5R5ElBKliYq3RH7O95FDL8QoMEoptnxkupVdh/LyHo7E8Z10UUFmP3RrCAFk32amk5qwsbn6IFdmF6z61TQFQ9p+oLA66E1R6lwDYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W2SferVr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABDDgIQ000996;
	Mon, 11 Nov 2024 14:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s3ch2zK6btPv7A60igJHzQm+
	J69JTW97ZJYE7PmPEAQ=; b=W2SferVr+oOLNJy65Gn/2fLvxuUyeUue2sF/FEhW
	NTcqL1js2/A2YrYG1Fo7vLacIsOmrFfaAiMVfBn6QZamQqS4aofrvcVaHn8EdaI1
	zhKEK0j8rgs2I5+nc+h0AvDbLVGkzSp1CskVRz39oydtKQTWAO/0Ibsg8bqOtLHU
	3ptFa96Gp2RzaM6rXSkQYxA8G2PtmY0F1Ae73fX2M+g2Siw2PxY5IP1Pnagp0UQr
	DJNulvCohxW7oOTAAktcWnw0Fnmfqa1uqH7rGFN1PUmm5zb1mw73u+lpMAdRQhHR
	HDFNK5R2f4ex8psfnnAtO1x35woQ//cURhWOsTw9IxMYrw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0wjv7hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:03:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABE3Iqd018042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:03:18 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 06:03:14 -0800
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
Subject: [PATCH v2 RESEND 2/3] i2c: qcom_geni: Update compile dependenices for qcom geni
Date: Mon, 11 Nov 2024 19:32:43 +0530
Message-ID: <20241111140244.13474-3-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-GUID: SkJbrxnqQOHJ4HJOTWjoHmdudaNaGeMU
X-Proofpoint-ORIG-GUID: SkJbrxnqQOHJ4HJOTWjoHmdudaNaGeMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=868 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411110116

I2C_QCOM_GENI is having compile dependencies on QCOM_GPI_DMA and
so update I2C_QCOM_GENI to depends on QCOM_GPI_DMA.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---

v1 -> v2: 
	This patch is added in v2 to address the kernel test robot
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


