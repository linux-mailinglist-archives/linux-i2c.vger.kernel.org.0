Return-Path: <linux-i2c+bounces-7966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1A9C7877
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D98B528DEB8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2B1632C8;
	Wed, 13 Nov 2024 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ULVjlLfE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806F158D93;
	Wed, 13 Nov 2024 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514478; cv=none; b=kjIbLu17h0LyP6WGVCR+RpxXT42VeIQ1BoTybAErdj+b8ijuADwcFeP6k5niE30vv5gFWFojJWNqCIzUmyNwCJ6QCeKUOfEF0rxPkbbTmMVINQU1sMBEHB9UD1lv2+5j4LTOCgNXtLByqoVU5qxCIUqBsx71N3Djv9GWDFxTWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514478; c=relaxed/simple;
	bh=RXGMLAR3bg5FOVAqjr6JASvnv2XJHWRSXuGih7D/Avc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Hgxyt1Ui4u7k6eroVfXB6IfFDzYCoILd8HiS6btPqBUD/bkQZEEAr+LnB7Gil5c6N8Yzu0JKY5ptwufIknEHTBIm48QWm1++N4SyQiyKqVRjKTj/uDFJj1elKVv5dxhrkH88aDv3zi2rlrWsj/8ZVQd88uUYfBK9PeV3MjikWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ULVjlLfE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADA4U2F014505;
	Wed, 13 Nov 2024 16:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G9Oa1ik0d6o7nSuuwamkgP
	KqsXhKm2pdllp0FR+Yfdo=; b=ULVjlLfE/F8ToN98Kw64ss8q5ewrlmJ+rdARLj
	1YY64Uj+/VT5EJcbAlhzU1ukNwvu7xdx3j0rvoCN9uAhjA0TWNXKoJkrsG8gItup
	licGo+IVQBMG/KuRqTpSa0uKMHMCHBBTO8WiDQVFN5raUxF8LaY/s0Tf6RQ4HYeS
	JxNRwxn1oEY20Sh2BUhwkijMjsDPQw/hp0FEynNXEVJfLsDyIwLegXz0oUyVwqy7
	5zzoz/kHO6H/u+p3ODaA2Nmnz3tnsjrVD/HgrQPm/v1bDh9UZXU3SkxSaZKAGUmA
	daXNYSNlvpoCDIYCfGuChW0zMCIq1T5800pKpUZksVYIap5g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1vfw193-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADGEO5D031884;
	Wed, 13 Nov 2024 16:14:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tmhvej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:24 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ADGEO6k031877;
	Wed, 13 Nov 2024 16:14:24 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ADGEORu031876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:24 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 6323724055; Wed, 13 Nov 2024 21:44:23 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v4 0/4] Enable shared SE support over I2C
Date: Wed, 13 Nov 2024 21:44:09 +0530
Message-Id: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: bTn5nCBEdNZTXTcgyf4TEXUFum02tJVe
X-Proofpoint-ORIG-GUID: bTn5nCBEdNZTXTcgyf4TEXUFum02tJVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

QUP based I2C GENI controller driver doesn't support controller sharing
between two processors (E.g. APPS and DSP) running same or different OS.

For example, two I2C clients (one from ADSP and another from APPS) want to
communicate with EEPROM connected over I2C without any bus level disturbance
during transfer.

This Series adds support to share QUP (Qualcomm Unified peripheral) based
I2C SE (Serial Engine) controller between two or more processors (Apps/ADSP
etc). Each system processor is having its own dedicated GPII(General 
Purpose Interface Instance) acting as pipe between SE and GSI(Generic SW-
Interface) DMA HW engine. Hence the sharing of I2C is possible only in GPI
mode, not with FIFO/CPU DMA mode.

Each Processor subsystem must acquire Lock over the controller so that it
gets uninterrupted control till it unlocks the SE. Generally, GPIOs are
being unconfigured during It also makes sure the commonly shared TLMM GPIOs
are not touched which can impact other subsystem or cause any interruption. 
suspend time. Transfer from each processor gets serialized by lock TRE +
Transfers + Unlock TRE at HW level.

GSI DMA engine is capable to perform requested transfer operations from any
of the I2C client in a seamless way and its transparent to the subsystems.
Make sure to enable “qcom,is-shared” flag only while enabling this feature.
I2C client should add in its respective parent node.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
Link to V3: https://lore.kernel.org/lkml/20240927063108.2773304-4-quic_msavaliy@quicinc.com/T/

Changes in V4:
 - Fixed Typo to dt-bindings in subject line of PATCH 1.
 - Replaced SS (subsystem) as multiprocessor as per Bryan's suggestions.
 - Replied to Krzysztof's comments and replaced SS with Multiprocessor system.
 - Removed Abbreviations and also bullet point list from  PATCH 1.
 - Changed feature flag name from qcom,shared-se to qcom,is-shared.
 - Removed bullet points from example of usecase and explained in paragraph.
 - Changed title suffix to dmaengine from dma for Patch 2.
 - Rename TRE_I2C_LOCK to TRE_LOCK in PATCH 2.
 - Enhanced comments about not modifying the pin states on shared SE for PATCH 3.
 - Enhanced shared_geni_se struct member explanation as per Bjorn's comment in PATCH 3.
 - Moved GPIO unconfiguration description from patch 4 to patch 3 as pointed by Bjorn.
 - Removed debug log which was unrelated to this feature change.
 - Added usecase exmaple of shared SE in commit log.

---
Link to V2: https://lore.kernel.org/lkml/a88a16ff-3537-4396-b2ea-4ba02b4850e9@quicinc.com/T/

Changes in V3:
 - Added missing maintainers which i forgot to add.
 - Add cover letter with description of SS and EE for dt-bindings patch.
 - Added acronyms expansion to commit log.
 - [PATCH v2 3/4] : Removed exported symbol geni_se_clks_off(). 
   Instead added changes to bypass pinctrl sleep configuration from
   geni_se_resources_off() function.
 - Changed title name of [PATCH v2 3/4] to reflect the suggested changes.
 - [PATCH v2 4/4] kept geni_i2c_runtime_suspend() as is and removed 
   explicit call to geni_se_clks_off().
 - Removed is_shared variable from i2c driver and instead used common 
   shared_geni_se variable from qcom-geni-se.h so that other protocols
   can also extend for similar feature.
 - I2C driver log changed from dev_err() to dev_dbg() for timeout.
 - set gpi_mode = true if shared_geni_se is set for this usecase. Enhanced
   comments around code and commit log.
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
  dmaengine: gpi: Add Lock and Unlock TRE support to access I2C
    exclusively
  soc: qcom: geni-se: Do not keep GPIOs to sleep state for shared SE
    usecase
  i2c: i2c-qcom-geni: Enable i2c controller sharing between two
    subsystems

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
 drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c            | 19 ++++++++--
 drivers/soc/qcom/qcom-geni-se.c               | 13 +++++--
 include/linux/dma/qcom-gpi-dma.h              |  6 +++
 include/linux/soc/qcom/geni-se.h              |  3 ++
 6 files changed, 74 insertions(+), 8 deletions(-)

-- 
2.25.1


