Return-Path: <linux-i2c+bounces-7591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF349B0CCF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 20:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC97281BBF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 18:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608B8215C5C;
	Fri, 25 Oct 2024 18:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lK8mgHJ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE2215C43;
	Fri, 25 Oct 2024 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879845; cv=none; b=SBH0spvxXXQkTPUtdghb0tNIK0o9jXkImu9arL9SUEIqQQbE5a3Up58kLnvf/LHnJ90MK+I1lr4j7M4NqAnkQnX+AJuqjdj2U3Djuv+4J8GYdhFOvSQhGQ+i3+ntFuYZYDwahw0P130au/KFQmedEO8G/fvgNL2IQhVaYez6o+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879845; c=relaxed/simple;
	bh=cFRIS7JRLucwHT6mgPvTK/dvlbTiUKQXj40jaViXIEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PWfzHCYi/ZU0ynkXwXPuQv2mZXODUJqTY5giLVVvbPjMPJgQln/HYr8l7M9+UC/4qelnU6EYlfRGmdcspFctbae3poC8dPOnTf9fOYWASpAe7Ydaj4FC5KNngxb9KXjOmm4tB2n/kK7k9T5OKL01MeX9zbIK69Ho9x5X5Z5DNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lK8mgHJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB5p6F015464;
	Fri, 25 Oct 2024 18:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s3ch2zK6btPv7A60igJHzQm+
	J69JTW97ZJYE7PmPEAQ=; b=lK8mgHJ9TGYaxCP5WNlYTD+ksSVgM0l1I1IzgF9l
	GoAbcddygfvpTfi3S4byWi78/j1OetgmivRqIxzn0lHVuv24FqNSpqcDJA18w2+r
	rgRR0+5NmnBCuXfArpBpWUX1GERhvhFz6/Wu1vUdEUV6PafMQ0hlU9EqARtrWTl1
	D5NVyh9WWUY1AtJ1PQiBEeJrBnCXW6qQQ3myxi7ns6KHeENXwGdnI6smk40yUPGQ
	yu7d8aGtuToHDOjdfbf1rnhtE+o8LaSaMCKo92QkURFPLtlAl0QW6qQN9bSUrp5Y
	Ixls9s8VUYyvEBh695ejFtUToPr7bhSFhI7dt4ciRXo3oA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5js9fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:10:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIAaSH023534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:10:36 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 11:10:32 -0700
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
Subject: [PATCH v2 2/3] i2c: qcom_geni: Update compile dependenices for qcom geni
Date: Fri, 25 Oct 2024 23:40:09 +0530
Message-ID: <20241025181010.7555-3-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241025181010.7555-1-quic_jseerapu@quicinc.com>
References: <20241025181010.7555-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Q2fe6d4KJLup6da60XW4fCBufT1hz_xA
X-Proofpoint-GUID: Q2fe6d4KJLup6da60XW4fCBufT1hz_xA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=894 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250138

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


