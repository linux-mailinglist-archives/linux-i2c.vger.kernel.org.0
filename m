Return-Path: <linux-i2c+bounces-6335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2696FBEC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 21:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811D4282835
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 19:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0178C1D4609;
	Fri,  6 Sep 2024 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hAngnSiW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA521C7B68;
	Fri,  6 Sep 2024 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650071; cv=none; b=turl/jy9ArScD49uKzERET8iDCRyti0Mii9ILaF7BOPdqC88+nPlUAq1Nb+HAUsUGC05L73c74ncAOjzS/em/EfpzTefQg+BaNZcP9+N/ON9WLUjZtXRSmqTJsNoWOhyqgFo/krVD1NogfxoQKn7TzvhlQEVueYmLUDIGki6dtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650071; c=relaxed/simple;
	bh=ZvJZWzdz4jNdMO3kOKAhwF0UfgUENPl360oLYkkdpSw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aJ9i/RHZrMcPqdXqp24gqugWbjhYKeWxlPs4Vvn/ScDiHOaXUQOX7rC0E23f/r2xxrPJbW10J+tiuGo2iXz0DVjbZye68PRp9dM7tFF2FLf1GqLzGkssnJfT6rcMfJXNTeMN5yRo+Sb+GFi1gk/E09XePiXCpo2Yk74us7rwXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hAngnSiW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868sjVC024778;
	Fri, 6 Sep 2024 19:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FW9JLL9skAXPxLyeTf+kco
	n76yi61/xeR0qeqfGZIo0=; b=hAngnSiWtogbQAfRdZcBB8s0JEEYeLyI9ymB+e
	vIfzFiW/33C2MJh9SD/+k8+onMtQpYsjgs06enjY7VsK+s2DGgZumhdLYxuB/2km
	eg//DdJ6H7qm28XZ+tuXiqzWQtrRkl0B/pk6FcEjjy5GzBu+9Qo+bqFz2vC6wTqg
	wtgl4jZGktKz7cduIbPs034jW4rdyXxzIhq7xKqjMuxMSP7mQzbbeu9hPhbzNKQ5
	Why/oE4ZOtJVC02sr6O86brm3Ae2HWa4uLjy5OpEGNPwRDNwizvxWTCSYEosplPv
	YQcbgxjlErZtgx6p4KK33tuKfu50A9VGEAzzlhMxOBGveaPA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj03b4ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 486JEG2M012919;
	Fri, 6 Sep 2024 19:14:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41bv8mxxyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 486JEGOT012914;
	Fri, 6 Sep 2024 19:14:16 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 486JEFH4012909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:16 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 00FFE240F3; Sat,  7 Sep 2024 00:44:14 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 0/4] Enable shared SE support over I2C
Date: Sat,  7 Sep 2024 00:44:06 +0530
Message-Id: <20240906191410.4104243-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: kNJkQDQEvelD5F3nBq0hlLibNHD80gFM
X-Proofpoint-ORIG-GUID: kNJkQDQEvelD5F3nBq0hlLibNHD80gFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=746
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409060141

This Series adds support to share QUP (Qualcomm Unified peripheral)
based I2C SE (Serial Engine) controller between two subsystems.
Each subsystem should have its own dedicated GPII (General Purpose -
Interface Instance) acting as pipe between SE and GSI (Generic SW -
Interface) DMA HW engine.

Subsystem must acquire Lock over the SE so that it gets uninterrupted
control till it unlocks the SE. It also makes sure the commonly shared
TLMM GPIOs are not touched which can impact other subsystem or cause
any interruption. Generally, GPIOs are being unconfigured during
suspend time.

GSI DMA engine is capable to perform requested transfer operations
from any of the I2C client in a seamless way and its transparent to
the subsystems. Make sure to enable “qcom,shared-se” flag only while
enabling this feature. I2C client should add in its respective parent
node.

Example : 
Two clients from different SS can share an I2C SE for same slave device
OR their owned slave devices.
Assume I2C Slave EEPROM device connected with I2C controller.
Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.


Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---

Link to V1: https://lore.kernel.org/lkml/cb7613d0-586e-4089-a1b6-2405f4dc4883@quicinc.com/T/

Changes in V2:
 - Enhanced commit log grammatically for PATCH v1 3/4 as suggested by Bryan.
 - Updated Cover letter along with acronyms expansion.
 - Added maintainers list from other subsystems for review, which was missing.
   Thanks to Krzysztof for pointing out.
 - Added cover letter with an example of Serial Engine sharing.
 - Addressed review comments for all the patches.

---

Mukesh Kumar Savaliya (4):
  dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
  dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
  soc: qcom: geni-se: Export function geni_se_clks_off()
  i2c: i2c-qcom-geni: Enable i2c controller sharing between two
    subsystems

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
 drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
 drivers/soc/qcom/qcom-geni-se.c               |  4 +-
 include/linux/dma/qcom-gpi-dma.h              |  6 +++
 include/linux/soc/qcom/geni-se.h              |  3 ++
 6 files changed, 74 insertions(+), 9 deletions(-)

-- 
2.25.1


