Return-Path: <linux-i2c+bounces-6336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55696FBF1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 21:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFB8282676
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 19:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7987C1D2F51;
	Fri,  6 Sep 2024 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D6oMQ7RI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43B1C7B68;
	Fri,  6 Sep 2024 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650096; cv=none; b=L8RiuheQqO6M+l9wvbbry5zzWgu+GS9nHYTkF25VFkqx/orzuUi7XTTyaylhsfEE5R9q0XUtQvVzLxLkZM/GymenHQJCVQlVWn7VWJwmgo79LU3EGsrOuuVFTkBwKSS+SIEZqt6m89xDOYTQ9pF0M8WDjEBccPATpYB9KC3PtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650096; c=relaxed/simple;
	bh=ZvJZWzdz4jNdMO3kOKAhwF0UfgUENPl360oLYkkdpSw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mnlHcAYrwYUok82/6F1+U+Z3y8VsSgQm792zlx9kE0EI7kiGuh52vGZOIVwRs+PIA2NfVGMD1b8hnKjCsg2/R7eQ4bKjPSmdgV85dKKfDfwGA44jLXX9u9gj81PvjiL3kIcX35QeOSTfvZyY8WRFuLn4bJIOeB4V2G4QxTIeSgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D6oMQ7RI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868boiX022025;
	Fri, 6 Sep 2024 19:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FW9JLL9skAXPxLyeTf+kco
	n76yi61/xeR0qeqfGZIo0=; b=D6oMQ7RI4/QpX+Mkl/tCv3QrJuKVZN27U4K1Jh
	EXcBOdsMvH0G5Bplkh2AC7DRVIvaifri10FtQhui2GDQUnIp6ZU8d1r74NNDbmcP
	mC1ahwufJOtMUAOMFo4SFG9h7iogAgbFcyNuepQd7YiB7kXHgjw9LWD/jPGLk/3w
	3dhYnjlUC2KzgfUwlv8WLSLbtv6oGNX36UcW14LyxIoyXy+xpIP8WTPgyRFEcCHD
	uOhACJCB1c0mRkHmkD4EaHA33z4/l/yENaxyVU0rPQn0kCtU55VFpkbgKji7i8NW
	uKU/weyVDrh24stQs8CPlTi/L7XwjQytCxy53zzJRJ11aASQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu36na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 486JEgKp013053;
	Fri, 6 Sep 2024 19:14:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41bv8mxy1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:42 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 486JEfTR013045;
	Fri, 6 Sep 2024 19:14:41 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 486JEfOX013042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:41 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 8C7A7240F3; Sat,  7 Sep 2024 00:44:40 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 0/4] Enable shared SE support over I2C
Date: Sat,  7 Sep 2024 00:44:34 +0530
Message-Id: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: 6wPWdHI6QhGH67MN8ykSCn5qfVyT1jVY
X-Proofpoint-ORIG-GUID: 6wPWdHI6QhGH67MN8ykSCn5qfVyT1jVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=737 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060141

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


